#' Create a new Biometry Hub Report using a template
#'
#' @param filename The filename of the report
#' @param type The type of the report. Valid types are `biometry_hub_report`, `sagi_report`, `html_presentation`, `short_report` and `knitr_report`.
#'
#' @importFrom rmarkdown draft
#' @importFrom utils file.edit
#' @importFrom bookdown pdf_document2
#' @importFrom knitr opts_chunk
#' @importFrom xaringan inf_mr
#'
#' @return Returns the path to the created file invisibly.
#' @export
#'
#' @examples
#' \dontrun{
#' new_report(filename = "test_report", type = "biometry_hub_report")
#' }
new_report <- function(filename, type) {
  type <- match.arg(tolower(type),
                    choices = c("biometry_hub_report", "sagi_report", "html_presentation", "short_report", "knitr_report"))

  if(type == "biometry_hub_report") {
    bh_report(filename)
    ext <- "Rmd"
  }
  else if(type == "sagi_report") {
    sagi_report(filename)
    ext <- "Rmd"
  }
  else if(type == "html_presentation") {
    html_presentation(filename)
    ext <- "html"
  }
  else if(type == "short_report") {
    short_report(filename)
    ext <- "Rmd"
  }
  else if(type == "knitr_report") {
    knitr_report(filename)
    ext <- "Rnw"
  }
  invisible(file.path(filename, paste(filename, ext, sep = ".")))
}

#' @rdname new_report
bh_report <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "Biometry_Hub_report",
                   package = "SAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file <- file.path(filename, paste0(filename, ".Rmd"))
  file.edit(file)
  invisible(file)
}

#' @rdname new_report
sagi_report <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "SAGI_report",
                   package = "SAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file <- file.path(filename, paste0(filename, ".Rmd"))
  file.edit(file)
  invisible(file)
}

#' @rdname new_report
html_presentation <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "HTML_presentation",
                   package = "SAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file <- file.path(filename, paste0(filename, ".Rmd"))
  file.edit(file)
  invisible(file)
}

#' @rdname new_report
short_report <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "one_page_report",
                   package = "SAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file <- file.path(filename, paste0(filename, ".Rmd"))
  file.edit(file)
  invisible(file)
}

#' @rdname new_report
knitr_report <- function(filename) {
  # create folder
  if(!dir.exists(filename)) {
    dir.create(trimws(filename))
  }

  files <- list.files(file.path(find.package("SAGITemplates"),
                     "inst", "rmarkdown", "templates", "Knitr"), full.names = TRUE)
  # copy template and assets into folder
  file.copy(from = files, to = filename, recursive = TRUE)

  # rename template
  file.rename(from = file.path(filename, "report.Rnw"),
              to = file.path(filename, paste0(filename, ".Rnw")))

  # Open for editing
  file <- file.path(filename, paste0(filename, ".Rnw"))
  file.edit(file)
  invisible(file)
}


