<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
   
   
   <c:if test="${errMsg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if> 


<div class="mainpanel">
  <form action="viewregion" method="get" id="cancelForm"></form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Region</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Demography</li>
                           <li class="breadcrumb-item active" aria-current="page">Region</li>
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
                              <a class="nav-item nav-link "  href="viewregion" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" onclick="cancel()" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form action="updateRegion" modelAttribute="region" autocomplete="off" method="post">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <form:input path="demographyId" type="hidden"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Select Country<span class="text-danger">*</span></label>
                                 <div class="col-12 col-md-6 col-xl-4">
                                  <form:select class="form-control" id="country" path="countryId" tabindex="1">
                                   <option value="0">--Select--</option>
                                   <c:forEach items="${country}" var="countr" >
                                    <form:option value="${countr.demographyId}">${countr.demographyName}</form:option>
                                    </c:forEach>
                                    </form:select>
                              </div>
                            </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demography-name">Region Name<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input path="demographyName" id="demography-name" class="form-control" placeholder="Region Name" maxlength="50" tabindex="2"/>
                                 
                              </div>
                           </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="short-name">Short Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input path="alias"  id="short-name" class="form-control" placeholder="Short Name" maxlength="50" tabindex="3"/>
                                 
                              </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="description">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea path="description" id="description" rows="4" class="form-control" placeholder="Description" maxlength="100" tabindex="4" /><div id="charNum"></div>
                              </div>
                           </div>
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <div class="radio">
                                    <form:radiobutton path="status" value="0" id="demo-form-radio" class="magic-radio sampleyes" name="form-radio-button" checked="checked"/>
                                    <label for="demo-form-radio" tabindex="5">Active</label>
                             
                                    <form:radiobutton value="1" path="status" id="demo-form-radio-2" class="magic-radio sampleno" name="form-radio-button" />
                                    <label for="demo-form-radio-2" tabindex="6">Inactive</label>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnUpdateId" tabindex="7">Update</button>
                                 <button id="btnCancelId" type="button" class="btn btn-danger mb-1" tabindex="8" onclick="return cancel()">Cancel</button>
                                 
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
		   var regionname = $('#demography-name').val();
		   var shortname = $('#short-name').val();
		   var desc = $('#description').val();
		   var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
	  		 var form = event.target.form;
			      if ( $('#country').val() == '0')
			    	  {
			    	  swal("Error", "Please select the country", "error").then(function() {
						   $("#country").focus();
					   });
			    	  return false;
			    	  }
			
	        if (regionname == ""){
	        	swal("Error", "Please enter the Region Name", "error").then(function() {
					   $("#demography-name").focus();
				   });
	            return false;
	        }
	        
	        if(regionname.charAt(0)== ' ' || regionname.charAt(regionname.length - 1)== ' '){
	 			   swal("Error", "White space is not allowed at initial and last place in Region Name", "error").then(function() {
					   $("#demography-name").focus();
				   });
	 	            return false;
	 		   }
	        if(regionname!=null)
 	    	{
 		   		var count= 0;
 		   		var i;
 		   		for(i=0;i<regionname.length && i+1 < regionname.length;i++)
 		   		{
 		   			if ((regionname.charAt(i) == ' ') && (regionname.charAt(i + 1) == ' ')) 
 		   			{
 						count++;
 					}
 		   		}
 		   		if (count > 0) {
 		   			swal("Error", "Region Name should not contain consecutive blank spaces", "error").then(function() {
 					   $("#demography-name").focus();
 					});
 					return false;
 				}
 	    	}
	        if(/^[a-zA-Z0-9- ]*$/.test(regionname) == false) {
	        	swal("Error","Region Name accept only alphabets and numbers", "error").then(function() {
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
	        return false;
	        });
	  
	});
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
<script type="text/javascript">
function cancel(){
		$("#cancelForm").submit();
}
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

