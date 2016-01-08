#' Interactive Exploding Boxplots
#'
#' Create interactive d3.js exploding boxplots using
#'  \href{https://github.com/mcaule/d3_exploding_boxplot}{d3_exploding_boxplot}
#'
#' @param data \code{data.frame} to plot
#' @param y \code{string} representing the column name for aes y
#' @param group \code{string} representing the column name for aes group
#' @param color \code{string} representing the column name for aes color
#' @param label \code{string} representing the column name for aes label
#' @param margin \code{list} in \code{list(bottom = , left = , top = , right = )} format
#' @param xlab \code{string} for the label of the x axis. Note, currently not working.
#' @param ylab \code{string} for the label of the y axis.
#' @param width,height any valid \code{CSS} size unit for the height and width of the htmlwidget
#' @param elementId likely \code{NULL} unless you would like to manually specify a \code{CSS} selector id to the htmlwidget container
#'
#' @example ./inst/examples/examples.R
#' 
#' @import htmlwidgets
#'
#' @export
exploding_boxplot <- function(
  data,
  y = NULL,
  group = NULL,
  color = NULL,
  label = NULL,
  iqr = NULL,
  margin = NULL,
  xlab = NULL,
  ylab = NULL,
  width = NULL,
  height = NULL,
  elementId = NULL,
  crosstalk_group = NULL
) {

  # forward options using x
  x = list(
    data = data,
    aes = Filter(
      Negate(is.null),
      list(
        y = y,
        group = group,
        color = color,
        label = label
      )
    ),
    options = Filter(
      Negate(is.null),
      list(
        iqr = iqr,
        margin = margin,
        xlab = xlab,
        ylab = ylab
      )
    ),
    crosstalk_group = crosstalk_group
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'exploding-boxplot',
    x = x,
    width = width,
    height = height,
    package = 'explodingboxplotR',
    elementId = elementId,
    dependencies = crosstalk::dependencies
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
  shinyWidgetOutput(outputId, 'exploding-boxplot', width, height, package = 'explodingboxplotR')
}

#' @rdname exploding_boxplot-shiny
#' @export
renderExploding_boxplot <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, exploding_boxplotOutput, env, quoted = TRUE)
}