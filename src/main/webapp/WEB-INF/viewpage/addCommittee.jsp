 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add Committee</title> 
    
      <style type="text/css">
     .subject-info-box-1,
     .subject-info-box-2 {
    float: left;
    width: 100%;
    
    select {
        height: 200px;
        padding: 0;

        option {
            padding: 4px 10px 4px 10px;
        }

        option:hover {
            background: #EEEEEE;
        }
    }
    }

.subject-info-arrows {
	margin: 5px 0;
}
.subject-info-arrows .btn{
	font-size: 24px;
    line-height: 20px;
    margin-top: 3px;
	}
   </style>
      
</head>

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Committee</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Committee Configuration</li>
                        </ol>
                     </nav>
                  </div>

               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addCommittee">Add</a>
                              <a class="nav-item nav-link "  href="viewCommittee" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form action="add-committee" id="committeeForm" modelAttribute="committeeDetails" autocomplete="off">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                             <div class="width50">
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Committee Name<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <form:input type="text" path="committeeName" id="center-text-input" class="form-control" placeholder="Enter committee name" maxlength="50" autofocus="autofocus" />
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Committee Role<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <form:select class="form-control" id="committeeroleid" path="committeeRoleId">
												<form:option value="0">--Select--</form:option>
												<form:options items="${committeeRole}" itemLabel="roleName" itemValue="roleId" />
											</form:select>
                              </div>
                           </div>
                           <h3>Committee Members</h3>
                           <div class="form-group row">
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Organization</label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                     <form:select class="form-control" id="organizationId" path="intLevelDetailId" onchange="getUsers();">
												<form:option value="0">--Select--</form:option>
												<form:options items="${orgList}" itemLabel="levelName" itemValue="levelDetailId" />
												
											</form:select>
                                    </div>
                            </div>
                            
                            
                            
                             
                             <div class="form-group row">
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Role</label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                      <span class="colon">:</span>
                                      <form:select class="form-control" id="userRoleId" path="roleId" onchange="getUsers();">
												<form:option value="0">--Select--</form:option>
												<form:options items="${roles}" itemLabel="roleName" itemValue="roleId" />
											</form:select>
                                    </div>
                                 </div>
                                 <div class="form-group row">
                                 	<label class="col-12 col-md-4 col-xl-4 control-label">Members<span class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
									
										<span class="colon">:</span>
										<div class="subject-info-box-1">
											<select multiple="multiple" id="usersId" class="form-control selectbox-scrollable lstBox1">
											
											
											</select>
										</div>
										
										<!-- div For Arrow Start -->
										<div class="subject-info-arrows text-center">
									 
									  <input type="button" id="btnRight" value="+" class="btn btn-primary">
									  <input type="button" id="btnLeft" value="-" class="btn btn-danger"><br>
									  
									</div>
										<!-- div For Arrow End -->
										
										<div class="subject-info-box-2">
											<select multiple="multiple" id="usersSelectedId" name="selectedUsers" class="form-control selectbox-scrollable lstBox1">
											
											</select>
											<input type="button" id="select_all" name="select_all" value="Select All" style="display:none;">
										</div>
									
									</div>	                                 
                                 </div>
                        	<div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Description</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <form:textarea path="committeeDesc" id="descriptionID" rows="4" class="form-control" placeholder="Description" maxlength="200" /><div id="charNum"></div>
                                 
                              </div>
                           </div>
                           <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnSubmitId">Submit</button>
								 <button class="btn btn-danger mb-1" type="reset" id="btnResetId">Reset</button>
							  </div>
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
$(function ()
		{
	
        $("#btnSubmitId").click(function () 
        		{
        	var membersId = $("#usersSelectedId").val();
        	var form = event.target.form;
    		var name_regex = /^[a-zA-Z ]{1,60}$/;
    		var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
    		var desc=$("#descriptionID").val();
 			var descLen=desc.length;
     		var name=$("#center-text-input").val();
        	if (name == ""){
	        	swal("Error", "Please enter the Committee Name", "error").then(function() {
					   $("#center-text-input").focus();
				   });
	            return false;
	        }
        	if(!name.match(name_regex))
        	{
        		swal("Error!", "Committee Name accept only alphabets", "error").then(function() {
					   $("#center-text-input").focus();
				   });
    			return false;
        	}
    	   if(name.charAt(0)== ' ' || name.charAt(name.length -1)== ' '){
    		   swal("Error", "White space is not allowed at initial and last place in Committee Name", "error").then(function() {
				   $("#center-text-input").focus();
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
    	   			swal("Error", "Committee Name should not contain consecutive blank spaces", "error").then(function() {
 					   $("#center-text-input").focus();
 				   });
    				return false;
    			}
        	}
        	if ($('#committeeroleid').val() == "0"){
	        	swal("Error", "Please select Committee Role", "error").then(function() {
					   $("#committeeroleid").focus();
				   });
	            return false;
	        }
        	 
     	 	
     	   	 if(membersId == '')
     		  {
     	   		swal(
     					'Error!',
     					'Please select at least one Member!',
     					'error'
     					).then(function() {
     					   $("#usersSelectedId").focus();
     					});
     		   		return false;
     		  }
        	if(desc.charAt(0)== ' ' || desc.charAt(descLen-1)== ' '){
 			   swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() {
					   $("#descriptionID").focus();
				});
 	         return false;
 		   }
        	if(!desc.match(desc_regex))
 	    	{
 	    		swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
					   $("#descriptionID").focus();
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
 					   $("#descriptionID").focus();
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
					   $("#descriptionID").focus();
				});
 				return false;
 			}
            else{
		        	swal({
		        		title: 'Do you want to submit?',
		        		  type: 'info',
		        		  showCancelButton: true,
		        		  confirmButtonText: 'Yes',
		        		  cancelButtonText: 'No',
		        		  /* reverseButtons: true */
		    	    }).then((result) => {
		    	    	  if (result.value) {
		    	    		  $('#committeeForm').submit();
		    	    		  }
		    	    		})
            }
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

	 $('#descriptionID').keyup(function() {
	     var text_length = $('#descriptionID').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
});
</script>  
  
<script>
function getUsers()
{
	var assignedUserIds = new Array();
	$('#usersSelectedId').find('option').each(function() {
	   assignedUserIds.push(this.value);
	});
	



	var roleId = $('#userRoleId').val();
	var levelDetailId=$('#organizationId').val();
	if(roleId==0)
	{
		$('#usersId').empty();
		return false;
	}
	if(levelDetailId==0)
	{
		$('#usersId').empty();
		return false;
	}
	
	$.ajax({
		type : "POST",
		url : "getUserByRoleAndOrgId", 
	 
		data : {
			"roleId":roleId,
			"levelDetailId" : levelDetailId
			
		},
		success : function(response) {
			 
		
			var html ='';
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {

				var exist=true;
				$.each(val,function(index, value) {		
									
					exist=false;
					if(assignedUserIds.size !=0){
						assignedUserIds.forEach(function(item) {
							if(item==value.userId){
								exist=true;
							}
						});
					}
						
					if(!exist)	{
						html=html+"<option value="+value.userId+" >"+value.name+"("+value.username+")</option>";
					}
							
				});
			}
			$('#usersId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});
}

$(function(){
	$("#btnRight").click(function(){
	
		$("#usersId option:selected").each(function()
		{
			$(this).remove().appendTo("#usersSelectedId");
			
		});
	});
	$("#btnLeft").click(function(){
		$("#usersSelectedId option:selected").each(function()
		{
			$(this).remove().appendTo("#usersId");
			
		});
	});
});


$('#select_all').click(function() {
    $('#usersSelectedId option').prop('selected', true);
});

</script>

<!-- Sorting of Dropdownlist -->





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

<script>
$(function(){
	   $("#btnResetId").click(function(){
		   $('#usersId').empty();
		   $('#usersSelectedId').empty();
	  });
	});
</script>