(function ( $ ) {
  $.fn.treeview = function(){
    //Set Id for first UL of calling object
    this.children("ul:first-child").attr("class", "expList");
    
    /**** Tree View Logic **/
    this.children('ul.expList').find('li:has(ul)')
    .click( function(event) {
        if (this == event.target) {
            $(this).toggleClass('expanded');
            $(this).children('ul').toggle('medium');
        }
        return false;
    })
    .addClass('collapsed')
    .children('ul').hide();
    /**** End *****/
  };
}( jQuery ));