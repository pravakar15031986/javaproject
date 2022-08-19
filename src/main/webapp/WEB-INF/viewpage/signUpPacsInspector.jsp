<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" user-scalable="no">
    <title>Paddy Fields Survey</title>
    <meta name="keywords" content="WRSIS :: Wheat Rust Surveillance Information System" />
    <meta name="description" content="WRSIS :: Wheat Rust Surveillance Information System" />
    <link type="image/x-icon" rel="shortcut icon" href="wrsis/images/logo_white_orsac.png" />
    
    <link href="wrsis/css/bootstrap.min.css" rel="stylesheet">
   	<link href="wrsis/css/login.css" rel="stylesheet" type="text/css">
    <script src="wrsis/js/jquery-3.5.1.min.js"></script>

</head>

<script>
function isAlphaBets(evt){ // Alphanumeric only
	var keyCode = (evt.which) ? evt.which : evt.keyCode 
			if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) &&  keyCode != 32 && keyCode != 39){
				return false;
			}
	}
	
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode != 45  && charCode > 31 && (charCode < 48 || charCode > 57)){
	   return false;
	   }
   if(evt.keyCode===45){  //For negetive symbol
	   return false;
	   }
   

   return true;
}

</script>
<script type="text/javascript">
$(document).ready(function(){
	
	
	$("#distId").on("change",function(){
	var distId=$(this).val();
	
	
	
	
   $.ajax({
	type : "POST",
	url : "fetchBlockDetailsByDistId",
	data : 'distId='+distId,
	cache : false,
	timeout : 600000,
	success : function(response) {
		//console.log(response);
		var len=response.length;
		var html='';
		html+='<option value="0">Select Block</option>';
		for(var i=0;i<len;i++){
			
			html+='<option value="'+response[i].blockId+'">'+response[i].blockName+'</option>';
			
		}
		$("#blockId").empty();
		$('#pacsId option:first').attr('selected',true);
		$("#blockId").append(html);

	},
	error:function(err){
		console.log(err);
	}
	
});

});
	
	$("#blockId").on("change",function(){
		var blockId=$(this).val();
		
		
	   $.ajax({
		type : "POST",
		url : "fetchPacsDetailsByBlockId",
		data : 'blockId='+blockId,
		cache : false,
		timeout : 600000,
		success : function(response) {
			//console.log(response);
			var len=response.length;
			var html='';
			html+='<option value="0">Select Society</option>';
			for(var i=0;i<len;i++){
			
				html+='<option value="'+response[i].societyId+'">'+response[i].societyName+'('+response[i].societyId+')</option>';
				
			}
			$("#pacsId").empty();
			$("#pacsId").append(html);

		},
		error:function(err){
			console.log(err);
		}
		
	});
	
	});
	
	
	
	 $(window).scroll(function(){ 
         if ($(this).scrollTop() > 50) { 
             $('#scroll').fadeIn(); 
             $('.header').addClass('fix-header');
         } else { 
             $('#scroll').fadeOut(); 
             $('.header').removeClass('fix-header');
         } 
     }); 
     $('#scroll').click(function(){ 
         $("html, body").animate({ scrollTop: 0 }, 600); 
         return false; 
     });

	var otpTimer = "";	

	$("#btnSubmitId").on("click",function(){
		
	if(validate()){
			
			  
			  swal({
			 		title: 'Do you want to submit?',
			 		  type: '',
			 		  showCancelButton: true,
			 		  confirmButtonText: 'Yes',
			 		  cancelButtonText: 'No',
				    }).then((result) => {
				    	     if (result.value) {
				    		  saveSignUpdata();
				    		  }
				    	  
				    		})
				    	
		  }
  
	});
	
	function saveSignUpdata(){
		
		var name=$("#Name").val();
		var desgination=$("#desigId").val();
		var mobNo=$("#mobNo").val();
		var state=$("#stateId").val();
		var district=$("#distId").val();
		var block=$("#blockId").val();
		var pacs=$("#pacsId").val();
		
		 var data = {};
		 data.name=name;
		 data.desginationId=desgination;
		 data.mobileNumber=mobNo;
		 data.stateId=state;
		 data.districtId=district;
		 data.blockId=block;
		 data.pacsId=pacs;
		
		$.ajax({ 
			   type: "POST",
			   contentType: "application/json",
			   url: "savePacsInspectorData",
			   data: JSON.stringify(data),
			   dataType: 'json',
			   cache: false,
			   timeout: 600000,
			   success: function(data){
				   debugger;				   
				   var temp=data;
				   if(data=='200'){
					   sendOtp(mobNo);
				   }else if(data=='201'){
					   sendOtp(mobNo);
				   }else if(data=='202'){
					   swal({
		    				title:'',
		    				  text: "Mobile Number already Sign up.",
		    				  icon: "error",
		    				  button: "Close",
		    				});
				   }else{
					   swal({
		    				title:'Error',
		    				  text: "Some Error Ocuured.",
		    				  icon: "error",
		    				  button: "Close",
		    				});
				   }
			     
			   } 
			}); 

	}
	
	function sendOtp(mobNo){
		
		var mobNo=$("#mobNo").val();
		
		
		 var data = {};
		 data.mobNumber=mobNo;
			$.ajax({ 
				   type: "POST",
				   contentType: "application/json",
				   url: "saveOtp",
				   data: JSON.stringify(data),
				   dataType: 'json',
				   cache: false,
				   timeout: 600000,
				   success: function(data){
					   var temp=data;
					  
					   if(temp=='200'){
					   	$(".hideDiv").hide();
					   	$(".ind").hide();
					   	$("#headerId").text("OTP Verification");
						 
						  $('select').prop('disabled', true);
						  
						  var phno=$("#mobNo").val();
						  
						  var maskedString="XXXXXX";
						  var maskedPhNo=maskedString+phno.substring(6,10);
						  $("#maskedPhNo").text(maskedPhNo);
						  //alert(maskedPhNo);
						 
						  $("#otpDivId").show();
						  var fiveMinutes = 60 * 5, display = document.querySelector('#time');
							startTimer(fiveMinutes, display);
					   }else if(temp=='201'){
						   swal({
			    				title:'',
			    				  text: "This Mobile Number has been already exist.",
			    				  icon: "error",
			    				  button: "Close",
			    				});
					   }else if(temp=='501'){
						   swal({
			    				title:'',
			    				  text: "OTP can not Sent this time, Please try after some time.",
			    				  icon: "error",
			    				  button: "Close",
			    				});
					   } else{
						   swal({
			    				title:'Error',
			    				  text: "Some Error Occured.",
			    				  icon: "error",
			    				  button: "Close",
			    				});
					   }
				}
			});
	 
	}
	
	
	
	
	function validate(){
		debugger;
	
		//regex
		var reg_name = /^[a-zA-Z\s]*$/;
		var reg_mob=   /^[0-9]*$/;
		//Field data
		var name=$("#Name").val();
		var desgination=$("#desigId").val();
		var mobNo=$("#mobNo").val();
		var state=$("#stateId").val();
		var district=$("#distId").val();
		var block=$("#blockId").val();
		var pacs=$("#pacsId").val();
		
		
		if(name.trim()==''){
			 $("#Name").focus();
		     swal("Error", "Please Enter the  Name", "error");
		     return false;
		}else if(!reg_name.test(name)){
			 $("#Name").focus();
		     swal("Error", "Please Enter the Valid Name", "error");
		     return false;
		}else if(desgination=='0'){
			$("#desigId").focus();
		     swal("Error", "Please Select the  Designation", "error");
		     return false;
		}else if(mobNo.trim()==''){
			$("#mobNo").focus();
		     swal("Error", "Please Enter the  Mobile Number", "error");
		     return false;
		}else if(mobNo.length!=10){
			$("#mobNo").focus();
		     swal("Error", "Mobile Number Should be 10 Digits", "error");
		     return false;
		}else if(!reg_mob.test(mobNo)){
			$("#mobNo").focus();
		     swal("Error", "Please Enter the  Valid Mobile Number", "error");
		     return false;
		}else if(state=='0'){
			$("#stateId").focus();
		     swal("Error", "Please Select the  State", "error");
		     return false;
		}else if(district=='0'){
			$("#distId").focus();
		     swal("Error", "Please Select the  District", "error");
		     return false;
		}else if(block=='0'){
			$("#blockId").focus();
		     swal("Error", "Please Select the  Block", "error");
		     return false;
		}else if(pacs=='0'){
			$("#gpId").focus();
		     swal("Error", "Please Select the  Society", "error");
		     return false;
		}else{
			return true;
		}
		
	
	}
	


function startTimer(duration, display) {
    debugger;
    //stopTimer();
   
	var timer = duration, minutes, seconds;
	
    otpTimer = setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
	
        display.textContent = minutes + ":" + seconds;
		
        if (--timer < 0) {
           // timer = duration;
            display.textContent = "00" + ":" + "00";
        }
    }, 1000);
}

