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
                     <h4>Edit Tagged Sample</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Race Analysis</li>
                           <li class="breadcrumb-item active" aria-current="page">Tag Sample</li>
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
                              <a class="nav-item nav-link "  href="viewsample" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="history.back()"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form action="updateLabTaggedSample" modelAttribute="taggedSampledetails" autocomplete="off" method="post">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <form:hidden path="sampleLabTagId" />
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demography-name">Sample ID</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                <c:out value="${taggedSampledetails.sampleIdValue }" />
                               </div>
                           </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="short-name">Survey No. </label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                <c:out value="${taggedSampledetails.surveyNo }" />
                               </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="description">Survey Date</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                              <c:out value="${taggedSampledetails.surveyDate }" />
                               </div>
                           </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Region</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                  <c:out value="${taggedSampledetails.regionName }" />
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="description">Rust Type</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                             <c:out value="${taggedSampledetails.rustType }" />
                               </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="description">Lab Tagging</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                            <c:choose>
							 <c:when test="${taggedSampledetails.externalLab == 'false'}">
						    <div class="radio">
                                    <input type="radio"  id="demo-form-radio" value="false" class="magic-radio sampleyes" name="status"  checked="checked"/>
                                    <label for="demo-form-radio" tabindex="0">Internal</label>
                                    <input type="radio" id="demo-form-radio-2" value="true" name="status" class="magic-radio sampleno" />
                                    <label for="demo-form-radio-2" tabindex="0">External</label>
                             </div>
							</c:when>    
							  <c:otherwise>
							   <div class="radio">
							   <input type="radio"  id="demo-form-radio" value="false" class="magic-radio sampleyes" name="status"  />
                                    <label for="demo-form-radio" tabindex="0">Internal</label>
                                    <input type="radio" id="demo-form-radio-2" value="true" name="status" class="magic-radio sampleno" checked="checked"/>
                                    <label for="demo-form-radio-2" tabindex="0">External</label>
                               </div>
							 </c:otherwise>
							  </c:choose>
                               </div>
                             </div>
                            <div class="form-group row" id="researchId">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="description">Laboratory Name<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                             <form:select class="form-control" path="researchCenterId"  id="lab">
                             <form:option value="0">--Select--</form:option>
                              <form:options items="${labs}" itemLabel="researchCenterName" itemValue="researchCenterId" /> 
                             </form:select>
                               </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnUpdateId" tabindex="10">Update</button>
                                 <button type="button" class="btn btn-danger mb-1" tabindex="11" onclick="history.back()">Cancel</button>
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
	 var labstatus="${taggedSampledetails.externalLab}";
	  if(labstatus == "true"){
		 $("#researchId").hide();
		}else{
			$("#researchId").show();
			} 
	
	   $('#btnUpdateId').click(function(){
		   event.preventDefault();
	  		 var form = event.target.form;
	  		 
			      if ( $('#lab').val() == '0' && $("#demo-form-radio").prop('checked'))
			    	  {
			    	  swal("Error", "Please select Laboratory Name", "error").then(function() {
						   $("#lab").focus();
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
var selected = $("#lab").val();

$('input[type=radio][name=status]').on('change', function() {
	  var bolval = $(this).val();
	  if(bolval == false || bolval == 'false')
		  {
		  $("#researchId").show();
		  $("#lab").val(selected);
		  }
	  else
		  {
		  $("#researchId").hide();
		  $("#lab").val('0');
		  }
	});
	
	 

</script>


      <c:if test="${errMsg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${errMsg}"," ", "error");
	}); 
</script>
</c:if>
