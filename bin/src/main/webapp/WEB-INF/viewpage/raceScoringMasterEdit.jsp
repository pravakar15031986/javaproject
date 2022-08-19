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
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>  
 <script>
   $(document).ready(function(){
	 //  alert("Score Master");
	   });
   </script>  

 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Race Scoring</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                            <li class="breadcrumb-item">Manage Master</li>
                            <li class="breadcrumb-item active" aria-current="page">Race Analysis Scoring</li>
                          
                          
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
                              <a class="nav-item nav-link "  href="raceScoringMasterView" >View</a>
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
                           
                           <form:form action="insert-race-Scroing" method="post" id="scroMasterformId" onsubmit="return false" modelAttribute="race">
                        	<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        	<form:hidden path="raceScoreId"/> 
                        	
                        	<div class="form-group row">
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Rust Type<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                                                     
                                     <form:select class="form-control" id="rustId" path="rustId.rustId" tabindex="3" >
                                     <form:option value="0">--Select--</form:option>
                                     <c:forEach items="${rustTypeList}" var="rust"> 
                                     <form:option value='${rust.rustId}'>${rust.typeOfRust}</form:option>
                                    </c:forEach>
											
                                  
                                    </form:select>
                                    </div>
                            </div>	
                           <div class="form-group row" >
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Infection Type<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <form:input  id="infectionId" path="infectionType" maxlength="10"  class="form-control" tabindex="2"/>
                              </div>
                           </div>
                           
                             
                            
                            <div class="form-group row">
                                    <label class="col-12 col-md-4 col-xl-4 control-label">H/L/I Type<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                      <span class="colon">:</span>
                                   <form:select class="form-control" id="hltypeId" path="hlValue" tabindex="3" >
											<form:option value='0'>---Select---</form:option>
											<form:option value='H'>High</form:option>
											<form:option value='I'>Intermediate</form:option>
											<form:option value='L'>Low</form:option>
                                  
                                    </form:select>
                                    </div>
                                 </div>
                                
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                   
                                    <form:radiobutton id="demo-form-radio" path="status" class="magic-radio sampleyes" value="false"  name="form-radio-button"/>
                                    <label for="demo-form-radio" tabindex="3">Active</label>
                             
                                    <form:radiobutton path="status" id="demo-form-radio-2" class="magic-radio sampleyes" value="true" name="form-radio-button"/>
                                    <label for="demo-form-radio-2" tabindex="4">Inactive</label>
                                 </div> 
                              </div>
                           </div>
                         
              
						  <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnSubmitId" onclick="return save();" tabindex="6">Update</button>
								 <button class="btn btn-danger mb-1" type="reset" onclick="cancel()" id="btnResetId" tabindex="7">Cancel</button>
							  </div>
					      </div>
                         </form:form>
                        </div> 
                        <div class="clearfix"></div>
                           
                           <br> <br> <br> <br> <br> <br>
                           <form action="raceScoringMasterView" method="get" id="cancelForm">
                           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
 <script type="text/javascript">
     
      function save()
      {
    	 
    	   event.preventDefault();
   		 var form = event.target.form;
	   	var rustId=$("#rustId").val();
	   	 if(rustId=='0')
	   	{
	   		swal(
					'Error',
					'Please select rust type',
					'error'
					).then(function() 
			   		   		{
						$("#rustId").focus();
					});
					
	   		
	   		return false;
	   	 }
	   	 var infectionId=$("#infectionId").val();
	   	 if(infectionId=='')
		 {
	   		swal(
					'Error',
					'Please enter infection type',
					'error'
					).then(function() 
			   		   		{
						$("#infectionId").focus();
					});
					
	   		
	   		return false;
		 }
	   	var hltypeId=$("#hltypeId").val();
	   	 if(hltypeId=='0')
	   	{
	   		swal(
					'Error',
					'Please select H\L Type',
					'error'
					).then(function() 
			   		   		{
						$("#hltypeId").focus();
					});
	   		return false;
	   	 }
	 	
	  
		swal({
			title: "Do you want to update ?",
			type: "warning",
			cancelButtonText: "No",
			confirmButtonText: "Yes",
			showCancelButton: true
	    })
	    	.then((result) => {
				if (result.value) {
					 form.submit();
				} 
			})
			return false;
      }
      function cancel()
      {
      	$("#cancelForm").submit();	
      }
</script>


