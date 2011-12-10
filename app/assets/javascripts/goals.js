// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
 	$("#landing").delay(800).fadeOut(1000);

 	$("#showdropdown").click(function(e){
 		e.preventDefault();
 		$(".droplocation").toggleClass("hide");
 		$("span.current").toggle();
 	});

	$("#addstatuslink").click(function(e){
		e.preventDefault();
		$(".addstatus").animate({
			top:'100px'
		});

	});


});