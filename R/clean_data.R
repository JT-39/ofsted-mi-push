clean_ofsted <- function(data_raw, snapshot_date){

  data_raw |>
    dplyr::mutate(
      `Web link` = iconv(`Web.link`,"WINDOWS-1252","UTF-8")
      ,`URN` = iconv(`URN`,"WINDOWS-1252","UTF-8")
      ,`LAESTAB` = iconv(`LAESTAB`,"WINDOWS-1252","UTF-8")
      ,`School name` = iconv(`School.name`,"WINDOWS-1252","UTF-8")
      ,`Ofsted phase` = iconv(`Ofsted.phase`,"WINDOWS-1252","UTF-8")
      ,`Type of education` = iconv(`Type.of.education`,"WINDOWS-1252","UTF-8")
      ,`School open date` = as.Date(`School.open.date`, "%d/%m/%Y")
      ,`Admissions policy` = iconv(`Admissions.policy`,"WINDOWS-1252","UTF-8")
      ,`Sixth form` = iconv(`Sixth.form`,"WINDOWS-1252","UTF-8")
      ,`Designated religious character` = iconv(`Designated.religious.character`,"WINDOWS-1252","UTF-8")
      ,`Religious ethos` = iconv(`Religious.ethos`,"WINDOWS-1252","UTF-8")
      ,`Faith grouping` = iconv(`Faith.grouping`,"WINDOWS-1252","UTF-8")
      ,`Ofsted region` = iconv(`Ofsted.region`,"WINDOWS-1252","UTF-8")
      ,`Region` = iconv(`Region`,"WINDOWS-1252","UTF-8")
      ,`Local authority` = iconv(`Local.authority`,"WINDOWS-1252","UTF-8")
      ,`Parliamentary constituency` = iconv(`Parliamentary.constituency`,"WINDOWS-1252","UTF-8")
      ,`Postcode` = iconv(`Postcode`,"WINDOWS-1252","UTF-8")
      ,`The income deprivation affecting children index (IDACI) quintile` = iconv(`The.income.deprivation.affecting.children.index..IDACI..quintile`,"WINDOWS-1252","UTF-8")
      ,`Total number of pupils` = iconv(`Total.number.of.pupils`,"WINDOWS-1252","UTF-8")
      ,`Latest ungraded inspection number since last graded inspection` = iconv(`Latest.ungraded.inspection.number.since.last.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`Does the ungraded inspection relate to the URN of the current school?` = iconv(`Does.the.ungraded.inspection.relate.to.the.URN.of.the.current.school.`,"WINDOWS-1252","UTF-8")
      ,`URN at time of the ungraded inspection` = iconv(`URN.at.time.of.the.ungraded.inspection`,"WINDOWS-1252","UTF-8")
      ,`LAESTAB at time of the ungraded inspection` = iconv(`LAESTAB.at.time.of.the.ungraded.inspection`,"WINDOWS-1252","UTF-8")
      ,`School name at time of the ungraded inspection` = iconv(`School.name.at.time.of.the.ungraded.inspection`,"WINDOWS-1252","UTF-8")
      ,`School type at time of the ungraded inspection` = iconv(`School.type.at.time.of.the.ungraded.inspection`,"WINDOWS-1252","UTF-8")
      ,`Number of ungraded inspections since the last graded inspection` = iconv(`Number.of.ungraded.inspections.since.the.last.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`Date of latest ungraded inspection` = as.Date(`Date.of.latest.ungraded.inspection`, "%d/%m/%Y")
      ,`Ungraded inspection publication date` = as.Date(`Ungraded.inspection.publication.date`, "%d/%m/%Y")
      ,`Did the latest ungraded inspection convert to a graded inspection?` = iconv(`Did.the.latest.ungraded.inspection.convert.to.a.graded.inspection.`,"WINDOWS-1252","UTF-8")
      ,`Ungraded inspection overall outcome` = iconv(`Ungraded.inspection.overall.outcome`,"WINDOWS-1252","UTF-8")
      ,`Number of monitoring and urgent inspections since last graded inspection` = iconv(`Number.of.monitoring.and.urgent.inspections.since.last.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`Inspection number of latest graded inspection` = iconv(`Inspection.number.of.latest.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`Inspection type` = iconv(`Inspection.type`,"WINDOWS-1252","UTF-8")
      ,`Inspection type grouping` = iconv(`Inspection.type.grouping`,"WINDOWS-1252","UTF-8")
      ,`Event type grouping` = iconv(`Event.type.grouping`,"WINDOWS-1252","UTF-8")
      ,`nspection start date` = as.Date(`Inspection.start.date`, "%d/%m/%Y")
      ,`Inspection end date` = as.Date(`Inspection.end.date`, "%d/%m/%Y")
      ,`Publication date` = as.Date(`Publication.date`, "%d/%m/%Y")
      ,`Does the latest graded inspection relate to the URN of the current school?` = iconv(`Does.the.latest.graded.inspection.relate.to.the.URN.of.the.current.school.`,"WINDOWS-1252","UTF-8")
      ,`URN at time of latest graded inspection` = iconv(`URN.at.time.of.latest.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`LAESTAB at time of latest graded inspection` = iconv(`LAESTAB.at.time.of.latest.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`School name at time of latest graded inspection` = iconv(`School.name.at.time.of.latest.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`School type at time of latest graded.inspection` = iconv(`School.type.at.time.of.latest.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`Overall effectiveness` = iconv(`Overall.effectiveness`,"WINDOWS-1252","UTF-8")
      ,`Category of concern` = iconv(`Category.of.concern`,"WINDOWS-1252","UTF-8")
      ,`Quality of education` = iconv(`Quality.of.education`,"WINDOWS-1252","UTF-8")
      ,`Behaviour and attitudes` = iconv(`Behaviour.and.attitudes`,"WINDOWS-1252","UTF-8")
      ,`Personal development` = iconv(`Personal.development`,"WINDOWS-1252","UTF-8")
      ,`Effectiveness of leadership and management` = iconv(`Effectiveness.of.leadership.and.management`,"WINDOWS-1252","UTF-8")
      ,`Safeguarding is effective?` = iconv(`Safeguarding.is.effective.`,"WINDOWS-1252","UTF-8")
      ,`Early years provision (where applicable)` = iconv(`Early.years.provision..where.applicable.`,"WINDOWS-1252","UTF-8")
      ,`Sixth form provision (where applicable)` = iconv(`Sixth.form.provision..where.applicable.`,"WINDOWS-1252","UTF-8")
      ,`Previous graded inspection number` = iconv(`Previous.graded.inspection.number`,"WINDOWS-1252","UTF-8")
      ,`Previous inspection start date` = as.Date(`Previous.inspection.start.date`, "%d/%m/%Y")
      ,`Previous inspection end date` = as.Date(`Previous.inspection.end.date`, "%d/%m/%Y")
      ,`Previous publication date` = as.Date(`Previous.publication.date`, "%d/%m/%Y")
      ,`Does the previous graded inspection relate to the URN of the current school?` = iconv(`Does.the.previous.graded.inspection.relate.to.the.URN.of.the.current.school.`,"WINDOWS-1252","UTF-8")
      ,`URN at time of previous graded inspection` = iconv(`URN.at.time.of.previous.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`LAESTAB at time of previous graded inspection` = iconv(`LAESTAB.at.time.of.previous.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`School name at time of previous graded inspection` = iconv(`School.name.at.time.of.previous.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`School type at time of previous graded inspection` = iconv(`School.type.at.time.of.previous.graded.inspection`,"WINDOWS-1252","UTF-8")
      ,`Previous graded inspection overall effectiveness` = iconv(`Previous.graded.inspection.overall.effectiveness`,"WINDOWS-1252","UTF-8")
      ,`Previous category of concern` = iconv(`Previous.category.of.concern`,"WINDOWS-1252","UTF-8")
      ,`Previous quality of education` = iconv(`Previous.quality.of.education`,"WINDOWS-1252","UTF-8")
      ,`Previous behaviour and attitudes` = iconv(`Previous.behaviour.and.attitudes`,"WINDOWS-1252","UTF-8")
      ,`Previous personal development` = iconv(`Previous.personal.development`,"WINDOWS-1252","UTF-8")
      ,`Previous effectiveness of leadership and management` = iconv(`Previous.effectiveness.of.leadership.and.management`,"WINDOWS-1252","UTF-8")
      ,`Previous safeguarding is effective?` = iconv(`Previous.safeguarding.is.effective.`,"WINDOWS-1252","UTF-8")
      ,`Previous early years provision (where applicable)` = iconv(`Previous.early.years.provision..where.applicable.`,"WINDOWS-1252","UTF-8")
      ,`Previous sixth form provision (where applicable)` = iconv(`Previous.sixth.form.provision..where.applicable.`,"WINDOWS-1252","UTF-8")
      ,`DateStamp` = snapshot_date
    ) |>
    dplyr::select(
      `Web link`
      ,`URN`
      ,`LAESTAB`
      ,`School name`
      ,`Ofsted phase`
      ,`Type of education`
      ,`School open date`
      ,`Admissions policy`
      ,`Sixth form`
      ,`Designated religious character`
      ,`Religious ethos`
      ,`Faith grouping`
      ,`Ofsted region`
      ,`Region`
      ,`Local authority`
      ,`Parliamentary constituency`
      ,`Postcode`
      ,`The income deprivation affecting children index (IDACI) quintile`
      ,`Total number of pupils`
      ,`Latest ungraded inspection number since last graded inspection`
      ,`Does the ungraded inspection relate to the URN of the current school?`
      ,`URN at time of the ungraded inspection`
      ,`LAESTAB at time of the ungraded inspection`
      ,`School name at time of the ungraded inspection`
      ,`School type at time of the ungraded inspection`
      ,`Number of ungraded inspections since the last graded inspection`
      ,`Date of latest ungraded inspection`
      ,`Ungraded inspection publication date`
      ,`Did the latest ungraded inspection convert to a graded inspection?`
      ,`Ungraded inspection overall outcome`
      ,`Number of monitoring and urgent inspections since last graded inspection`
      ,`Inspection number of latest graded inspection`
      ,`Inspection type`
      ,`Inspection type grouping`
      ,`Event type grouping`
      ,`nspection start date`
      ,`Inspection end date`
      ,`Publication date`
      ,`Does the latest graded inspection relate to the URN of the current school?`
      ,`URN at time of latest graded inspection`
      ,`LAESTAB at time of latest graded inspection`
      ,`School name at time of latest graded inspection`
      ,`School type at time of latest graded.inspection`
      ,`Overall effectiveness`
      ,`Category of concern`
      ,`Quality of education`
      ,`Behaviour and attitudes`
      ,`Personal development`
      ,`Effectiveness of leadership and management`
      ,`Safeguarding is effective?`
      ,`Early years provision (where applicable)`
      ,`Sixth form provision (where applicable)`
      ,`Previous graded inspection number`
      ,`Previous inspection start date`
      ,`Previous inspection end date`
      ,`Previous publication date`
      ,`Does the previous graded inspection relate to the URN of the current school?`
      ,`URN at time of previous graded inspection`
      ,`LAESTAB at time of previous graded inspection`
      ,`School name at time of previous graded inspection`
      ,`School type at time of previous graded inspection`
      ,`Previous graded inspection overall effectiveness`
      ,`Previous category of concern`
      ,`Previous quality of education`
      ,`Previous behaviour and attitudes`
      ,`Previous personal development`
      ,`Previous effectiveness of leadership and management`
      ,`Previous safeguarding is effective?`
      ,`Previous early years provision (where applicable)`
      ,`Previous sixth form provision (where applicable)`
      ,`DateStamp`
    )
}
