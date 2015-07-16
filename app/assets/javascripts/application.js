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
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"

$(document).ready(function(){
    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
    });
});

$(document).ready(function(){
  $("#search_category_Backpack").click(function(){
    $("#backpack").show();
    $("#tent").hide();
    $("#sleepingbag").hide();
  });
  $("#search_category_Tent").click(function(){
    $("#backpack").hide();
    $("#tent").show();
    $("#sleepingbag").hide();;
  });
  $("#search_category_Sleepingbag").click(function(){
    $("#backpack").hide();
    $("#tent").hide();
    $("#sleepingbag").show();;
  });
});