$('#resendOtpId').on('click', function() {
	debugger;
	clearInterval(otpTimer);
	//sendOtp();
	 sendOtp(mobNo);

});

$('#OtpValidateBtnId').on('click', function(e) {
	
e.preventDefault();
	
		var data ={};
		data.otp = $("#otpNO").val();
	 	data.mobNumber=$("#mobNo").val();
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "validateOtp",
		data : JSON.stringify(data),
		dataType : 'json',
		cache : false,
		timeout : 600000,
		async:false,
		success : function(response) {
			
		if(response=='200'){
			swal({
				title:'Success',
				  text: "OTP verified successfully  and pending with DRCS for Approval",  /* and pending with DRCS Approval */
				  icon: "success",
				  button: "Close",
				}).then((result)=>{
					location.href='login';
				});
			
		}else if(response=='300'){
			swal({
				title:'Error',
				  text: "Mobile Number Mismatched.",
				  icon: "error",
				  button: "Close",
				});
		}else if(response=='301'){
			swal({
				title:'Error',
				  text: "Invalid Otp, Please Enter Correct Otp.",
				  icon: "error",
				  button: "Close",
				});
		} else if(response=='302'){
			swal({
				title:'Error',
				  text: "Otp Expired",
				  icon: "error",
				  button: "Close",
				});
		}
	
	}
	});
});
});

