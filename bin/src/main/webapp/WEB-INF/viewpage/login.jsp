<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" user-scalable="no">
    <title>Odisha Paddy Land Monitor</title>
    <meta name="keywords" content="Odisha Paddy Land Monitor" />
    <meta name="description" content="Odisha Paddy Land Monitor" />
    <link type="image/x-icon" rel="shortcut icon" href="wrsis/images/favicon_orsac.ico" />
    <link href="wrsis/css/bootstrap.min.css" rel="stylesheet">
   	<link href="wrsis/css/login.css" rel="stylesheet">
    <script src="wrsis/js/jquery-3.5.1.min.js"></script>
    <style>
    	.brandList{
    		    color: #ef8a0c;
			    text-decoration:underline;
    	}
    	.brandList:hover , .brandList:focus {
    	color:#ef8a0c}
    	
    </style>
</head>

<body>
    <div class="containtarea">
        <div class="header fixed-top">
            <div class="loginlogo">
               <a href="login" title="Odisha Paddy Land Monitor"> <img src="wrsis/images/logo_white_orsac.png" alt="Orsac logo" class="mobile-login" />
            	    <h1>Odisha Paddy Land Monitor<span>Food Supplies & Consumer Welfare Department</span></h1>
               </a>
            </div>
            <div class="register_pac">
            	<a href="signUpPacsInspector" class="hvr-rectangle-out pac_text">Registration for Field Surveyor</a>
            	<a href="signUpPacsInspector" class="hvr-rectangle-out pac_icon">
            		<i class="fa fa-pencil"></i>
            	</a>
            </div>
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
            </div>
        </div>
    </div>
    <div class="bannersec">
        <img src="wrsis/images/mobile-bg.jpg" alt="mobile banner" class="bannerimg">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block" src="wrsis/images/banner_orsac.jpg" alt="First slide">
                </div>
               <!--  <div class="carousel-item">
                    <img class="d-block" src="wrsis/images/Banner1.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block" src="wrsis/images/Banner3.jpg" alt="Fifth slide">
                </div> -->
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> <span
                    class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
            </a> <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"> <span
                    class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
            </a>
            
            <div class="scrollbtn"><a href="javascript:void(0);" ><span></span><span></span><span></span>Scroll</a></div>
            
        </div>
        <div class="loginbox">
            <form id="loginfrom" action="home" method="post" autocomplete="off">
                <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>" />
                <h2>USER LOGIN</h2>
                <hr>
                <input type="text" name="ipaddress" id="ipaddress" class="d-none">
                <div class="form-group row">
                    <div class="col-12 col-md-12 col-xl-12">
                        <input type="text" maxlength="50" class="form-control" placeholder="User ID" id="txtuserID"
                            Autocomplete="off" title="User ID">

                        <input type="hidden" name="username" id="encodeTxtuserID">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-12 col-md-12 col-xl-12">
                        <i toggle="#txtPassword" class="fa fa-fw fa-eye-slash pass-i-tooltip password"></i>
                        <input type="password" class="form-control form-control-eye-position" placeholder="Password"
                            id="txtPassword" Autocomplete="off" title="Password" maxlength="20">
                        <input type="hidden" name="password" id="encodPassword">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-12 col-md-12 col-xl-12">
                        <div class="captcha">
                            <span class="mb-2"> <img src="thymeleaf/Captcha.jpg" alt="captcha" id="captchId">
                                <a href="javascript:void(0)" onclick="reloadCaptch();" class="text-right"><i
                                        class="fa fa-refresh"></i></a>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-12 col-md-12 col-xl-12">
                        <input type="text" id="txtCaptcha" name="securityAns" class="form-control"
                            placeholder="Enter Your Answer Here" Autocomplete="off">
                    </div>
                </div>

                <button class="btn btn-primary mb-1 btn-block hvr-rectangle-out"
                    onclick="return submitForm();">Submit</button>

                <div class="clearfix"></div>
                <div class="links d-flex justify-content-end align-items-center ">
                
                 <!-- <a class="text-white" href="signUpPacsInspector">Pacs
                        Inspector?</a> -->
                  
                    <!-- <a class="text-white " href="forgotPassword">Forgot
                        Password?</a> -->

                   <!--  <div class="clearfix"></div> -->
                </div>
                
               

                <c:if test="${not empty  message }">
                    <div id="messageId">
                        <span class="text-yellow">${message}</span>
                    </div>

                </c:if>

                <c:if test="${not empty  successMessage }">
                    <script>
                        $(document).ready(function () {
                            swal("Success", "<c:out value='${successMessage}'/> ", "success");
                        });
                    </script>
                </c:if>

            </form>
             <form id="apkDownload" method="get" action="downLoadLatestApk" autocomplete="off" target="_blank">
             <input type="hidden" value="<c:out value='${csrf_token_}'/>" name="rVal" />
             </form>
        </div>
	<!-- <div class="bannerFooter">
	<div class="row">
		<div class="col-lg-8">
			 <div class="bannerbottom w-100">
            <div class="row animatedParent" data-sequence="100">
                <div class="col-6 col-sm animated fadeInUp image-wrapper">
                    <div class="bottomportlet">
                        <img src="wrsis/images/clipboardwithpencil.svg" alt="clipboard with pencil">
                        <p>
                            <a href="aboutus#datacollection" class="effect-shine">Wheat Rust Data Collection & Reporting</a>
                        </p>
                    </div>
                </div>
                <div class="col-6 col-sm animated fadeInUp image-wrapper">
                    <div class="bottomportlet">
                        <img src="wrsis/images/clipboard.svg" alt="clipboard with pencil">
                        <p>
                            <a href="aboutus#surveyoutput" class="effect-shine">Wheat Rust and record survey output</a>
                        </p>
                    </div>
                </div>
                <div class="col-6 col-sm animated fadeInUp image-wrapper">
                    <div class="bottomportlet">
                        <img src="wrsis/images/interpretation.svg" alt="clipboard with pencil">
                        <p>
                            <a href="aboutus#interpretation" class="effect-shine">Interpretation
                                recommendations</a>
                        </p>
                    </div>
                </div>
                <div class="col-6 col-sm animated fadeInUp image-wrapper">
                    <div class="bottomportlet ">
                        <img src="wrsis/images/pie-chart.svg" alt="clipboard with pencil">
                        <p>
                            <a href="aboutus#implementation"  class="effect-shine">
                            Monitor implementation of recommendations</a>
                            </p>
                    </div>
                </div>
                 <div class="col-12 col-sm animated fadeInUp image-wrapper">
                    <div class="bottomportlet ">
                        <img src="wrsis/images/survey-map.svg" alt="Survey Map">
                        <p>
                            <a href="surveymap#surveysec"  class="effect-shine">
                                Wheat Rust <br class="d-none d-md-block">Survey Map
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
		</div>
		<div class="col-lg-4 mt-60">
			 <div class="bannerbottom white-bg">
			 <div class="row animatedParent">
			 <div class="col-12 col-sm animated fadeInUp image-wrapper stackLogo d-lg-none d-md-block d-sm-block partnerLogo">
			 		<a href="#" title="Met Office" target="_blank">
            		<img src="wrsis/images/ministry-agri.jpg" alt="Met Office" />
            	</a>
			 	</div>
			 	<div class="col-12 col-sm animated fadeInUp image-wrapper stackLogo d-lg-none d-md-block d-sm-block partnerLogo">
			 		<a href="#" title="Met Office" target="_blank">
            		<img src="wrsis/images/agri-research.jpg" alt="Met Office" />
            	</a>
			 	</div>
			 	<div class="col-6 col-sm animated fadeInUp stackLogo image-wrapper">
			 		<a href="http://www.ata.gov.et/" title="ATA" target="_blank">
            		<img src="wrsis/images/agri-transfo.jpg" alt="login logo" />
            	</a>
			 	</div>
			 	<div class="col-6 col-sm animated fadeInUp stackLogo image-wrapper">
			 		<a href="https://www.cimmyt.org/" title="cimmyt" target="_blank">
            			<img src="wrsis/images/cimmyt-1.jpg" alt="login logo" />
            	</a>
			 	</div>
			 	<div class="col-6 col-sm animated fadeInUp stackLogo image-wrapper">
			 	<a href="https://www.cam.ac.uk/" title="University Cambridge" target="_blank">
            		<img src="wrsis/images/uni-cambridge.jpg" alt="University Cambridge" />
            	</a>
			 	</div>
			 	<div class="col-6 col-sm animated fadeInUp stackLogo image-wrapper">
			 		<a href="#" title="Met Office" target="_blank">
            		<img src="wrsis/images/met-office.jpg" alt="Met Office" />
            	</a>
			 	</div>
			 	
			 </div>
        </div>
		</div>
	</div>
        </div> -->
    </div>




    <div class="aboutsec text-center">
        <div class="container wow animated fadeInUp" data-wow-delay=".5s">
            <i>About</i>
            <h2>
                Odisha Paddy Land Monitor
            </h2>
            <p class="mrgnt">Welcome to the <b>Odisha Paddy Land Monitor</b> Application, a geo-spatial surveillance system for tracking and monitoring crop cultivation with the help of technology. 
The  <b>Odisha Paddy Land Survey</b> Mobile App enables authorized users (i.e. PACs Secretaries) to collect survey data and take action on the survey request. 
It ensures secured and real-time surveillance of the paddy cultivation in the State of Odisha.
			</p>

            <!-- <a class="btn button mt-5" href="aboutus" title="Read More">Read More</a> -->
        </div>
    </div>
    </div>




    <div class="network">
        <div class="row networkimg wow animated fadeInUp" data-wow-delay=".5s">
            <div class="col-12 col-md-6 col-xl-6">
                <div class="mobilesec">
				<div class="text-section">
                    <h3>
                        <span>Get your Free Download of</span>
                    	<br>
                        Odisha Paddy Land Survey App
                    </h3>
                    <div class="apps">
                   
                    <a href="https://play.google.com/store/apps/details?id=com.pfs.arcs" target="_blank" title="Google Play" class="playstore apple"> 
						<img src="wrsis/images/playstore.png" alt="Google Play" />
					</a>
					<p class="text-center font-weight-bold">
						<a href="javscript:void(0);" title="View Supported Mobile List" class="brandList">View Supported Mobile List</a>
					</p>
					 <!-- <a href="javascript:void(0);" title="Download" class="playstore" title="Apple Store">
                    	<img src="wrsis/images/apple.png" alt="Apple Store " />
                    </a> -->
                   <!--  <p class="text-center font-weight-bold">Coming Soon...</p> -->
                        <!--<div class="playstore">
                            <img src="wrsis/images/playstore.svg" alt="Google" />
                            <a href="javascript:void(0);" onclick="downloadAPK()" title="Google Play" class="text-white"> Get it on <br> <span>Google Play</span></a>
                            <p>
                                <a href="javascript:void(0);" onclick="downloadAPK()" title="Google Play" class="text-white"> Get it on <br> <span>Google Play</span></a>
                            </p>
                        </div>-->
                       <!-- <div class="playstore apple">
                            <img src="wrsis/images/apple.svg" alt="Google" />
                            
                             <p>
                                <a href="javascript:void(0);" title="Download" class="text-white">Download on the<br> <span>App Store</span></a>
                            </p>
                        </div>-->
                        
                          <!-- <div class="playstore apple">
                            <img src="wrsis/images/information.jpg" alt="Google" />
                            <p>
                                <a href="downLoadLatestApk" title="Download" class="text-white">Download on the<br> <span>Apk Here</span></a>
                            </p>
                        </div> -->
                    </div>
                    <img src="wrsis/images/mobile_app_orsac.png" alt="Mobile App" class="mobile-app-img" />
                    </div>
                </div>
            </div>



            <div class="col-12 col-md-6 col-xl-6 text-center">
             <!-- <img src="wrsis/images/hand-mob.png" alt="Mobile Image" class="rust-mobile" /> -->
                <!-- <div class="Communication">
                    <h2 class="">
                        <i>Leading in the</i>
                    </h2>
                    <h2>New World of Network</h2>
                    <h1>IVR</h1>
                    <p>
                        Shaping AI's Role in <br> Business Communication
                    </p>
                </div> -->
            </div>


        </div>
    </div>

    <footer>
        <div class="row align-items-center">
            <div class="col-12 col-lg-9 col-xl-9 text-left">Copyrights &copy;
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





    <script>

      
    
        $(document).ready(function () {
            new WOW().init();

            $('[data-toggle="tooltip"]').tooltip();
            //setTimeout(function() {$("#messageId").hide(); }, 5000);

           
            function setPublicIpSucess(response) {

                var ipaddress = response.toString();
                $("#ipaddress").val(ipaddress);

            }
            function errorFun(response) {
            }
        });

function downloadAPK() {

    		/* if (userId == "") {
                swal(
                    'Error!',
                    'User ID should not left blank',
                    'error'
                )
                $("#txtuserID").focus();
                return false;
            } */
           

            document.getElementById("apkDownload").submit();
        }
        

        function reloadCaptch() {
            var d = new Date();
            document.getElementById("captchId").src = "thymeleaf/Captcha.jpg?a=" + d.getTime();
        }

        function submitForm() {
            var userId = $("#txtuserID").val();
            var password = $("#txtPassword").val();
            var captcha = $("#txtCaptcha").val();
            if (userId == "") {
                swal(
                    'Error!',
                    'User ID should not left blank',
                    'error'
                )
                $("#txtuserID").focus();
                return false;
            }
            if (password == "") {
                swal(
                    'Error!',
                    'Password should not left blank',
                    'error'
                )
                $("#txtPassword").focus();
                return false;
            }
            if (captcha == "") {
                swal(
                    'Error!',
                    'Captcha should not left blank',
                    'error'
                )
                $("#txtCaptcha").focus();
                return false;
            }


            $("#encodeTxtuserID").val(btoa(userId));
            $("#encodPassword").val(btoa(password));

            document.getElementById("loginfrom").submit();
        }

        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode;
            if (((unicode > 47) && (unicode < 58)) || unicode == 9 || unicode == 8 || unicode == 46)
                return true;
            else {
                swal('This field accepts numbers Only!');
                return false;
            }
        }

        function blockSpecialChar(e) {
            var regex = new RegExp("^[A-Za-z0-9@#$.]+$");
            var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
            if (regex.test(str)) {
                return true;
            }
            return false;
        }

        function blockSpecialChar1(e) {
            var regex = new RegExp("^[A-Za-z0-9_.]+$");
            var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
            if (regex.test(str)) {
                return true;
            }
            return false;
        }
        
        
        /*for Login page scroll button*/
        $(function() {
            $('.scrollbtn').click (function() {
              $('html, body').animate({scrollTop: $('.aboutsec').offset().top }, 'slow');
              return false;
            });
         });
        
        
        $(document).ready(function(){ 
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
        });
    </script>
    
    <c:if test="${PswdMsg ne Empty}">
    <c:choose>
        <c:when test="${PswdMsg eq 'success'}">
            <script>
                swal("Success", "Password Reset Successfully.New Password sent to registered email ID </p>  ", "success"); 
            </script>
        </c:when>
        <c:otherwise>
            <script>
                swal("Success", "Password Reset Successfully. Login with new password <p><font color='red'><c:out value='${PswdMsg}'/></font></p>  ", "success"); 
            </script>
        </c:otherwise>


    </c:choose>
</c:if>
 <script>
 $(document).ready(function(){
	 $(".brandList").on("click",function(){
		  var req = new XMLHttpRequest();
		  req.open("GET", "wrsis/excelFile/Mobile Brand Model.pdf", true);
		  req.responseType = "blob";

		  req.onload = function (event) {
		    var blob = req.response;
		    console.log(blob.size);
		    var link=document.createElement('a');
		    link.href=window.URL.createObjectURL(blob);
		    link.download="Supported_Mobile_List.pdf";
		    link.click();
		  };

		  req.send();
	 })
 })
 
 </script>
 
 
</body>
</html>