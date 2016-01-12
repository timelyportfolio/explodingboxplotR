HTMLWidgets.widget({

  name: 'exploding-boxplot',

  type: 'output',
  
  factory: function(el, width, height) {

    return {
      
      chart: {},
      
      renderValue: function(x) {
        // empty el in case of dynamic/Shiny situation
        el.innerHTML = "";
        
        var chart = d3.exploding_boxplot(
          HTMLWidgets.dataframeToD3(x.data), x.aes
        );
        
        // loop through options and set if available
        Object.keys(x.options).map(function(ky){
          if(chart[ky]){
            chart[ky](x.options[ky]);
          } else {
            console.log(ky + " does not exist for chart");
          }
        })
        
        // set height and width to fit container
        chart.width(el.getBoundingClientRect().width);
        chart.height(el.getBoundingClientRect().height);
        
        // experiment - work with crosstalk
        var ctgrp;
        if(x.crosstalk_group){
          ctgrp = crosstalk.group(x.crosstalk_group);
        } else {
          ctgrp = crosstalk.defaultGroup;
        }
        
        chart.on('boxover',function(cht,g){
          ctgrp.var("selection").set(g.group, {sender: el});
        });
        
        chart.on('boxout',function(cht,g){
          ctgrp.var("selection").set(null, {sender:el});
        });
        
        chart(el);
        
        this.chart = chart;
        
      },
      
      resize: function(width, height) {

      }
    };

  }
});