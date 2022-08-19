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
<form action="viewTypeofRust" method="get" id="cancelForm"></form>
            <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Type of Rust</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Type of Rust</li>
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
                              <a class="nav-item nav-link "  href="viewTypeofRust" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="cancel()"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <%-- <form action="" autocomplete="off" > --%>
                        <form:form action="add-type-of-rust" method="post" modelAttribute="typeOfRustt" autocomplete="off"  onsubmit="return false">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                           <form:hidden path="rustId"/>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input1">Type of Rust <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input tabindex="1" id="demo-text-input1" path="typeOfRust" class="form-control" placeholder="Type of Rust" maxlength="50"/>
                                
                              </div>
                           </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input2">Short Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input tabindex="2" path="shortName" id="demo-text-input2"  class="form-control" placeholder="Short Name" maxlength="50"/>
                               
                              </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea tabindex="3" id="descriptionId" path="rustDescription" rows="4" class="form-control" placeholder="Description" maxlength="200" onkeyup="countChar(this)"/><div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div>
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <form:radiobutton id="demo-form-radio" value="0" class="magic-radio sampleyes" path="isDelete"  />
                                    <label for="demo-form-radio" tabindex="4">Active</label>
                             
                                    <form:radiobutton id="demo-form-radio-2" value="1" path="isDelete" class="magic-radio sampleno" />
                                    <label for="demo-form-radio-2" tabindex="5">Inactive</label>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnUpdateId" tabindex="6">Update</button>
                                 <button class="btn btn btn-danger mb-1"  id="btnCancelId" onclick="cancel()" tabindex="7">Cancel</button>
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
	   $('#btnUpdateId').click(function()
		{
		   event.preventDefault();
      		 var form = event.target.form;
      		var name_regex = /^[a-zA-Z ]{1,50}$/;
 		   var desc=$('#descriptionId').val();
 		   var typeOfRuset=$("#demo-text-input1").val();
 		   if(typeOfRuset.length == 0)
        		{
 			   swal("Error", "Please enter the Type of Rust", "error").then(function() {
				   $("#demo-text-input1").focus();
			   });
    			  	return false;
        		}
 		   if(typeOfRuset.charAt(0)== ' ' || typeOfRuset.charAt(typeOfRuset.length - 1)== ' '){
 			   swal("Error", "White space is not allowed at initial and last place in Type of Rust", "error").then(function() {
				   $("#demo-text-input1").focus();
			   });
 	            return false;
 		   }
 		   if(typeOfRuset!=null)
 	       	{
 		   		var count= 0;
 		   		var i;
 		   		for(i=0;i<typeOfRuset.length && i+1 < typeOfRuset.length;i++)
 		   		{
 		   			if ((typeOfRuset.charAt(i) == ' ') && (typeOfRuset.charAt(i + 1) == ' ')) 
 		   			{
 						count++;
 					}
 		   		}
 		   		if (count > 0) {
 		   			swal("Error", "Type of Rust should not contain consecutive blank spaces", "error").then(function() {
 					   $("#demo-text-input1").focus();
 				   });
 					return false;
 				}
 	       	}
        	
        	if(!typeOfRuset.match(name_regex))
        	{
        		swal("Error", "Type of Rust accept only alphabets", "error").then(function() {
 				   $("#demo-text-input1").focus();
 			   });
    			return false;
        	}
 		var shortName=$('#demo-text-input2').val();
 		 if(shortName.length==0){
 			 swal("Error", "Please enter the Short Name", "error").then(function() {
				   $("#demo-text-input2").focus();
			   });
 			  	return false; 
 		 }
 		 if(!shortName.match(name_regex))
 	       	{
 	       		swal("Error", "Short Name accept only alphabets", "error").then(function() {
 				   $("#demo-text-input2").focus();
 			   });
 	   			return false;
 	       	}
 		 if(shortName.charAt(0)== ' ' || shortName.charAt(shortName.length - 1)== ' '){
 			   swal("Error", "White space is not allowed at initial and last place in Short Name", "error").then(function() {
				   $("#demo-text-input2").focus();
			   });
 	            return false;
 		   }
 		 if(shortName!=null)
 	       	{
 		   		var count= 0;
 		   		var i;
 		   		for(i=0;i<shortName.length && i+1 < shortName.length;i++)
 		   		{
 		   			if ((shortName.charAt(i) == ' ') && (shortName.charAt(i + 1) == ' ')) 
 		   			{
 						count++;
 					}
 		   		}
 		   		if (count > 0) {
 		   			swal("Error", "Short Name should not contain consecutive blank spaces", "error").then(function() {
 					   $("#demo-text-input2").focus();
 				   });
 					return false;
 				}
 	       	}
 		 if(desc.charAt(0)== ' ' || desc.charAt(desc.length - 1)== ' '){
 			   swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() {
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
 		 var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
 		 if(!desc.match(desc_regex))
 	       	{
 	       		swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
 				   $("#descriptionId").focus();
 			   });
 	   			return false;
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
 			}swal({
     		title: 'Do you want to update?',
     		  type: 'warning',
     		  showCancelButton: true,
     		  confirmButtonText: 'Yes',
     		  cancelButtonText: 'No',
     		  /* reverseButtons: true */
 	    }).then((result) => {
 	    	  if (result.value) {
 	    		   //swal("Success", "User created Successfully ", "success");
 	    		   form.submit();
 	    		  }
 	    		})
     	return false;
	   });
	   
	  
});
function cancel(){
	$("#cancelForm").submit();
}
function countChar(val) {
    var len = val.value.length;
    if (len > 200) {
    	
    } else {
      var remaining_len=$('#charNum').text(200 - len+" characters left");
    }
  };
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