/**
 * 
 */

$(document).ready(function() {
	
	$('[data-toggle="tooltip"]').tooltip();

		var winHeight = $(window).height();
		
		if ( winHeight > $('.scroll-box').height()) {
		
		    $('.scroll-box').css({
		        "height": winHeight - 200
		    })
		}
});

// any ajax call start and completion loader
$(document).bind("ajaxSend", function(){
	$.blockUI({ message: '<span style="height:40px;"> Loading, Please wait...</span>' });
	 }).bind("ajaxComplete", function(){
		 $.unblockUI();
	 });

$(window).on('load', function () {
	
	$.unblockUI();
	try
	{
	var A = document.getElementsByTagName("form");

	for (var i = 0; i < A.length; i++) {
		 
		if(A[i].getAttribute('class').trim() == 'noload')
			{
			
			continue;
			}
		if (A[i]['class'] != "") {
			A[i].setAttribute("class", "loaderclass");
		}
	}
	}
	catch(e)
	{}
	try
	{
	var A = document.getElementsByTagName("a");

	for (var i = 0; i < A.length; i++) {
		if (A[i]['class'] != "") {
			$("p:first").addClass("intro");
			A[i].element.classList.add("loaderclass");
		}
	}
	}
	catch(e)
	{}

	
	 
	
	
	$( ".loaderclass" ).not(".noload").submit(function( event ) {
		$.blockUI({ message: '<span style="height:40px;"> Loading, Please wait...</span>' });
		});
	
	$( ".loaderclass" ).click(function( event ) {
		//$.blockUI({ message: '<img src="assets/images/loader.gif" /> Loading...' });
		var val_ = $(this).attr("href");
		if(!(val_.trim() == "#" || val_.trim() == "" || val_.trim() == 'javascript:void(0);'))
			{
			$.blockUI({ message: ' <span style="height:40px;"> Loading, Please wait...</span>' });
			}
		});
})

 
/*$(document).ready(function()
		{
	function disableBack() { window.history.forward() }

    window.onload = disableBack();
    window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
		});



function disableF5(e) { if ((e.which || e.keyCode) == 116) e.preventDefault(); };
$(document).on("keydown", disableF5);


$(document).keydown(function(event){
if(event.keyCode==123){
//window.top.close();  // uncomment it if you want to close the tab
return false;//Prevent from F12
}
else if((event.ctrlKey && event.shiftKey && event.keyCode==74) ||  (event.ctrlKey  && event.keyCode==85)  || (event.ctrlKey && event.shiftKey && event.keyCode==73) || (event.ctrlKey && event.shiftKey && event.keyCode==67) ){ 
//window.top.close();  // uncomment it if you want to close the tab
return false; //Prevent from ctrl+shift+i , ctrl+shift+c, ctrl+u
}
});
$(function() {
	$(this).bind("contextmenu", function(e) {
	//window.top.close();  // uncomment it if you want to close the tab
		e.preventDefault();
	});
});*/