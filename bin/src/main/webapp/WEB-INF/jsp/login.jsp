
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%
String path = request.getContextPath();
/* String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; */
Random random = new Random();
int randomNo = random.nextInt(1000);  
session.setAttribute("r_no", randomNo);
%>  --%>


<!DOCTYPE html>
<%-- <%@page import="java.util.Random"%>
<%@page errorPage="error.jsp" %> --%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Admin Console</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--[if lt IE 9]>
    <script src="scripts/html5.js"></script>
<![endif]-->


  <link rel="stylesheet" href="./styles/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./styles/font-awesome.min.css">
 
  <!-- Custom styles for this template -->
    <link href="./styles/login.css" rel="stylesheet">
    <link href="./styles/animate-custom.css" rel="stylesheet">
	
	
  <!-- jQuery 3 -->
<script src="./scripts/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="./scripts/bootstrap.min.js"></script>

<!--validation--->
<script src="./scripts/validator.js"></script>

<script src="./scripts/placeholder-shim.min.js"></script>        
        <script src="./scripts/custom.js"></script>



<script type="text/javascript">
function Validate()
{
	/* var objFrm = document.frmAdmin; */
	if (!blankFieldValidation('txtuserID', 'User ID')) {
		return false;
	}
	if (!WhiteSpaceValidation1st('txtuserID')) {
		return false;
	}
	
	if (!WhiteSpaceValidation('txtuserID')) {
		return false;
	}
	if (!IsSpecialCharacter('txtuserID', 'Special Character Not Alowed !')) {
		return false;
	}
	
	if (!blankFieldValidation('txtPassword', 'Password')) 
	{
		return false;
	}
	if (!WhiteSpaceValidation1st('txtPassword'))
	{
		return false;
	}

}
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
    setTimeout(function() {$("#messageId").hide(); }, 3000);
});
 
 


</script>
<script type="text/javascript">
    var queryString = new Array();
	$(function () {
        if (queryString.length == 0) {
            if (window.location.search.split('?').length > 1) {
                var params = window.location.search.split('?')[1].split('&');
                for (var i = 0; i < params.length; i++) {
                    var key = params[i].split('=')[0];
                    var value = decodeURIComponent(params[i].split('=')[1]);
                    queryString[key] = value;
                }
            }
        }
        if (queryString["name"] != null) {
            var data = "";
            data +=queryString["name"] + " LOGIN ";
            $("#lblData").html(data);
        }
    });
</script>
<style>
.social a{color:#337ab7; text-decoration:none;}
.social a:hover{color:#333; text-decoration:none;}
.loginbox{position:relative; padding-top:10px;}
.loginbox .specuser {
        position: absolute;
		top: 10px;
		left: 0;
		margin: auto;
		background: #003399;
		padding: 7px 35px;
		color: #fff;
		width: auto;
		border-radius: 0 30px 30px 0;
		font-size: 1em;
		padding-left: 10px;
}
#messageId {
    text-align: center;
    position: absolute;
    right: 0;
    left: 0;
    bottom: 0;
    font-size: .8em;
    background: #f00;
    padding: 3px;
	margin: 0 15px;
	line-height:1.2em;
	
}
</style>

</head>




<body>


<section id="data_area">
<div class="container">
	<div class="loginarea">
		<div class="row loginbox">
			<h1 id = "lblData" class="specuser">Login</h1>
			<div class="col-sm-6">
				<div class="loginlogo">
					<img src="/images/userSoumya.png" alt="Logo" />
					<h3>Admin Console</h3>
					<p>Spring Boot Framework</p>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="loginform">
				<form  id="frmAdmin"   action="/home"   method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

				
	
	
				<input type="text" class="form-control" placeholder="User name" id="txtuserID" onKeyUp="return blockspecialchar_first(this);" Autocomplete="off" title="User ID" maxlength="50" name = "username">
				<input type="password" class="form-control"   placeholder="Password" id="txtPassword"  Autocomplete="off"  title="Password" maxlength="50" name="password"/>
				<input id="userType" type="text" hidden="" name="userType">
					<div class="captcha">
                        <span class="qstn">
                            <a href="javascript:void(0);" onclick="reloadCaptch();" data-toggle="tooltip" title="Refresh" class="pull-right"><i class="fa fa-refresh"></i></a>
                            <small>    <img alt="captcha" src="thymeleaf/Captcha.jpg" id="captchId">
                            </small>
                        </span>
                         <input  class="form-control" type="text" name = "securityAns" placeholder="Enter Your Answer Here">
                    </div>
                    
					<div class="rmbr">
					  <input type="checkbox" name="remember-me"  value="true"> 
					  <label>Remember Me</label>
					</div>
					
					<button name="btnLogin" id="btnLogin" type="submit" onclick="return Validate()" >Log In</button> 
			
					<div class="links"> 
						<a class="pull-right" href="#">Forgot password?</a>
						<div class="clearfix"></div>
					</div> 	
				</form>
				
				<c:if test="${not empty  message }">
				<div id="messageId">
				 <span style="color:#fff;">${message}</span>
				</div>
				</c:if>
				
				</div> 
			</div>
		</div>
		
		<div class="loginfoot">
			<!-- <div class="col-sm-6">
				<p>Copyright @ EATTA</p>
			</div> -->
			
		<div class="col-sm-6">
			<div class="social">
				Powered By <a href="#">CSMPL</a>
			</div>
		</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
</section>

</body>
</html>
