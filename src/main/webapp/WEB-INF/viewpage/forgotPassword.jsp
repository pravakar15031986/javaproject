<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" user-scalable="no">
<title>WRSIS :: Wheat Rust Surveillance Information System</title>
<meta name="keywords" content="WRSIS :: Wheat Rust Surveillance Information System" />
<meta name="description" content="WRSIS :: Wheat Rust Surveillance Information System" />
<link type="image/x-icon" rel="shortcut icon" href="wrsis/images/favicon.png"/>
<link href="wrsis/css/bootstrap.min.css" rel="stylesheet">
<link href="wrsis/css/font-awesome.min.css" rel="stylesheet">
<link href="wrsis/css/animate.css" rel="stylesheet">
<link href="wrsis/css/icons.css" rel="stylesheet">
<link href="wrsis/css/login.css" rel="stylesheet">
<script src="wrsis/js/jquery-3.5.1.min.js"></script>

<script src="wrsis/js/bootstrap.min.js"></script>
</head>
<body>

  <div class="containtarea">
    <div class="header"> 
    	<div class="loginlogo">
			<img src="wrsis/images/wrsis-logo.png" alt="WRSIS logo" class="mobile-login"/>
			<h1>Wheat Rust Surveillance <br>Information System</h1>
		</div>
		  <div class="stakeholder-logo float-right  d-lg-block d-none">
            	<div class="stakeholder-logobox">
            	<a href="http://www.moa.gov.et/" title="Ministry of Agriculture" target="_blank">
            		<img src="wrsis/images/stakeholder-1.jpg" alt="login logo" />
            	</a>	
            	</div>
            	<div class="stakeholder-logobox">
            	<a href="http://www.ata.gov.et/" title="ATA" target="_blank">
            			<img src="wrsis/images/stakeholder-2.jpg" alt="login logo" />
            	</a>		
            	</div>
            	<div class="stakeholder-logobox">
            	<a href="http://www.eiar.gov.et/" title="eiar" target="_blank">
            		<img src="wrsis/images/stakeholder-3.jpg" alt="login logo" />
            	</a>	
            	</div>
            	<div class="stakeholder-logobox">
            	<a href="https://www.cimmyt.org/" title="cimmyt" target="_blank">
            		<img src="wrsis/images/stakeholder-4.jpg" alt="login logo" />
            	</a>	
            	</div>
            </div>
	</div>
    
    <div class="bannersec">
    <img src="wrsis/images/mobile-bg.jpg" alt="mobile banner" class="bannerimg">
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active"> <img class="d-block" src="wrsis/images/Banner.jpg" alt="First slide"> </div>
          <div class="carousel-item"> <img class="d-block" src="wrsis/images/Banner1.jpg" alt="Second slide"> </div>
          <div class="carousel-item"> <img class="d-block" src="wrsis/images/Banner3.jpg" alt="Fifth slide"> </div>
        </div>
        
     
     
     </div>
      <div class="loginbox wow animated fadeInLeft" data-wow-delay=".5s">
       <form:form action="passwordReset" method="post" modelAttribute="paswdResetDetails" autocomplete="off" id="pswdResetForm">    
       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
        <h2>Forgot Password</h2>
        <hr>
        <div class="form-group row">
          
          <div class="col-12 col-md-12 col-xl-12">
            <input type="text"  maxlength="50" class="form-control" placeholder="User ID" id="txtuserID" title="User ID">
            <input type="hidden" name="userName" id="encodeTxtuserID" />
          </div>
        </div>
        <div class="form-group row">
          <div class="col-12 col-md-12 col-xl-12">
            <input type="text" name="email" class="form-control" placeholder="Email" id="emailId" title="Email ID" maxlength="50" >
            
          </div>
        </div>
        
        
        
      <div class="form-group row">
          <div class="col-12 col-md-12 col-xl-12">
          <div class="captcha">
            <span class="mb-2"> <img  src="thymeleaf/Captcha.jpg" alt="captcha" id="captchId"> <!-- Which is the smallest among 5,65,32 ? -->  <a href="javascript:void(0)" onclick="reloadCaptch();" class="text-right"><i class="fa fa-refresh"></i></a>  </span>
           </div>
          </div> 
        </div>
        
        <div class="form-group row">
          <div class="col-12 col-md-12 col-xl-12">
            <input type="text" id="txtCaptcha" name = "securityAns" class="form-control" placeholder="Enter Your Answer Here" >
          </div>
        </div>
        
      
        
      
        
        <button class="btn btn-primary mb-1 btn-block hvr-rectangle-out" onclick="return submitForm();" >Submit</button>
        <div class="clearfix"></div>
       <div class="links"> 
					<center> <a class="" href="login" style="color:white">Back to Login</a> </center>
						<div class="clearfix"></div>
	   </div>
       </form:form>
       </div>
      
<script src="wrsis/js/easing.js"></script>
<script src="wrsis/js/wow.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>

<script>
$( document ).ready( function () {
			
new WOW().init();

} );



function reloadCaptch(){
	var d=new Date();
	document.getElementById("captchId").src="thymeleaf/Captcha.jpg?a="+d.getTime();
}

function submitForm(){
	var userId = $("#txtuserID").val();
	var emailId = $("#emailId").val();
	var captcha = $("#txtCaptcha").val();
	if(userId == ""){
		swal(
				'Error!',
				'Please enter User ID',
				'error'
			)
		$("#txtuserID").focus();
		return false;
	}
	if(emailId == ""){
		swal(
				'Error!',
				'Please enter Email',
				'error'
			)
		$("#emailId").focus();
		return false;
	}
	if(captcha == ""){
		swal(
				'Error!',
				'Please enter the Captcha',
				'error'
			)
		$("#txtCaptcha").focus();
		return false;
	}
	
	/* document.getElementById("loginfrom").submit(); */
	 
	//  $("#encodeEmailId").val(btoa(emailId));	
	swal({
		title: ' Do you want to submit?',
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonText: 'Yes',
		  cancelButtonText: 'No',
		  /* reverseButtons: true */
    }).then((result) => {
    	  if (result.value) {
    		
    		  $("#encodeTxtuserID").val(btoa(userId));
    		  $("#pswdResetForm").submit();
    		  /* swal("Success", "password has been sent your register email id ", "success"); 
    		  window.location.href="forgotPassword"; */
    		  }
    		})
    return false;
}

function numbersonly(e){
    var unicode=e.charCode? e.charCode : e.keyCode;
    if ( ( (unicode>47)&&(unicode<58) ) || unicode == 9 || unicode == 8 || unicode == 46)
            return true;
    else {
    	/* swal('This field accepts numbers Only!'); */
    	return false;
    }
}

function blockSpecialChar(e){
	var regex = new RegExp("^[A-Za-z0-9@#$.]+$");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (regex.test(str)) {
       return true;
   }
    return false;
}

function blockSpecialChar1(e){
	var regex = new RegExp("^[A-Za-z0-9_.]+$");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (regex.test(str)) {
       return true;
   }
    return false;
}
</script>


<c:if test="${errMsg ne Empty}">
<script>
	$(document).ready(function(){   
		swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>
</body>
</html>
