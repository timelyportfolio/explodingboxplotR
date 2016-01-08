HTMLWidgets.widget({

  name: 'exploding_boxplot',

  type: 'output',

  factory: function(el, width, height) {

    return {
      renderValue: function(x) {
        el.innerText = x.message
      },
      resize: function(width, height) {

      }
    };

  }
});