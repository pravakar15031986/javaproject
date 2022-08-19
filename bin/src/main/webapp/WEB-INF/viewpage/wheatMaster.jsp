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
                     <h4>Add Type of Wheat</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                            <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Type of Wheat</li>
                          
                        </ol>
                     </nav>
                  </div>
               
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="wheatMaster">Add</a>
                              <a class="nav-item nav-link "  href="wheatMasterView" >View</a>
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
                           
                           <form:form action="insert-wheat" modelAttribute="wheat" id="wheatMasterformId" method="post"  onsubmit="return false">
                        
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Type of Wheat<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <form:input tabindex="1" id="center-text-input" class="form-control" maxlength="50" placeholder="Type of Wheat" path="wheatName" autofocus="autofocus"/>
                              </div>
                           </div>
                          <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <form:textarea tabindex="2"  path="description" id="descriptionId" rows="4" class="form-control" placeholder="Description" maxlength="200" /><div id="charNum"></div>
                              </div>
                           </div>
                           
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                  <div class="radio">
                                    <%-- <form:radiobutton id="demo-form-radio" class="magic-radio sampleyes" value="0" path="status" name="form-radio-button" checked/> --%>
                                    <form:radiobutton id="demo-form-radio" path="status" class="magic-radio sampleyes" value="false" checked="checked" name="form-radio-button"/>
                                    <label for="demo-form-radio" tabindex="3">Active</label>
                             
                                    <form:radiobutton path="status" id="demo-form-radio-2" class="magic-radio sampleyes" value="true" name="form-radio-button"/>
                                    <label for="demo-form-radio-2" tabindex="4">Inactive</label>
                                 </div> 
                              </div>
                           </div>
                           
						  <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
							 
							<button class="btn btn-primary mb-1" onclick="return save();" id="btnSubmitId" tabindex="5">Submit</button> 	<!--   -->
								 <button class="btn btn-danger mb-1" type="reset" id="btnResetId" tabindex="6">Reset</button>
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
function save()
      {
	
	 event.preventDefault();
		 var form = event.target.form;
		 
    	 var wheatType=$("#center-text-input").val();
    	 var desc=$("#descriptionId").val();
    	 var name_regex = /^[a-zA-Z ]{1,50}$/;
    	 var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
	   	 if(wheatType=='')
    	{	 
    		 swal(
 	   				'Error', 
 	   				'Please enter the Type of Wheat',
 	   				'error'
 	   			).then(function() {
					   $("#center-text-input").focus();
				   });
    		return false; 
    	}
	   	if(!wheatType.match(name_regex))
       	{
       		swal("Error", "Type of Wheat accept only alphabets", "error").then(function() {
				   $("#center-text-input").focus();
			   });
   			return false;
       	}
	   	if(wheatType!=null)
       	{
	   		var count= 0;
	   		var i;
	   		for(i=0;i<wheatType.length && i+1 < wheatType.length;i++)
	   		{
	   			if ((wheatType.charAt(i) == ' ') && (wheatType.charAt(i + 1) == ' ')) 
	   			{
					count++;
				}
	   		}
	   		if (count > 0) {
	   			swal("Error", "Type of Wheat should not contain consecutive blank spaces", "error").then(function() {
					   $("#center-text-input").focus();
				   });
				return false;
			}
       	}
	   	if(wheatType.charAt(0)== ' ' || wheatType.charAt(wheatType.length - 1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Type of Wheat", "error").then(function() {
				   $("#center-text-input").focus();
			   });
	            return false;
		   }
	   	if(!desc.match(desc_regex))
       	{
       		swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
				   $("#descriptionId").focus();
			   });
   			return false;
       	}
	   	if(desc.charAt(0)== ' ' || desc.charAt(desc.length - 1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Description", "error");
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
      } 
	   	 
</script>
<script>
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
	   		swal("Error", "${errMsg}", "error"); 
			//alert('${ErrorMessage}');
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
