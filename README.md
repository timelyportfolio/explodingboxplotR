exploding\_boxplotR
===================

> d3.js Exploding Boxplots

[![](http://www.r-pkg.org/badges/version/exploding_boxplotR)](http://www.r-pkg.org/pkg/exploding_boxplotR)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/exploding_boxplotR)](http://www.r-pkg.org/pkg/exploding_boxplotR)

d3.js Exploding Boxplots from
[`d3_exploding_boxplot`](https://github.com/mcaule/d3_exploding_boxplot)
in [`htmlwidget`](http://htmlwidgets.org) form for `R`

Installation
------------

    # get newest htmlwidgets
    devtools::install_github("ramnathv/htmlwidgets")
    devtools::install_github("timelyportfolio/explodingboxplotR")

Usage
-----

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

License
-------

MIT + file LICENSE © [Kenton Russell](https://github.com/).
