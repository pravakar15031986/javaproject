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
                     <h4>Add Crop Growth Stage</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Crop Growth Stage</li>
                        </ol>
                     </nav>
                  </div>

               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addgrowthstage">Add</a>
                              <a class="nav-item nav-link "  href="viewgrowthstage" >View</a>
                           </ul>
                           <div class="indicatorslist">
                                    <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form action="save-groth-stage" autocomplete="off" modelAttribute="stage"  method="post" onsubmit="return false">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input1">Growth Stage <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input tabindex="1" path="stageName" id="demo-text-input1" maxlength="50" class="form-control" placeholder="Growth Stage" autofocus="autofocus"/>

                              </div>
                           </div>
                         
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea tabindex="2" path="description" id="descriptionId" rows="4" class="form-control" placeholder="Description" maxlength="200" /><div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div>
                           <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <form:radiobutton path="status" id="demo-form-radio" value="0" class="magic-radio sampleyes"  name="form-radio-button" checked="checked"/>
                                    <label for="demo-form-radio" tabindex="3">Active</label>
                             
                                    <form:radiobutton path="status" id="demo-form-radio-2" value="1" class="magic-radio sampleno"  name="form-radio-button" />
                                    <label for="demo-form-radio-2" tabindex="4">Inactive</label>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnSubmitId" tabindex="5">Submit</button>
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
	   $('#btnSubmitId').click(function(){
		   
		   event.preventDefault();
  		 var form = event.target.form;
  		 
  		 var cropGrowthLen=$('#demo-text-input1').val().length;
  		 var desc=$('#descriptionId').val();
  		 var descLen=desc.length;
  		 var name_regex = /^[a-zA-Z ]{1,50}$/;
  		var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
  		 var name=$('#demo-text-input1').val();
		   if (name.length == 0){
	        	swal("Error", "Please enter the Growth Stage", "error").then(function() {
					$("#demo-text-input1").focus();
				   });
	            return false;
	        }
		   if($('#demo-text-input1').val().charAt(0)== ' ' || $('#demo-text-input1').val().charAt(cropGrowthLen-1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Growth Stage", "error").then(function() {
					$("#demo-text-input1").focus();
			   });
	            return false;
		   }
		   if(name!=null)
	       	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<name.length && i+1 < name.length;i++)
		   		{
		   			if ((name.charAt(i) == ' ') && (name.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Growth Stage should not contain consecutive blank spaces", "error").then(function() {
						$("#demo-text-input1").focus();
					   });
					return false;
				}
	       	}
		   if (!name.match(name_regex)){
	        	swal("Error", "Growth Stage accept only alphabets", "error").then(function() {
					$("#demo-text-input1").focus();
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
		 $('#charNum').html('Maximum characters :' + '200');
	 });
	 
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#descriptionId').keyup(function() {
	     var text_length = $('#descriptionId').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
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
