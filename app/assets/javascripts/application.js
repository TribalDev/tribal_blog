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



$(document).ready(function() {
  if ($('.next-pagination').length) {
    $(window).scroll(function() {
      var url = $('.next-pagination').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 70) {
        $('.pagination').text("Please Wait...");
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
});

$(document).on('page:change', function() {
  $('.mobile-nav, .nav').click(function() {
    $('.nav').toggleClass('mobile-menu-showing');
  });
});

$(document).on("scroll",function(){
  if($(document).scrollTop()>80){
    $("nav").addClass("navbar-scroll");
    $(".nav-logo").addClass("nav-logo-showing");
  }
  else{
    $("nav").removeClass("navbar-scroll");
    $(".nav-logo").addClass("nav-logo-showing");
  }
});


$(window).scroll(function(){
  var wScroll = $(this).scrollTop();
  var $mainTitle = $("#main-title");
  var opacity = (($mainTitle.offset().top - wScroll) / wScroll);
  if(opacity <= 1 && opacity >= 0) {
    $mainTitle.css('opacity', opacity);
  } else if (opacity > 1) {
    $mainTitle.css('opacity', 1);
  }
  
});
