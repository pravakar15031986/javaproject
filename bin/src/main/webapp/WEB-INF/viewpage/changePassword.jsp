<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<script src="wrsis/pagejs/passwordEye.js"></script>

<style>
form-control-eye-position{
	position:relative;
}
.fa-fw {
    position: absolute;
    top: 8px;
    right: 27px;
    font-size: 20px;
    color: #000;
}
</style>
<div class="mainpanel">
<form action="Home" method="get" id="cancelForm"></form>
           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
            <div class="section">
               <div class="page-title"> 
                  <div class="title-details">
                  
                  
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <form:form action="updatePassword" modelAttribute="passwordObj" autocomplete="off" method="post">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                    
        <div class="Surveysec">
      <div class="container wow animated fadeInUp animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
        <div class="clearfix"></div>
        
			        
			<div class="loginbox mb-5" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInLeft;">
			  <h2>Change Password</h2>
			  <hr>
			  <div class="form-group row"> 
			    
			    <div class="col-12 col-md-12 col-xl-12">
			    <i toggle="#oldPassword" class="fa fa-fw fa-eye-slash pass-i-tooltip"></i>
			      <input type="password" id="oldPassword" maxlength="20" class="form-control form-control-eye-position" name="currentPassword" placeholder="Old Password" autofocus="autofocus">
			    </div>
			  </div>
			  <div class="form-group row">
			    <div class="col-12 col-md-12 col-xl-12">
			    <i toggle="#newPassword" class="fa fa-fw fa-eye-slash pass-i-tooltip"></i>
			      <input type="password" id="newPassword" maxlength="20" class="form-control form-control-eye-position" name="newPassword" placeholder="New Password">
			    </div>
			  </div>
			  <div class="form-group row">
			    <div class="col-12 col-md-12 col-xl-12">
			    <i toggle="#confirmPassword" class="fa fa-fw fa-eye-slash pass-i-tooltip"></i>
			      <input type="password" id="confirmPassword" maxlength="20"  class="form-control form-control-eye-position" name="confirmPassword" placeholder="Confirm Password">
			    </div>
			  </div>
			 
			  <div align="center">
			  <button class="btn btn-primary" id="btnSubmitId">Submit</button>
			  <button type="button" class="btn btn-danger" id="btnCancelId" onclick="cancel()">Cancel</button></div>
			  
			</div>
        <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
   <div class="clearfix"></div>
  
                        </div>
                        </form:form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
          <script>
                        $(document).ready(function(){
                        	$('#btnSubmitId').click(function(){
                        		event.preventDefault();
                   	  		 var form = event.target.form;
		                   	  	  if ($('#oldPassword').val() == ""){
		                   	  		$("#oldPassword").focus();
		               	            swal("Error", "Please enter the Old Password", "error");
		               	        	return false;
		               	        } 
		               		    if ($('#newPassword').val() == ""){
		               		    	$("#newPassword").focus();
		               	            swal("Error", "Please enter the New Password", "error");
		               	        	return false;
		               	        }
		               		   if ($('#confirmPassword').val() == ""){
		               				$("#confirmPassword").focus();
	              	             	swal("Error", "Please enter the Confirm Password", "error");
		              	        	return false;
		              	        }  
                               
                                	swal({
                                		title: ' Do you want to Change Password?',
                                		  type: 'warning',
                                		  showCancelButton: true,
                                		  confirmButtonText: 'Yes',
                                		  cancelButtonText: 'No',
                                		  /* reverseButtons: true */
                            	    }).then((result) => {
                            	    	if (result.value) {
                          	    		  form.submit();
                          	    		  }
                            	    		})
                            	    return false;
                     	   }); 
                        });
                        
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
<script>
function cancel(){
		$("#cancelForm").submit();
}
</script>