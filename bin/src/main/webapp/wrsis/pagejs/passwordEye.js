$(document).ready(function(){
	
//start
	$(".pass-i-tooltip").click(function() {
	    $(this).toggleClass("fa-eye fa-eye-slash");
	    var input = $($(this).attr("toggle"));
	    if (input.attr("type") == "password") {
	      input.attr("type", "text");
	    } else {
	      input.attr("type", "password");
	    }
	});
//end

//start
	$(".pass-i-tooltip2").click(function() {
	    $(this).toggleClass("fa-eye fa-eye-slash");
	    var input = $($(this).attr("toggle"));
	    if (input.attr("type") == "password") {
	      input.attr("type", "text");
	    } else {
	      input.attr("type", "password");
	    }
	});
//end

//start
	$(".pass-i-tooltip3").click(function() {
	    $(this).toggleClass("fa-eye fa-eye-slash");
	    var input = $($(this).attr("toggle"));
	    if (input.attr("type") == "password") {
	      input.attr("type", "text");
	    } else {
	      input.attr("type", "password");
	    }
	});
//end
});