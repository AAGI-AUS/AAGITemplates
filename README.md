# AAGITemplates

<!--Badges... -->
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![package version](https://img.shields.io/badge/package%20version-0.6.0-80b6ff.svg)](/DESCRIPTION)

Rmarkdown, LaTeX and Knitr reporting templates for AAGI staff.

<!--Previews -->
<div style="display: flex; justify-content: space-between;">
  <figure>
    <img src="preview_AAGIreport.jpg" alt="AAGI report preview png"/>
    <figcaption aria-hidden="true" align="center">AAGI Report</figcaption>
  </figure>
  <figure>
    <img src="preview_AAGIreport.jpg" alt="AAGI report preview png"/>
    <figcaption aria-hidden="true" align="center">AAGI HTML Presentation</figcaption>
  </figure>
  <figure>
    <img src="preview_AAGIreport.jpg" alt="AAGI report preview png"/>
    <figcaption aria-hidden="true" align="center">AAGI One-Page Report</figcaption>
  </figure>
</div>

This package adds templates for AAGI reports and presentations to RStudio, accessible graphically via the `File > New File... > R Markdown...` menu and also via the R Console using the `new_report()` function.

Install this R package with:

```{r eval = FALSE}
if(!require("remotes")) install.packages("remotes") 
remotes::install_github("biometryhub/AAGITemplates", upgrade = FALSE)
```
