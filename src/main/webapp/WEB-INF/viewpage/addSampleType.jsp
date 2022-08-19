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
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Sample Type</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Sample Type</li>
                        </ol>
                     </nav>
                  </div>

               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addSampleType">Add</a>
                              <a class="nav-item nav-link "  href="viewsampletype" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form action="save-sample-type" modelAttribute="sample" method="post" autocomplete="off">
                      <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                      <%--  <form action="save-sample-type" method="post"> --%>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                           <div class="form-group row">
										<label class="col-12 col-md-2 col-xl-2 control-label" for="demo-email-input">Rust Type<span class="text-danger">*</span></label>
										<div class="col-12 col-md-6 col-xl-4">
										<span class="colon">:</span>
											 <form:select id="rustId" path="rustTypeId" class="form-control">
												<form:option value="0" selected="selected">--Select--</form:option>
												<form:options items="${rustTypes}" itemLabel="typeOfRust" itemValue="rustId" />
											</form:select>
										</div>
									</div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input1">Sample Type <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input tabindex="1" id="demo-text-input1" path="sampleName" class="form-control" placeholder="Sample Type" maxlength="50" autofocus="autofocus"/>
                                 
                                
                              </div>
                           </div>
                         
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea tabindex="2" id="description" rows="4" class="form-control" path="description" placeholder="Description" maxlength="200" /><div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div> 
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <form:radiobutton id="demo-form-radio" class="magic-radio sampleyes" path="status" value="false" name="form-radio-button" checked="checked"/>
                                    <label for="demo-form-radio" tabindex="3">Active</label>
                             
                                    <form:radiobutton path="status" id="demo-form-radio-2" class="magic-radio sampleno"  value="true" name="form-radio-button" />
                                    <label for="demo-form-radio-2" tabindex="4">Inactive</label>
                                 </div>
                              </div>
                           </div> 
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button id="btnSubmitId" class="btn btn-primary mb-1" type="button" tabindex="5">Submit</button>
                                 <button type="reset" id="btnResetId" class="btn btn btn-danger mb-1" tabindex="6">Reset</button>
                               
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
$(document).ready(function(){
	   $('#btnSubmitId').click(function()
		{
		   event.preventDefault();
			 var form = event.target.form;
			 var name_regex = /^[a-zA-Z ]{1,60}$/;
	    	 var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
			 var sampleType=$("#demo-text-input1").val();
			 var desc=$("#description").val();
			 if ($('#rustId').val() == 0){
		        	swal("Error", "Please select Rust Type", "error").then(function() {
						$("#rustId").focus();
					   });
		            return false;
		        }
		   if ($('#demo-text-input1').val() == ""){
	        	swal("Error", "Please enter the Sample Type", "error").then(function() {
					$("#demo-text-input1").focus();
				   });
	            return false;
	        }
		   if(!sampleType.match(name_regex))
	       	{
	       		swal("Error", "Sample Type accept only alphabets", "error").then(function() {
					$("#demo-text-input1").focus();
				   });
	   			return false;
	       	}
		   	if(sampleType!=null)
	       	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<sampleType.length && i+1 < sampleType.length;i++)
		   		{
		   			if ((sampleType.charAt(i) == ' ') && (sampleType.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Sample Type should not contain consecutive blank spaces", "error").then(function() {
						$("#demo-text-input1").focus();
					   });
					return false;
				}
	       	}
		   if($('#demo-text-input1').val().charAt(0)== ' ' || $('#demo-text-input1').val().charAt($('#demo-text-input1').val().length - 1)== ' '){
				   swal("Error", "White space is not allowed at initial and last place in Sample Type", "error").then(function() {
					$("#demo-text-input1").focus();
				   });
		            return false;
			   }
		   if(!desc.match(desc_regex))
	       	{
	       		swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
					$("#description").focus();
				   });
	   			return false;
	       	}
		   	if(desc.charAt(0)== ' ' || desc.charAt(desc.length - 1)== ' '){
				   swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() {
					$("#description").focus();
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
						$("#description").focus();
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
					$("#description").focus();
				   });
				return false;
			}
        	   swal({
        	 		title: 'Do you want to submit?',
        	 		  type: 'warning',
        	 		  showCancelButton: true,
        	 		  confirmButtonText: 'Yes',
        	 		  cancelButtonText: 'No',
        		    }).then((result) => 
        		    {
        		    	if (result.value) {
        		    		   form.submit();
        		    		  }
        		    })
       	    return false;
           //}
	   });
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
<script>
$(document).ready(function(){
	 var text_max = 200;
	 $('#btnResetId').click(function() {
		 $('#charNum').html('Maximum characters :' + '200');
	 });
	 
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#description').keyup(function() {
	     var text_length = $('#description').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
});
</script>  