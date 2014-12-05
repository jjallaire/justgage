
#' @export
justgage <- function(title, value, min, max, label = NULL,
  width = NULL, height = NULL) {

  x <- list(
    title = title,
    value = value,
    min = min,
    max = max,
    label = label
  )
  
  htmlwidgets::createWidget("justgage", x, width = width, height = height)
}
