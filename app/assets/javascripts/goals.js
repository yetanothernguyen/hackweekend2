// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
 	$("#landing").delay(800).fadeOut(1000);

 	$("#showdropdown").click(function(e){
 		e.preventDefault();
 		$(".droplocation").toggleClass("hide");
 		$("span.current").toggle();
 	});
 	
 	$(".addstatus").hide();

	$("#addstatuslink").click(function(e){
	  e.preventDefault();
	  if ($(".addstatus:visible").length) {
      $(".addstatus").animate({
  			top:'-160px'
  		}, function(){
  		  $(this).hide();
  		});
	  } else {
	    $(".addstatus").show().animate({
  			top:'100px'
  		});
	  }
	});

});