<%-- 

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Region</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="#"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item"><a href="#">Manage Master</a></li>
                           <li class="breadcrumb-item active" aria-current="page">Region Master</li>
                        </ol>
                     </nav>
                  </div>
           <!--        <div class="buttons-list">
                     <ul>
                        <li><a class="active" href="#" >Button 1</a></li>
                        <li><a href="#" >Button 2</a></li>
                        <li><a href="#" >Button 3</a></li>
                     </ul>
                  </div> -->
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addregion">Add</a>
                              <a class="nav-item nav-link "  href="viewregion" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              <!-- <a title="" href="javascript:void(0)" id="refreshIcon" data-toggle="tooltip" data-placement="top" data-original-title="Refresh"><i class="icon-reuse"></i></a> -->
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form action="" autocomplete="off">
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Select Country <span class="text-danger">*</span></label>
                               <div class="col-12 col-md-6 col-xl-4">
                                  <select class="form-control" id="country">
                                   <option value="0">--Select--</option>
                                    <option value="1" selected>Ethiopia</option>
                                    </select>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Region Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <input type="text" id="demo-text-input1" class="form-control" placeholder="Region Name" value="Amhara">
                                 <!-- <small class="help-block text-muted">This is a help text</small> -->
                              </div>
                           </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Short Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <input type="text" id="demo-text-input2" class="form-control" placeholder="Short Name" value="SR">
                                 <!-- <small class="help-block text-muted">This is a help text</small> -->
                              </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <textarea id="demo-textarea-input" rows="4" class="form-control" placeholder="Description">Sample Test</textarea>
                              </div>
                           </div>
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <input id="demo-form-radio" class="magic-radio sampleyes" type="radio" name="form-radio-button" checked>
                                    <label for="demo-form-radio">Active</label>
                             
                                    <input id="demo-form-radio-2" class="magic-radio sampleno" type="radio" name="form-radio-button" >
                                    <label for="demo-form-radio-2">Inactive</label>
                                 </div>
                              </div>
                           </div>
                           <hr>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 
                                 <button class="btn btn-primary mb-1" id="btnSubmitId">Update</button>
                                 <button type="reset" class="btn btn-danger mb-1">Reset</button>
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
	$(function(){

		   $(".selectall").click(function(){
			$(".individual").prop("checked",$(this).prop("checked"));
			});
		
		
	});
</script>


<script>
$(document).ready(function(){
	   $('#btnSubmitId').click(function(){
		   
			      if ( $('#country').val() == '0')
			    	  {
			    	  swal("Error", "Please select a Country", "error");
			    	  return false;
			    	  }
			
	        if ($('#demo-text-input1').val() == ""){
	        	swal("Error", "Please enter the Region Name", "error");
	            /* alert('Please select the survey to date.'); */
	            return false;
	        }
	        
	        if ($('#demo-text-input2').val() == ""){
	        	swal("Error", "Please enter the Short Name", "error");
	            /* alert('Please select the survey to date.'); */
	            return false;
	        }
	        
            if($("input[name='form-radio-button']:checked").length==0){
            	swal("Error", "Please select Status", "error");
	            /* alert('Please select the survey to date.'); */
	            return false;
            }
            else{
            	swal({
            		title: ' Do you want to Update?',
            		  type: 'warning',
            		  showCancelButton: true,
            		  confirmButtonText: 'Yes',
            		  cancelButtonText: 'No',
            		  /* reverseButtons: true */
        	    }).then((result) => {
        	    	  if (result.value) {
        	    		  swal("Success", "Submitted Successfully ", "success"); 
        	    		  window.location.href="viewregion";
        	    		  return true;
        	    		  }
        	    		})
        	    return false;
            }
	    });
	});
</script>
<script>
      function countChar(val) {
        var len = val.value.length;
        if (len > 200) {
        	
        } else {
          var remaining_len=$('#charNum').text(200 - len+" characters left");
        }
      };
    </script> --%>