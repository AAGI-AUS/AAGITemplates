#' Create a new AAGI Report using a template
#'
#' @param filename The filename of the report.
#' @param type The type of the report. Partial matching is performed.
#'   * `aagi_report` (default): A full AAGI report using Rmarkdown.
#'   * `html_presentation`: An AAGI slide presentation in HTML, 
#'     using Rmarkdown/xaringan.
#'   * `short_report`: A short one-page AAGI report using Rmarkdown.
#'   * `knitr_report`: A full AAGI report using knitr.
#'   * `latex_report`: A full AAGI report using LaTeX (without embedded
#'      R/chunks).
#'   * `beamer_presentation`: An AAGI slide presentation in LaTeX,
#'     using Beamer (without embedded R/chunks).
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
#' @md
new_report <- function(filename,
    type = c("aagi_report", "html_presentation", "short_report",
      "knitr_report", "latex_report", "beamer_presentation")) {
  # Partial matching to given report type
  type <- match.arg(tolower(type),
    choices = c("aagi_report", "html_presentation", "short_report",
      "knitr_report", "latex_report", "beamer_presentation")
  )

  ext <- "Rmd"
  if (type[1] == "aagi_report") {
    aagi_report(filename)
  }
  else if (type[1] == "html_presentation") {
    html_presentation(filename)
  }
  else if (type[1] == "short_report") {
    short_report(filename)
  }
  else if (type[1] == "knitr_report") {
    knitr_report(filename)
    ext <- "Rnw"
  }
  else if (type[1] == "latex_report") {
    latex_report(filename)
    ext <- "tex"
  }
  else if (type[1] == "beamer_presentation") {
    beamer_presentation(filename)
    ext <- "tex"
  }
  #else if (type == "powerpoint_presentation") {
  #  powerpoint_presentation(filename)
  #}
  else {
    stop("type not recognised.")
  }
  invisible(file.path(filename, paste(filename, ext, sep = ".")))
}

#' AAGI full report in Rmarkdown
#' @noRd
aagi_report <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "AAGI_report",
                   package = "AAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file <- file.path(filename, paste0(filename, ".Rmd"))
  file.edit(file)
  invisible(file)
}

#' AAGI slide presentation in HTML/xaringan
#' @noRd
html_presentation <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "HTML_presentation",
                   package = "AAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file <- file.path(filename, paste0(filename, ".Rmd"))
  file.edit(file)
  invisible(file)
}

#' AAGI short/one-page report in Rmarkdown
#' @noRd
short_report <- function(filename) {
  rmarkdown::draft(file = filename,
                   template = "one_page_report",
                   package = "AAGITemplates",
                   create_dir = TRUE, edit = FALSE)
  file <- file.path(filename, paste0(filename, ".Rmd"))
  file.edit(file)
  invisible(file)
}

#' AAGI full report in knitr
#' @noRd
knitr_report <- function(filename) {
  # create folder
  if (!dir.exists(filename)) {
    dir.create(trimws(filename))
  }

  files <- list.files(
    file.path(find.package("AAGITemplates"),
      "rmarkdown", "templates", "Knitr"),
    full.names = TRUE
  )
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

#' AAGI full report in LaTeX
#' @noRd
latex_report <- function(filename) {
  # create folder
  if (!dir.exists(filename)) {
    dir.create(trimws(filename))
  }

  files <- list.files(
    file.path(find.package("AAGITemplates"),
      "rmarkdown", "templates", "LaTeX"),
    full.names = TRUE
  )
  # copy template and assets into folder
  file.copy(from = files, to = filename, recursive = TRUE)
  
  # rename template
  file.rename(from = file.path(filename, "report.tex"),
              to = file.path(filename, paste0(filename, ".tex")))
  
  # open for editing
  file <- file.path(filename, paste0(filename, ".tex"))
  file.edit(file)
  invisible(file)
}

#' AAGI slide presentation in LaTeX/Beamer
#' @noRd
beamer_presentation <- function(filename) {
  # create folder
  if (!dir.exists(filename)) {
    dir.create(trimws(filename))
  }

  files <- list.files(
    file.path(find.package("AAGITemplates"),
      "rmarkdown", "templates", "beamer_presentation"),
    full.names = TRUE
  )
  # copy template and assets into folder
  file.copy(from = files, to = filename, recursive = TRUE)

  # rename template
  file.rename(from = file.path(filename, "presentation.tex"),
              to = file.path(filename, paste0(filename, ".tex")))
  
  # open for editing
  file <- file.path(filename, paste0(filename, ".tex"))
  file.edit(file)
  invisible(file)
}
