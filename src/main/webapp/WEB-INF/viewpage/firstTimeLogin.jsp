<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" user-scalable="no">
<title>Paddy Fields Survey</title>
<meta name="keywords" content="WRSIS :: Wheat Rust Surveillance Information System" />
<meta name="description" content="WRSIS :: Wheat Rust Surveillance Information System" />
  <link type="image/x-icon" rel="shortcut icon" href="wrsis/images/logo_white_orsac.png" />
<link href="wrsis/css/bootstrap.min.css" rel="stylesheet">
<link href="wrsis/css/font-awesome.min.css" rel="stylesheet">
<link href="wrsis/css/animate.css" rel="stylesheet">
<link href="wrsis/css/icons.css" rel="stylesheet">
<link href="wrsis/css/login.css" rel="stylesheet">
<script src="wrsis/js/jquery-3.5.1.min.js"></script>

<script src="wrsis/js/popper.min.js"></script>  
<script src="wrsis/pagejs/passwordEye.js"></script>
<script src="wrsis/js/bootstrap.min.js"></script>
</head>
<body>

<div class="containtarea">
        <div class="header fixed-top">
            <div class="loginlogo">
               <a href="login" title="Paddy Field Survey Application"> <img src="wrsis/images/logo_white_orsac.png" alt="WRSIS logo" class="mobile-login" />
                <h1>Paddy Field Survey Application<span>Food Supplies & Consumer Welfare Department </span></h1>
               </a>
            </div>
            <!-- <div class="register_pac">
            	<a href="signUpPacsInspector" class="hvr-rectangle-out pac_text">Register for PACS Inspector</a>
            	<a href="signUpPacsInspector" class="hvr-rectangle-out pac_icon">
            		<i class="fa fa-pencil"></i>
            	</a>
            </div> -->
            <div class="stakeholder-logo float-right d-lg-block d-none">
            	<!-- <div class="stakeholder-logobox">
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
            	</div>-->
            	
            	<!-- <div class="stakeholder-logobox large-imgbox">
            	<a href="http://www.moa.gov.et/" title="Ministry of Agriculture" target="_blank">
            		<img src="wrsis/images/ministry-agri.jpg" alt="login logo"  />
            	</a>	
            	
            	<a href="http://www.eiar.gov.et/" title="EAIR" target="_blank">
            			<img src="wrsis/images/agri-research.jpg" alt="login logo" class="border-0"/>
            	</a>		
            	</div> -->
            	<!-- <hr> -->
           <!--  	<div class="stakeholder-logobox small-imgbox">
            	<a href="http://www.ata.gov.et/" title="ATA" target="_blank">
            		<img src="wrsis/images/agri-transfo.jpg" alt="login logo" />
            	</a>	
            	
            	<a href="https://www.cimmyt.org/" title="cimmyt" target="_blank">
            			<img src="wrsis/images/cimmyt-1.jpg" alt="login logo" />
            	</a>		
            	
            	<a href="https://www.cam.ac.uk/" title="University Cambridge" target="_blank">
            		<img src="wrsis/images/uni-cambridge.jpg" alt="University Cambridge" />
            	</a>	
            	
            	<a href="#" title="Met Office" target="_blank">
            		<img src="wrsis/images/met-office.jpg" alt="Met Office" />
            	</a>	
            	</div> -->
            </div><!--  -->
            
        </div>
    </div>
    <div class="bannersec">
    <img src="wrsis/images/mobile-bg.jpg" alt="mobile banner" class="bannerimg">
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active"> <img class="d-block" src="wrsis/images/banner_orsac.jpg" alt="First slide"> </div>
         <!--  <div class="carousel-item"> <img class="d-block" src="wrsis/images/Banner1.jpg" alt="Second slide"> </div>
          <div class="carousel-item"> <img class="d-block" src="wrsis/images/Banner3.jpg" alt="Fifth slide"> </div> -->
        </div>
        
     
      </div>
    
      <div class="loginbox wow animated fadeInLeft" data-wow-delay=".5s">
       <form:form action="firstTimeChangePassword" modelAttribute="loginObj" autocomplete="off" method="post">    
       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
        <h2>First Time Login</h2>
        <hr> 
        	
        	<div class="form-group row"> 
			    
			    <div class="col-12 col-md-12 col-xl-12">
			    <i toggle="#currentPassword" class="fa fa-fw fa-eye-slash pass-i-tooltip password"></i>
			      <input type="password" id="currentPassword" class="form-control form-control-eye-position" placeholder="Current Password" Autocomplete="off" maxlength="20" >
			   	  <input type="hidden" name="currentPassword" id="encodeCurrentPassword"  />
			    </div>
			  </div>
			  
			  
			  <div class="form-group row">
			    <div class="col-12 col-md-12 col-xl-12 alert1">
			    <i toggle="#newPassword" class="fa fa-fw fa-eye-slash pass-i-tooltip2 password"></i>
			      <input type="password" id="newPassword" class="form-control form-control-eye-position" placeholder="New Password" Autocomplete="off" maxlength="20" >
			      <input type="hidden" name="newPassword" id="encodeNewPassword"  />
			      <a class="imark" data-toggle="tooltip" data-html="true" data-placement="left" title="Passwords must contain  at least<br> 8-20 characters  including  A-Z,<br> a-z, 0-9, @, #, $, ."><i class="fa fa-info-circle" aria-hidden="true"></i> </a>
			    </div>
			  </div>
			  
			  <div class="form-group row">
			    <div class="col-12 col-md-12 col-xl-12 alert1">
			    <i toggle="#conformPassword" class="fa fa-fw fa-eye-slash pass-i-tooltip3 password"></i>
			      <input type="password" id="conformPassword" class="form-control form-control-eye-position"  placeholder="Confirm Password" Autocomplete="off" maxlength="20" >
			       <input type="hidden" name="confirmPassword" id="encodeConformPassword"  />
			       <a class="imark"  data-toggle="tooltip"  data-html="true" data-placement="left" title="New Password and Confirm<br> Password must be same"><i class="fa fa-info-circle" aria-hidden="true"></i> </a>
			    </div>
			  </div>
			  
	
			  
         <div class="form-group row">
          <div class="col-12 col-md-12 col-xl-12">
          <div class="captcha">
            <span class="mb-2"> <img  src="thymeleaf/Captcha.jpg" alt="captha" id="captchId"> <!-- Which is the smallest among 5,65,32 ? -->  <a href="javascript:void(0)" onclick="reloadCaptch();" class="text-right"><i class="fa fa-refresh"></i></a>  </span>
           </div>
          </div> 
        </div>
        
        <div class="form-group row">
          <div class="col-12 col-md-12 col-xl-12">
            <input type="text" id="txtCaptcha" name = "securityAns" class="form-control" placeholder="Enter Your Answer Here" Autocomplete="off" >
          </div>
        </div>
        
      
        
      
        
        <button class="btn btn-primary mb-1 btn-block hvr-rectangle-out" onclick="return submitForm();" >Submit</button>
        <div class="clearfix"></div>
       <div class="links"> 
					<center> <a class="text-white" href="login" >Back to Login</a> </center>
						<div class="clearfix"></div>
	   </div>
       </form:form>
       </div>
       </div>
  
 
