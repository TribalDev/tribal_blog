// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).on('page:change', function() {
  // Mobile-nav
  $('.mobile-nav, .nav').click(function() {
    $('.nav').toggleClass('mobile-menu-showing');
  });

  // Infinite Scroll
  if ($('.next-pagination').length) {
    $(window).scroll(function() {
      var url = $('.next-pagination').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 200) {
        $('.pagination').text("Please Wait...");
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
});

$(document).on("scroll",function(){
  // Transtition nav-bar on scroll
  if($(document).scrollTop()>80){
    $("nav").addClass("navbar-scroll");
    $(".nav-logo").addClass("nav-logo-showing");
  }
  else{
    $("nav").removeClass("navbar-scroll");
    $(".nav-logo").addClass("nav-logo-showing");
  }
});