</script>
<style>
.pd_top_7{padding-top:7rem; padding-bottom: 7rem;}
.SignUp_Form .card .card-header{    
	display: flex;
    padding: 20px 16px;
    background: #f8ffe6;
    color: #668f00;
    font-weight: 500;
    letter-spacing: 0.5px;}
.SignUp_Form .card .card-header p{flex-grow:1; margin-bottom:0px}
.button_section{padding-top:2rem}
.SignUp_Form{background: #f2f2f2;padding-bottom:1.5rem;
/* height:100vh; */
}
label.control-label{color: #648d00;}
.form-control{color: #787878;
    background-clip: padding-box;
    border: 1px solid #e1e1e1;}
.mobile_text_resend{font-style:italic; color: #5d7a15;}
.mobile_text_resend a{color:#7eb100; font-weight:bold}
#maskedPhNo{color:#5d7a15}
.button_section .submit_btn{
    background: #608700;
    color: #fff;
    border: none;
    letter-spacing: 1px;
}
.button_section .submit_btn.hvr-rectangle-out:before{
	background: #8bc34a;
    border: 1px solid #8bc34a;
    border-radius: 3px;
}
.button_section .reset_btn{
	background: #cf1c00;
    color: #fff;
    border: none;
    letter-spacing: 1px;
}
.button_section .reset_btn.hvr-rectangle-out:before{
	background: #ff0000;
    border: 1px solid #ff0000;
    border-radius: 3px;
}

  @media (max-width: 768px) {
  	.SignUp_Form .card .card-header{ 
  		display:block;
  	}
  	.SignUp_Form .card .card-header p{font-size:18px}
  	.SignUp_Form .card .card-header .ind{font-size: 13px}
  }
  
  footer{
  	width:100%;
  	position:fixed;
  	bottom:0px;
  }
</style>
 <div class="containtarea">
        <div class="header fixed-top">
            <div class="loginlogo">
               <a href="signUpPacsInspector" title="Wheat Rust Surveillance Information System"> <img src="wrsis/images/logo_white_orsac.png" alt="WRSIS logo" class="mobile-login" />
                <h1>Odisha Paddy Land Monitor<span>Food Supplies & Consumer Welfare Department </span></h1>
               </a>
            </div>
            <div class="register_pac">
            	<a href="login" class="hvr-rectangle-out pac_text">Login</a>
            	<a href="signUpPacsInspector" class="hvr-rectangle-out pac_icon">
            		<i class="fa fa-pencil"></i>
            	</a>
            </div>            
        </div>
    </div>
   <div class="SignUp_Form">
            <div class="container pd_top_7">
              <!--  <div class="page-title">
                  <div class="title-details">
                     <h4>Pacs Inspector</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Pacs Inspector</li>
                           <li class="breadcrumb-item active" aria-current="page">Pacs Inspector</li>
                        </ol>
                     </nav>
                  </div>
           
               </div> -->
            <!--    <div class="row">
                  <div class="col-md-12 col-sm-12"> -->
                     <div class="card">
                        <div class="card-header">
                        <p id="headerId">Register for Field Surveyor</p>
                          <!--  <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active" href="signUpPacsInspector">SignUp</a>
                              <a class="nav-item nav-link " href="viewFunctionMaster">View</a>
                           </ul> -->
                           <div class="indicatorslist">
                              
                              
                              <p class="ind" style="color: red;" ><small>(*) Indicates mandatory</small></p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form class="col-sm-12 form-horizontal customform" action="signUpPacsInspector"  method="post" autocomplete="off">
                       
					

                        <div class="card-body">
                  			<div class="row">
                  				<div class="col-lg-6">
                  					<div class="form-group hideDiv">
								        <label for="demo-text-input2" class="control-label"><span>Name of Field Surveyor</span> <span class="text-danger">*</span></label>
								         <input type="text" class="form-control"  id="Name" maxlength="50"  onKeypress="return isAlphaBets(event);"></input>
										<label ></label><errors path="functionName" cssClass="error"  element="div" />
								    </div>
								    </div>
								    <div class="col-lg-6">
                  					<div class="form-group hideDiv">
								        <label for="demo-text-input" class="control-label"><span>Designation</span> <span class="text-danger">*</span></label>
								        <select id="desigId" name="globalLinkId" class="form-control select2">
                                   <option value="0">Select Designation</option>
     			         			   <option value="3">Field Surveyor</option>

                                    </select>
                                    <label></label>
								  </div>
								  </div>
								    <div class="col-lg-6">
								    <div class="form-group hideDiv">
								        <label for="demo-text-input1" class="control-label"><span>Mobile Number</span> <span class="text-danger">*</span></label>
								          <input type="text" class="form-control"  id="mobNo" maxlength="10" onkeypress="return isNumberKey(event)"></input> 
										<label ></label><errors path="fileName" cssClass="error"  element="div" />
								    </div>

								    </div>
								     <div class="col-lg-6">
								    <div class="form-group hideDiv">

								        <label for="demo-text-input1" class="control-label"><span>Email Id</span> <span class="text-danger"></span></label>
								          <input type="text" class="form-control"></input> 
									</div>
									</div>
									<div class="col-lg-6">
								  <div class="form-group hideDiv">
								        <label for="demo-text-input" class="control-label"><span>State</span> <span class="text-danger">*</span></label>
								         <select id="stateId" name="globalLinkId" class="form-control select2">
                                   <option value="0">-- Select --</option>
     			         			 <option value="1">Odisha</option>
     			         			  
                                    </select>
                                    <label></label>
								  </div>
								  </div>
								     <div class="col-lg-6">

								      <div class="form-group hideDiv">
								        <label for="demo-text-input" class="control-label"><span>District</span> <span class="text-danger">*</span></label>
								        <select id="distId" name="globalLinkId" class="form-control select2">
                               

                                   <option value="0">Select District</option>
     			         			 <c:forEach var="listValue"
																items="${districtList}">
																<option value='${listValue.districtId}'>${listValue.districtName}</option>
																<%-- <input type="hidden" name="ppcId"
																	value="${listValue.key}" /> --%>
									 </c:forEach>

     			         			  
                                    </select>
                                    <label></label>
								  </div>
								  </div>

     			         			   <div class="col-lg-6">
								   <div class="form-group hideDiv">
								        <label for="demo-text-input" class="control-label"><span>Block</span> <span class="text-danger">*</span></label>
								         <select id="blockId" name="globalLinkId" class="form-control select2">

                                 

                                 		<option value="0">Select Block</option>
                                    </select>
                                    <label></label>
								  </div>
								  </div>
									<div class="col-lg-6">
									    <div class="form-group hideDiv">
								        <label for="demo-text-input" class="control-label"><span>Society</span> <span class="text-danger">*</span></label>
								       <select id="pacsId" name="globalLinkId" class="form-control select2">


                                   <option value="0">Select Society</option>

                                    </select>
                                    <label></label>
								  </div>
                  				</div>
                  		
								<!--   <div class="form-group hideDiv">
								        <label for="demo-text-input1" class="control-label"><span>PACS Email ID</span> <span class="text-danger"></span></label>
								          <input type="text" class="form-control"  id="mobNo" maxlength="10"></input> 

										<label ></label><errors path="fileName" cssClass="error"  element="div" />

								    </div>
								    </div>
								    <div class="col-lg-6">

								    </div> -->

                  				
                  				
								<!--   <div class="form-group hideDiv">
								        <label for="demo-text-input1" class="control-label"><span>PACS Email ID</span> <span class="text-danger"></span></label>
								          <input type="text" class="form-control"  id="mobNo" maxlength="10"></input> 
										<label ></label><errors path="fileName" cssClass="error"  element="div" />
								    </div> -->
								   
                  				
                  				<div class="col-lg-12 text-center">
                  					 <div class="button_section hideDiv">
								  	  <button class="btn submit_btn mb-1 mr-2 hvr-rectangle-out" id="btnSubmitId" >Submit</button>
                                 	  <button type="reset" class="btn reset_btn mb-1 hvr-rectangle-out" id="btnResetId">Reset</button>
								  </div>
                  				</div>
                  			</div>

                           
                           	<div class="col-xs-12 col-md-12 col-lg-12 col-xl-12" id="otpDivId"  style="display: none;">
								<div class="content-section">
									<div class="tab-pane active" id="View">
										<div class="table-responsive" align="center">
										
										<div class="form-group">
											<h5 >OTP Verification</h5>
											<span class="mobile-text" style="font-weight:bold;">An OTP has been sent to your Mobile No <span id="maskedPhNo"></span></span>
											<div class="col-lg-3 mt-4" >
												<input type="text" maxlength="6" id="otpNO" name ="otpNO" class="form-control" autofocus  placeholder="Enter OTP" required>
											</div>	<br>
											<intput type="hidden" value="${user_name}" id="userNameId" name="user_name" />
											
											<button class="btn btn-success px-4 mb-2 validate"  id="OtpValidateBtnId">Verify</button>
											<div>OTP Expires in <span id="time" style="font-weight:bold">05:00</span> minutes!</div>
											<div class="text-center mt-5">
												<span class="d-block mobile_text_resend">If You have not received your OTP, click here 
												<a href="#" ><span class="cursor" id="resendOtpId">Resend</span></a></span>
											</div>			
										</div>
										
											
										</div>
						
									</div>
								</div>
						</div>
                        </div>
                        </form>
                        <!--===================================================-->
                        <!-- END BASIC FORM ELEMENTS -->
                     </div>
                 <!--  </div>
               </div> -->
            </div>
         </div>
         
         <footer>
        <div class="row align-items-center">
            <div class="col-12 col-lg-9 col-xl-9 text-left">Copyrights ©
                <script>document.write(new Date().getFullYear());</script> Odisha Paddy Land Monitor
            	<br><small>The website is best experienced on the following version (or higher) of Chrome 31, Firefox 26, Safari 6 and Internet Explorer 9 browsers </small>
            </div>
            <div class="col-12 col-md-3 col-xl-3 text-right">
               <!-- <a href="aboutus" title="About Us" class="text-white">About Us</a> | <a href="privacy" title="Privacy Policy"  class="text-white">Privacy Policy</a>  | <a href="surveymap" title="Survey Map"  class="text-white">Survey Map</a> -->
            </div>
        </div>
        <a href="#" id="scroll" style="display: none;"><span></span></a>
    </footer>
         
         
         <link href="wrsis/css/font-awesome.min.css" rel="stylesheet">
    <link href="wrsis/css/animate.css" rel="stylesheet">
    <script src="wrsis/js/bootstrap.min.js" defer></script>

    <script src="wrsis/pagejs/passwordEye.js" defer></script>
 


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">

    <!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
    <script
        src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
    <script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>

         