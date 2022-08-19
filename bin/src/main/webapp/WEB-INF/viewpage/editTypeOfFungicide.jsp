<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
<c:if test="${msg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	});
</script>
</c:if>
      <c:if test="${msg_1 ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${msg_1}"," ", "error"); 
	});
</script>
</c:if>  

<div class="mainpanel">
<form action="viewtypeoffungicide" method="get" id="cancelForm">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/></form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Type of Fungicide</h4>
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
                              <a class="nav-item nav-link active"  href="#">edit</a>
                              <a class="nav-item nav-link "  href="viewtypeoffungicide" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="cancel()"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form action="save-typeof-fungicide" autocomplete="off" modelAttribute="fungicide" method="post" onsubmit="return false">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                           <form:hidden path="fungicideId"/>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input1">Fungicide Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input tabindex="1" id="Name-text-input1" path="fungicideName" class="form-control" maxlength="50" placeholder="Fungicide Name"/>
                                 
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
                                 <form:input type="number" max="99999999" min="0" step="0.01" tabindex="3" path="quantity" id="quantity" maxlength="50" class="form-control" placeholder="Quantity kg/hac"/>
                               
                              </div>
                           </div> 
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea tabindex="3" id="descriptionId" path="description" rows="4" class="form-control" placeholder="Description" maxlength="200" /><div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div>
                         <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <form:radiobutton  id="demo-form-radio" value="0" class="magic-radio sampleyes" path="status" name="form-radio-button" />
                                    <label for="demo-form-radio" tabindex="4">Active</label>
                             
                                    <form:radiobutton  id="demo-form-radio-2" value="1" class="magic-radio sampleno" path="status" name="form-radio-button" />
                                    <label for="demo-form-radio-2" tabindex="5">Inactive</label>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button tabindex="6" id="btnUpdateId" class="btn btn-primary mb-1">Update</button>
                                 <button tabindex="7"  id="btnCancelId" class="btn btn btn-danger mb-1" onclick="cancel()">Cancel</button>
                                
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
</script>


<script>
$(document).ready(function(){
	   $('#btnUpdateId').click(function(){
		   event.preventDefault();
    		var form = event.target.form;
    		 
    		var name_regex = /^[a-zA-Z0-9- ]{1,50}$/;
 	   		var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
 	   	    var quantity=$("#quantity").val();
 	   		var quantity_regex=/^(?:\d*\.\d{1,2}|\d+)$/;
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
 			
 			 if(shortName.length == 0){
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
 			 if(!shortName.match(name_regex))
 			{
 				 swal("Error", "Short Name accept only alphabets ", "error").then(function() {
						$("#Short-text-input").focus();
				   });
 				  	return false;
 			 }
 			if(quantity == ""){
				 swal("Error", "Please enter the Quantity", "error").then(function() {
						$("#quantity").focus();
				   });
				  	return false; 
			 }
 			if(!quantity.match(quantity_regex))
			 	{
			 		swal("Error", "Quantity accept only decimal number and upto 2 precision ", "error").then(function() {
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
	     		title: 'Do you want to update?',
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
function cancel()
{
	$("#cancelForm").submit();
}
</script>
<script>
$(document).ready(function(){
	 //$('#alertId').hide();
	 var text_max = 200;
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#descriptionId').keyup(function() {
	     var text_length = $('#descriptionId').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
	   
	/* $('[data-toggle="tooltip"]').tooltip(); 
	setTimeout(function() {$("#messageId").hide(); }, 3000); */
	
});
</script>
 <script>
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
	   		swal("Error", "${errMsg}", "error");
			document.getElementById('${FieldId}').value="";
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>