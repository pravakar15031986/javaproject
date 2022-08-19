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
                     <h4>Add Disease</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                            <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Disease Master</li>
                          
                        </ol>
                     </nav>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="deseaseMaster">Add</a>
                              <a class="nav-item nav-link "  href="deseaseMasterView" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                           <!--Static-->
                           
                            <div class="width50">
                           
                           <form:form action="add-desease-master" id="deseaseFormId" modelAttribute="desease" onsubmit="return false">
                           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Disease Name<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <form:input path="diseaseName" id="disease-text-input" class="form-control" maxlength="50" placeholder="Disease Name" autofocus="autofocus" tabindex="1"/>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Alias Name<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <form:input path="diseaseAliasName" id="disease-text-alias" maxlength="50" class="form-control" placeholder="Alias Name" tabindex="2" />
                              </div>
                           </div>
                           
                           <%-- <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Other Details Required?</label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <span class="colon">:</span>
                                 <div class="radio">
                                   <form:radiobutton id="other-radio" value="yes" class="magic-radio sampleyes" path="otherDetails" />
                                    <label for="other-radio" data-toggle="tooltip" data-placement="top" title="At the time of capturing survey details " tabindex="3">Yes</label>
                             
                                    <form:radiobutton id="other-radio-2" value="no" path="otherDetails" class="magic-radio sampleno"  checked="checked"/>
                                    <label for="other-radio-2" tabindex="4">No</label>
                                 </div>
                              </div>
                           </div> --%>
                           <form:hidden path="otherDetails" value="true"/>
                           
                           <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Severity Required?</label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <span class="colon">:</span>
                                 <div class="radio">
                                   <form:radiobutton id="other-radio" value="true"  class="magic-radio" path="severityRequired" />
                                    <label for="other-radio" data-toggle="tooltip" data-placement="top">Yes</label>
                             
                                    <form:radiobutton id="other-radio-2" value="false"  path="severityRequired" class="magic-radio"  checked="checked"/>
                                    <label for="other-radio-2" tabindex="4">No</label>
                                 </div>
                              </div>
                           </div>
                           
                           <div class="form-group row severity">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Severity<span class="text-danger">*</span></label>
                             <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                               <div class="row">
                                    <div class="col-12 col-md-5 col-xl-6">
                                      <form:input type="number" id="severityMin" path="severityMin" min="0" max="100" class="form-control" placeholder="Min"/>
                                   </div>
                                    <div class="col-12 col-md-5 col-xl-6">
                                      <form:input type="number" id="severityMax" path="severityMax" min="0" max="100" class="form-control" placeholder="Max"/>
                                    </div>
                                </div>   
                               </div>
                           </div>
                           
                          <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Description</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <form:textarea path="description" id="descriptionId" rows="5" cols="100" tabindex="5" placeholder="Description" class="form-control" maxlength="200" onkeyup="countChar(this)"/>
                                 <div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div> 
                        <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <form:radiobutton id="demo-form-radio" value="0" class="magic-radio" path="status"  checked="checked"/>
                                    <label for="demo-form-radio" tabindex="6">Active</label>
                             
                                    <form:radiobutton id="demo-form-radio-2" value="1" path="status" class="magic-radio" />
                                    <label for="demo-form-radio-2" tabindex="7">Inactive</label>
                                 </div>
                              </div>
                           </div>
                        
						  <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnSubmitId" onclick="return saveDesease();" tabindex="8">Submit</button>
								 <button class="btn btn-danger mb-1" type="reset" id="btnResetId" tabindex="9">Reset</button>
							  </div>
					      </div>
                         </form:form>
                        </div>  
                   
                          <div class="clearfix"></div>
                           
                           <br> <br> <br> <br> <br> <br>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
         
        	 var radio = $('input[name="severityRequired"]'),
             choice = '';

         radio.change(function(e) {
             choice = this.value;

             if (choice === 'false') {
                 $('.severity').hide();
                 $('#severityMin').val(0);
                 $('#severityMax').val(0);
             } else if (choice === 'true'){
                 $('.severity').show();
         }
         });
    </script>
<script>
$(document).ready(function(){
    if ($('input[name="severityRequired"]').val() === 'true') {
         $('.severity').hide();
         $('#severityMin').val(0);
         $('#severityMax').val(0);
     } else if($('input[name="severityRequired"]').val() === 'false') {
         $('.severity').show();
     }
 });
</script>  
         <script type="text/javascript">
      function saveDesease()
      {
    	  
    	  event.preventDefault();
   		 var form = event.target.form;
   		var name_regex = /^[a-zA-Z ]{1,50}$/;
   		var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
   		var shortName=$('#disease-text-alias').val();
   		var dName=$("#disease-text-input").val();
   		var desc=$("#descriptionId").val();
		var descLen=$('#descriptionId').val().length;
		var dNLen=$('#disease-text-input').val().length;
		var aliasLen=$('#disease-text-alias').val().length;
		   
		   if(dNLen == 0)
	 		{
				   swal("Error", "Please enter the Disease Name", "error").then(function() {
					   $("#disease-text-input").focus();
				   });
				  	return false;
	 		}
		   if(dName.charAt(0)== ' ' || dName.charAt(dNLen-1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Disease Name", "error").then(function() {
				   $("#disease-text-input").focus();
			   });
	            return false;
		   }
		   if(dName!=null)
	       	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<dNLen && i+1 < dNLen;i++)
		   		{
		   			if ((dName.charAt(i) == ' ') && (dName.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Disease Name should not contain consecutive blank spaces", "error").then(function() {
						   $("#disease-text-input").focus();
					   });
					return false;
				}
	       	}
		 	if(!dName.match(name_regex))
		 	{
		 		swal("Error", "Disease Name accept only alphabets  ", "error").then(function() {
					   $("#disease-text-input").focus();
				   });
					return false;
		 	}
		
		 if(shortName.length == 0){
			 swal("Error", "Please enter the Alias Name", "error").then(function() {
				   $("#disease-text-alias").focus();
			   });
			  	return false; 
		 }
		 if(shortName.charAt(0)== ' ' || shortName.charAt(aliasLen-1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Alias Name", "error").then(function() {
				   $("#disease-text-alias").focus();
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
		   			swal("Error", "Alias Name should not contain consecutive blank spaces", "error").then(function() {
						   $("#disease-text-alias").focus();
					   });
					return false;
				}
	       	}
		 if(!shortName.match(name_regex))
		{
			 swal("Error", "Alias Name accept only alphabets ", "error").then(function() {
				   $("#disease-text-alias").focus();
			   });
			  	return false;
		 }
		// alert($("input[name='severityRequired']:checked").val());
		 if($("input[name='severityRequired']:checked").val() === 'true')
		 {
		  if($('#severityMin').val() >= $('#severityMax').val())
			 {
			 swal("Error", "Max Severity should be greater than Min Severity ", "error").then(function() {
				   $("#severityMax").focus(); 
			   });
			  	return false;
			 }
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
			title: "Do you want to submit ?",
			type: "warning",
			showCancelButton: true,
			confirmButtonText: 'Yes',
   		  cancelButtonText: 'No',
	    }).then((result) => {
	    		if (result.value) {
	 	    		   form.submit();
	 	    		  }
			})
			return false;
      }
    /*   function countChar(val) {
    	    var len = val.value.length;
    	    if (len > 200) {
    	    	
    	    } else {
    	      var remaining_len=$('#charNum').text(200 - len+" characters left");
    	    }
    	  };
    	   */
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

	 $('#descriptionId').keyup(function() {
	     var text_length = $('#descriptionId').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
});
</script>



