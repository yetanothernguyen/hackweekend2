// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
 	$("#landing").fadeOut(2000);

 	$("#showdropdown").click(function(e){
 		e.preventDefault();
 		$(".droplocation").removeClass("hide");
 		$("span.current").hide();
 	});
});