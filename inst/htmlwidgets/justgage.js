HTMLWidgets.widget({

  name: "justgage",
  
  type: "output",
  
  initialize: function(el, width, height) {
   
    // create the JustGage and tie it to the element
    // we'll fill in the rest of the justgage options
    // in renderValue when we have access to 'x'
    var justgage = new JustGage({
      id: el.id
    });
    
    // return the justgage in our instance data
    // so we can access it in other methods
    return {
      justgage: justgage
    };
  },
  
  renderValue: function(el, x, instance) {
       
  },
  
  resize: function(el, x, width, height, instance) {
    
  }
});