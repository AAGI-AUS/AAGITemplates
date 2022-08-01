#' Create a new Biometry Hub Report using a template
#'
#' @param filename The filename of the report
#' @param type The type of the report. Valid types are `biometry_hub_report`, `sagi_report`, `html_presentation`.
#'
#' @importFrom rmarkdown draft
#' @importFrom utils file.edit
#'
#' @return Returns the path to the created file invisibly.
#' @export
#'
#' @examples
#' \dontrun{
#' new_report(filename = "test_report", type = "biometry_hub_report")
#' }
new_report <- function(filename, type) {
  stopifnot(tolower(type) %in% c("biometry_hub_report", "sagi_report", "html_presentation"))

  if(tolower(type) %in% c("biometry_hub_report", "bhr", "bh")) {
    bh_report(filename)
  }
  else if(tolower(type) %in% c("sagi_report", "sagi", "grdc")) {
    sagi_report(filename)
  }
  else if(tolower(type)  %in% c("html_presentation", "presentation", "pres", "slides")) {
    html_presentation(filename)
  }
  invisible(file.path(filename, paste0(filename, ".Rmd")))
}

#' @rdname new_report
bh_report <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "Biometry_Hub_report",
                   package = "SAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file.edit(file.path(filename, paste0(filename, ".Rmd")))
}

#' @rdname new_report
sagi_report <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "SAGI_report",
                   package = "SAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file.edit(file.path(filename, paste0(filename, ".Rmd")))
}

#' @rdname new_report
html_presentation <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "HTML_presentation",
                   package = "SAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file.edit(file.path(filename, paste0(filename, ".Rmd")))
}
