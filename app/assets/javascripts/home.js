$(document).ready(function() {
  new WOW().init();
  setTimeout(function() {
    $('#notice_wrapper').fadeOut("slow", function() {
      $this.remove();
    })
  }, 4000);

  
  
});