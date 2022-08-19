<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
<div class="mainpanel">
<form action="viewdesignation" method="get" id="cancelForm">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
</form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Designation</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage User</li>
                           <li class="breadcrumb-item active" aria-current="page">Designation Master</li>
                        </ol>
                     </nav>
                  </div>
           
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active" href="#">Edit</a>
                               <a class="nav-item nav-link " href="viewdesignation">View</a>
                              
                           </ul>
                           <div class="indicatorslist">
                              
                              <a title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" onclick="history.back()" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                          <form:form  action="saveDesignation" modelAttribute="designation" method="post" autocomplete="off" >
                          <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                          <form:hidden path="id"/>
                             <div class="width50">
                             
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Designation<span class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> 
											<form:input tabindex="1" type="text" path="designation" id="designationId" class="form-control" maxlength="50" placeholder="Designation" onkeypress="return blockSpecialAlphabet(event)"></form:input>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Description</label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> 
											<form:textarea tabindex="2" path="description" id="demo-textarea-input" rows="4" class="form-control" placeholder="Description" maxlength="200" onkeyup="countChar(this)" onkeypress="return blockSpecialAddress(event)"></form:textarea><div id="charNum" >Maximum 200 characters</div>
										</div>
									</div>
									<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label">Status<span class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
									 <span class="colon">:</span>
										<div class="radio">
											  <form:radiobutton path="status" value="false" id="demo-form-radio" class="magic-radio sampleyes" name="form-radio-button" />
                                              <label for="demo-form-radio" tabindex="3">Active</label>
                             
                                               <form:radiobutton path="status" value="true" id="demo-form-radio-2" class="magic-radio sampleyes" name="form-radio-button" />
                                               <label for="demo-form-radio-2" tabindex="4">Inactive</label>
										</div>
									</div>
								</div>                                      
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
                                 <button class="btn btn-primary mb-1" id="btnSubmit" onclick="return checkValidate();" tabindex="5">Update</button>
                                 <button type="button" class="btn btn-danger mb-1" id="btnCancelId" onclick="cancel()" tabindex="6">Cancel</button>
                              </div>
                           </div>
                           
                          
                           </div>
                           </form:form>
                           </div>
                        <!--===================================================-->
                        <!-- END BASIC FORM ELEMENTS -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
         $(document).ready(function(){
        	 $('#btnSubmit').click(function(){

			 event.preventDefault(); 
			  var form = event.target.form;
			
			    var desc=$("#demo-textarea-input").val();
				var descLen=desc.length;
				var designationVal = $("#designationId").val();

				if (designationVal == '') {
					swal("Error","Please enter the Designation", "error").then(function() {
						$("#designationId").focus();
					   });
					return false;
				}
				if(designationVal.charAt(0)== ' ' || designationVal.charAt(designationVal.length - 1)== ' '){
					   swal("Error", "White space is not allowed at initial and last place in Designation", "error").then(function() {
						   $("#designationId").focus();
					   });
			            return false;
				   }
				if(desc!=null)
		       	{
			   		var count= 0;
			   		var i;
			   		for(i=0;i<designationVal.length && i+1 < designationVal.length;i++)
			   		{
			   			if ((designationVal.charAt(i) == ' ') && (designationVal.charAt(i + 1) == ' ')) 
			   			{
							count++;
						}
			   		}
			   		if (count > 0) {
			   			swal("Error", "Designation should not contain consecutive blank spaces", "error").then(function() {
							   $("#designationId").focus();
						   });
						return false;
					}
		       	}
				if(desc.charAt(0)== ' ' || desc.charAt(descLen-1)== ' '){
					   swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() {
						   $("#demo-textarea-input").focus();
					   });
			            return false;
				   }
				if(desc!=null)
		       	{
			   		var count= 0;
			   		var i;
			   		for(i=0;i<desc.length && i+1 < desc.length;i++)
			   		{
			   			if ((desc.charAt(i) == ' ') && (desc.charAt(i + 1) == ' ')) 
			   			{
							count++;
						}
			   		}
			   		if (count > 0) {
			   			swal("Error", "Description should not contain consecutive blank spaces", "error").then(function() {
							   $("#demo-textarea-input").focus();
						   });
						return false;
					}
		       	}
			   	if (desc.charAt(0) == '!' || desc.charAt(0) == '@' 
					|| desc.charAt(0) == '#' || desc.charAt(0) == '$' 
					|| desc.charAt(0) == '&' || desc.charAt(0) == '*' 
					|| desc.charAt(0) == '(' || desc.charAt(0) == ')' 
					|| desc.charAt(descLen - 1) == '!' || desc.charAt(descLen - 1) == '@' 
					|| desc.charAt(descLen - 1) == '#' || desc.charAt(descLen - 1) == '$' 
					|| desc.charAt(descLen - 1) == '&' || desc.charAt(descLen - 1) == '*' 
					|| desc.charAt(descLen - 1) == '(' || desc.charAt(descLen - 1) == ')') 
			   	{
		   			swal("Error", "!@#$&*() characters are not allowed at initial and last place in Description", "error").then(function() {
						   $("#demo-textarea-input").focus();
					   });
					return false;
				}
			swal({
           		title: ' Do you want to update ? ',
           		  type: 'warning',
           		  showCancelButton: true,
           		  confirmButtonText: 'Yes',
           		  cancelButtonText: 'No',
       	    }).then((result) => {
       	    	  if (result.value) {
       	    		form.submit();
       	    		  }
       	    		})

        	 });

         });
         function cancel()
         {
         	  $("#cancelForm").submit();
         }
         
         function blockSpecialAlphabet(e){
 			var regex = new RegExp("^[A-Za-z\\s]+$");
 		    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 		    if (regex.test(str)) {
 		       return true;
 		   }
		    swal("Error", "Designation accept only alphabets", "error");
 		    return false;
 		}

 		function blockSpecialAddress(e){
 			var regex = new RegExp("^[\\\\A-Za-z0-9.,-\\s(:)#;/]+$");
 		    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 		    if (regex.test(str)) {
 		       return true;
 		   }
		    swal("Error", "Description accept only alphabets,numbers and .,-(:)#;/\\ ", "error");
 		    return false;
 		}

 		  function countChar(val) {
 		        var len = val.value.length;
 		        if (len > 200) {
 		        	
 		        } else {
 		          var remaining_len=$('#charNum').text(200 - len+" characters left");
 		        }
 		      };
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