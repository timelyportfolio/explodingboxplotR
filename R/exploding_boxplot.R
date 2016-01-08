#' <Add Title...>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
exploding_boxplot <- function(
  data,
  ...,
  width = NULL,
  height = NULL,
  elementId = NULL
) {

  # forward options using x
  x = list(
    data = data,
    options = ...
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'exploding-boxplot',
    x = x,
    width = width,
    height = height,
    package = 'explodingboxplotR',
    elementId = elementId
  )
}

#' Shiny bindings for exploding_boxplot
#'
#' Output and render functions for using exploding_boxplot within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \\code{'100\%'},
#'   \\code{'400px'}, \\code{'auto'}) or a number, which will be coerced to a
#'   string and have \\code{'px'} appended.
#' @param expr An expression that generates a exploding_boxplot
#' @param env The environment in which to evaluate \\code{expr}.
#' @param quoted Is \\code{expr} a quoted expression (with \\code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name exploding_boxplot-shiny
#'
#' @export
exploding_boxplotOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'exploding_boxplot', width, height, package = 'explodingboxplotR')
}

#' @rdname exploding_boxplot-shiny
#' @export
renderExploding_boxplot <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, exploding_boxplotOutput, env, quoted = TRUE)
}