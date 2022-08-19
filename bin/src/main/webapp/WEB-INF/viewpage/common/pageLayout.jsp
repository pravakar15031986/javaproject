<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%-- <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
 
<!--   ' File Name		  		: index.html
  ' Description 	  		: Home Page
  ' Created by            	: Rumana Parween
  ' Created on            	: 10-Dec-2019
  ' Developed by          	:   
  ' Developed on          	: 
  ' Modification History  	: 
 *  Modified by             : 
  ' <Updated By>           	  <Date>                  <Updated Summary>'     
  ' Style sheet           	: bootstrap.min.css, font-awesome.min.css,custom.css,animate.css
  ' Javscript Functions   	:jquery-3.3.1.min.js, bootstrap.min.js,
  ' includes		  		:  -->

<!doctype html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" user-scalable="no">
	<title>Paddy Field Survey System</title>
	<meta name="keywords" content="Paddy Field Survey System" />
	<meta name="description" content="Paddy Field Survey System" />
	<link type="image/x-icon" rel="shortcut icon" href="wrsis/images/logo_white_orsac.png"/>
	<link href="wrsis/css/bootstrap.min.css" rel="stylesheet">
	<link href="wrsis/css/custom.css" rel="stylesheet">
	<script src="wrsis/js/jquery-3.5.1.min.js"></script>
	<script src="wrsis/js/popper.min.js"></script> 
	<script src="wrsis/js/bootstrap.min.js"></script> 
	</head>
   <body>
      
      <!--=== Header content ===--> 
    <tiles:insertAttribute name="header"></tiles:insertAttribute>
       <!--=== Header content ===--> 
      <!--===Side Menu===--> 
      <!--===Page container===--> 
      <div class="page-container">
         <!--===Side Menu===--> 
         <tiles:insertAttribute name="menu"></tiles:insertAttribute>
         <!--===Body ===-->
         <tiles:insertAttribute name="body"></tiles:insertAttribute>
      </div>
     
     <!-- Footer -->
     
       <tiles:insertAttribute name="footer"></tiles:insertAttribute>
       
     <!-- Footer -->
     <script src="wrsis/js/popper.min.js"></script> 
	<script src="wrsis/js/bootstrap.min.js"></script>
	
      <link href="wrsis/css/font-awesome.min.css" rel="stylesheet">
      <link href="wrsis/css/slimscrollbar.min.css" rel="stylesheet">
      <link href="wrsis/css/icons.css" rel="stylesheet">
      <link href="wrsis/css/bootstrap-datepicker.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
      
      
      
      <script src="wrsis/js/bootstrap-datepicker.min.js" defer></script> 
      <script src="wrsis/js/slimscrollbar.min.js" defer></script> 
      <script src="wrsis/js/custom.js" async></script>
       
       <script src="wrsis/js/jquery.blockUI.js" defer></script>
       <script src="wrsis/js/common.js" defer></script> 
       <script src="wrsis/pagejs/print.js" defer></script> 
 </body>
</html>