<script src="wrsis/js/easing.js"></script>
<script src="wrsis/js/wow.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>

        
 <script>
 $(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	});

$( document ).ready( function () {
			
new WOW().init();

} );



$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
    setTimeout(function() {$("#messageId").hide(); }, 3000);
});

function reloadCaptch(){
	var d=new Date();
	document.getElementById("captchId").src="thymeleaf/Captcha.jpg?a="+d.getTime();
}

function submitForm(){
	var currentPassword = $("#currentPassword").val();
	var newPassword = $("#newPassword").val();
	var conformPassword = $("#conformPassword").val();
	var captcha = $("#txtCaptcha").val();
	if(currentPassword == ""){
		swal(
				'Error!',
				'Current Password should not be blank',
				'error'
			)
		$("#currentPassword").focus();
		return false;
	}
	if(newPassword == ""){
		swal(
				'Error!',
				'New Password should not be blank',
				'error'
			)
		$("#newPassword").focus();
		return false;
	}
	if(conformPassword == ""){
		swal(
				'Error!',
				'Confirm Password should not be blank',
				'error'
			)
		$("#conformPassword").focus();
		return false;
	}
	if(captcha == ""){
		swal(
				'Error!',
				'Captcha should not be blank',
				'error'
			)
		$("#txtCaptcha").focus();
		return false;
	}if(newPassword != conformPassword){
		swal(
				'Error!',
				'Confirm Password does not match with New Password ',
				'error'
			)
		$("#txtCaptcha").focus();
		return false;
	}
	/* if(/^(?=.*\d)(?=.*[a-z])(?=.*[$@#])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/.test(newPassword) == false) {
    	swal("Error","Password must contain at least 8-20 characters including A-Z, a-z, 0-9, @, #, $", "error");
    	return false;
    }else{
			swal({
			title: ' Do you want to Submit?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonText: 'Yes',
			  cancelButtonText: 'No',
			  }).then((result) => {
			  	  if (result.value) {
			  		  swal("Success", "Your password has been changed succcessfully ", "success"); 
			  		  window.location.href="firstTimeLogin";
			  		  return true;
			  		  }
	  		})
  		} */
	
	/* document.getElementById("loginfrom").submit(); */
	
	$("#encodeCurrentPassword").val(btoa(currentPassword));
	$("#encodeNewPassword").val(btoa(newPassword));
	$("#encodeConformPassword").val(btoa(conformPassword));
	
	
    return true;
}

function numbersonly(e){
    var unicode=e.charCode? e.charCode : e.keyCode;
    if ( ( (unicode>47)&&(unicode<58) ) || unicode == 9 || unicode == 8 || unicode == 46)
            return true;
    else {
    	swal('This field accepts numbers Only!');
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

<c:if test="${not empty msg}">

	<script>
	$(document).ready(function(){   
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	});
</script>
</c:if>
      <c:if test="${not empty errMsg}">
	<script>
	$(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>
</body>
</html>



