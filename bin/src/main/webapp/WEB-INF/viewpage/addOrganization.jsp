<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Organization</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage User</li>
                           <li class="breadcrumb-item active" aria-current="page">Organization Master</li>
                        </ol>
                     </nav>
                  </div>

               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addOrganization">Add</a>
                              <a class="nav-item nav-link "  href="viewOrganization" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                           <form:form action="save-update-Organization" modelAttribute="orgDetails" method="post" onsubmit="return false">
                            <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input" >Select Country<span class="text-danger">*</span></label>

                                 <div class="col-12 col-md-6 col-xl-4">
                                  <form:select class="form-control" id="countryId" path="countryId" tabindex="1" autofocus="autofocus">
                                   <form:option value="0">--Select--</form:option>
                                    <c:forEach items="${countryList}" var="couList">
                                    <form:option value="${ couList.intleveldetailid}">${ couList.nvchlevelname}</form:option>
                                    </c:forEach>
                                    </form:select>
                              </div>
                            </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input" >Select Ministry<span class="text-danger">*</span></label>

                                 <div class="col-12 col-md-6 col-xl-4">
                                  <form:select class="form-control" id="ministryId" path="ministryId" tabindex="2">
                                   <form:option value="0">--Select--</form:option>
                                    </form:select>
                              </div>
                            </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Organization <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input tabindex="3" type="text" path="nvchlevelname" id="orgId" class="form-control" placeholder="Organization Name" maxlength="50" autocomplete="off" />

                              </div>
                           </div>
                             
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                              <form:textarea  path="vchalias" id="descId" rows="4" class="form-control" placeholder="Description" maxlength="200" /><div id="charNum"></div>
                                 <%-- <form:textarea path="vchalias" id="descId" rows="4" class="form-control" placeholder="Description" id="descId" maxlength="200" onkeyup="countChar(this)"/><div id="charNum">Maximum 200 characters</div> --%>
                              </div>
                           </div>
                           
                           <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                              <div class="radio">
											<form:radiobutton id="demo-form-radio-1" class="magic-radio" value="false"  checked="checked" path="bitstatus"/> 
											<label for="demo-form-radio-1"> Active </label> 
											<form:radiobutton id="demo-form-radio-2" class="magic-radio" value="true" path="bitstatus"/> 
											<label for="demo-form-radio-2"> Inactive </label>
								</div>
                                 <%-- <div class="radio">
                                    <form:radiobutton id="demo-form-radio" path="bitstatus" checked="checked" class="magic-radio" type="radio" value="false"/>
                                    <label for="demo-form-radio">Active</label>
                             
                                    <form:radiobutton id="demo-form-radio-2" path="bitstatus" class="magic-radio" type="radio" value="true"/>
                                    <label for="demo-form-radio-2">Inactive</label>
                                 </div> --%>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnSubmitId">Submit</button>
                                 <button type="reset" class="btn btn-danger mb-1" id="btnResetId">Reset</button>
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
	   $('#btnSubmitId').click(function(){
		   event.preventDefault();
	   		 var form = event.target.form;
	   		var name_regex = /^[a-zA-Z ]{1,50}$/;
	   		var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
			      if ( $('#countryId').val() == '0')
			    	  {
			    	  swal("Error", "Please select a Country", "error").then(function() {
						   $("#countryId").focus();
			    	  });
			    	  return false;
			    	  }
			      if ( $('#ministryId').val() == '0')
		    	  {
		    	  swal("Error", "Please select a Ministry", "error").then(function() {
					   $("#ministryId").focus();
		    	  });
		    	  return false;
		    	  }
	        
	        if ($('#orgId').val() == "")
	        {
	        	swal("Error", "Please enter the Organization Name", "error").then(function() {
					   $("#orgId").focus();
	        	});
	            return false;
	        }
	        if($('#orgId').val()!=null)
	       	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i< $('#orgId').val().length && i+1 < $('#orgId').val().length;i++)
		   		{
		   			if (($('#orgId').val().charAt(i) == ' ') && ($('#orgId').val().charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Organization Name should not contain consecutive blank spaces", "error").then(function() {
						   $("#orgId").focus();
					   });
					return false;
				}
	       	}
	        if(!$('#orgId').val().match(name_regex))
			{
				 swal("Error", "Organization name accept only alphabets ", "error").then(function() {
					   $("#orgId").focus();
				 });
				  	return false;
			 }
	        if($('#orgId').val().charAt(0)== ' ' || $('#orgId').val().charAt($('#orgId').val().length-1)== ' ')
	        		{
				   swal("Error", "White space is not allowed at initial and last place in Organization Name", "error").then(function() {
					   $("#orgId").focus();
				   });
		            return false;
			   }
	        if(!$('#descId').val().match(desc_regex))
	       	{
	       		swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
					   $("#descId").focus();
				   });
	   			return false;
	       	}
			 if($('#descId').val().charAt(0)== ' ' || $('#descId').val().charAt($('#descId').val().length-1)== ' ')
					 {
				   swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() {
					   $("#descId").focus();
				   });
		            return false;
			   }
			 if($('#descId').val() !=null)
		       	{
			   		var count= 0;
			   		var i;
			   		for(i=0;i< $('#descId').val().length && i+1 < $('#descId').val().length;i++)
			   		{
			   			if (($('#descId').val().charAt(i) == ' ') && ($('#descId').val().charAt(i + 1) == ' ')) 
			   			{
							count++;
						}
			   		}
			   		if (count > 0) {
			   			swal("Error", "Description should not contain consecutive blank spaces", "error").then(function() {
							   $("#descId").focus();
						   });
						return false;
					}
		       	}
			   	var descLen=$('#descId').val().length;
			   	if ($('#descId').val().charAt(0) == '!' || $('#descId').val().charAt(0) == '@' 
					|| $('#descId').val().charAt(0) == '#' || $('#descId').val().charAt(0) == '$' 
					|| $('#descId').val().charAt(0) == '&' || $('#descId').val().charAt(0) == '*' 
					|| $('#descId').val().charAt(0) == '(' || $('#descId').val().charAt(0) == ')' 
					|| $('#descId').val().charAt(descLen - 1) == '!' || $('#descId').val().charAt(descLen - 1) == '@' 
					|| $('#descId').val().charAt(descLen - 1) == '#' || $('#descId').val().charAt(descLen - 1) == '$' 
					|| $('#descId').val().charAt(descLen - 1) == '&' || $('#descId').val().charAt(descLen - 1) == '*' 
					|| $('#descId').val().charAt(descLen - 1) == '(' || $('#descId').val().charAt(descLen - 1) == ')') 
			   	{
		   			swal("Error", "!@#$&*() characters are not allowed at initial and last place in Description", "error").then(function() {
						   $("#descId").focus();
					   });
					return false;
				}
            	swal({
            		title: 'Do you want to submit?',
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
			 return false;
	    });
	});
	
$( "#countryId" ).change(function() {
	 var ministryId=$('#ministryId');
	 var option="<option value='0'>--Select--</option>";
	 ministryId.empty();
	 if($(this).val()=='0'){
		 ministryId.empty();
		 ministryId.append(option);
	    	return false;
	 }
	var changeVal = $(this).val();
	var objRowsData ="";
	var dataString = 'countryId='+ changeVal;
	 $.ajax({
		 type: "POST",
        url : 'getMinistryList',
        data: dataString,
			cache: false,
        success : function(data) {
       	
       	
       	 if(data.length > 0){
       		ministryId.empty();
    		
	            for(var i=0; i<data.length; i++){
	                option = option + "<option value='"+data[i].intleveldetailid + "'>"+data[i].nvchlevelname + "</option>";
	            }
	            ministryId.append(option);


       	 }else{
       		ministryId.append(option);
	         }
       	
	         
	     
        } 	             
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

	 $('#descId').keyup(function() {
	     var text_length = $('#descId').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
});
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