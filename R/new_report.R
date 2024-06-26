#' Create a new AAGI Report using a template
#'
#' @param filename The filename of the report.
#' @param type The type of the report. Valid types are `aagi_report`,
#'   `html_presentation`, `short_report`, and `knitr_report`.
#'   Partial matching is performed.
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
#' new_report(filename = "test_report", type = "aagi_report")
#' }
new_report <- function(filename, type) {
  type <- match.arg(tolower(type),
                    choices = c("aagi_report", "html_presentation",
                                "short_report", "knitr_report"))

  ext <- "Rmd"
  if(type == "aagi_report") {
    aagi_report(filename)
  }
  else if(type == "html_presentation") {
    html_presentation(filename)
  }
  else if(type == "short_report") {
    short_report(filename)
  }
  else if(type == "knitr_report") {
    knitr_report(filename)
    ext <- "Rnw"
  }
  else if(type == "powerpoint_presentation") {
    powerpoint_presentation(filename)
  }
  else {
    stop("type not recognised.")
  }
  invisible(file.path(filename, paste(filename, ext, sep = ".")))
}

#' @rdname new_report
aagi_report <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "AAGI_report",
                   package = "AAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file <- file.path(filename, paste0(filename, ".Rmd"))
  file.edit(file)
  invisible(file)
}

#' @rdname new_report
html_presentation <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "HTML_presentation",
                   package = "AAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file <- file.path(filename, paste0(filename, ".Rmd"))
  file.edit(file)
  invisible(file)
}

#' @rdname new_report
short_report <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "one_page_report",
                   package = "AAGITemplates",
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

  files <- list.files(file.path(find.package("AAGITemplates"),
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
