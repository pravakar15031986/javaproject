<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%-- <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html>
   <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>WRSIS</title>
      <meta name="keywords" content="WRSIS" />
      <meta name="description" content="WRSIS" />
      <link rel="shortcut icon" href="#" type="image/x-icon">
      <link href="wrsis/css/bootstrap.min.css" rel="stylesheet">
      <link href="wrsis/css/font-awesome.min.css" rel="stylesheet">
      <link href="wrsis/css/slimscrollbar.min.css" rel="stylesheet">
      <link href="wrsis/css/icons.css" rel="stylesheet">
       <link href="wrsis/css/bootstrap-datepicker.min.css" rel="stylesheet">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
      <link href="wrsis/css/custom.css" rel="stylesheet">
      
      <script src="wrsis/js/jquery-3.3.1.min.js"></script>
      <script src="wrsis/js/bootstrap.min.js"></script> 
      <script src="wrsis/js/popper.min.js"></script> 
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
      <script src="wrsis/js/bootstrap-datepicker.min.js"></script> 
      <script src="wrsis/js/slimscrollbar.min.js"></script> 
      <script src="wrsis/js/custom.js"></script> 
      <script src="wrsis/js/common.js"></script> 
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
     
 </body>
</html>