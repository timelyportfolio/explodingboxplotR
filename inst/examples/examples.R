# devtools::install_github("timelyportfolio/explodingboxplotR")

library(explodingboxplotR)

# use this to replicate
#   from ?boxplot
#boxplot(count ~ spray, data = InsectSprays, col = "lightgray")

exploding_boxplot(
  data.frame(
    rowname = rownames(InsectSprays),
    InsectSprays,
    stringsAsFactors = FALSE
  ),
  y = "count",
  group = "spray",
  color = "spray",
  label = "rowname"
)

# demonstrate all of the options
#  xlab does not work
#  filed issue on source repo
exploding_boxplot(
  data.frame(
    rowname = rownames(InsectSprays),
    InsectSprays,
    stringsAsFactors = FALSE
  ),
  y = "count",
  group = "spray",
  color = "spray",
  label = "rowname",
  iqr = 2,
  margin = list(bottom = 50, left = 30, top = 20, right = 20),
  xlab = "Spray Type",
  ylab = "Count Provided"
)


# use new htmlwidgets on render to customize tooltip
htmlwidgets::onRender(
  exploding_boxplot(
    data.frame(
      rowname = rownames(InsectSprays),
      InsectSprays,
      stringsAsFactors = FALSE
    ),
    y = "count",
    group = "spray",
    color = "spray",
    label = "rowname"
  ),
  "
function(){
  this.chart.tip.html(function(d){
    return [
      '<span style = \\'font-size:150%\\'>',
      d.spray,
      ' |  ',
      '</span>',
      ' count of',
      d.count,
      ' from rowname ',
      d.rowname
    ].join('\\n')
  })
}
  "
)
