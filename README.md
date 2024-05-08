# Readme

## Introduction
This is a exemplar project of how to setup a R data pipeline in a reproducible
fashion.
Also the package {targets} is used to further increase the reproducibility.

The data pipeline scrapes the latest data of the Ofsted MI dataset off the
Ofsted website.
This is then cleaned and pushed to SQL.

The future release dates are also scraped.

## Getting Started
Clone the repository:

1. Click on the green `<> Code` button just below (right) of the repository
name.
2. Copy the HTTPS path.
3. Head over to your favoured command line tool (PowerShell or GitBash).
4. Navigate to the folder you want to store this project.
5. Run the code below:

```bash
git clone https://github.com/JT-39/ofsted-mi-push.git
```

6. Voila!

When in the RStudio project, use `renv::restore()` to load the correct
packages.

The main pipeline is stored in the Quarto file `02_Analysis\main.qmd`.
Use the shortcut `Ctrl Shift K` to render the Quarto document.

# Contribute
Create an issue or branch off the main and start a pull request!
