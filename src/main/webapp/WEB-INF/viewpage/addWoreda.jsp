<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     <script type="text/javascript" src="wrsis/pagejs/demography.js"></script>
     
<c:if test="${msg ne Empty}">

	<script>
	$(document).ready(function(){ 
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	});
</script>
</c:if>
      <c:if test="${errMsg ne Empty}">
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
                     <h4>Add Woreda</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Demography</li>
                           <li class="breadcrumb-item active" aria-current="page">Woreda </li>
                        </ol>
                     </nav>
                  </div>

               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addworeda">Add</a>
                              <a class="nav-item nav-link "  href="viewworeda" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form action="add-woreda" modelAttribute="woreda" autocomplete="off" method="post">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Select Country<span class="text-danger">*</span></label>
                               
                                 <div class="col-12 col-md-6 col-xl-4">
                                  <form:select class="form-control" id="country" path="countryId" onchange="getDemographyData(this.value,'region')" autofocus="autofocus" tabindex="1">
                                   <option value="0">--Select--</option>
                                   <c:forEach items="${country}" var="countr" >
                                    <form:option value="${countr.demographyId}">${countr.demographyName}</form:option>
                                    </c:forEach>
                                    </form:select>
                              </div>
                            </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Select Region<span class="text-danger">*</span></label>
                               
                                 <div class="col-12 col-md-6 col-xl-4">
                                  <form:select class="form-control" id="region" path="regionId" onchange="getDemographyData(this.value,'zone');" tabindex="2">
                                   <option value="0">--Select--</option>
                                   <c:forEach items="${region}" var="countr" >
                                    <form:option value="${countr.demographyId}">${countr.demographyName}</form:option>
                                    </c:forEach>
                                    </form:select>
                              </div>
                            </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Select Zone<span class="text-danger">*</span></label>
                                
                                 <div class="col-12 col-md-6 col-xl-4">
                                  <form:select class="form-control" id="zone" path="zoneId" tabindex="3">
                                   <option value="0">--Select--</option>
                                   <c:forEach items="${zone}" var="countr" >
                                    <form:option value="${countr.demographyId}">${countr.demographyName}</form:option>
                                    </c:forEach>
                                    </form:select>
                              </div>
                            </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demography-name">Woreda Name<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input path="demographyName" id="demography-name" class="form-control" placeholder="Woreda Name" maxlength="50" tabindex="4"/>
                                
                              </div>
                           </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="short-name">Short Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input path="alias"  id="short-name" class="form-control" placeholder="Short Name" maxlength="50" tabindex="5"/>
                                 
                              </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="description">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea path="description" id="description" rows="4" class="form-control" placeholder="Description" maxlength="100" tabindex="6"/><div id="charNum"></div>
                              </div>
                           </div>
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <div class="radio">
                                    <form:radiobutton path="status" value="0" id="demo-form-radio" class="magic-radio sampleyes" name="form-radio-button" checked="checked"/>
                                    <label for="demo-form-radio" tabindex="7">Active</label>
                             
                                    <form:radiobutton value="1" path="status" id="demo-form-radio-2" class="magic-radio sampleno" name="form-radio-button" />
                                    <label for="demo-form-radio-2" tabindex="8">Inactive</label>
                                 </div>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnSubmitId" tabindex="9">Submit</button>
                                 <button type="reset" class="btn btn-danger mb-1" id="btnResetId" tabindex="10">Reset</button>
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
	  		 var woredaname = $('#demography-name').val();
			   var shortname = $('#short-name').val();
			   var desc = $('#description').val();
			   var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
			      if ( $('#country').val() == '0')
			    	  {
			    	  swal("Error", "Please select a Country", "error").then(function() {
						   $("#country").focus();
					   });
			    	  return false;
			    	  };
			      if ( $('#region').val() == '0')
		    	  {
		    	  swal("Error", "Please select a Region", "error").then(function() {
					   $("#region").focus();
				   });
		    	  return false;
		    	  }
			      if ( $('#zone').val() == '0')
		    	  {
		    	  swal("Error", "Please select a Zone", "error").then(function() {
					   $("#zone").focus();
				   });
		    	  return false;
		    	  }
			
	     if (woredaname == ""){
	     	swal("Error", "Please enter the Woreda Name", "error").then(function() {
					   $("#demography-name").focus();
				   });
	         return false;
	     }
	     
	     if(woredaname.charAt(0)== ' ' || woredaname.charAt(woredaname.length - 1)== ' '){
				   swal("Error", "White space is not allowed at initial and last place in Woreda Name", "error").then(function() {
					   $("#demography-name").focus();
				   });
		            return false;
			   }
	     if(woredaname!=null)
	  	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<woredaname.length && i+1 < woredaname.length;i++)
		   		{
		   			if ((woredaname.charAt(i) == ' ') && (woredaname.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Woreda Name should not contain consecutive blank spaces", "error").then(function() {
					   $("#demography-name").focus();
					});
					return false;
				}
	  	}
	     if(/^[a-zA-Z0-9- ]*$/.test(woredaname) == false) {
	     	swal("Error","Woreda Name accept only alphabets and numbers", "error").then(function() {
					   $("#demography-name").focus();
				   });
	     	return false;
	     }
	     if (shortname == ""){
	     	swal("Error", "Please enter the Short Name", "error").then(function() {
					   $("#short-name").focus();
				   });
	         return false;
	     }
	     if(shortname.charAt(0)== ' ' || shortname.charAt(shortname.length - 1)== ' '){
				   swal("Error", "White space is not allowed at initial and last place in Short Name", "error").then(function() {
					   $("#short-name").focus();
				   });
		            return false;
			   }
	     if(shortname!=null)
	  	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<shortname.length && i+1 < shortname.length;i++)
		   		{
		   			if ((shortname.charAt(i) == ' ') && (shortname.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Short Name should not contain consecutive blank spaces", "error").then(function() {
					   $("#short-name").focus();
					});
					return false;
				}
	  	}
	     if(/^[a-zA-Z0-9- ]*$/.test(shortname) == false) {
	     	swal("Error","Short Name accept only alphabets and numbers", "error").then(function() {
					   $("#short-name").focus();
				   });
	     	return false;
	     }
	     if(desc.charAt(0)== ' ' || desc.charAt(desc.length - 1)== ' '){
				   swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() {
					   $("#description").focus();
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
            else{
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
            }
        	   return false;
	    });
	});
</script>
<script>
$(document).ready(function(){
	 var text_max = 100;
	 $('#btnResetId').click(function() {
		 $('#charNum').html('Maximum characters :' + text_max);
	 });
	 
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#description').keyup(function() {
	     var text_length = $('#description').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
});
</script> 
    <script>
	   $(document).ready(function(){
	   	if('${ErrorMessage}' != '')
	   	{
			swal("Error", "${ErrorMessage}", "error");
			document.getElementById('${FieldId}').value="";
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>