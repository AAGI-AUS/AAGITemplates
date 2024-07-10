# AAGITemplates

<!--Badges... -->
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![package version](https://img.shields.io/badge/package%20version-0.6.0-80b6ff.svg)](/DESCRIPTION)

Rmarkdown, LaTeX and Knitr reporting templates for AAGI staff.

<!--Previews -->
|<img src="preview_AAGIreport.jpg" alt="AAGI report jpg" width="200px"/><br>AAGI Report|<img src="preview_AAGIonepagereport.jpg" alt="AAGI one-page report jpg" width="200px"/><br>AAGI Short Report|<img src="preview_AAGIHTMLpresentation.jpg" alt="AAGI HTML presentation jpg" width="248px"/><br>AAGI HTML Presentation|<img src="preview_AAGIbeamerpresentation.jpg" alt="AAGI beamer presentation jpg" width="248px"/><br>AAGI Beamer Presentation|
|:-:|:-:|:-:|:-:|

This package adds templates for AAGI reports and presentations to RStudio, accessible graphically via the `File > New File... > R Markdown...` menu and also via the R Console using the `new_report()` function.

Install this R package with:

```{r eval = FALSE}
if(!require("remotes")) install.packages("remotes") 
remotes::install_github("AAGI-Org-AU-Public/AAGITemplates", upgrade = FALSE)
```

## Installing the Microsoft Office templates
The AAGI report/presentation templates for Microsoft Word and Microsoft PowerPoint can be installed easily by the following steps.

1. Download the .dotx and .potx template files from this GitHub directory to your machine:
    - [AAGI Report Template](<https://github.com/AAGI-Org-AU-Public/AAGITemplates/raw/master/inst/rmarkdown/templates/Word_report/AAGI Report Template.dotx>)
    - [AAGI Short Report Template](<https://github.com/AAGI-Org-AU-Public/AAGITemplates/raw/master/inst/rmarkdown/templates/Word_report/AAGI Short Report Template.dotx>)
    - [AAGI PowerPoint Presentation](<https://github.com/AAGI-Org-AU-Public/AAGITemplates/raw/master/inst/rmarkdown/templates/PowerPoint_presentation/AAGI PowerPoint Presentation.potx>)

