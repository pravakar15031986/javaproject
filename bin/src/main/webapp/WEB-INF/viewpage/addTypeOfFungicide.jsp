<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 

      

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Type of Fungicide</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master </li>
                           <li class="breadcrumb-item active" aria-current="page">Type of Fungicide</li>
                        </ol>
                     </nav>
                  </div>
        	</div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addtypeoffungicide">Add</a>
                              <a class="nav-item nav-link "  href="viewtypeoffungicide" >View</a>
                           </ul>
                           <div class="indicatorslist">
                           		<p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form action="save-typeof-fungicide" autocomplete="off" modelAttribute="fungicide" method="post">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input1">Fungicide Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input  tabindex="1" id="Name-text-input1" path="fungicideName" class="form-control" maxlength="50" placeholder="Fungicide Name" autofocus="autofocus"/>
                               </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Short Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input tabindex="2" path="fungicideAliasName" id="Short-text-input" maxlength="50" class="form-control" placeholder="Short Name"/>
                               </div>
                           </div> 
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Quantity kg/ha<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input type="number" max="99999999" min="0" step="0.01" tabindex="3" path="quantity" id="quantity" maxlength="50" class="form-control" placeholder="Quantity kg/hac" onkeypress="return checkQuantity(event);"/>
                              </div>
                           </div> 
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea tabindex="4" id="descriptionId" path="description" rows="4" class="form-control" placeholder="Description" maxlength="200" onkeyup="countChar(this)"/><div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div>
                         <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <form:radiobutton id="demo-form-radio" value="0" class="magic-radio sampleyes" path="status" name="form-radio-button" checked="checked"/>
                                    <label for="demo-form-radio" tabindex="5">Active</label>
                             
                                    <form:radiobutton  id="demo-form-radio-2" value="1" class="magic-radio sampleno" path="status" name="form-radio-button" />
                                    <label for="demo-form-radio-2"  tabindex="6">Inactive</label>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button tabindex="7" id="btnSubmitId" class="btn btn-primary mb-1">Submit</button>
                                 <button tabindex="8" id="btnResetId" type="reset" class="btn btn btn-danger mb-1">Reset</button>
                                
                              </div>
                           </div>
                        </div>
                        </form:form>
                        <!--===================================================-->
                        <!-- END BASIC FORM ELEMENTS -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
<script>
	$(function(){

		   $(".selectall").click(function(){
			$(".individual").prop("checked",$(this).prop("checked"));
			});
		
		
	});

$(document).ready(function(){
	   $('#btnSubmitId').click(function(){
		   event.preventDefault();
    		 var form = event.target.form;
    		 
    		 	var name_regex = /^[a-zA-Z0-9- ]{1,50}$/;
    		 	var quantity_regex=/^(?:\d*\.\d{1,2}|\d+)$/;
    	   		var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
    	   		var quantity=$("#quantity").val();
    	   		var shortName=$('#Short-text-input').val();
    	   		var name=$("#Name-text-input1").val();
    	   		var desc=$("#descriptionId").val();
    			var descLen=desc.length;
    			var nameLen=name.length;
    			var aliasLen=shortName.length;
    			   
    			   if(name == "")
    		 		{
    					   swal("Error", "Please enter the Fungicide Name", "error").then(function() {
    							$("#Name-text-input1").focus();
    					   });
    					  	return false;
    		 		}
    			   if(name.charAt(0)== ' ' || name.charAt(nameLen-1)== ' '){
    				   swal("Error", "White space is not allowed at initial and last place in Fungicide Name", "error").then(function() {
							$("#Name-text-input1").focus();
					   });
    		            return false;
    			   }
    			   if(name!=null)
    		       	{
    			   		var count= 0;
    			   		var i;
    			   		for(i=0;i<nameLen && i+1 < nameLen;i++)
    			   		{
    			   			if ((name.charAt(i) == ' ') && (name.charAt(i + 1) == ' ')) 
    			   			{
    							count++;
    						}
    			   		}
    			   		if (count > 0) {
    			   			swal("Error", "Fungicide Name should not contain consecutive blank spaces", "error").then(function() {
    							$("#Name-text-input1").focus();
     					   });
    						return false;
    					}
    		       	}
    			 	if(!name.match(name_regex))
    			 	{
    			 		swal("Error", "Fungicide Name accept alphabets,numbers and - ", "error").then(function() {
							$("#Name-text-input1").focus();
 					   });
    						return false;
    			 	}
    			
    			 if(shortName.length == ""){
    				 swal("Error", "Please enter the Short Name", "error").then(function() {
							$("#Short-text-input").focus();
					   });
    				  	return false; 
    			 }
    			 if(shortName.charAt(0)== ' ' || shortName.charAt(aliasLen-1)== ' '){
    				   swal("Error", "White space is not allowed at initial and last place in Short Name", "error").then(function() {
							$("#Short-text-input").focus();
					   });
    		            return false;
    			   }
    			 if(shortName!=null)
    		       	{
    			   		var count= 0;
    			   		var i;
    			   		for(i=0;i<shortName.length && i+1 < shortName.length ;i++)
    			   		{
    			   			if ((shortName.charAt(i) == ' ') && (shortName.charAt(i + 1) == ' ')) 
    			   			{
    							count++;
    						}
    			   		}
    			   		if (count > 0) {
    			   			swal("Error", "Short Name should not contain consecutive blank spaces", "error").then(function() {
    							$("#Short-text-input").focus();
    						   });
    						return false;
    					}
    		       	}
    			 if(quantity == ""){
    				 swal("Error", "Please enter the Quantity", "error").then(function() {
							$("#quantity").focus();
					   });
    				  	return false; 
    			 }
    			 if(!quantity.match(quantity_regex))
 			 	{
 			 		swal("Error", "Quantity accept only decimal number with upto 2 precision ", "error").then(function() {
							$("#quantity").focus();
					   });
 						return false;
 			 	}
    			  if(quantity>99999999)
    				 {
    				 swal("Error", "Quantity should have less than 8 integrals", "error").then(function() {
							$("#quantity").focus();
					   });
						return false;
    				 } 
    			 if(desc.charAt(0)== ' ' || desc.charAt(descLen-1)== ' '){
    				   swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() {
							$("#descriptionId").focus();
					   });
    		            return false;
    			   }if(!desc.match(desc_regex))
    		       	{
    		       		swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
							$("#descriptionId").focus();
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
    							$("#descriptionId").focus();
    						   });
    						return false;
    					}
    		       	}
    			   	var descLen=desc.length;
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
							$("#descriptionId").focus();
 					   });
    					return false;
    				}
		   swal({
	     		title: 'Do you want to submit?',
	     		  type: 'info',
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


$(document).ready(function(){
	 var text_max = 200;
	 $('#btnResetId').click(function() {
		 $('#charNum').html('Maximum characters :' + '200');
	 });
	 
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#descriptionId').keyup(function() {
	     var text_length = $('#descriptionId').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });

	 <c:if test="${msg ne Empty}">
		 
		swal("Success", "<c:out value='${msg}'/> ", "success"); 
		
	</c:if>
	 
	 
	   	<c:if test="${errMsg ne Empty}">
	   
	   		swal("Error", "${errMsg}", "error");
	   		<c:if test="${FieldId ne Empty}">
				document.getElementById('${FieldId}').value="";
				document.getElementById('${FieldId}').focus();
			</c:if>
	   	</c:if>
	   });
</script>
