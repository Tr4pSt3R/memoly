/* js is only used to avoid transition on page load. Thanks to Chris Coyier for the tip. 

http://css-tricks.com/transitions-only-after-page-load/

*/

jQuery(function($){
  $('html').removeClass('preload');
})