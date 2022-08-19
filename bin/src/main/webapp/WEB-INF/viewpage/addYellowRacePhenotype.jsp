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
<c:if test="${errMsg ne Empty}">
<script>
$(document).ready(function(){   
	swal("Error", "<c:out value='${errMsg}'/> ", "error"); 
});
</script>
</c:if>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Yellow Rust Race Phenotype</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Yellow Rust Race Phenotype</li>
                        </ol>
                     </nav>
                  </div>

               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addYellowRacePhenotype">Add</a>
                              <a class="nav-item nav-link "  href="viewYellowRacePhenotype" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form action="saveYellowRacePhenotype" modelAttribute="yellowRacePhenotype" method="post" autocomplete="off">
                     <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                           <div class="form-group row">
										<label class="col-12 col-md-2 col-xl-2 control-label" for="demo-email-input">Genetic Group</label>
										<div class="col-12 col-md-6 col-xl-4">
										<span class="colon">:</span>
											 <form:select id="geneticGroupId" path="geneticGroupId" class="form-control" autofocus="autofocus">
												<form:option value="0" selected="selected">--Select--</form:option>
												<c:forEach items="${group}" var="group">
													<form:option value="${group.geneticGroupId}">${group.groupName}</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input1">Race Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input tabindex="1" id="raceName" path="raceName" class="form-control" placeholder="Race Name" maxlength="50" />
                                
                              </div>
                           </div>
                         
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Virulence Phenotype<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input tabindex="2" id="virulencePhenotype" class="form-control" path="virulencePhenotype" placeholder="Virulence Phenotype" maxlength="200" />
                              </div>
                           </div> 
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <form:radiobutton id="demo-form-radio" class="magic-radio" path="status" value="false" checked="checked"/>
                                    <label for="demo-form-radio" tabindex="3">Active</label>
                             
                                    <form:radiobutton path="status" id="demo-form-radio-2" class="magic-radio"  value="true" />
                                    <label for="demo-form-radio-2" tabindex="4">Inactive</label>
                                 </div>
                              </div>
                           </div> 
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button id="btnSubmitId" class="btn btn-primary mb-1" type="button" tabindex="5">Submit</button>
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
	   $('#btnSubmitId').click(function()
		{
		   event.preventDefault();
			 var form = event.target.form;
			 var name_regex = /^[a-zA-Z0-9()_,-]{1,50}$/;
	    	 var desc_regex = /^([a-zA-Z0-9(),-]){0,200}$/;
			 var raceName=$("#raceName").val();
			 var virulencePhenotype=$("#virulencePhenotype").val();
			 /* if ($('#geneticGroupId').val() == 0){
		        	swal("Error", "Please select Genetic Group", "error").then(function() {
						$("#geneticGroupId").focus();
					   });
		            return false;
		        } */
		   if (raceName == ""){
	        	swal("Error", "Please enter Race Name", "error").then(function() {
					$("#raceName").focus();
				   });
	            return false;
	        }
		   if (virulencePhenotype == ""){
	        	swal("Error", "Please enter Virulence Phenotype", "error").then(function() {
					$("#virulencePhenotype").focus();
				   });
	            return false;
	        }
		   if(!raceName.match(name_regex))
	       	{
	       		swal("Error", "Race Name accept alphabets,numbers and (),_- characters", "error").then(function() {
					$("#raceName").focus();
				   });
	   			return false;
	       	}
		   if(!virulencePhenotype.match(desc_regex))
	       	{
	       		swal("Error", "Virulence Phenotype accept only alphabets,numbers and (),- characters", "error").then(function() {
					$("#virulencePhenotype").focus();
				   });
	   			return false;
	       	}
        	   swal({
        	 		title: 'Do you want to submit?',
        	 		  type: 'warning',
        	 		  showCancelButton: true,
        	 		  confirmButtonText: 'Yes',
        	 		  cancelButtonText: 'No',
        		    }).then((result) => 
        		    {
        		    	if (result.value) {
        		    		   form.submit();
        		    		  }
        		    })
       	    return false;
           //}
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


