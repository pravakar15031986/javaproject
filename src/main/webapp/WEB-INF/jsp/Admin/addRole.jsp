<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$(document).ready(function(){
	
	$('#btnSubmitId').click(function(){
		event.preventDefault();
 		 var form = event.target.form;
		var letters =  new RegExp(/^[A-Za-z_]+$/);
		var letters1 =  new RegExp(/^[A-Za-z_ ]+$/);
		var  v =  letters.test($('#name').val());
		var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
		var desc=$("#desc").val();
		var descLen=desc.length;
		if($('#name').val().length == 0)
			{
			$('#name').focus();
			swal('Error','Please enter the Role Name','error');
			return false;
			}
		if(v== false){
			$('#name').focus();
			swal('Error','Role Name accept only alphabets and _','error');
			return false;
		}
		if($('#alias').val().length == 0)
		{
		$('#alias').focus();
		swal('Error','Please enter the Alias Name','error');
		return false;
		}
		v = letters1.test($('#alias').val());
		if(v== false){
			$('#alias').focus();
			swal('Error','Alias Name accept only alphabets and _','error');
			return false;
		}
		if($('#alias').val().charAt(0)== ' ' || $('#alias').val().charAt($('#alias').val().length -1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Alias Name", "error").then(function() {
					   $("#alias").focus();
				});
	         return false;
		   }
		if($('#alias').val()!=null)
    	{
	   		var count= 0;
	   		var i;
	   		for(i=0;i<$('#alias').val().length && i+1 < $('#alias').val().length;i++)
	   		{
	   			if (($('#alias').val().charAt(i) == ' ') && ($('#alias').val().charAt(i + 1) == ' ')) 
	   			{
					count++;
				}
	   		}
	   		if (count > 0) {
	   			swal("Error", "Alias Name should not contain consecutive blank spaces", "error").then(function() {
				   $("#alias").focus();
				});
				return false;
			}
    	}
		if(desc.charAt(0)== ' ' || desc.charAt(descLen-1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() {
					   $("#desc").focus();
				});
	         return false;
		   }
     	if(!desc.match(desc_regex))
	    	{
	    		swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
					   $("#desc").focus();
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
					   $("#desc").focus();
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
					   $("#desc").focus();
				});
				return false;
			}swal({
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

</script>
<script>
$(document).ready(function(){
	 var text_max = 200;
	 $('#btnResetId').click(function() {
		 $('#charNum').html('Maximum characters :' + '200');
	 });
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#desc').keyup(function() {
	     var text_length = $('#desc').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
	
});
</script>


<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Role</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage User</li>
                           <li class="breadcrumb-item active" aria-current="page">Role Master</li>
                        </ol>
                     </nav>
                  </div>
           
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active" href="addRoleMaster">Add</a>
                              <a class="nav-item nav-link " href="getRoles">View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form  class="col-sm-12 form-horizontal customform"  id="myForm" method="post"  modelAttribute="admRol" action="addRole" onsubmit="return formValidation()" autocomplete="off">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        
                        <div class="card-body">
                        <c:if test="${not empty errMsg}">
                  			<div class="alert alert-danger fade-in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Error!</strong>${errMsg}
							</div>
                  		</c:if>
                		<c:if test="${not empty msg}">
                			<div class="alert alert-success fade-in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Success!</strong>${msg}
							</div>
                		</c:if>
                           <!--Static-->
                           <!--Text Input-->
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input2">Role Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input id="name" path="name" type="text" class="form-control" placeholder="Enter Role Name" maxlength="50" autofocus="autofocus"/><%-- <form:errors cssClass="text-error" path="name" /> --%> 
                                 
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input1">Alias Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input type = "text" id="alias" path = "aliasName" class="form-control" placeholder="Enter Alias Name" maxlength="50"/><%-- <form:errors path="aliasName" />  --%>
                                 
                              </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea type = "text" id="desc" path = "desc" class="form-control" rows="3" placeholder="Enter Description" maxlength="100"/><div id="charNum"></div><%-- <form:errors path="desc" /> --%>
                              </div><label ></label><div></div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Location Tag Required <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                               <div class="radio">
											<form:radiobutton id="demo-form-radio-1" class="magic-radio" value="true"   path="locationTagged"/> 
											<label for="demo-form-radio-1"> Yes </label> 
											<form:radiobutton id="demo-form-radio-2" class="magic-radio" value="false" checked="checked" path="locationTagged"/> 
											<label for="demo-form-radio-2"> No </label>
										</div> </div><label ></label><div></div>
                           </div>
                           
                        
                           <hr>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnSubmitId">Submit</button>
                                 <button type="reset" class="btn btn btn-danger mb-1" id="btnResetId">Reset</button>
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




<%-- <div id="mainTable">

<div class="row">

  <div class="tab-content">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
          
            <ul class="nav nav-tabs">
              <li class="active"><a href="#fa-icons" >Add</a></li>
              <li><form:form id="view" method="post" modelAttribute="pagination" action ="getRoles"> <input name="page" value="1" hidden=""> <input name="size" value="10" hidden=""><a  class="btn btn-primary view" >View</a></form:form></li>
            </ul>
            <div  class=" tab-content " >
              <div class="tab-pane active" id="fa-icons">
                <section id="new">
                  	<div class="col-md-12">
                  		<c:if test="${not empty errMsg}">
                  			<div class="alert alert-custom-danger fade in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Error!</strong>${errMsg}
							</div>
                  		</c:if>
                		<c:if test="${not empty msg}">
                			<div class="alert alert-custom-success fade in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Success!</strong>${msg}
							</div>
                		</c:if>
                	</div>
                	
		  <div class="form-horizontal">
				    <form:form  class=" form-actions" cssClass="formbgcolor" id="myForm" method="post"  modelAttribute="admRol" action="addRole" onsubmit="return formValidation()" autocomplete="off">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

				    
				       <div class="form-group">
				         <form:label path="" class="control-label col-sm-2 " >Role Name   <span class="mandatory">*</span> </form:label> 
				         <div class="col-sm-4">
				          <form:input id="name" path="name" type="text" class="form-control" placeholder="Enter Role Name" maxlength="50" /><form:errors cssClass="text-error" path="name" /> 
				         </div>
					   </div>
					   <div class="form-group">
					      <form:label path="" class="control-label col-sm-2 " >Alias Name <span class="mandatory">*</span>  </form:label>
					       <div class="col-sm-4">
					       <form:input type = "text" path = "aliasName" class="form-control" placeholder="Enter Alias Name" maxlength="50"/><form:errors path="aliasName" /> 
					       </div>
				  	  </div>
					      <div class="form-group">
					      <form:label path=""  class="control-label col-sm-2 "  >Description  </form:label>
					      <div class="col-sm-4"> 
					      <form:textarea type = "text" path = "desc" class="form-control" rows="3" placeholder="Enter Description" maxlength="100"/><form:errors path="desc" /> 
					      </div>
				  			</div>

						<!-- <div class="form-group">
				          <input  id="submit_bttn"  class ="btn btn-success" type = "submit" value = "Submit" />
				           <input   class ="btn btn-danger" type = "reset" value = "Reset"  />
					     </div> -->
					     <div class="form-group">
					     <label class="control-label col-sm-2 "></label>
										<div class="col-sm-4">
										 <input  id="submit_bttn"  class ="btn btn-success " type = "submit" value = "Submit" />
										<input   class ="btn btn-danger" type = "reset" value = "Reset"  />
										</div>
				      				</div>	
					</form:form>
		</div>
	  
	</section>
	 <hr>
	</div>
	 </div>
             
              </div>
            </div>
          </div>
        </div> 
        </div> --%>