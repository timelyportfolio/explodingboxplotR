HTMLWidgets.widget({

  name: 'exploding-boxplot',

  type: 'output',
  
  initialize: function(el, width, height) {
   
    // create our sigma object and bind it to the element
    var chart = {};
    
    // return it as part of our instance data
    return {
      exploding_boxplot: chart
    };
  },
  
  renderValue: function(el, x, instance){ 
    // empty el in case of dynamic/Shiny situation
        el.innerHTML = "";

        chart = d3.exploding_boxplot(
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
  },
  
  resize: function(width, height) {

  }

});