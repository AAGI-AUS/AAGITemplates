# SAGI Templates package

This package adds templates to the RStudio `New > R Markdown...` button.

It can be installed with:

```{r eval = FALSE}
if(!require("remotes")) install.packages("remotes") 
remotes::install_github("biometryhub/SAGITemplates", upgrade = FALSE)
```

There is now a function to create reports from the template directly from the R console. Simply use `new_report()` with `filename` and `type` arguments. Check documentation for more details.
