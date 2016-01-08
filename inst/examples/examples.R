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