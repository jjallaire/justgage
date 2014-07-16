
#' @export
justgage <- function(title, value, min, max, label = NULL,
  width = NULL, height = NULL) {

  jg <- structure(class = "justgage", list(
    title = title,
    label = label,
    value = value,
    min = min,
    max = max,
    width = width,
    height = height
  ))
  jg
}

#' @export
print.justgage <- function(x, ...) {
  print(htmltools::as.tags(x))
}

#' @export
as.tags.justgage <- function(x) {
  justgageHTML(x, 450, 350)
}

#' @export
knit_print.justgage <- function(x, ..., options) {
  htmltools::knit_print(
    justgageHTML(x, options$out.width.px, options$out.height.px),
    options = options, 
    ...
  )
}

justgageHTML <- function(x, defaultWidth, defaultHeight) {

  # create random/unique id to bind the div and script
  id <- paste("justgage", as.integer(stats::runif(1, 1, 10000)), sep="-")

  width <- if (is.null(x$width)) defaultWidth else x$width
  height <- if (is.null(x$height)) defaultHeight else x$height

  # create a style attribute for the width and height
  style <- paste("width:", width, "px;height:", height, "px;", sep = "")

  # create a list representing the parameters to JustGage
  options <- list(id = id,
                  title = x$title,
                  value = x$value,
                  min = x$min,
                  max = x$max,
                  label = x$label)

  # generate html for the justgage
  html <- htmltools::tagList(
    tags$div(id = id, style = style),
    tags$script(HTML("var g = new JustGage(", RJSONIO::toJSON(options), ");"))
  )

  # return html
  html <- htmltools::attachDependencies(html, justgageDependencies)

  htmltools::browsable(html)
}

justgageDependencies <- list(
  htmltools::htmlDependency(
    name = "raphael",
    version = "2.1.2",
    src = system.file("www/libs/raphael-2.1.2", package = "rmdexamples"),
    script = "raphael.js"
  ),
  htmltools::htmlDependency(
    name = "justgage",
    version = "1.0.1",
    src = system.file("www/libs/justgage-1.0.1", package = "rmdexamples"),
    script = "justgage.1.0.1.min.js"
  )
)
