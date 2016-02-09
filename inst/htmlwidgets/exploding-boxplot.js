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

        chart(el);
        
        this.chart = chart;
        
      },
      
      resize: function(width, height) {

      }
    };

  }
});