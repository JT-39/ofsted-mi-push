
# connect to the SQL Server database
connect_sql_db <- function(yml_key) {
  # Get database credentials
  db_creds <- config::get(yml_key)

  # connect to the database
  db_conn <- DBI::dbConnect(
    odbc::odbc(),
    Driver = db_creds$driver,
    Server = db_creds$server,
    Database = db_creds$database,
    UID = db_creds$uid,
    PWD = db_creds$pwd,
    Trusted_connection = db_creds$trusted
  )

  db_conn
}


# Pull existing snapshots from SQL table
pull_snapshots <- function(yml_key) {
  conn <- connect_sql_db(yml_key)
  on.exit(DBI::dbDisconnect(conn, shutdown = TRUE))

  DBI::dbGetQuery(conn,
                  paste0("select distinct(DateStamp) ",
                         "from [", Sys.getenv("schema_final"),"].[Ofsted]"))
}


# Write the cleaned data to the SQL Server database
write_ofsted_temp <- function(conn, data) {
  DBI::dbWriteTable(conn,
                    DBI::Id(schema = Sys.getenv("schema_temp"),
                            table = "RG_MonthlyOfsted_Temp"),
                    data)

}

# Insert the data from the temporary table into the main database table
append_ofsted_final <- function(conn) {
  DBI::dbGetQuery(conn,
                  paste0("insert into [", Sys.getenv("schema_final"), "].[Ofsted] ",
                         "select * ",
                         "from [", Sys.getenv("schema_temp"), "].[RG_MonthlyOfsted_Temp]"))
}

# Drop the temporary table
drop_ofsted_temp <- function(conn) {
  DBI::dbRemoveTable(conn,
                     DBI::Id(schema = Sys.getenv("schema_temp"),
                             table = "RG_MonthlyOfsted_Temp"))
}


# Test to see if data already exists in main database table if not,
# then append data
safely_append_ofsted <- function(latest_month,
                                 existing_months,
                                 yml_key,
                                 data) {
  conn <- connect_sql_db(yml_key)
  on.exit(DBI::dbDisconnect(conn, shutdown = TRUE))

  if(!(latest_month %in% dplyr::pull(existing_months))) {

    write_ofsted_temp(conn = conn, data= data)
    append_ofsted_final(conn = conn)
    drop_ofsted_temp(conn = conn)

    print(glue::glue("Ofsted table pushed to {dit_conn@info[['dbname']]} database."))

  } else {
    warning(htmltools::HTML(
      paste0(
        "This date was used to pull data: **",
        latest_month,
        "** \n",
        "Looks like data may already exist in the database.\n",
        "Please check the Oftsed MI website and SQL table ",
        "[", Sys.getenv("schema_final"), "].[Ofsted]."
      )
    ))
  }
}

