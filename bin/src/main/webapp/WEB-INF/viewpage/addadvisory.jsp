<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="wrsis/css/sweetalert2.min.css">
<script src="wrsis/js/sweetalert2.all.min.js" defer></script>




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
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Upload Advisory</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Recommendation</li>
                           <li class="breadcrumb-item active" aria-current="page">Prepare Advisory</li>
                        </ol>
                     </nav>
                  </div>

               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addadvisory">Add</a>
                              <a class="nav-item nav-link "  href="viewadvisory" >View</a>
                           </ul>
                           <div class="indicatorslist">
                             
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form action="saveadvisory" autocomplete="off" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                           <div class="width50">
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Summary From Date<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <div class="input-group" >
                               <input type="text" id="txtDate1" name="summaryFromDate" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" autocomplete="off">
                               <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>  
                              </div>
                           </div> 
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Upload Advisory<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <input type="file" name="advisory" id="demo-text-input1" class="form-control" accept="application/pdf, .doc,.docx" >
                                 <small>Max size: 5MB<br> Allowed types: pdf,doc,docx</small>
                              </div>
                           </div>
                           <div class="form-group row">
                           <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnSubmitId">Submit</button>
								 <button class="btn btn-danger mb-1" type="reset" id="btnResetId">Reset</button>
							  </div>
					      </div>
                           </div>
                           
                           <div class="width50 mrgnl40">
                           	<div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Summary To Date<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <div class="input-group" >
                               <input type="text" id="txtDate2" name="summaryToDate" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" autocomplete="off" >
                               <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>  
                              </div>
                           </div> 
  							</div>
  							<div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Remark </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <textarea name="advRemark" rows="2" id="remarkId" class="form-control" maxlength="200" onkeyup="countChar(this)"></textarea><div id="charNum"></div>
                              </div>
                           </div>
                           </div>
                        </div>
                        </form>
                        <!--===================================================-->
                        <!-- END BASIC FORM ELEMENTS -->
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
			var remark=$('#remarkId').val();
	        if ($('#txtDate1').val() == ""){
	        	swal("Error", "Please select Summary From Date", "error");
	            return false;
	        }
	        if ($('#txtDate2').val() == ""){
	        	swal("Error", "Please select Summary To Date", "error");
	            return false;
	        }
			var fromDate=$("#txtDate1").val();
    		var toDate=$("#txtDate2").val();
    		if(Date.parse(fromDate)>Date.parse(toDate))
    		{
    			swal(
    					'Error',
    					'Summary From Date should be less than Summary To Date',
    					'error'
    					)
    	   		 	   		return false; 
    		}
	        
	        var fileInput = $('#demo-text-input1').val();
            if(fileInput=='')
            {
            	swal("Error", "Please Upload Advisory", "error");
            	return false;
            }
             var filePath = fileInput;
            var allowedExtensions = /.*\.(pdf|doc|docx)$/i;
            
            if(!allowedExtensions.exec(filePath)){
            	swal("Error", "Please upload file with .pdf, .doc or .docx extension", "error");
                fileInput.value = '';
                return false; 
            }
            var file_size = $('#demo-text-input1')[0].files[0].size;
           if (file_size > 5242880) { 
                swal("Error", "Please upload file less than 5MB", "error");
                return false;
            } 
            if(remark.charAt(0)== ' ' || remark.charAt(remark.length - 1)== ' '){
 			   swal("Error", "White space is not allowed at initial and last place in Remark", "error").then(function() {
 				   $("#remarkId").focus();
 			   });
 	            return false;
 		   }
 	   	if(remark!=null)
   	{
 	   		var count= 0;
 	   		var i;
 	   		for(i=0;i<remark.length && i+1 < remark.length;i++)
 	   		{
 	   			if ((remark.charAt(i) == ' ') && (remark.charAt(i + 1) == ' ')) 
 	   			{
 					count++;
 				}
 	   		}
 	   		if (count > 0) {
 	   			swal("Error", "Remark should not contain consecutive blank spaces", "error").then(function() {
 				   $("#remarkId").focus();
 				});
 				return false;
 			}
   	}
            	swal({
            		title: ' Do you want to submit?',
            		  type: 'warning',
            		  showCancelButton: true,
            		  confirmButtonText: 'Yes',
            		  cancelButtonText: 'No',
        	    }).then((result) => {
        	    	  if (result.value) {
        	    		  form.submit();
        	    		  }
        	    		})
        	    return false;
	    });
	});
</script>
 	
<script>
$(document).ready(function(){
	 var text_max = 200;
	 $('#btnResetId').click(function() {
		 $('#charNum').html('Maximum characters :' + text_max);
	 });
	 
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#remarkId').keyup(function() {
	     var text_length = $('#remarkId').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
});
</script>