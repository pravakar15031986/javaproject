<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
<script type="text/javascript" src="wrsis/pagejs/demography.js"></script>

<div class="mainpanel">
<form action="viewkebele" method="get" id="cancelForm">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
</form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Kebele</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Demography</li>
                           <li class="breadcrumb-item active" aria-current="page">Kebele </li>
                        </ol>
                     </nav>
                  </div>
           
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="#">Edit</a>
                              <a class="nav-item nav-link "  href="viewkebele" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="cancel()"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form action="updateKebele" modelAttribute="kebele" autocomplete="off" method="post">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <form:input path="demographyId" type="hidden"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Select Country<span class="text-danger">*</span></label>
                                 
                                 <div class="col-12 col-md-6 col-xl-4">
                                  <form:select class="form-control" id="country" path="countryId" onchange="getDemographyData(this.value,'region')"  tabindex="1">
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
                                  <form:select class="form-control" id="region" path="regionId" tabindex="2" onchange="getDemographyData(this.value,'zone');">
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
                                  <form:select class="form-control" id="zone" path="zoneId" tabindex="3" onchange="getDemographyData(this.value,'woreda')">
                                   <option value="0">--Select--</option>
                                   <c:forEach items="${zone}" var="countr" >
                                    <form:option value="${countr.demographyId}">${countr.demographyName}</form:option>
                                    </c:forEach>
                                    </form:select>
                              </div>
                            </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Select Woreda<span class="text-danger">*</span></label>
                                 
                                 <div class="col-12 col-md-6 col-xl-4">
                                  <form:select class="form-control" id="woreda" path="woredaId" tabindex="4" >
                                   <option value="0">--Select--</option>
                                   <c:forEach items="${woreda}" var="countr" >
                                    <form:option value="${countr.demographyId}">${countr.demographyName}</form:option>
                                    </c:forEach>
                                    </form:select>
                              </div>
                            </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demography-name">Kebele Name<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input path="demographyName" id="demography-name" class="form-control" tabindex="5" placeholder="Enter Kebele Name" maxlength="50"/>
                                 
                              </div>
                           </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="short-name">Short Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input path="alias"  id="short-name" class="form-control" tabindex="6" placeholder="Short Name" maxlength="50"/>
                                 
                              </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="description">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea path="description" id="description" rows="4" class="form-control" tabindex="7" placeholder="Description" maxlength="100" /><div id="charNum"></div>
                              </div>
                           </div>
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <div class="radio">
                                    <form:radiobutton path="status" value="0" id="demo-form-radio" class="magic-radio sampleyes" name="form-radio-button" checked="checked"/>
                                    <label for="demo-form-radio" tabindex="8">Active</label>
                             
                                    <form:radiobutton value="1" path="status" id="demo-form-radio-2" class="magic-radio sampleno" name="form-radio-button" />
                                    <label for="demo-form-radio-2" tabindex="9">Inactive</label>
                                 </div>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnUpdateId" tabindex="10">Update</button>
                                 <button type="button" class="btn btn-danger mb-1" tabindex="11" onclick="return cancel()">Cancel</button>
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
	   $('#btnUpdateId').click(function(){
		   event.preventDefault();
	  		 var form = event.target.form;
	  		var kebelename = $('#demography-name').val();
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
			      if ( $('#woreda').val() == '0')
		    	  {
		    	  swal("Error", "Please select a Woreda", "error").then(function() {
					   $("#woreda").focus();
				   });
		    	  return false;
		    	  }
			
	     if (kebelename == ""){
	     	swal("Error", "Please enter the Kebele Name", "error").then(function() {
					   $("#demography-name").focus();
				   });
	         return false;
	     }
	     
	     if(kebelename.charAt(0)== ' ' || kebelename.charAt(kebelename.length - 1)== ' '){
				   swal("Error", "White space is not allowed at initial and last place in Kebele Name", "error").then(function() {
					   $("#demography-name").focus();
				   });
		            return false;
			   }
	     if(kebelename!=null)
	  	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<kebelename.length && i+1 < kebelename.length;i++)
		   		{
		   			if ((kebelename.charAt(i) == ' ') && (kebelename.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Kebele Name should not contain consecutive blank spaces", "error").then(function() {
					   $("#demography-name").focus();
					});
					return false;
				}
	  	}
	     if(/^[a-zA-Z0-9- ]*$/.test(kebelename) == false) {
	     	swal("Error","Kebele Name accept only alphabets and numbers", "error").then(function() {
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
            		title: ' Do you want to update?',
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
            }
	    });
	   return false;
	});
</script>
<script type="text/javascript">
function cancel(){
		$("#cancelForm").submit();
}
</script>
<script>
$(document).ready(function(){
	 var text_max = 100;
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