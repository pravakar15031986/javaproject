 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="./js/html5lightbox.js"></script>

<style> 
.thumbimg{border: 1px solid #d5d5d5;display: block;border-radius: 3px;}
.thumbimg img{width:100%;border-radius: 3px;}
</style>


 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Survey Details</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item active" aria-current="page">Manage Survey</li>
                           <li class="breadcrumb-item">Survey Details</li>
                        </ol>
                     </nav>
                  </div>
               
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                       
                           <div class="indicatorslist">
                              
                             
                              
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                           <!--Static-->
                              <c:if test="${SurveyId ne 0}">
                           <b style="font-size: 20px;">Survey No : S${SurveyId}</b>
                           </c:if>
                           
                          
                          <h3>Surveyor Information</h3> 
                          <div class="width50">
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Institution Name</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                <span id="instituteName"></span>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Surveyor's Name</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                  <span id="surveryors"></span>
                              </div>
                           </div>
                           </div>
                           
                           
                           <div class="width50">
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Country</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                               <span id="country"></span>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Other Surveyor</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                               <span id="othersurveyor"></span>
                              </div>
                           </div>
                           
                           
                           </div>
                           
                           
                           <div class="clearfix"></div>
                           
                           <h3>Survey Information</h3>
                           
                            <div class="width50">
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Date of Survey</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                <span id="surveyDate"></span>
                              </div>
                           </div>
                            
                            
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Region </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="region"></span>
                              </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Woreda </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="woreda"></span>
                              </div>
                           </div>
                            
                            
                           
                            <div class="form-group row" id="kebelworedaaddrdiv">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Address <!--  --></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                <span id="kebelworedaaddr"></span>
                              </div>
                           </div> 
                            
                            
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Longitude(decimal degrees)</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <span id="longitude"></span>
                              </div>
                           </div>
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Contacted with farmer ?<!--  --></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="contactedFarmer"></span>
                              </div>
                           </div>
                            
                           <div class="form-group row contactdate">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Date of Tillering</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                               <span id="tilleringdate"></span>
                              </div>
                           </div>
                           
                            
                           </div>
                           
                           
                           
                           <div class="width50">
                           
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Season </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="season"></span>
                              </div>
                           </div> 
                           
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Zone </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                <span id="zone"></span>
                              </div>
                           </div>
                           
                           
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Kebele </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <span id="kebele"></span>
                              </div>
                              
                            
                           </div>
                           
                           
                          
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Altitude</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <span id="altitude"></span>
                              </div>
                           </div>
                          
                           
                            
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Latitude(decimal degrees)</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                               <span id="latitude"></span>
                              </div>
                           </div>

								<div class="form-group row contactdate">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-readonly-input">Date of Planting<!--  --></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span> <span id="plantingDate"></span>
									</div>
								</div>


								<div class="form-group row contactdate">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Date of first Rust Observation<!--  --></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                <span id="rustDate"></span>
                              </div>
                           </div>                           
                            
                           </div>
                           
                           <div class="clearfix"></div>
                           
                           
                           <h3>Site Information</h3>
                           
                           
                           <div class="width50">
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Survey Site </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <span id="surveySite"></span>
                              </div>
                           </div>
                           
                            
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Variety</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <span id="variety"></span>
                              </div>
                           </div>
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Area (in ha) </label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <span id="area"></span>
                              </div>
                           </div>
                           </div>
                           
                           <div class="width50">
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Type of Wheat </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="wheatType"></span>
                              </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Growth Stage </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="growthType"></span>
                              </div>
                           </div>
                           
                           </div>
                           
                           <div class="clearfix"></div>  
                           <div id="rustshow">   
                            <h3>Rust Details</h3> 
                           
                           
                           <div class="width50">
                            <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Is Rust Affected ? </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <!-- Radio Buttons -->
                                 <span id="rustAffect"></span>
                              </div>
                           </div>
                           	</div>
                           	
                         
					 		<div class="tablesec">
						<div class="table-responsive">
							<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered" id="rustTable">
							<tr>
								<th>Sl#</th>
								<th>Type of Rust</th>
								<th>Incident(%)</th>
								<th>Severity(%)</th>
								<th>Reaction</th>
								<th>Head Incident(%)</th>
								<th>Head Severity</th>
							</tr>
							 												
			
							</table>
						</div>
					</div>
							
						                  
		                    <div class="clearfix"></div>
		                    
		                     <div id="sampleShow">   
					    	<h3>Sample Detail</h3>
					    	
					    	
					    	<div class="width50">
					    	<div class="form-group row pad-ver">
	          <label class="col-12 col-md-4 col-xl-4 control-label">Samples collected ? </label>
	          <div class="col-12 col-md-8 col-xl-8">
	             <span class="colon">:</span>
	            <span id="sampleCollected"></span>
	            
	          </div>
      </div>
					       </div>
					       
					      
					        <div class="tablesec">
								<div class="table-responsive">
									<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered" id="sampleDetail">
									<tr>
										<th>Sl#</th>
										<th>Type of Sample</th>
										<th>No. of Samples</th>
										<th>Sample IDs</th>
										<th>Remarks</th>
										
									</tr>														
									 
									</table>
								</div>
							</div>
							</div>
    
                           <div class="clearfix"></div>
      
        <div id="imageShow">   
	    					  <h3>Capture Image</h3>
	    					  
	                          <div class="width50">
	                        <div class="form-group row pad-ver">
	                          <label class="col-12 col-md-4 col-xl-4 control-label"> </label>
	                          <div class="col-12 col-md-8 col-xl-8">
	                             <span class="colon" style="display:none">:</span>
	                             <span id="capturedImage" style="display:none"></span>
	                          </div>
	                       </div>
	                       
	                       
	                       <div class="row noimage">
	                          
	                           
			                       <c:forEach items="${Images}" var="images"
														varStatus="loop">
														<c:if test="${loop.index == 0 }">
														<label class="col-12 col-md-2 col-xl-2 control-label">Uploaded Images</label>
														</c:if>
			                       <a href="${images }" data-thumbnail="${images }" data-group="mygroup" class="html5lightbox thumbimg" title="Toronto">  <img src="${images }" alt="captureImage" style="width: 160px;height:160px;"></a>
														</c:forEach>
			                       
			                       
			                       
		                       </div>
	                       
	                       </div>
	                       </div>
	                        
	                          
	                          <div class="clearfix"></div>
	                         
	                             
	                        <h3>Fungicide Details</h3>
	                         <div class="form-group row pad-ver">
	                          <label class="col-12 col-md-4 col-xl-4 control-label">Fungicide Applied ? </label>
	                          <div class="col-12 col-md-8 col-xl-8">
	                             <span class="colon">:</span>
	                             <span id="funApplied"></span>
	                          </div>
	                       </div>
	  						<div id="fungiShow">
	                        
	                        <div class="width50">
	                       
	  						<div class="form-group row">
	                          <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Fungicide Used <!--  --></label>
	                          <div class="col-12 col-md-8 col-xl-8">
	                             <span class="colon">:</span>
	                             <span id="FungicideName"></span>
	                          </div>
	                       </div>
	                       
	                        <div class="form-group row">
	                          <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Dose (lit/ha) <!--  --></label>
	                          <div class="col-12 col-md-8 col-xl-8">
	                             <span class="colon">:</span>
	                             <span id="dose"></span>
	                          </div>
	                       </div>
	  						</div>
	  						
	  						
	  						<div class="width50">
	  					    <div class="form-group row">
	                          <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Date of Spray<!--  --></label>
	                          <div class="col-12 col-md-8 col-xl-8">
	                             <span class="colon">:</span>
	                             <span id="sprayDate"></span>
	                          </div>
	                       </div>
	                       
	                        <div class="form-group row">
	                          <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Effectiveness <!--  --></label>
	                          <div class="col-12 col-md-8 col-xl-8">
	                             <span class="colon">:</span>
	                            <span id="EffectiveNessName"></span>
	                          </div>
	                       </div>
	                       </div>
	                       </div>
      						</div>
      						<div class="clearfix"></div>
      						
      						
      						
      						<div id="otherShow">
      						
      						<h3>Other Diseases </h3>


							 


							<div class="tablesec">
								<div class="table-responsive">
									<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered" id="otherDisease1">
									<tr>
										<th>Sl#</th>
										<th>Disease</th>
										<th>Incident (%)</th>
										<th>Severity (%)</th>
										
									</tr>														
									 
									</table>
								</div>
							</div>
							
    </div>
                           <div class="clearfix"></div>
      
      						
      						
      						
      						
      						
      						
    
      
      						<h3>Other Detail</h3> 
                          
                        <div class="width50">
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Irrigated ?<!--  --></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="irrigated"></span>
                              </div>
                           </div>
                           
                             
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Any Other disease <!--  --></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                <span id="otherDisease"></span>
                              </div>
                           </div>
                           
                           
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Additional comments or Observation <!--  --></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                <span id="remark"></span>
                              </div>
                           </div> 
                           
                           
                           </div>
                          
                          
                          <div class="width50">
                          <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Weed Control ?<!--  --></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="weedcontrol"></span>
                              </div>
                           </div>  
                           
                          <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Soil Colour <!--  --></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="SoilName"></span>
                              </div>
                           </div>
                        
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Moisture <!--  --></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="MoistureName"></span>
                              </div>
                           </div>
                           
                          
                           
						 
                         </div>
                     
                          <div class="clearfix"></div>
                          
                          
                          <div class="width50">
                          
                           <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnSubmitId">Submit</button>
								 <button class="btn btn-warning mb-1" id="btnModifyId">Modify</button>
								 <button class="btn btn-danger mb-1" id="btnCancel">Cancel</button>
							  </div>
					      </div>
                          </div>
                          
                            <div class="clearfix"></div>
                          
                          
                          
                          
                       	  <form action="saveSurveyDetailsDiscardSurveyor" autocomplete="off" id="myForm"   method="post">
                            <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                             <input type="text" value="" style="display:none;" name="surveyJSON" id="encodedata">
                             <input type="text" value="" style="display:none;" name="surveyId" id="surveyId">
                           </form>
                          
                          
                          
                          
                          
                          <div class="clearfix"></div>
                           
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      
      <script>
$(document).ready(function(){
	
	 
	 $("#btnSubmitId").click(function(){
		 
		 var message = ('${SurveyId}' != 0 || '${SurveyId}' != '0')?'update ?' : 'submit ?';
		 swal({
		 		title: ' Do you want to '+message,
		 		  type: 'warning',
		 		  showCancelButton: true,
		 		  confirmButtonText: 'Yes',
		 		  cancelButtonText: 'No',
			    }).then((result) => {
			    	  if (result.value) { 
			    		  
			    		  //window.location.href="viewsurveydetails";
			    		  var SurveyJSON = '${SurveyJSON}';
			    		  $("#encodedata").val(SurveyJSON);
			    		  $("#surveyId").val('${SurveyId}');
			    		  $("#myForm").submit();
			    		  
			    		  }
			    		})  
			    		return false;  
	});
	 
$("#btnModifyId").click(function(){
		 
		 /* if(confirm("Do you want to Modify?")){
			 window.location.href="modifySurveyData.html";
		 }else{
		   return false;
		} */
	 swal({
 		title: ' Do you want to Modify?',
 		  type: 'warning',
 		  showCancelButton: true,
 		  confirmButtonText: 'Yes',
 		  cancelButtonText: 'No',
	    }).then((result) => {
	    	  if (result.value) { 
	    		  window.location.href="modifySurveyDiscardSurveyor?surveyId="+'${SurveyId}';
	    		  }
	    		})  
	    		return false; 
	});
  
  
  
$("#btnCancel").click(function(){
	 
	 /* if(confirm("Do you want to Cancel ?")){
		 window.location.href="Addpage.html";
	 }else{
	   return false;
	} */
	swal({
 		title: ' Do you want to Cancel?',
 		  type: 'warning',
 		  showCancelButton: true,
 		  confirmButtonText: 'Yes',
 		  cancelButtonText: 'No',
	    }).then((result) => {
	    	  if (result.value) { 
	    		  window.location.href="cancelSurveyDetailsDiscardSurveyor";
	    		  }
	    		})  
	    		return false;   
});


});
</script>

<script>
$(document).ready(function()
		{
			
		var SurveyJSON = '${SurveyJSON}';
		SurveyJSON = atob(SurveyJSON);
		SurveyJSON = JSON.parse(SurveyJSON);
		console.log(SurveyJSON);
		$("#instituteName").html(SurveyJSON.surveyorJsa[0].InstitutionName);
		$("#country").html(SurveyJSON.surveyorJsa[0].CountryName);
		var sur = "";
		for(i=0;i<SurveyJSON.surveyorJsa.length;i++)
			{
			sur += SurveyJSON.surveyorJsa[i].surveyorName +" , ";
			}
		$("#surveryors").html(sur.substring(0,sur.length-2));
		
		$("#season").html(SurveyJSON.SeasionName);
		$("#region").html(SurveyJSON.RegionName);
		$("#zone").html(SurveyJSON.ZoneName);
		$("#woreda").html(SurveyJSON.WoredaName);
		 
			$("#kebelworedaaddr").html(((SurveyJSON.kebelworedaaddr).trim().length == 0)?"NA":SurveyJSON.kebelworedaaddr);
 
		$("#kebele").html(SurveyJSON.KebeleName);
		$("#othersurveyor").html(SurveyJSON.othersurveyor);
		$("#tilleringdate").html(((SurveyJSON.tilleringdate).trim().length == 0)?"NA":SurveyJSON.tilleringdate);
		$("#altitude").html(SurveyJSON.altitudeId);
		$("#latitude").html(SurveyJSON.latitudeId  );
		$("#longitude").html(SurveyJSON.longitudeId);
		$("#surveyDate").html(SurveyJSON.surveyDateId);
		$("#plantingDate").html((SurveyJSON.plantingDate).trim().length == 0 ?"NA":SurveyJSON.plantingDate);
		$("#rustDate").html((SurveyJSON.observationId).trim().length == 0?"NA":SurveyJSON.observationId);
		$("#contactedFarmer").html((SurveyJSON.contactedFarmerId == true)?"Yes":"No");
		if(SurveyJSON.contactedFarmerId == false)
		{
		$(".contactdate").hide();
		}
	else{
		$(".contactdate").show()
		}
		$("#area").html((SurveyJSON.siteInformation.siteArea).trim().length==0?"NA":SurveyJSON.siteInformation.siteArea);
		$("#surveySite").html(SurveyJSON.siteInformation.SurveySiteName);
		$("#growthType").html(SurveyJSON.siteInformation.GrowthStageName);
		$("#wheatType").html(SurveyJSON.siteInformation.WheatName);
		$("#variety").html(SurveyJSON.siteInformation.VarityName);
		$("#rustAffect").html((SurveyJSON.rustAffectedId == true)?"Yes":"No");
		
		(SurveyJSON.rustAffectedId == true)?$("#rustshow").show():$("#rustshow").hide();
		$("#funApplied").html((SurveyJSON.fungisideId == true)?"Yes":((SurveyJSON.fungisideId == null) ? "I Don't Know":"No"));
		$("#sampleCollected").html((SurveyJSON.sampleCollectedId == true)?"Yes":"No");
		(SurveyJSON.sampleCollectedId == true)?$("#sampleShow").show():$("#sampleShow").hide();
		(SurveyJSON.fungisideId == true)?$("#fungiShow").show():$("#fungiShow").hide();
		
		//rustTable
		
		for(i=0;i<SurveyJSON.rustDetails.length;i++)
			{
			var  rustType = SurveyJSON.rustDetails[i].RustTypeName;
			var  incident = SurveyJSON.rustDetails[i].incidentId;
			var  severityId = SurveyJSON.rustDetails[i].severityId;
			var  reactionName = SurveyJSON.rustDetails[i].ReactionName;
			var  headIncident = SurveyJSON.rustDetails[i].headIncidentId;
			var  headSeverity = SurveyJSON.rustDetails[i].headSeverityId;
			var html = "<tr><td>"+(i+1)+"</td><td>"+rustType+"</td><td>"+incident+"</td><td>"+severityId+"</td><td>"+reactionName+"</td><td>"+headIncident+"</td><td>"+headSeverity+"</td></tr>";
			$("#rustTable").append(html);
			
			}
		
		//sampleDetail
		for(i=0;i<SurveyJSON.sampleDetails.length;i++)
			{
			var  SampleTypeName = SurveyJSON.sampleDetails[i].SampleTypeName;
			var  sampleCountId = SurveyJSON.sampleDetails[i].sampleCountId;
			var  sampleIds = SurveyJSON.sampleDetails[i].sampleIds;
			var  sampleRemarks = SurveyJSON.sampleDetails[i].sampleRemarks;
			var html = "<tr><td>"+(i+1)+"</td><td>"+SampleTypeName+"</td><td>"+sampleCountId+"</td><td>"+sampleIds.substring(0,sampleIds.length-1)+"</td><td>"+sampleRemarks+"</td></tr>";
			$("#sampleDetail").append(html);
			
			}
		$("#FungicideName").html(SurveyJSON.fungicideJson.FungicideName);
		$("#EffectiveNessName").html(SurveyJSON.fungicideJson.EffectiveNessName);
		$("#sprayDate").html((SurveyJSON.fungicideJson.sprayDate).trim().length == 0?"NA":SurveyJSON.fungicideJson.sprayDate);
		$("#dose").html((SurveyJSON.fungicideJson.dose).trim().length == 0 ?"NA":SurveyJSON.fungicideJson.dose);
		
		// Other Details
		//otherDetails
		
		$("#remark").html((SurveyJSON.remark).trim().length == 0?"NA":SurveyJSON.remark);
		$("#irrigated").html((SurveyJSON.otherDetails.irrigated == true)?"Yes":"No");
		$("#weedcontrol").html((SurveyJSON.otherDetails.weedcontrol == true)?"Yes":"No");
		$("#SoilName").html(SurveyJSON.otherDetails.SoilName);
		$("#MoistureName").html(SurveyJSON.otherDetails.MoistureName);
		
		var val_ = "";
		
		for(i=0;i<SurveyJSON.anyOtherDiseaseJsa.length;i++)
		{
		var  DiseaseName = SurveyJSON.anyOtherDiseaseJsa[i].DiseaseName;
		val_ += DiseaseName+" , ";
		}
		val_ = val_.substring(0,val_.length-2);
		$("#otherDisease").html((val_.trim().length == 0)?"NA":val_);
//		
		// /public/load_image
		//
		
		$("#capturedImage").html((SurveyJSON.capturedImageId == true)?"Yes":"No");
		
		(SurveyJSON.capturedImageId == true)?$("#imageShow").show():$("#imageShow").hide();
		 
		
		
		// Other disease
		//otherDisease
		
		for(i=0;i<SurveyJSON.otherDisease.length;i++)
			{
			var  DiseaseName = SurveyJSON.otherDisease[i].DiseaseName;
			var  othIncidentVal = SurveyJSON.otherDisease[i].othIncidentVal;
			var  othSeverityVal = ((SurveyJSON.otherDisease[i].othSeverityVal).trim() == '')?'--':SurveyJSON.otherDisease[i].othSeverityVal;
			var html = "<tr><td>"+(i+1)+"</td><td>"+DiseaseName+"</td><td>"+othIncidentVal+"</td><td>"+othSeverityVal+"</td></tr>";
			$("#otherDisease1").append(html);
			
			}
		(SurveyJSON.otherDisease.length > 0)?$("#otherShow").show():$("#otherShow").hide();
	
		});
	

</script>