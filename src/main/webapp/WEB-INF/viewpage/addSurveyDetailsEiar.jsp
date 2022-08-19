<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src="./js/html5lightbox.js"></script>

<style> 
.thumbimg{width: 60px;margin: 0 10px 0 0;}
.mapmodal{max-width: 90% !important;}
</style>

<link rel="stylesheet"
	href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
<!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
<script
	src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
<script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>


<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                    <c:if test="${Update eq true || SurveyId ne 0}">
                     <h4>Edit Survey Details</h4>
                     </c:if>
                     
                     <c:if test="${Update eq false || SurveyId eq 0}">
                     <h4>Add Survey Details</h4>
                     </c:if>
                     
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Survey</li>
                           <li class="breadcrumb-item active" aria-current="page">Survey Details</li>
                        </ol>
                     </nav>
                  </div>
               
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="javascript:void(0)">Edit</a>
                           </ul>
                           <div class="indicatorslist">
                              
                               <c:if test="${ SurveyId ne 0}">
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" onclick="history.back()" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                              </c:if>
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                           <!--Static-->
                           

                           
                           
                           
                           <c:if test="${ SurveyId ne 0}">
                           <b style="font-size: 20px;">Survey No : S${SurveyId}</b>
                           </c:if>
                           
                           <div class="">
                           
                           <h3>Surveyor Information</h3> 
                             <div class="width50">
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Institution Name</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <select class="form-control" disabled id="institutionName">
                                 <option value="-1">--Select--</option>
                                 <option value="${InstitutionSelected[0] }" selected >${InstitutionSelected[1] }</option>
                                 <c:forEach items="${Institutions}" var="rc">
                                 	<option value="${rc.researchCenterId}" >${rc.researchCenterName}</option>
                                 </c:forEach>
                               
                                 </select>
                              </div>
                           </div>
                           
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Surveyor's Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>


										<div class="dropdown-container">
											<div class="dropdown-button noselect">
												<div class="dropdown-surveyor">
													<span class="quantity" id="sur">1</span>
												</div>
												<i class="fa fa-caret-down pull-right"></i>
											</div>
											<div class="dropdown-list" style="display: none;">
												<input type="search" placeholder="Search Surveyor's"
													class="dropdown-search" />
												<ul>


													<li>
														<div class="checkbox">
															<input id="demo-form-checkbox21surveyor"
																class="magic-checkbox selectall1 nocheck" type="checkbox">
															<label for="demo-form-checkbox21surveyor"></label>
														</div> <label for="AL">Select All</label>
													</li>


													<c:forEach items="${Surveyors}" var="surveyors"
														varStatus="loop">
														<li>
															<div class="checkbox">
																<input id="check_surveyor_${surveyors[0] }"
																	value="${surveyors[0] }"
																	class="magic-checkbox individual1" type="checkbox">
																<label for="check_surveyor_${surveyors[0] }"></label>
															</div> <label for="check_surveyor_${surveyors[0] }" id="check_val_${surveyors[0] }">${ surveyors[1]}</label>
														</li>
													</c:forEach>



												</ul>
											</div>
										</div>



									</div>
                           </div>
                           
                           
                           
							</div>

                            <div class="width50 mrgnl40">
                            
                          		 <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Country</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                              <select class="form-control" disabled id="country">
                               <option value="1">Ethiopia</option>
                              </select>
                                
                              </div>
                           </div>
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Other Surveyor </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <textarea rows="2" cols="100" class="form-control" id="othersurveyor" maxlength="200"></textarea><div id="charNum3">Maximum 500 characters</div>
                              </div>
                           </div> 
                           
                           
  							</div>
                           </div>
                           
                           
                           <div class="clearfix"></div>
                           
                           <h3>Survey Information</h3>
                           
                             <div class="width50"> 
                             
                               <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Date of Survey<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <div class="input-group">
                                  <input value="${CurrentDate }" autocomplete="off" type="text" class="form-control datepicker"  data-date-end-date="0d"  id="surveyDateId" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                    <div class="input-group-ap
                                    pend">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                   
                                 </div>
                              </div>
                           </div>
                           
                           
                           
                           
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Region <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <select class="form-control"  id="regionId">
                                     <option value="-1">--Select--</option>
                                    
                                     <c:forEach items="${DemographList}" var="demographList">
                                   <option value="${ demographList[0]}">${ demographList[1]}</option>
                                    </c:forEach>
                                 </select>
                              </div>
                           </div>
                           
                           
                            
                             
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Woreda <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <select class="form-control" id="woredaId">
                                    <option value="-1">--Select--</option>
                                   
                                    
                                 </select>
                              </div>
                           </div>  
                            <div class="form-group row" id="kebelworedaaddrdiv"  >
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Location Name   <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <textarea rows="1" cols="100" class="form-control" id="kebelworedaaddr" maxlength="200"></textarea><div id="charNum2">Maximum 500 characters</div>
                              </div>
                           </div>
                             
                            
                            
                          
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Lat & Long Type<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                <div class="radio">
					                <input id="decimal" class="magic-radio" type="radio" checked="checked" name="latlongtype" value="decimal">
					                <label for="decimal">Decimal</label>
					         
					                <input id="degree" class="magic-radio" type="radio"  name="latlongtype" value="degree">
					                <label for="degree">Degree</label>
					                
					           </div>
                              </div>
                           </div>
                           
                            
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Latitude <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                               <div class="row">
                                    <div class="col-12 col-md-12 col-xl-12">
                                      <input type="text"  autocomplete="off"  id="latitudeId" class="form-control" placeholder="Enter decimal values">
                                   </div>
                                    
                                </div>   
                                </div>
                           </div>
                           
                           
                          <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Contacted with farmer ?</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <div class="radio">
                                    <input id="contactedFarmerId" class="magic-radio farmertyes" type="radio" name="farmert" value='yes'>
                                    <label for="contactedFarmerId">Yes</label>
                             
                                    <input id="demo-form-radio-16" class="magic-radio farmertno" checked="checked" type="radio" name="farmert" value='no' >
                                    <label for="demo-form-radio-16">No</label>
                                 </div>
                              </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Date of Tillering</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <div class="input-group">
                                 <input type="text"  autocomplete="off"  class="form-control datepicker" readonly="readonly"  data-date-end-date="0d" id="tilleringdate" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                    <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                    
                                 </div>
                              </div>
                           </div>

 						   </div>
                             <div class="width50 mrgnl40">
                             
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Season <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <select class="form-control" id="seasonId">
                                    <option value="-1">--Select--</option>
                                    
                                     <c:forEach items="${SeasionList}" var="seasionList">
                                   <option value="${ seasionList.intSeasoonId}" months="${seasionList.months }">${ seasionList.vchSeason}</option>
                                    </c:forEach>
                                 </select>
                              </div>
                           </div> 
                           
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Zone <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <select class="form-control" id="zoneId">
                                    <option value="-1">--Select--</option>
                                   
                                 </select>
                              </div>
                           </div>
                           
                               <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Kebele <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <select class="form-control" id="kebeleId">
                                    <option value="-1">--Select--</option>
                                    
                                 </select>
                              </div>
                           </div>
                           
                          
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Altitude<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <input type="text"  autocomplete="off"    class="form-control" placeholder="" id="altitudeId">
                              </div>
                           </div>
                           
                            <div class="form-group row mt-4 mb-4 text-underline">
                            	<label class="col-12 col-md-4 col-xl-4 control-label"></label>
                                <div class="col-12 col-md-8 col-xl-8">
                                <a data-placement="top" data-toggle="modal" title="map detail" data-target="#mapModal"href="javascript:void(0);" ><i class="fa fa-map-marker"></i> View On Map</a></div>
                            </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Longitude<span class="text-danger">*</span></label>
                             <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                               <div class="row">
                                    <div class="col-12 col-md-12 col-xl-12">
                                      <input type="text"  autocomplete="off"  id="longitudeId" class="form-control" placeholder="Enter decimal values">
                                   </div>
                                     
                                </div>   
                               </div>
                           </div>
                          
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label"  for="demo-readonly-input">Date of Planting</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 
                                 <div class="input-group">
                                  <input type="text"  autocomplete="off"  readonly="readonly" class="form-control datepicker" data-date-end-date="0d" id="plantingDate" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                    <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                   
                                 </div>
                              </div>
                           </div>
                         
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Date of first Rust Observation</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <div class="input-group">
                                 <input type="text"  autocomplete="off" readonly="readonly"  class="form-control datepicker"  data-date-end-date="0d" id="observationId" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                    <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                    
                                 </div>
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
                                 <select class="form-control" id="surveySite">
                                    <option value="-1">--Select--</option>
                                    <c:forEach items="${SiteTypeList}" var="siteTypeList">
                                   <option value="${ siteTypeList.intSiteTypeId}">${ siteTypeList.vchSiteName}</option>
                                    </c:forEach>
                                   
                                 </select>
                              </div>
                           </div>
                           
                            
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Variety  <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-4 col-xl-4"> 

                              <span class="colon">:</span>
                            
                               <select class="form-control" id="varity">
                                    <option value="-1">--Select--</option>
                                    <c:forEach items="${VarietyList}" var="varietyList">
                                   <option value="${ varietyList.varietyTypeId}">${ varietyList.vchDesc}</option>
                                    </c:forEach>
                                   
                                 </select>
                                
                              </div>
                               <div class="col-12 col-md-4 col-xl-4">
                               <input type="text" class="form-control" placeholder="Other Variety" id="othervariety" disabled="disabled">
                               </div>
                               
                              
                           </div>
                           
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Area (in ha)</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <input type="number" min="0" step="1" max="9999" id="siteArea" class="form-control" placeholder="">
                              </div>
                           </div>
                           
                           
                           </div>
                           
                            <div class="width50 mrgnl40">
                            
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Type of Wheat </label>
                              <div class="col-12 col-md-4 col-xl-4">
                                 <span class="colon">:</span>
                                 <select class="form-control" id="wheatType">
                                    <option value="-1">--Select--</option>
                                      <c:forEach items="${WheatTypeList}" var="wheatTypeList">
                                   <option value="${ wheatTypeList.intWheatTypeId}">${ wheatTypeList.vchDesc}</option>
                                    </c:forEach>
                                 </select>
                              </div>
                              <div class="col-12 col-md-4 col-xl-4">
                               <input type="text" class="form-control" placeholder="Other Wheat" id="otherwheat" disabled="disabled">
                               </div>
                           </div>
                            
                            
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Growth Stage </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <select class="form-control" id="growthStage">
                                   <option value="-1">--Select--</option>
                                      <c:forEach items="${GrowthList}" var="growthList">
                                   <option value="${ growthList.intCrGrStageId}">${ growthList.vchStage}</option>
                                    </c:forEach>
                                 </select>
                              </div>
                           </div>
                           
                          
                            </div>
                           
                            <div class="clearfix"></div>
                           
                           
                           <h3>Rust Details</h3> 
                           
                           
                            <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Is Rust Affected ? <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <!-- Radio Buttons -->
                                 <div class="radio">
                                    <input id="rustAffectedId" class="magic-radio rustAffectyes" type="radio" name="isRustAffected">
                                    <label for="rustAffectedId">Yes</label>
                             
                                    <input id="demo-form-radio-4" class="magic-radio rustAffectno" type="radio" checked="checked" name="isRustAffected" >
                                    <label for="demo-form-radio-4">No</label>
                                 </div>
                              </div>
                           </div>
                           
                           
                           <div id="rustDetailId" >
                           
                           <div class="form-group row">
                           
                           <div class="table-responsive">
      
      <table class="table  table-bordered" id="rustTbl">
      <thead>
      <tr>
	      <td>Type of Rust</td>
	      <td>Incident (0-100%)</td>
	      <td>Severity (0-100%)</td>
	      <td>Reaction</td>
	      <td>Head Incident (0-100%)</td>
	      <td>Head Severity (0-5)</td>
	      <td>Action</td>
      </tr>
      </thead>
      <tbody>
      <tr>
	      <td><select class="form-control" id="rustTypeId">
	              <option value="-1">--Select--</option>
                                      <c:forEach items="${RustTypeList}" var="rustTypeList">
                                   <option value="${ rustTypeList.intRustTypeId}">${ rustTypeList.vchRustType}</option>
                                    </c:forEach>
	          </select></td>
	      <td><input type="number" id="incidentId" max="100" min="0" step="1" class="form-control" placeholder=""></td>
	      <td><input type="number" id="severityId" maxlength="20"  max="100" min="0" step="1" class="form-control" placeholder=""></td>
	      <td><select class="form-control" id="reactionId">
	             <option value="-1"> --Select-- </option>
	             
	          </select></td>
	      <td><input type="number" id="headIncidentId" max="100" min="0" step="1" class="form-control" placeholder=""></td>
	      <td><input type="number" id="headSeverityId"  max="5" min="0" step="1" class="form-control" placeholder=""></td>
	      <td><input type="button" id="demo-text-input1" value="Add" class="btn btn-success" onclick="return addRow('dataTable');" ></td>
       </tr>
     </tbody>
    </table>
      </div>
	</div>
	
	
	<div id="subMainDiv">													
		 <div class="tablesec">
			<div class="table-responsive">
				<table id="dataTable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered">
				<tr>
					<th>Sl#</th>
					<th>Type of Rust</th>
					<th>Incident(%)</th>
					<th>Severity(%)</th>
					<th>Reaction</th>
					<th>Head Incident(%)</th>
	                <th>Head Severity</th>
					<th>Action</th>
				</tr>														

				</table>
			</div>
		</div>
		</div>
						                  
		
		<h3>Sample Detail</h3>
		<div class="form-group row pad-ver">
	          <label class="col-12 col-md-2 col-xl-2 control-label">Samples collected ? <span class="text-danger">*</span></label>
	          <div class="col-12 col-md-8 col-xl-8">
	             <span class="colon">:</span>
	             <!-- Radio Buttons -->
	             <div class="radio">
	                <input id="sampleCollectedId" class="magic-radio sampleyes" type="radio" name="isSampleCollected">
	                <label for="sampleCollectedId">Yes</label>
	         
	                <input id="demo-form-radio-2" class="magic-radio sampleno" type="radio" checked="checked" name="isSampleCollected" >
	                <label for="demo-form-radio-2">No</label>
	             </div>
	          </div>
      </div>
      
      <div id="sampleDetailId">
      
      <div class="form-group row">
                           
                           <div class="table-responsive">
      
      <table class="table  table-bordered">
      <thead>
      <tr>
	      <td>Type of Sample</td>
	      <td>No. of Samples</td>
	      <td>Sample ID</td>
	      <td>Remarks</td>
	      <td>Action</td>
      </tr>
      </thead>
      <tbody>
      <tr>
	      <td><select class="form-control" id="sampleTypeId">
	             <option value="-1">-- Select --</option>
	               <%-- <c:forEach items="${SampleTypeList}" var="sampleTypeList">
                                   <option value="${ sampleTypeList.sampleId}">${ sampleTypeList.sampleName}</option>
                                    </c:forEach> --%>
	          </select></td>
	      <td><input type="number" max="9" min="1" step="1" id="sampleCountId" class="form-control" placeholder="" onblur="createInputField(this.value)"></td>
	      <td id="hdnSampleIdEntry"></td>
	      <td><textarea  class="form-control" id="sampleRemarks" maxlength="200"></textarea><div id="charNum">Maximum 500 characters</div></td>
	      <td><input type="button" id="demo-text-input1" value="Add" class="btn btn-success" onclick="return addRow1('dataTable1');" ></td>
       </tr>
     </tbody>
    </table>
      </div>
	</div>
	
	
	<div id="subMainDiv1">													
		 <div class="tablesec">
			<div class="table-responsive">
				<table id="dataTable1" width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered">
				<tr>
					<th>Sl#</th>
					<th>Type of Sample</th>
					<th>No. of Samples</th>
					<th>Sample IDs</th>
					<th>Remarks</th>
					<th>Action</th>
				</tr>														

				</table>
			</div>
		</div>
		</div>
      
     </div> 
      
      
      <h3>Capture Image</h3>
                          
                          <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Do you want to upload Image ? <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <!-- Radio Buttons -->
	             <div class="radio">
	                <input id="capturedImageId" class="magic-radio imgyes" type="radio" name="isUploadImg">
	                <label for="capturedImageId">Yes</label>
	         
	                <input id="demo-form-radio-6" class="magic-radio imgno" type="radio" checked="checked" name="isUploadImg" >
	                <label for="demo-form-radio-6">No</label>
	             </div>
                              </div>
                           </div> 
                           
                            
                          
                          <div class="form-group row" id="hdnImgdiv">
                          <label class="col-12 col-md-2 col-xl-2 control-label">Upload image</label>
                           <div class="col-12 col-md-8 col-xl-8">
                          <div class="table-responsive">
                          
      							    <form action="validateSurveyDetailsEiar" autocomplete="off" id="myForm"   method="post" enctype="multipart/form-data">
      							    <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
      							     <c:if test="${Update eq true }">
								 <input type="text"  autocomplete="off"  style="display:none;" name="surveyId" id="surveyId" value="${SurveyId }">
								 </c:if>
								 <c:if test="${ Update eq false}">
								 <input type="text"  autocomplete="off"  style="display:none;" name="surveyId" id="surveyId" value="${SurveyId }">
								 </c:if>
      							    <input type="text"  autocomplete="off"  value="" style="display:none;" name="surveyJSON" id="encodedata">
							      <table class="table  table-bordered" id="imgTable">
							      
							      <tr>
								      <td><input id="mimage" type="file" class="form-control" name="files" accept=" image/jpeg, image/png"></td>
								      <td><input type="button" id="demo-text-input1" value="Add More" class="btn btn-success" onclick="return addImg('imgTable');" > &nbsp;&nbsp;<input type="button" id="clearimage" value="Delete" class="btn btn-danger" ></td>
								  </tr>
							     

							    
							    </table>
							    </form>
						 </div>
               			 </div>
               			  <c:if test="${fn:length(Images) > 0}">
               			   <div class="col-12 col-md-8 col-xl-8">
               			  <div class="row noimage">
	                            <label class="col-12 col-md-2 col-xl-2 control-label">Uploaded Images</label>
			                       <c:forEach items="${Images}" var="images"
														varStatus="loop">
														
			                       <a href="${images }" data-thumbnail="${images }" data-group="mygroup" class="html5lightbox thumbimg" title="Survey"  data-width=800 >  
									   <img src="${images }" alt="no image" style="width:60px;height:60px;float: left;">
									</a>
														</c:forEach>
			                       
			                       
			                       
		                       </div>
		                       </div>
                          </c:if>
                       </div>
                              
                        <h3>Fungicide Details</h3>
                        
                          <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label"> Fungicide Applied ? <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <div class="radio">
					                <input id="fungisideId" class="magic-radio fungiyes" type="radio" name="isFungicide">
					                <label for="fungisideId">Yes</label>
					         
					                <input id="demo-form-radio-8" class="magic-radio fungino" type="radio" checked="checked" name="isFungicide" >
					                <label for="demo-form-radio-8">No</label>
					                
					                <input id="unknownfungicide" class="magic-radio unknownfungicide" type="radio"  name="isFungicide" >
					                <label for="unknownfungicide">I Don't Know</label>
					           </div>
                              </div>
                           </div>
      						
      						
      						
      						
      						<div id="fungicideDetailId">
      						
      					<div class="width50">
      						
      						<div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Fungicide Used </label>
                              <div class="col-12 col-md-4 col-xl-4">
                                 <span class="colon">:</span>
                                 <select class="form-control"  id="fungiUsed">
                                    <option value="-1">--Select--</option>
                                      <c:forEach items="${FungiList}" var="fungiList">
                                   <option value="${ fungiList.fungicideId}">${ fungiList.fungicideName}</option>
                                    </c:forEach>
                                   
                                 </select>
                              </div>
                               <div class="col-12 col-md-4 col-xl-4">
                               <input type="text" class="form-control" placeholder="Other Fungicide Used" id="otherfungi" disabled="disabled">
                               </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Dose (lit/ha) </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <input type="text"  autocomplete="off"  id="dose" class="form-control" placeholder="">
                              </div>
                           </div>
                           
                           </div>
                           
                      
      						<div class="width50 mrgnl40">
      						 <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Date of Spray</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <div class="input-group">
                                 <input type="text"  autocomplete="off" readonly="readonly" class="form-control datepicker" data-date-end-date="0d" id="sprayDate" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                    <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                    
                                 </div>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Effectiveness </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <select class="form-control" id="effectiveness">
                                    <option value="-1">--Select--</option>
                                    <c:forEach items="${FungiEffectList}" var="fungiEffectList">
                                   <option value="${ fungiEffectList.intEffectId}">${ fungiEffectList.vchDesc}</option>
                                    </c:forEach>
                                   
                                 </select>
                              </div>
                           </div>

                           </div>
                         
                           <div class="clearfix"></div>
      						
      						
      						</div>
      						
      						
      						
                        </div> <!-- end of rust div -->
                        
                        <h3>Other Diseases</h3>
                        
                        
                        <div class="form-group row">
                           
                           <div class="table-responsive">
      
      <table class="table  table-bordered">
      <thead>
      <tr>
	      <td><b>Disease</b></td>
	      <td><b>Incident (%)</b></td>
	      <td><b>Severity (%)</b></td>
	      
	      <td><b>Action</b></td>
      </tr>
      </thead>
      <tbody>
      <tr>
	      <td><select class="form-control" id="diseaseTypeId">
	      <option value="-1">-- Select --</option>
	              <c:forEach items="${DiseaseList}" var="diseaseList">
                                   <option value="${ diseaseList.diseaseId}" min-sev="${diseaseList.severityMin }"
                                   max-sev="${diseaseList.severityMax }" severity-required="${diseaseList.severityRequired }">${ diseaseList.diseaseName}</option>
                                    </c:forEach>
                                     
	          </select></td>
	      <td><input type="number" id="othIncidentId"  max="100" min="0" step="1"  class="form-control" placeholder=""></td>
	      <td><input type="number" id="othSeverityId"   max="100" min="0" step="1" class="form-control" placeholder=""></td>
	      
	      <td><input type="button" id="demo-text-input4" value="Add" class="btn btn-success" onclick="return addRow4('dataTable4');" ></td>
       </tr>
     </tbody>
    </table>
      </div>
	</div>
	
	
	<div id="subMainDiv4">													
		 <div class="tablesec">
			<div class="table-responsive">
				<table id="dataTable4" width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered">
				<tr>
					<th>Sl#</th>
					<th>Disease</th>
					<th>Incident(%)</th>
					<th>Severity(%)</th>
					<th>Action</th>
				</tr>														

				</table>
			</div>
		</div>
		</div>
      
                          <h3>Other Detail</h3> 
                          
                        <div class="width50">
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Irrigated ?</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <div class="radio">
					                <input id="irrigated" class="magic-radio irrigatedyes" type="radio" name="isIrrigated">
					                <label for="irrigated">Yes</label>
					         
					                <input id="demo-form-radio-10" class="magic-radio irrigatedno" type="radio" checked="checked" name="isIrrigated" >
					                <label for="demo-form-radio-10">No</label>
					           </div>
                              </div>
                           </div>
                           
                              
                           
                            <div class="form-group row" style="display:none">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Any Other disease </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 
                                 
                                 
                                 <div class="dropdown-container">
						    <div class="dropdown-button noselect">
						        <div class="dropdown-quantity"><span class="quantity"></span></div>
						        <i class="fa fa-caret-down pull-right"></i>
						    </div>
						    <div class="dropdown-list" style="display: none;">
						        <input type="search" placeholder="Search disease" class="dropdown-search"/>
						        <ul>
						        
						        
						          <li>
							        <div class="checkbox">
	                                    <input id="demo-form-checkbox3disease" class="magic-checkbox selectall nocheck" type="checkbox">
	                                   <label for="demo-form-checkbox3disease"></label>
	                                 </div>
	                                 <label for="AL">Select All</label>
	                              </li>
						        
							      
							       <c:forEach items="${DiseaseListAny}" var="diseaseList" varStatus="loop">
							      <li>
							        <div class="checkbox">
	                                    <input id="check_disease_${diseaseList.diseaseId }" value="${diseaseList.diseaseId }" class="magic-checkbox individual" type="checkbox">
	                                   <label for="check_disease_${diseaseList.diseaseId }"></label>
	                                 </div>
	                                 <label for="check_disease_${diseaseList.diseaseId }" id="check_val1_${diseaseList.diseaseId }">${ diseaseList.diseaseName}</label>
	                              </li>
                                 </c:forEach>
                                 
                                 
                                  
                                 </ul>
						    </div>
						</div>
                                 
                                 
                                 
                                 
                                 
                              
                               </div>
                           </div>
                           
                           
                           
                           
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Additional comments or Observation </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <textarea rows="5" cols="100" class="form-control" id="remark" maxlength="200"></textarea><div id="charNum1">Maximum 500 characters</div>
                              </div>
                           </div> 
                            
                           
                           <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnSubmitId">
								 <c:if test="${Update eq true || SurveyId ne 0}">
								 Update
								 </c:if>
								 <c:if test="${ Update eq false &&  SurveyId eq 0}">
								 Submit
								 </c:if>
								 </button>
								 
								  <c:if test="${Update eq true}">
								  <button class="btn btn-danger mb-1" id="btnBack">Cancel</button>
								 </c:if>
								 <c:if  test="${Update eq false}">
								  <button class="btn btn-danger mb-1" id="btnBack1">Reset</button>
								 </c:if>

							  </div>
					      </div>
                           
                           
							 </div>

                        <div class="width50 mrgnl40">
                        
                        <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Weed Control ?</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <div class="radio">
					                <input id="weedcontrol" class="magic-radio weedyes" type="radio" name="isWeed">
					                <label for="weedcontrol">Yes</label>
					         
					                <input id="demo-form-radio-12" class="magic-radio weedino" checked="checked" type="radio" name="isWeed" >
					                <label for="demo-form-radio-12">No</label>
					           </div>
                              </div>
                           </div> 
                        
                        <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Soil Colour </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <select class="form-control" id="soilColor">
                                    <option value="-1">--Select--</option>
                                   <c:forEach items="${SoilColors}" var="soilColors">
                                   <option value="${ soilColors.intSoilColorId}">${ soilColors.vchSoilColor}</option>
                                    </c:forEach>
                                 </select>
                              </div>
                           </div>
                        
                        <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Moisture </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <select class="form-control" id="moisture">
                                   <option value="-1">--Select--</option>
                                   <c:forEach items="${MoistureList}" var="moistureList">
                                   <option value="${ moistureList.intMoistureId}">${ moistureList.vchMoisture}</option>
                                    </c:forEach>
                                     
                                 </select>
                              </div>
                           </div>
                           
                           
                           
                           
                           
							                           
                       </div>
                         
                         
                         <div class="clearfix"></div>
                         
                         
                     
                          
                          
          <br> <br> <br> <br>  

               
                          
                          
                     

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Alert</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Alert
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">View Section</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered">
                                 <thead>
                                    <tr>
                                       <th width="25px" valign="top">
                                          <input id="demo-form-inline-checkboxall" class="magic-checkbox" type="checkbox">
                                          <label for="demo-form-inline-checkboxall"></label>
                                       </th>
                                       <th width="40px">Sl#</th>
                                       <th>Organization</th>
                                       <th>Parent Node</th>
                                       <th>Entity</th>
                                       <th>Created On</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                       <td> <input id="demo-form-inline-checkbox" class="magic-checkbox" type="checkbox">
                                          <label for="demo-form-inline-checkbox"></label>
                                       </td>
                                       <td>1</td>
                                       <td>BMC</td>
                                       <td>--</td>
                                       <td>Department</td>
                                       <td>12-Jan-2018</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip" title="" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                          <a class="btn btn-danger btn-sm" data-toggle="tooltip" title="" data-original-title="Delete"><i class="icon-trash-21"></i></a>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td> <input id="demo-form-inline-checkbox2" class="magic-checkbox" type="checkbox">
                                          <label for="demo-form-inline-checkbox2"></label>
                                       </td>
                                       <td>2</td>
                                       <td>BMC</td>
                                       <td>Department</td>
                                       <td>Section</td>
                                       <td>12-Jan-2018</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip" title="" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                          <a class="btn btn-danger btn-sm" data-toggle="tooltip" title="" data-original-title="Delete"><i class="icon-trash-21"></i></a>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td> <input id="demo-form-inline-checkbox3" class="magic-checkbox" type="checkbox">
                                          <label for="demo-form-inline-checkbox3"></label>
                                       </td>
                                       <td>3</td>
                                       <td>BDA</td>
                                       <td>--</td>
                                       <td>Department</td>
                                       <td>12-Jan-2018</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip" title="" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                          <a class="btn btn-danger btn-sm" data-toggle="tooltip" title="" data-original-title="Delete"><i class="icon-trash-21"></i></a>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td> <input id="demo-form-inline-checkbox4" class="magic-checkbox" type="checkbox">
                                          <label for="demo-form-inline-checkbox4"></label>
                                       </td>
                                       <td>4</td>
                                       <td>BDA</td>
                                       <td>Department</td>
                                       <td>Section</td>
                                       <td>12-Jan-2018</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip" title="" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                          <a class="btn btn-danger btn-sm" data-toggle="tooltip" title="" data-original-title="Delete"><i class="icon-trash-21"></i></a>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td> <input id="demo-form-inline-checkbox5" class="magic-checkbox" type="checkbox">
                                          <label for="demo-form-inline-checkbox5"></label>
                                       </td>
                                       <td>5</td>
                                       <td>BPTS</td>
                                       <td>--</td>
                                       <td>Department</td>
                                       <td>13-Feb-2018</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip" title="" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                          <a class="btn btn-danger btn-sm" data-toggle="tooltip" title="" data-original-title="Delete"><i class="icon-trash-21"></i></a>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td> <input id="demo-form-inline-checkbox6" class="magic-checkbox" type="checkbox">
                                          <label for="demo-form-inline-checkbox6"></label>
                                       </td>
                                       <td>6</td>
                                       <td>BPCL</td>
                                       <td>--</td>
                                       <td>Department</td>
                                       <td>13-Feb-2018</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip" title="" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                          <a class="btn btn-danger btn-sm" data-toggle="tooltip" title="" data-original-title="Delete"><i class="icon-trash-21"></i></a>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
      </div>
    </div>
  </div>
</div>                
                          
   

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <p>Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.
       Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.</p>
      </div>
    </div>
  </div>
</div>           
                 

                          <div class="clearfix"></div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         
         <!-- Map Modal -->
  <div class="modal fade" id="mapModal"  role="dialog">
    <div class="modal-dialog mapmodal">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">

          <h4 class="modal-title">Click on anywhere on map to change latitude & longitude</h4>
        </div>
        
        <div class="modal-body">
        	<div id='map' style='height:450px;'>
        	</div>
                          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <script>
  /*GIS SCRIPT WRITTEN BY : TARUN KUMAR MEHER*/
  //creating scalelinecontrol object
    var scaleLineControl = new ol.control.ScaleLine();


	
  	//initializing raster layer
    var raster = new ol.layer.Tile({ 
        source: new ol.source.OSM()
    });



  	
    //Initializing map
    var map = new ol.Map({
        layers: [raster], 
        controls: ol.control.defaults().extend([scaleLineControl]),  
        //overlays: [overlay],         
        target: 'map',           
        view: new ol.View({
            center: ol.proj.transform([40.4897, 9.1450], "EPSG:4326", "EPSG:3857"),
            zoom:5,
            minZoom:5
        })
    });

    $('#mapModal').on('hidden.bs.modal', function () {
  	  map.removeLayer(markerLayer);
    });

	var markerLayer;
    $('#mapModal').on('shown.bs.modal', function () {
    	  map.updateSize();
    	  var longitude=$("#longitudeId").val();
    	  var latitude=$("#latitudeId").val();
    	  setTimeout(function(){
    		  var markerFeature = new ol.Feature(new ol.geom.Point(ol.proj.transform([parseFloat(longitude),parseFloat(latitude)], 'EPSG:4326', 'EPSG:3857')));

    		  markerLayer = new ol.layer.Vector({
    		        source: new ol.source.Vector({
    		          features: [markerFeature]
    		        }),
    		        style: new ol.style.Style({
    		            image: new ol.style.Icon(/** @type {olx.style.IconOptions} */ ({
    		                crossOrigin: 'anonymous',
    		                src: 'wrsis/images/marker2.png',
                            scale :0.06
    		              }))
    		            })
    		      });

		      map.addLayer(markerLayer)

        	  
        	  map.getView().animate({
					center:ol.proj.transform([parseFloat(longitude),parseFloat(latitude)], "EPSG:4326", "EPSG:3857"),
					zoom:9,
					duration:2000
        		});
    	  },1000);
   	});

   	map.on('singleclick', function(e){
		var coordinate = ol.proj.toLonLat(e.coordinate);
		var markerTempFeature = new ol.Feature(new ol.geom.Point(ol.proj.transform([coordinate[0],coordinate[1]], 'EPSG:4326', 'EPSG:3857')));
   	   	var markerTempSource = new ol.source.Vector({
   	   	   	features:[markerTempFeature]
	   	});
	   	markerLayer.setSource(null);
	   	markerLayer.setSource(markerTempSource);
		$("#longitudeId").val(coordinate[0]);
  	    $("#latitudeId").val(coordinate[1]);

  	    $("#decimal").prop("checked",true);
  	    
    });
  </script>






 

<script>
       //Written By Rakesh Sahoo
       $(document).ready(function()
    		   {
    	// Contacted with farmer by Raman Shrestha
       	var contact = $('input:radio[name="farmert"]');
       	if($('input[name=farmert]:checked').val()=='yes')
           	{
           	$("#plantingDate").prop('disabled',false);
      			$("#plantingDate").val('');
      			$("#tilleringdate").prop('disabled',false);
      			$("#tilleringdate").val('');
      			$("#observationId").prop('disabled',false);
      			$("#observationId").val('');
           }else{
           	$("#plantingDate").prop('disabled',true);
      			$("#plantingDate").val('');
      			$("#tilleringdate").prop('disabled',true);
      			$("#tilleringdate").val('');
      			$("#observationId").prop('disabled',true);
      			$("#observationId").val('');
               }
       	contact.change(
       function(){
           if (this.checked && this.value=='yes') {
           	$("#plantingDate").prop('disabled',false);
      			$("#plantingDate").val('');
      			$("#tilleringdate").prop('disabled',false);
      			$("#tilleringdate").val('');
      			$("#observationId").prop('disabled',false);
      			$("#observationId").val('');
      			
           }else{
           	$("#plantingDate").prop('disabled',true);
      			$("#plantingDate").val('');
      			$("#tilleringdate").prop('disabled',true);
      			$("#tilleringdate").val('');
      			$("#observationId").prop('disabled',true);
      			$("#observationId").val('');
               }
       });
    	   // variety onchange
    	   $("#varity").change(function()
    			   {
    		   		var selText = $("#varity :selected").text();
    		   		if(selText.trim().toLowerCase() == 'other')
    		   			{
    		   			$("#othervariety").prop('disabled',false);
    		   			$("#othervariety").val('');
    		   			}
    		   		else
    		   			{
    		   			$("#othervariety").prop('disabled',true);
    		   			$("#othervariety").val('');
    		   			}
    			   });

  //wheat type change
		   
		   $("#wheatType").change(function()
    			   {
    		   		var selText = $("#wheatType :selected").text();
    		   		if(selText.trim().toLowerCase() == 'other')
    		   			{
    		   			$("#otherwheat").prop('disabled',false);
    		   			$("#otherwheat").val('');
    		   			}
    		   		else
    		   			{
    		   			$("#otherwheat").prop('disabled',true);
    		   			$("#otherwheat").val('');
    		   			}
    			   });
    	   
    	   $("#fungiUsed").change(function()
    			   {
    		   		var selText = $("#fungiUsed :selected").text();
    		   		if(selText.trim().toLowerCase() == 'other')
    		   			{
    		   			$("#otherfungi").prop('disabled',false);
    		   			$("#otherfungi").val('');
    		   			}
    		   		else
    		   			{
    		   			$("#otherfungi").prop('disabled',true);
    		   			$("#otherfungi").val('');
    		   			}
    			   });
    	   
    	   $('#surveyDateId').change(function()
    			   {
    		   
    		   		var date = new Date($(this).val());
    		   		var month = date.getMonth()+1;
    		   		var check = false;
    		   		
    		   		$("#seasonId option").each(function()
    		   				{
    		   			
    		   			var mont = $(this).attr('months');
    		   			var val_ = $(this).val();
    		   			 if(mont != undefined)
    		   				 {
    		   				 mont = JSON.parse(atob(mont));
    		   				 
    		   				 for(i=0;i<mont.length;i++)
    		   					 {
    		   					 if(check == false)
    		   						 {
    		   					 	if(mont[i] == month)
    		   					 		{
    		   					 		$("#seasonId").val(val_);
    		   					 	check = true;
    		   					 		}
    		   					 	else
    		   					 		{
    		   					 	$("#seasonId").val("-1");
    		   					 		}
    		   						 }
    		   					 }
    		   				 
    		   				 }
    		   				});
    		   		
    		   
    			   });
    	   
    	   
    	   $("#clearimage").click(function()
    			   {
    		   $("#mimage").val('');
    		   $("#clearimage").hide();
    			   });
    	   
    	   var val_ = 0;
	   		 
	   		
  	   	 var dataString = 'rustTypeId='+ val_;
			 $.ajax({
			 	type: "POST",
	            url : 'getReactionList',
	            data: dataString,
				cache: false,
				async:false,
	            success : function(data) {  	
                  var html = '<option value="-1">-Select -</option>';
					var len = data.length;
				if (data.length != 0 ){
					for ( var i = 0; i < len; i++) {
					
						html += '<option value="' + data[i].intRustReactionId + '">'
								+ data[i].vchDesc + '</option>';
					}
	           	    $('#reactionId').html(html); 
				}else{
				 var html = '<option value="-1">-Select -</option>';
				 $('#reactionId').html(html); 
				}
					  
	            },
				  error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
	        });
			 
    	   
    	   $("#btnBack").click(function(){
    			 
    			window.location.href="pendingsurvey";
    		});
    	   $("#btnBack1").click(function(){
    			 
    			 
    		});

    	   
    	   
    	   
    	   	
    	   	
    	   	
    		$("#regionId").change(function()
    	   			{
    	   		
    	   		var val_ = $(this).val();
    	   		 
    	   		
    	   	 var dataString = 'parentId='+ val_;
			 $.ajax({
			 	type: "POST",
	            url : 'getDemographicListZone',
	            data: dataString,
	            async:false,
				cache: false,
	            success : function(data) {  
	            	$("#zoneId").val("-1");
	            	$("#zoneId").find('option').not(':first').remove();
	            	$("#woredaId").val("-1");
	            	$("#woredaId").find('option').not(':first').remove();
	            	$("#kebeleId").val("-1");
	            	
	            	$("#kebeleId").find('option').not(':first').remove();
                    var html = '<option value="-1">--Select--</option>';
					var len = data.length;
				if (data.length != 0 ){
					for ( var i = 0; i < len; i++) {
					
						html += '<option value="' + data[i][0] + '">'
								+ data[i][1] + '</option>';
					}
	           	    $('#zoneId').html(html); 
				}else{
				 var html = '<option value="-1">-Select -</option>';
				 $('#zoneId').html(html); 
				}
					  
	            },
				  error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
	        });
    	   			});	
    		
    		
    		
    		
    		$("#zoneId").change(function()
    	   			{
    	   		
    	   		var val_ = $(this).val();
    	   		
    	   	 var dataString = {"regionId": $('#regionId').val(),"zoneId": val_};
			 $.ajax({
			 	type: "POST",
	            url : 'getDemographicListWoreda',
	            data: btoa(JSON.stringify(dataString)),
	            contentType: "text/xml", 
				cache: false,
				async:false,
	            success : function(data) {  	
	            	$("#woredaId").val("-1");
	            	$("#woredaId").find('option').not(':first').remove();
	            	$("#kebeleId").val("-1");
	            	$("#kebeleId").find('option').not(':first').remove();
                    var html = '<option value="-1">--Select--</option>';
					var len = data.length;
				if (data.length != 0 ){
					for ( var i = 0; i < len; i++) {
					
						html += '<option value="' + data[i][0] + '">'
								+ data[i][1] + '</option>';
					}
	           	    $('#woredaId').html(html); 
				}else{
				 var html = '<option value="-1">--Select--</option>';
				 $('#woredaId').html(html); 
				}
					  
	            },
				  error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
	        });
    	   			});	
    		
    		
    		
    		//kebel change
    		 
    		
    		
    		$("#woredaId").change(function()
    	   			{
    	   		
    	   		var val_ = $(this).val();
    	   		var selectedText = $("#woredaId option:selected").html();
    	   		 
    	   		
    	   	 var dataString = {"regionId": $('#regionId').val(),"woredaId": val_,"zoneId":$("#zoneId").val()};
			 $.ajax({
			 	type: "POST",
	            url : 'getDemographicListKebele',
	            data: btoa(JSON.stringify(dataString)),
	            contentType: "text/xml", 
				cache: false,
				async:false,
	            success : function(data) {
	            	$("#kebeleId").val("-1");
	            	$("#kebeleId").find('option').not(':first').remove();
                    var html = '<option value="-1">--Select--</option>';
					var len = data.length;
				if (data.length != 0 ){
					for ( var i = 0; i < len; i++) {
					
						html += '<option value="' + data[i].demographyId + '">'
								+ data[i].demographyName + '</option>';
					}
	           	    $('#kebeleId').html(html); 
				}else{
				 var html = '<option value="-1">--Select--</option>';
				 $('#kebeleId').html(html); 
				}
					  
	            },
				  error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
	        });
    	   			});	
    		
    		
    		
    		
    		
    		
    		
    	   
    		   });
       
       
       </script>
         
         
         
         
<script>
	$(function(){

		   $(".selectall").click(function(){
			$(".individual").prop("checked",$(this).prop("checked"));
			});
		   
		   $(".selectall1").click(function(){
			   var loginUserId = '${UserId}';
				$(".individual1").not("#check_surveyor_"+loginUserId).prop("checked",$(this).prop("checked"));
				});
		
		
	});
</script>


<script>
$(document).ready(function(){
	
	$("#clearimage").hide()
	$("#mimage").change(function(){
	        if ($('#mimage')[0].files.length === 0) { 
	     	   $("#clearimage").hide()
	     	   
	        } else { 
	     	  $("#clearimage").show() 
	     	  
	        }   
		   });
	// Alert Modal Type
	$(document).on('click', '#success', function(e) {
		swal(
			'Success',
			'You clicked the <b style="color:green;">Success</b> button!',
			'success'
		)
	});

	$(document).on('click', '#error', function(e) {
		swal(
			'Error!',
			'You clicked the <b style="color:red;">error</b> button!',
			'error'
		)
	});

	$(document).on('click', '#warning', function(e) {
		swal(
			'Warning!',
			'You clicked the <b style="color:coral;">warning</b> button!',
			'warning'
		)
	});

	$(document).on('click', '#info', function(e) {
		swal(
			'Info!',
			'You clicked the <b style="color:cornflowerblue;">info</b> button!',
			'info'
		)
	});

	$(document).on('click', '#question', function(e) {
		swal(
			'Question!',
			'You clicked the <b style="color:grey;">question</b> button!',
			'question'
		)
	});

// Alert With Custom Icon and Background Image
	$(document).on('click', '#icon', function(event) {
		swal({
			title: 'Custom icon!',
			text: 'Alert with a custom image.',
			imageUrl: 'https://image.shutterstock.com/z/stock-vector--exclamation-mark-exclamation-mark-hazard-warning-symbol-flat-design-style-vector-eps-444778462.jpg',
			imageWidth: 200,
			imageHeight: 200,
			imageAlt: 'Custom image',
			animation: false
		})
	});

	$(document).on('click', '#image', function(event) {
		swal({
			title: 'Custom background image, width and padding.',
			width: 700,
			padding: 150,
			background: '#fff url(https://image.shutterstock.com/z/stock-vector--exclamation-mark-exclamation-mark-hazard-warning-symbol-flat-design-style-vector-eps-444778462.jpg)'
		})
	});

// Alert With Input Type
	$(document).on('click', '#subscribe', function(e) {
		swal({
		  title: 'Submit email to subscribe',
		  input: 'email',
		  inputPlaceholder: 'Example@email.xxx',
		  showCancelButton: true,
		  confirmButtonText: 'Submit',
		  showLoaderOnConfirm: true,
		  preConfirm: (email) => {
		    return new Promise((resolve) => {
		      setTimeout(() => {
		        if (email === 'example@email.com') {
		          swal.showValidationError(
		            'This email is already taken.'
		          )
		        }
		        resolve()
		      }, 2000)
		    })
		  },
		  allowOutsideClick: false
		}).then((result) => {
		  if (result.value) {
		    swal({
		      type: 'success',
		      title: 'Thank you for subscribe!',
		      html: 'Submitted email: ' + result.value
		    })
		  }
		})
	});

	// Alert Redirect to Another Link
	$(document).on('click', '#btnSubmitId', function(e) {
	    
 
		// surveyor information
		
		
		var surveyorJsa = new Array();
		
		$('.individual1').each(function(){
			var chkStatus = $(this).prop("checked");
			if(chkStatus == true)
				{
				var institutionName = $("#institutionName").val();
				var country = $("#country").val();
				var json = {"researchId":institutionName,"InstitutionName":$("#institutionName :selected").text(),"userId": $(this).val(),"country":country,"CountryName":$("#country :selected").text(),"surveyorName":$("#check_val_"+$(this).val()).html()};
				surveyorJsa.push(json);
				}
		});
		
		if(surveyorJsa.length ==0 )
			{
			swal(
					'Error!',
					'Please select at least one surveyor.',
					'error'
				)
			return  false;
			}
		
		//othersurveyor
		var othersurveyor = $("#othersurveyor").val();
 	//survey details
 	
 	
 	var contactedFarmerId = $("#contactedFarmerId").prop("checked");
	var plantingDate = $("#plantingDate").val();
	var tilleringdate = $("#tilleringdate").val();
	if(plantingDate == '')
		{
		plantingDate = ' ';
		}
	var latitudeId = $("#latitudeId").val();
	var altitudeId= $("#altitudeId").val();
	var woredaId= $("#woredaId").val();
	var regionId= $("#regionId").val();
	var surveyDateId= $("#surveyDateId").val();
	
	 
	
	var observationId= $("#observationId").val();
	if(observationId == '')
	{
		observationId = ' ';
	}
	
	var longitudeId= $("#longitudeId").val();
	var kebeleId= $("#kebeleId").val();
	var zoneId= $("#zoneId").val();
	var seasonId= $("#seasonId").val();
	var rustAffectedId= $("#rustAffectedId").prop("checked"); 
	var sampleCollectedId= $("#sampleCollectedId").prop("checked");
	var capturedImageId= $("#capturedImageId").prop("checked");
	var fungisideId= $("#fungisideId").prop("checked");
	if(fungisideId == false)
		{
		var unknownfungicide = $("#unknownfungicide").prop("checked");
		if(unknownfungicide == true)
			{
			fungisideId = null;
			}
		else
			{
			fungisideId = false;
			}
		}
	var remark = $("#remark").val();
	
	

	if(seasonId == -1)
	{
			$("#seasonId").focus();
		swal(
				'Error!',
				'Please select season.',
				'error'
			)
	return false;
	}
	if(regionId == -1)
	{
		$("#regionId").focus();
		swal(
				'Error!',
				'Please select region.',
				'error'
			)
	return false;
	}
	
	if(zoneId == -1)
		{
		$("#zoneId").focus();
		swal(
				'Error!',
				'Please select zone.',
				'error'
			)
		return false;
		}
	
	if(woredaId == -1)
	{
		$("#woredaId").focus();
		swal(
				'Error!',
				'Please select woreda.',
				'error'
			)
	return false;
	}
	
	if(kebeleId == -1)
	{
		$("#kebeleId").focus();
		swal(
				'Error!',
				'Please select kebele.',
				'error'
			)
	return false;
	}
	
	if(altitudeId.trim() == "")
		{
		$("#altitudeId").focus();
		swal(
				'Error!',
				'Please enter altitude.',
				'error'
			)
		return false;
		}
	 
	var m = altitudeId.match(/^\d{0,4}(?:\.\d{0,1}){0,1}$/);
	if(!m)
		{
		$("#altitudeId").focus();
		swal(
				'Error!',
				'Altitude accepts only decimal values.Accept 1 digit after decimal.',
				'error'
			)
		return false;
		}
	
	
	if(longitudeId.trim() == '')
		{
		$("#longitudeId").focus();
		swal(
				'Error!',
				'Longitude should not be blank',
				'error'
			)
		return false;
		}
	
	if(latitudeId.trim() == '')
	{
	$("#latitudeId").focus();
	swal(
			'Error!',
			'Latitude should not be blank',
			'error'
		)
	return false;
	}

	// decimal validation
	// latitude and longitude validation
	var decimal = $("#decimal").prop("checked");
	if(decimal == true)
	{
	// decimal validation
	if( !(longitudeId.match(/^[-+]?[0-9]{1,4}(\.[0-9]{6,15})?$/))) {
		$("#longitudeId").focus();
		swal(
				'Error!',
				'Invalid Longitude(Decimal).Accepts minimum 6 digits after decimal.',
				'error'
			)
		return false;
	}  
 
	if( !(latitudeId.match(/^[-+]?[0-9]{1,4}(\.[0-9]{6,15})?$/)))
		{
		$("#latitudeId").focus();
		swal(
				'Error!',
				'Invalid Latitude(Decimal).Accepts minimum 6 digits after decimal.',
				'error'
			)
		return false;
		}
	
	}
else
	{
	// degree validation
	if( !(longitudeId.match(/^[-+]?[0-9]{2,3}(\.[0-9]{2,2}\.[0-9]{2,2})?$/) )) 
		{
		
		$("#longitudeId").focus();
		swal(
				'Error!',
				'Invalid Longitude(Degree).',
				'error'
			)
		return false;
		}
	if( !(latitudeId.match(/^[-+]?[0-9]{2,3}(\.[0-9]{2,2}\.[0-9]{2,2})?$/) ))
		{
		$("#latitudeId").focus();
		swal(
				'Error!',
				'Invalid Latitude(Degree).',
				'error'
			)
		return false;
		}
	}


 
	
	if(surveyDateId.trim() == '')
		{
		$("#surveyDateId").focus();
		
		swal(
				'Error!',
				'Please select survey date.',
				'error'
			)
		return false;
		}
	
	
	
	// check season and survey date
	var date1 = new Date(surveyDateId);
	var month1 = date1.getMonth()+1;
	var check1 = false;
	var actSeason;
	$("#seasonId option").each(function()
			{
		
		var mont1 = $(this).attr('months');
		var val_1 = $(this).val();
		 if(mont1 != undefined)
			 {
			 mont1 = JSON.parse(atob(mont1));
			 
			 for(i=0;i<mont1.length;i++)
				 {
				 if(check1 == false)
					 {
				 	if(mont1[i] == month1)
				 		{
				 	actSeason = val_1;
				 	check1 = true;
				 		}
				 	 
					 }
				 }
			 
			 }
			});
	
	if(actSeason != seasonId)
		{
		$("#seasonId").focus();
		 swal("Error", " Please select the appropiate season for given survey date.", "error");
		 return false;
		}
	
	
	// rust observation date validation
	
	if(observationId.trim() != '' && surveyDateId.trim() != '')
		{
			// 1.date of survey>=date of first rust observation		2.Proper alert message should display  In case of deviation
			
	 if(!(Date.parse(surveyDateId) >= Date.parse(observationId))){
		        	 $("#observationId").focus();
		    	  swal("Error", " Survey date  should not be less than Date of first Rust Observation.", "error");
		            return false;
		    	}
		}
	
	

	if(plantingDate.trim() != '' && surveyDateId.trim() != '')
	{
		 
		
 if(!(Date.parse(surveyDateId) > Date.parse(plantingDate))){
	        	 $("#plantingDate").focus();
	    	  swal("Error", " Survey Date  should not be less  or equal to Planting date.", "error");
	            return false;
	    	}
	}

	if(plantingDate.trim() != '' && tilleringdate.trim() != '')
	{
		 
		
 if(!(Date.parse(tilleringdate) > Date.parse(plantingDate))){
	        	 $("#plantingDate").focus();
	    	  swal("Error", "Tillering Date  should not be less  or equal to Planting date.", "error");
	            return false;
	    	}
	}
	
	
	if(plantingDate.trim() != '' && observationId.trim() != '')
		{
			 
			
	 if(!(Date.parse(observationId) > Date.parse(plantingDate))){
		        	 $("#observationId").focus();
		    	  swal("Error", " Date of first Rust Observation  should not be less than Planting date.", "error");
		            return false;
		    	}
		}
	
	
	
	
	
	
	//site information
	
	var growthStage = $("#growthStage").val(); 
	var wheatType = $("#wheatType").val(); 
	var siteArea = $("#siteArea").val(); 
	
	
	
	var varity = $("#varity").val(); 
	if(varity == -1 || varity == "-1")
		{
		$("#varity").focus();
		
		swal(
				'Error!',
				'Please select variety.',
				'error'
			)
		return false;
		}
	var vselText = $("#varity :selected").text();
	if(vselText.trim().toLowerCase() == 'other')
		{
		var oV = $("#othervariety").val();
		vselText =oV;
		if(oV.trim() == '')
			{
			$("#othervariety").focus();
			
			swal(
					'Error!',
					'Other variety should not be blank..',
					'error'
				)
			return false;
			}
		}
	var wselText = $("#wheatType :selected").text();
	if(wselText.trim().toLowerCase() == 'other')
		{
		var oW = $("#otherwheat").val();
		wselText =oW;
		if(oW.trim() == '')
			{
			$("#otherwheat").focus();
			
			swal(
					'Error!',
					'Other Wheat should not be blank..',
					'error'
				)
			return false;
			}
		}
	
	if(siteArea.trim() != '')
	{
	if(siteArea.includes("-"))
		{
	$("#siteArea").focus();
	  swal("Error", "Please provide valid site area.", "error");
      return false;
		}
	
	if(siteArea > 9999)
	{
$("#siteArea").focus();
  swal("Error", "Site area should not exceed 9999.", "error");
  return false;
	}
	
	}
	
var area = $("#siteArea").val();
	
	 
try
{
	if(area.trim() != "" && area.trim().length  > 10)
		{
	var temp = parseFloat(area);
	if(isNaN(temp))
		{
		$("#siteArea").focus();
		swal(
				'Error!',
				'Please enter valid site Area.Area accepts only 10 digits.',
				'error'
			)
		return false;
		}
		}
}
catch(e)
{
	$("#siteArea").focus();
	swal(
			'Error!',
			'Please enter valid site Area.Area accepts only 10 digits.',
			'error'
		) 
	return false;
}


	var surveySite = $("#surveySite").val(); 
	
	var siteInformation = {"growthStage":growthStage,
			"wheatType":wheatType,
			"siteArea":siteArea,
			"varity":varity,
			"OtherVariety":$("#othervariety").val(),
			"OtherWheat":$("#otherwheat").val(),
			"surveySite":surveySite,
			"SurveySiteName":$("#surveySite :selected").text(),		
			"WheatTypeName":$("#wheatType :selected").text(),		
			"VarityName":vselText,		
			"WheatName":wselText,
			"GrowthStageName":$("#growthStage :selected").text()		
	};
	
	
	if(rustAffectedId == true)
		{
	if(rustDetails.length == 0)
		{
		$("#rustTypeId").focus();
		swal(
				'Error!',
				'Please provide at least 1 rust details.',
				'error'
			) 
		return false;
		}
	}
	if(rustAffectedId == true && sampleCollectedId == true)
		{
	if(sampleDetails.length == 0)
	{
		$("#sampleTypeId").focus();
		swal(
				'Error!',
				'Please provide at least 1 sample details.',
				'error'
			) 
	return false;
	}
		}
	if(rustAffectedId == true && capturedImageId== true)
	{
		var table = document.getElementById("imgTable");
		  
	     var rowCount = table.rows.length;
	     if(rowCount>0)
	    	 {
	    	 if(rowCount == 6)
	    		 {
	    		 swal(
	     				'Error!',
	     				'You can upload only 5 images.',
	     				'error'
	     			) 
	    		 return false;
	    		 }
	     for(i=0;i<rowCount;i++)
	    	 {
	    	 	var chld = table.rows[i].cells[0].children[0];
	    	 	if(${SurveyId}==0){
	    	 	if(chld.value == '')
	    	 		{
	    	 		swal(
	        				'Error!',
	        				'Please provide an image.',
	        				'error'
	        			) 
	    	 		return false;
	    	 		}
	    	 	else
	    	 		{
	    	 		FileUploadPath = chld.value;
	    	 		var Extension = FileUploadPath.substring(
	                        FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

	    //The file uploaded is an image

	    if ( Extension == "png"  
	                        || Extension == "jpeg" || Extension == "jpg") {
	    	
	   
	    	
	    }
	    else
	    	{
	    	swal(
					'Error!',
					'Captured image only allows file types of  PNG, JPEG, JPG ',
					'error'
				) 
				return false;
	    	}
	    
	  
	     var filesize = ((chld.files[0].size/1024)/1024).toFixed(4); 
	     if(filesize > 2.0)
	    	 {
	    	 swal(
	 				'Error!',
	 				'Captured image size should not exceed 2MB. ',
	 				'error'
	 			) 
	 			return false;
	    	 }
	  
	    
	    
	    	 		
	    	 		}	}
	    	 }
	    	 }
	}
	
	// Survey other details
	
	var irrigated = $("#irrigated").prop("checked");
	var weedcontrol = $("#weedcontrol").prop("checked");
	var soilColor = $("#soilColor").val(); 
	var moisture = $("#moisture").val(); 
	var otherDetails = {"irrigated":irrigated,"weedcontrol":weedcontrol,"soilColor":soilColor,"moisture":moisture,"SoilName":$("#soilColor :selected").text(),"MoistureName":$("#moisture :selected").text()};
	
	
	
	
	//  other diseases details
	
	//otherDisease in this array it stores
	
	// Any other disease
	var anyOtherDiseaseJsa = new Array();
	
	$('.individual').each(function(){
		var chkStatus = $(this).prop("checked");
		if(chkStatus == true)
			{
			var json = {"diseaseId":$(this).val(),"DiseaseName":$("#check_val1_"+$(this).val()).html()};
			anyOtherDiseaseJsa.push(json);
			}
	});
	
	// Rust details 
	//rustDetails array
	//sampleDetails sample details	
	
	// fungicide 
	
	var fungiUsed = $("#fungiUsed").val();
	
	var dose = $("#dose").val();
	var fungiName = $("#fungiUsed :selected").text();
	if(fungiName.trim() == 'other')
		{
		var ofungi = $("#otherfungi").val();
		fungiName = ofungi;
		if(ofungi.trim() == '')
		{
			 $("#otherfungi").focus();
	    	  swal("Error", "Other fungicide used should not be blank.", "error");
	            return false;
		}
		}
	 
		
		
	var sprayDate = $("#sprayDate").val();
	
	
	
	
	if(plantingDate.trim() != '' && sprayDate.trim() != ''){
		
		if(!(Date.parse(sprayDate) > Date.parse(plantingDate))){
	        	 $("#sprayDate").focus();
	    	  swal("Error", "Spray date  should not be less or equal to Planting date.", "error");
	            return false;
	    	}
		
	}
	
	if(sprayDate.trim() != '' & surveyDateId.trim() != ''){
		
		if(!(Date.parse(surveyDateId) >= Date.parse(sprayDate))){
	        	 $("#sprayDate").focus();
	    	  swal("Error", "Survey date  should not be less than Spray date.", "error");
	            return false;
	    	}
		
	}
	var effectiveness = $("#effectiveness").val();
	 
	var fungicideJson = {"OtherFungi":$("#otherfungi").val(),"fungiUsed":fungiUsed,"dose":dose,"sprayDate":sprayDate,"effectiveness":effectiveness,"FungicideName":fungiName,"EffectiveNessName":$("#effectiveness :selected").text()};
	// add all the keys in json object, this object hold the survey details
	var selectedText = $("#woredaId option:selected").html();
	var selectedTextKeb = $("#kebeleId option:selected").html();
	var wroredakebeladdr = '';
    if(selectedText.trim().toLowerCase() == 'other' || selectedTextKeb.trim().toLowerCase() == 'other')
    	{
    	if($("#kebelworedaaddr").val().trim() == '')
    		{
    		 $("#kebelworedaaddr").focus();
	    	  swal("Error", "Location details should not be blank.", "error");
	            return false;
    		//wroredakebeladdr
    		}
    	}
	
	var finalJson  = {"contactedFarmerId":contactedFarmerId,
			"plantingDate":plantingDate,
			"latitudeId":latitudeId,
			"altitudeId":altitudeId,
			"decimaldegree":decimal,
			"woredaId":woredaId,
			"regionId":regionId,
			"observationId":observationId,
			"tilleringdate":tilleringdate,
			"surveyDateId":surveyDateId,
			"longitudeId":longitudeId,
			"kebeleId":kebeleId,
			"zoneId":zoneId,
			"kebelworedaaddr":$("#kebelworedaaddr").val(),
			"seasonId":seasonId,
			"rustAffectedId":rustAffectedId,
			"sampleCollectedId":sampleCollectedId,
			"capturedImageId":capturedImageId,
			"fungisideId":fungisideId,
			"remark":remark,
			"siteInformation":siteInformation,
			"otherDetails":otherDetails,
			"othersurveyor":othersurveyor,
			"surveyorJsa":surveyorJsa,
			"otherDisease":otherDisease,
			"anyOtherDiseaseJsa":anyOtherDiseaseJsa,
			"rustDetails":rustDetails,
			"sampleDetails":sampleDetails,
			"fungicideJson":fungicideJson,
			"SeasionName":$("#seasonId :selected").text(),
			"RegionName":$("#regionId :selected").text(),
			"ZoneName":$("#zoneId :selected").text(),
			"WoredaName":$("#woredaId :selected").text(),
			"KebeleName":$("#kebeleId :selected").text()
			}; //final json to be send to server
			
			console.log(JSON.stringify(finalJson));
			var dataString = btoa(JSON.stringify(finalJson));
			 var message = ('${SurveyId}' != 0 || '${SurveyId}' != '0')?'update ?' : 'submit ?';
			
			swal({
				title: "Do you want to "+message, 
				//text: "You will be redirected to https://utopian.io", 
				type: "warning",
				confirmButtonText: "Yes",
				showCancelButton: true,
				cancelButtonText: "No",
		    })
		    	.then((result) => {
					if (result.value) {
						 
							     $("#encodedata").val(dataString);
								$("#surveyId").val('${SurveyId}');
								$("#myForm").submit(); 
			
						
					} 
				})
			
	 
 
 
		
	});
	
});
</script>

<script>
$(document).ready(function(){



/*
	Dropdown with Multiple checkbox select with jQuery - May 27, 2013
	(c) 2013 @ElmahdiMahmoud
	license: https://www.opensource.org/licenses/mit-license.php
*/

$(".dropdown dt a").on('click', function() {
  $(".dropdown dd ul").slideToggle('fast');
});

$(".dropdown dd ul li a").on('click', function() {
  $(".dropdown dd ul").hide();
});

function getSelectedValue(id) {
  return $("#" + id).find("dt a span.value").html();
}

$(document).bind('click', function(e) {
  var $clicked = $(e.target);
  if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
});

$('.mutliSelect input[type="checkbox"]').on('click', function() {

  var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
    title = $(this).val() + ",";

  if ($(this).is(':checked')) {
    var html = '<span title="' + title + '">' + title + '</span>';
    $('.multiSel').append(html);
    $(".hida").hide();
  } else {
    $('span[title="' + title + '"]').remove();
    var ret = $(".hida");
    $('.dropdown dt a').append(ret);

  }
});




});


function checkLatLongDecimal(data)
{
	data = data.trim();
	var arr = data.split('.');
	if(arr.length > 2 || arr.length <2)
		{
		return false;
		}
	var farr = arr[0];
	var sarr = arr[1];
	if(farr.length > 4 || farr.length < 1 || sarr.length < 6 || sarr.length > 15 || (isNaN(farr) != false) || (isNaN(sarr) != false))
		{
		
		return false
		}
	return true;
}
function checkLatLongDegree(data)
{
		

	data = data.trim();
	var arr = data.split('.');
	if(arr.length > 3 || arr.length <3)
		{
		return false;
		}
	var farr = arr[0];
	var sarr = arr[1];
	var tarr = arr[2];
	if(tarr.length > 2 || tarr.length < 2 || (isNaN(tarr) != false) || farr.length > 2 || farr.length < 2 || sarr.length < 2 || sarr.length > 2 || (isNaN(farr) != false) || (isNaN(sarr) != false))
		{
		
		return false
		}
	return true;
	
}

</script>

<script>
$(document).ready(function(){

	// Events
	$('.dropdown-container')
		.on('click', '.dropdown-button', function() {
	        $(this).siblings('.dropdown-list').toggle();
		})
		.on('input', '.dropdown-search', function() {
	    	var target = $(this);
	        var dropdownList = target.closest('.dropdown-list');
	    	var search = target.val().toLowerCase();
	    
	    	if (!search) {
	            dropdownList.find('li').show();
	            return false;
	        }
	    
	    	dropdownList.find('li').each(function() {
	        	var text = $(this).text().toLowerCase();
	            var match = text.indexOf(search) > -1;
	            $(this).toggle(match);
	        });
		})
		.on('change', '[type="checkbox"]', function() {
			var attrId = $(this).attr("id");
	        var container = $(this).closest('.dropdown-container');
			if(attrId.includes("disease"))
				{
				container.find('.quantity').text("");
				}
	        var numChecked = container. find('[type="checkbox"]:checked').not(".nocheck").length;
	        if(numChecked > 4)
	        	{
	    	container.find('.quantity').text(numChecked || 'Any');
	        	}
	        else
	        	{
	        	var obj = container. find('[type="checkbox"]:checked').not(".nocheck");
	        	 
	        	var obj1 = obj[0];
	        	var text1 = $(obj1).attr("id");
	        	var val1 = (obj1 != null && obj1 != undefined && text1.split('_')[2] != null && text1.split('_')[2] != undefined) ? text1.split('_')[2]:"";
	        	
	        	var obj2 = obj[1];
	        	var text2 = $(obj2).attr("id");
	        	var val2 = ( obj2 != null && obj2 != undefined && text2.split('_')[2] != null && text2.split('_')[2] != undefined ) ? text2.split('_')[2] : "";
	        	
	        	var obj3 = obj[2];
	        	var text3 = $(obj3).attr("id");
	        	var val3 = ( obj3 != null && obj3 != undefined && text3.split('_')[2] != null && text3.split('_')[2] != undefined  ) ? text3.split('_')[2] :"" ;
	        	
	        	var obj4 = obj[3];
	        	var text4 = $(obj4).attr("id");
	        	var val4 = (obj4 != null && obj4 != undefined &&  text4.split('_')[2] != null &&  text4.split('_')[2] != undefined ) ?  text4.split('_')[2] : "";
	        	
	        	
	        	if(text1.includes("disease"))
	        		{
	        		
	        		var valu = "";
	        		if(val1 != undefined && val1 != null && val1.trim() != '')
	        			{
	        		valu += " , "+$("#check_val1_"+val1).html();
	        			}
	        		if(val2 != undefined && val2 != null  && val2.trim() != '')
        			{
	        		valu += " , "+$("#check_val1_"+val2).html();
        			}
	        		if(val3 != undefined && val3 != null  && val3.trim() != '')
        			{
	        		valu +=  " , "+$("#check_val1_"+val3).html();
        			}
	        		if(val4 != undefined && val4 != null  && val4.trim() != '')
        			{
	        		valu +=  " , "+$("#check_val1_"+val4).html();
        			}
	        		container.find('.quantity').text("");
	        		container.find('.quantity').text(valu.substring(2,valu.length));
	        		}
	        	else
	        		{
	        		var valu = "";
	        		if(val1 != undefined && val1 != null  && val1.trim() != '')
        			{
	        		valu += " , "+$("#check_val_"+val1).html();
        			}
	        		if(val2 != undefined && val2 != null  && val2.trim() != '')
        			{
	        		valu +=  " , "+$("#check_val_"+val2).html();
        			}
	        		if(val3 != undefined && val3 != null  && val3.trim() != '')
        			{
	        		valu +=  " , "+$("#check_val_"+val3).html();
        			}
	        		if(val4 != undefined && val4 != null  && val4.trim() != '')
        			{
	        		valu +=  " , "+$("#check_val_"+val4).html();
        			}
	        		container.find('.quantity').text("");
	        		container.find('.quantity').text(valu.substring(2,valu.length));
	        		}
	        	}
	      
	        
		});
	

	
	
	
	// JSON of States for demo purposes
	var usStates = [
	    { name: 'ALABAMA', abbreviation: 'AL'},
	    { name: 'ALASKA', abbreviation: 'AK'},
	    { name: 'AMERICAN SAMOA', abbreviation: 'AS'},
	    { name: 'ARIZONA', abbreviation: 'AZ'},
	    { name: 'ARKANSAS', abbreviation: 'AR'},
	    { name: 'CALIFORNIA', abbreviation: 'CA'},
	    { name: 'COLORADO', abbreviation: 'CO'},
	    { name: 'CONNECTICUT', abbreviation: 'CT'}
	];

	// <li> template
	var stateTemplate = _.template(
	    '<li>' +
	    	<%-- '<input name="<%= abbreviation %>" type="checkbox">' + --%>
	    	<%-- '<label for="<%= abbreviation %>"><%= capName %></label>' + --%>
	    '</li>'
	);

	// Populate list with states
	_.each(usStates, function(s) {
	    s.capName = _.startCase(s.name.toLowerCase());
	    $('ul').append(stateTemplate(s));
	});
	

});


</script>

<script>
$(document).ready(function(){
	
	 $("#rustDetailId").hide();
	 $("#dataTable").hide();
	 $("#sampleDetailId").hide();
	 $("#dataTable1").hide();
	 $("#hdnImgdiv").hide();
	 $("#fungicideDetailId").hide();
	 $("#dataTable4").hide();
	 
	 
	 $(".rustAffectyes").click(function(){
		  $("#rustDetailId").show();
		  $("#subMainDiv").hide();
	 });
		  
	 $(".rustAffectno").click(function(){
		 $("#subMainDiv").hide();
	    $("#rustDetailId").hide();
	    
	    
	    rustDetails = new Array();
	    $("#sampleDetailId").hide();
  		$("#subMainDiv1").hide();
	    sampleDetails = new Array();
	    $("#dataTable1").find("tr:gt(0)").remove();
	    $("#imgTable").find("tr:gt(0)").remove();
	    $("#fungiUsed").val('-1');
	    $("#sprayDate").val('');
	    $("#dose").val('');
	    $("#effectiveness").val('-1');
	    $(".sampleno").prop('checked',true);
	    $("#sampleDetailId").hide();
  		$("#subMainDiv1").hide();
  		clearData1();
  		clearData();
  		sampleDetails = new Array();
  		$("#dataTable1").find("tr:gt(0)").remove();
	     $("#dataTable").find("tr:gt(0)").remove();
	     
	     $("#imgTable").find("tr:gt(0)").remove();
	     $(".imgno").prop('checked',true);
	     $("#hdnImgdiv").hide();
		 $(document.getElementById("imgTable").rows[0].cells[0].children[0]).val('');
	 });
	
    $(".sampleno").click(function(){
  		 $("#sampleDetailId").hide();
  		$("#subMainDiv1").hide();
  		
  		sampleDetails = new Array();
  		$("#dataTable1").find("tr:gt(0)").remove();
    });
  
	  $(".sampleyes").click(function(){
		  $("#subMainDiv1").hide();
		  clearData1();
	  $("#sampleDetailId").show();
		  
	  });
  
  
 	  $(".fungino,.unknownfungicide").click(function(){
 		 $("#fungiUsed").val('-1');
 	    $("#sprayDate").val('');
 	    $("#dose").val('');
 	    $("#effectiveness").val('-1');
	  	 $("#fungicideDetailId").hide();
	  	 
	  });
	  
	  $(".fungiyes").click(function(){
	  	 $("#fungicideDetailId").show();
	  });
  
	  $(".imgno").click(function(){
		 $("#hdnImgdiv").hide();
		 
		 $("#imgTable").find("tr:gt(0)").remove();
		 $(document.getElementById("imgTable").rows[0].cells[0].children[0]).val('');
		 
	  });
		  
	 $(".imgyes").click(function(){
		 $("#hdnImgdiv").show();
	 });
	 
	/*  $("#btnSubmitId").click(function(){
		 
		 if(confirm("Do you want to Submit?")){
			window.location.href="confirmSurveyData.html";
		 }else{
		   return false;
		}
	}); */
	 
 
  
});
</script>

<script>
var rustDetails = [];
function addRow(tableID) {
	
	var v1=$('#rustTypeId').val();
	var vt1=$("#rustTypeId").val();
	//var vt1=$("#rustTypeId :selected").text();
	if(v1=='-1'){
		swal(
				'Error!',
				'Rust type should be selected.',
				'error'
			) 
		$("#rustTypeId").focus();
		return false;	
	}
	var v2=$('#incidentId').val();
    if(v2==''){
		$("#incidentId").focus();
    	swal(
				'Error!',
				'Incident Percentage should not left blank.',
				'error'
			) 
		return false;	
    }
    
 
	try
	{
		var temp = parseInt(v2);
		if(isNaN(temp))
			{
			$("#incidentId").focus();
			swal(
					'Error!',
					'Please enter valid Rust Incident Percentage.',
					'error'
				) 
			return false;
			}
		
		if(temp > 100)
			{
			$("#incidentId").focus();
			swal(
					'Error!',
					'Rust Incident Percentage should not exceed 100.',
					'error'
				) 
			return false;
			}
		
		if(temp < 0)
		{
			$("#incidentId").focus();
		swal(
				'Error!',
				'Rust Incident Percentage should not less than 0.',
				'error'
			) 
		return false;
		}
		
	}
	catch(e)
	{
		$("#incidentId").focus();
		swal(
				'Error!',
				'Please enter valid Rust Incident Percentage.',
				'error'
			) 
		return false;
	}
	
	
	

    var v3=$('#severityId').val();
    if(v3==''){
    	//swal("Variety Should be Selected");
    	swal(
				'Error!',
				'Severity Percentage should not left blank.',
				'error'
			) 
		$("#severityId").focus();
		return false;	
    }
    
    
    try
	{
		var temp = parseInt(v3);
		if(isNaN(temp))
			{
			$("#severityId").focus();
			swal(
					'Error!',
					'Please enter valid Rust Severity Percentage.',
					'error'
				) 
			return false;
			}
		if(temp > 100)
		{
			$("#severityId").focus();
			swal(
					'Error!',
					'Rust Severity Percentage should not exceed 100.',
					'error'
				) 
		return false;
		}
		
		if(temp < 0)
		{
			$("#severityId").focus();
		swal(
				'Error!',
				'Rust Severity Percentage should not less than 0.',
				'error'
			) 
		return false;
		}
		
		
	}
	catch(e)
	{
		$("#severityId").focus();
		swal(
				'Error!',
				'Please provide valid Rust Severity Percentage.',
				'error'
			) 
		return false;
	}
	
	
	
	
    
    var v4=$('#reactionId').val();
	var vt4=$("#reactionId :selected").text();
	if(v4=='-1'){
		swal(
				'Error!',
				'Please select reaction.',
				'error'
			) 
		$("#reactionId").focus();
		return false;	
	}
    
// Add Debendra 
    
    if(v1 == 3){
    	
	var v7=$('#headIncidentId').val();
    if(v7==''){
		$("#headIncidentId").focus();
    	swal(
				'Error!',
				'Head Incident Percentage should not left blank.',
				'error'
			) 
		return false;	
    }
    
 
	try
	{
		var temp = parseInt(v7);
		if(isNaN(temp))
			{
			$("#headIncidentId").focus();
			swal(
					'Error!',
					'Please enter valid Rust Head Incident Percentage.',
					'error'
				) 
			return false;
			}
		
		if(temp > 100)
			{
			$("#headIncidentId").focus();
			swal(
					'Error!',
					'Rust Head Incident Percentage should not exceed 100.',
					'error'
				) 
			return false;
			}
		
		if(temp < 0)
		{
			$("#headIncidentId").focus();
		swal(
				'Error!',
				'Rust Head Incident Percentage should not less than 0.',
				'error'
			) 
		return false;
		}
		
	}
	catch(e)
	{
		$("#headIncidentId").focus();
		swal(
				'Error!',
				'Please enter valid Rust Head Incident Percentage.',
				'error'
			) 
		return false;
	}
	
	
	var v8=$('#headSeverityId').val();
    if(v8==''){
    	//swal("Variety Should be Selected");
    	swal(
				'Error!',
				'Head Severity should not left blank.',
				'error'
			) 
		$("#headSeverityId").focus();
		return false;	
    }
    
    
    try
	{
		var temp = parseInt(v8);
		if(isNaN(temp))
			{
			$("#headSeverityId").focus();
			swal(
					'Error!',
					'Please enter valid Rust Head Severity.',
					'error'
				) 
			return false;
			}
		if(temp > 5)
		{
			$("#headSeverityId").focus();
			swal(
					'Error!',
					'Rust Head Severity should not exceed 5.',
					'error'
				) 
		return false;
		}
		
		if(temp < 0)
		{
			$("#headSeverityId").focus();
		swal(
				'Error!',
				'Rust Head Severity should not less than 0.',
				'error'
			) 
		return false;
		}
		
		
	}
	catch(e)
	{
		$("#headSeverityId").focus();
		swal(
				'Error!',
				'Please provide valid Rust Head Severity.',
				'error'
			) 
		return false;
	}
	
    }else{
    	
    var v7='--';
    var v8='--';
    }
    //
    
    for(var i = 0; i < rustDetails.length; i++) {
        var cur = rustDetails[i];
        if(cur.rustTypeId == v1 ) {
        	swal(
    				'Error!',
    				$('#rustTypeId :selected').text()+' already added.',
    				'error'
    			) 
    		return false;
        }
 	}
    
    var rustTypeVal = $('#rustTypeId :selected').text();
    var reaction = $("#reactionId :selected").text();
    var rustTypeHtml = '<span class="rust" style="display:none;">'+v1+'</span>'+rustTypeVal;
    var reactionHtml = '<span class="rust" style="display:none;">'+v4+'</span>'+reaction;
    var v5='<a href="javascript:void(0);" onclick="clearRow(this,\'' + v1 + '\');" class="btn btn-danger">Delete</a>';
    $("#dataTable").show();
   
    var table = document.getElementById(tableID);

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    cell1.innerHTML = rowCount;

    var cell2 = row.insertCell(1);
    cell2.innerHTML = rustTypeHtml;

    var cell3 = row.insertCell(2);
    cell3.innerHTML = v2;

    var cell4 = row.insertCell(3);
    cell4.innerHTML = v3;
	
    var cell5 = row.insertCell(4);
    cell5.innerHTML = reactionHtml;
	
    var cell6 = row.insertCell(5);
    cell6.innerHTML = v7;
    
    var cell7 = row.insertCell(6);
    cell7.innerHTML = v8;
    
    var cell8 = row.insertCell(7);
    cell8.innerHTML = v5;
	
    rustDetails.push({ 
	        "rustTypeId" : v1,
	        "incidentId" : v2,
	        "reaction"   : v4,
	        "severityId" : v3,
	        "RustTypeName":$('#rustTypeId :selected').text(),
	        "ReactionName":$('#reactionId :selected').text(),
	        "headIncidentId" : v7,
	        "headSeverityId" : v8
    }); 
    $("#subMainDiv").show();
    
    var ids = "";
    for(i=0;i<rustDetails.length;i++)
    	{
    		//fetchSampleCollected
    		//sampleTypeId
    		ids += rustDetails[i].rustTypeId+','
    	}
    	 var dataString = ids;
		 $.ajax({
		 	type: "POST",
            url : 'api/fetchSampleCollected',
            data: dataString,
			cache: false,
			async:false,
            success : function(data) {
            	var jsona = JSON.parse(data);
            	var htm = '<option value="-1">--Select--</option>';
            	
            	for(i=0;i<jsona.length;i++)
            		{
            		htm += '<option value="'+jsona[i].SampleId+'" rustid="'+jsona[i].RustId+'">'+jsona[i].SampleName+'</option>';
            		}
            	$("#sampleTypeId").html(htm);
            },
			  error : function(e) {
				console.log("ERROR: ", e);
			},
			done : function(e) {
				console.log("DONE");
			}
        });
		 
    		
    	
    
    clearData();
	       
	       
}

function clearData(){
	$('#rustTypeId').val('-1');
	$('#incidentId').val('');
	$('#severityId').val('');
	$('#reactionId').val('-1');
	$('#headIncidentId').val('');
	$('#headSeverityId').val('');
	
	
}

function clearRow(currElement,rustTypeId){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 
	 
	 //sampleDetails
	 for(i=0;i<sampleDetails.length;i++)
		 {
		  var cur = sampleDetails[i];
	        if(cur.RustId == rustTypeId ) {
	        	swal(
	    				'Error!',	
	    				'Rust type cant be deleted.',
	    				'error'
	    			) 
	          return false;
	        }
		 }
	 for(var i = 0; i < rustDetails.length; i++) {
	        var cur = rustDetails[i];
	        if(cur.rustTypeId == rustTypeId ) {
	        	rustDetails.splice(i, 1);
	          break;
	        }
	 }
	 var ids = "";
	 if(rustDetails.length == 0)
		 {
		 var htm = '<option value="-1">--Select--</option>';
		 $("#sampleTypeId").html(htm);
		 }
	 else
		 {
	    for(i=0;i<rustDetails.length;i++)
	    	{
	    		//fetchSampleCollected
	    		//sampleTypeId
	    		ids += rustDetails[i].rustTypeId+','
	    	}
	    	 var dataString = ids;
			 $.ajax({
			 	type: "POST",
	            url : 'api/fetchSampleCollected',
	            data: dataString,
				cache: false,
				async:false,
	            success : function(data) {
	            	var jsona = JSON.parse(data);
	            	var htm = '<option value="-1">--Select--</option>';
	            	
	            	for(i=0;i<jsona.length;i++)
	            		{
	            		htm += '<option value="'+jsona[i].SampleId+'" rustid="'+jsona[i].RustId+'">'+jsona[i].SampleName+'</option>';
	            		}
	            	$("#sampleTypeId").html(htm);
	            },
				  error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
	        });
		 }
	 
	 document.getElementById("dataTable").deleteRow(parentRowIndex);
		// updateIndex();
	 count=$('table#dataTable tr').length;
	 if(count==1){
	   	$("#dataTable").hide();
	 }
	 
}

function updateIndex() 
{	//
    $("#dataTable tr").each(function(){
    //	swal('hii'+$(this).index() + 1);
      $( this ).find( "td" ).first().html($(this).index() + 1 );
    });
}



function createInputField(fieldCount){
	
	if(fieldCount > 9 || fieldCount < 0)
		{
		$("#sampleCountId").focus();
		swal(
				'Error!',
				'Sample count accept minimum 1 and maximum 9.',
				'error'
			) 
		return false;	
		}
	
	$("#hdnSampleIdEntry").html('');
	
	var html="";
	
	for(i=0;i<fieldCount;i++){
		var sampleId='sampleIdVal'+i;
		html+="<input type='text' class='form-control' maxlength='20' id='"+sampleId+"' /><br>"
	}
	$("#hdnSampleIdEntry").html(html);
}



var sampleDetails = [];
var sampleIdsArray = new Array();
var samIdArr=new Array();

function addRow1(tableID) {
	
	var v1=$('#sampleTypeId').val();
	var rust = $('#sampleTypeId').find('option:selected').attr("rustid");
	var vt1=$("#sampleTypeId :selected").text();
	if(v1=='-1'){
		swal(
				'Error!',
				'Please select sample type.',
				'error'
			) 
		$("#sampleTypeId").focus();
		return false;	
	}
	var v2=$('#sampleCountId').val();
    if(v2==''){
    	swal(
				'Error!',
				'Please enter valid No. of Samples',
				'error'
			) 
		$("#sampleCountId").focus();
		return false;	
    }
    
    
    try
	{
		var temp = parseFloat(v2);
		if(isNaN(temp))
			{
			swal(
					'Error!',
					'Please enter valid No. of Samples',
					'error'
				) 
			return false;
			}
		
	}
	catch(e)
	{
		swal(
				'Error!',
				'Please enter valid No. of Samples',
				'error'
			) 
		return false;
	}
	
	
	  for(var i = 0; i < sampleDetails.length; i++) {
	        var cur = sampleDetails[i];
	        if(cur.sampleTypeId == v1 ) {
	        	
	        	swal(
	    				'Error!',
	    				'Already added '+vt1+' type.',
	    				'error'
	    			) 
	    			
	    		return false;
	        }
	 	}
	  
	  
    var v3='';
	var jsonarr = new Array();
	var samIdArrTemp = new Array();
	var samIdArrTemp2=new Array();
	
    for(i=0;i<parseInt(v2);i++){
		var idVal=$("#sampleIdVal"+i).val(); 
		//swal(idVal);
		if(idVal==''){
			$("#sampleIdVal"+i).focus();
			swal(
					'Error!',
					'Sample ID value should not left blank.',
					'error'
				) 
				
			return false;	
		}

var checkDupSamId=null;
		
		$.ajax({
		 	type: "POST",
	    url : 'api/checkDuplicateSampleId',
	    data: "sampleId="+idVal,
	    async:false,
			cache: false,
	    success : function(data) {
		       var jsn=JSON.parse(data)
		       
	 	   if(jsn[0].IsDuplicate)
		   		{
	 		  checkDupSamId=true;
		   		}else
			   		{
		   		 checkDupSamId=false;
			   		}
	    },
	    error : function(e) {
				console.log("ERROR: ", e);
			},
			done : function(e) {
				console.log("DONE");
			}
	});

		if(checkDupSamId==true){
			$("#sampleIdVal"+i).focus();
			swal(
	 				'Error!',
	 				'Sample Id '+idVal.toString().fontcolor('#f44336')+' is not allowed.<br>Please enter a unique Sample Id',
	 				'error'
	 			);
				
			return false;	
		}
		
		if(samIdArrTemp.includes(idVal))
			{
			swal('Error','Sample Id '+idVal.toString().fontcolor('#f44336')+' is already entered.<br>Please enter a unique Sample Id','error');
			samIdArrTemp.splice(0,samIdArrTemp.length);
			return false;
			}else{
				samIdArrTemp.push(idVal);
				}
		
		if(i==parseInt(v2)-1)
			{
				for (var samId of samIdArrTemp) {
					if(samIdArr.includes(samId))
						{
						swal('Error','Sample Id '+samId.toString().fontcolor('#f44336')+' is already entered.<br>Please enter a unique Sample Id','error');
						samIdArrTemp2.splice(0,samIdArrTemp2.length);
						return false;
						}else{
								samIdArrTemp2.push(samId);
							}
				}
				
				for(var samId of samIdArrTemp2){
					samIdArr.push(samId);
				}
			}
		 
		 /*  for(var j = 0; j < sampleIdsArray.length; j++) {
		        var cur = sampleIdsArray[j];
		        if(cur == idVal.trim() ) {
		    			$("#sampleIdVal"+i).focus();
		        	swal(
		    				'Error!',
		    				'Duplicate sample id not allowed.',
		    				'error'
		    			) 
		    			if(sampleDetails.length == 0)
		    				{
		    				sampleIdsArray = new Array();
		    				}
		    		return false;
		        }
		 	}   
		
		 */
		
		v3+=idVal+",";
		
		
		var json = {"SampleId":idVal.trim()};
		jsonarr.push(json);
	}
    
    for(l=0;l<jsonarr.length;l++)
    	{
    	sampleIdsArray.push(jsonarr[l].SampleId);
    	}
    var dataString = JSON.stringify(jsonarr);
	 $.ajax({
	 	type: "POST",
       url : 'api/checkDuplicateSampleIds',
       data: dataString,
       async:false,
		cache: false,
       success : function(data) { 
    	   var js = JSON.parse(data);
    	   for(c=0;c<js.length;c++)
    		   {
    		   	var obj = js[c];
    		   	if(obj.IsDuplicate == true)
    		   		{
    		   		$("#sampleIdVal"+c).focus();
		        	swal(
		    				'Error!',
		    				'Duplicate sample id not allowed.',
		    				'error'
		    			) 
    		   		return false;
    		   		}
    		   }
    	   

    	    if(v3.trim().length > 0)
    	    	{
    	    	v3 = v3.substring(0,v3.length-1);
    	    	}
    	    var v4=$('#sampleRemarks').val();
    		/* if(v4==''){
    			swal(
    					'Error!',
    					'Remarks should not left blank.',
    					'error'
    				) 
    			$("#sampleRemarks").focus();
    			return false;	
    		} */
    	   
    		
    	    
    	    for(var i = 0; i < sampleDetails.length; i++) {
    	        var cur = sampleDetails[i];
    	        if(cur.sampleTypeId == v1 ) {
    	        	
    	        	swal(
    	    				'Error!',
    	    				'Already added '+vt1+' type.',
    	    				'error'
    	    			) 
    	    			
    	    		return false;
    	        }
    	 	}
    	    
    	  
    	    
    	   
    	    
    	    var v5='<a href="javascript:void(0);" onclick="clearRow1(this,\'' + v1 + '\');" class="btn btn-danger">Delete</a>';
    	    $("#dataTable1").show();
    	   
    	    var table = document.getElementById(tableID);

    	    var rowCount = table.rows.length;
    	    var row = table.insertRow(rowCount);

    	    var cell1 = row.insertCell(0);
    	    cell1.innerHTML = rowCount;

    	    var cell2 = row.insertCell(1);
    	    cell2.innerHTML = vt1;

    	    var cell3 = row.insertCell(2);
    	    cell3.innerHTML = v2;

    	    var cell4 = row.insertCell(3);
    	    cell4.innerHTML = v3;
    		
    	    var cell5 = row.insertCell(4);
    	    cell5.innerHTML = v4;
    		
    	    var cell6 = row.insertCell(5);
    	    cell6.innerHTML = v5;
    	    sampleDetails.push({ 
    		        "sampleTypeId" : v1,
    		        "sampleCountId" : v2,
    		        "sampleIds" : v3,
    		        "sampleRemarks"   : v4,
    		        "SampleTypeName":$('#sampleTypeId :selected').text(),
    		        "RustId":rust
    	    }); 
    	    $("#subMainDiv1").show();
    	    clearData1();
    		       
    		    
    	    
    	    
       },
		  error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
   });
	 
	 
       
}

function clearData1(){
	$('#sampleTypeId').val('-1');
	$('#sampleCountId').val('');
	$('#sampleRemarks').val('');
	$('#hdnSampleIdEntry').empty();
	
	
	
}

function clearRow1(currElement,sampleTypeId){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 
	 for(var i = 0; i < sampleDetails.length; i++) {
	        var cur = sampleDetails[i];
	        if(cur.sampleTypeId == sampleTypeId ) {
	        	sampleDetails.splice(i, 1);
	          break;
	        }
	 }
	 var sampleIds =  currElement.parentNode.parentNode.cells[3].innerHTML;
	 //sampleIdsArray
	 
	 var spl = sampleIds.split(',');
	 for(i=0;i<spl.length;i++)
		 {
		 for(var j = 0; j < sampleIdsArray.length; j++) {
		        var cur = sampleIdsArray[j];
		        if(cur == spl[i] ) {
		        	sampleIdsArray.splice(i, 1);
		          break;
		        }
		 }
		 }
	 
	 document.getElementById("dataTable1").deleteRow(parentRowIndex);
		// updateIndex1();
	 count=$('table#dataTable1 tr').length;
	 if(count==1){
	   	$("#dataTable1").hide();
	 }
	 
}

function updateIndex1() 
{	//
    $("#dataTable1 tr").each(function(){
    //	swal('hii'+$(this).index() + 1);
      $( this ).find( "td" ).first().html($(this).index() + 1 );
    });
}

 

//#############################################################
function addImg(tableID){
	 var table = document.getElementById(tableID);
	  
     var rowCount = table.rows.length;
     if(rowCount>0)
    	 {
    	 if(rowCount == 6)
    		 {
    		 swal(
     				'Error!',
     				'You can upload only 5 images.',
     				'error'
     			) 
    		 return false;
    		 }
     for(i=0;i<rowCount;i++)
    	 {
    	 	var chld = table.rows[i].cells[0].children[0];
    	 	if(chld.value == '')
    	 		{
    	 		swal(
        				'Error!',
        				'Please provide an image.',
        				'error'
        			) 
    	 		return false;
    	 		}
    	 	else
    	 		{
    	 		FileUploadPath = chld.value;
    	 		var Extension = FileUploadPath.substring(
                        FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

    //The file uploaded is an image

    if ( Extension == "png"  
                        || Extension == "jpeg" || Extension == "jpg") {
    	
   
    	
    }
    else
    	{
    	swal(
				'Error!',
				'Captured image only allows file types of  PNG, JPEG, JPG ',
				'error'
			) 
			return false;
    	}
    
  
     var filesize = ((chld.files[0].size/1024)/1024).toFixed(4); 
     if(filesize > 2.0)
    	 {
    	 swal(
 				'Error!',
 				'Captured image size should not exceed 2MB. ',
 				'error'
 			) 
 			return false;
    	 }
  
    
    
    	 		
    	 		}
    	 }
    	 }
     var clone = $("#mimage").clone();
     clone.removeAttr('id');
     //clone.attr('disabled','disabled');
     clone.attr('readonly', true);
	 //var v1='<input type="file" class="form-control" name="files" value="'+$("#mimage").val()+'"/>';
	 $("#mimage").val('')
	 var v2='<a href="javascript:void(0);" onclick="removeImg(this);" class="btn btn-danger">Delete</a>';
	 
	 

     var row = table.insertRow(rowCount);
 
     var cell1 = row.insertCell(0);
     $(cell1).html(clone);
    // cell1.innerHTML = clone;

     var cell2 = row.insertCell(1);
     cell2.innerHTML = v2;
     $("#clearimage").hide();
}

function removeImg(currElement){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 document.getElementById("imgTable").deleteRow(parentRowIndex);
}

//##############################################################


var otherDisease = [];
function addRow4(tableID) {
	
	var v1=$('#diseaseTypeId').val();
	var vt1=$("#diseaseTypeId :selected").text();
	if(v1=='-1'){
		$("#diseaseTypeId").focus();
		swal(
				'Error!',
				'Please select disease..',
				'error'
			) 
			$('#diseaseTypeId').focus();
		return false;	
	}
	
    
    
    
    var v2=$('#othIncidentId').val();
    if(v2.trim() == '')
    	{
    	$('#othIncidentId').focus();
    	swal(
				'Error!',
				'Please enter '+vt1+' incident perecentage.',
				'error'
			) 
		return false;
    	}
    
	if(v2 !=''){
		 try
			{
				var temp = parseFloat(v2);
				if(isNaN(temp))
					{
					$('#othIncidentId').focus();
					swal(
	        				'Error!',
	        				'Please enter valid '+vt1+' incident perecentage.',
	        				'error'
	        			) 
					return false;
					}
				
				if(temp > 100)
				{
					$('#othIncidentId').focus();
					swal(
	        				'Error!',
	        				vt1+' incident Percentage should not exceed 100.',
	        				'error'
	        			) 
				return false;
				}
				
				if(temp < 0)
				{
					$("#othIncidentId").focus();
				swal(
						'Error!',
						vt1+' incident Percentage should not less than 0.',
						'error'
					) 
				return false;
				}
			}
			catch(e)
			{
					$('#othIncidentId').focus();
				swal(
        				'Error!',
        				'Please enter valid '+vt1+' incident perecentage.',
        				'error'
        			) 
				return false;
			}
			
	}
	
	var v3=$('#othSeverityId').val();
	
	
	 if(v3.trim() == '' && ($("#diseaseTypeId :selected").attr("severity-required") == 'true'))
 	{
 	$('#othSeverityId').focus();
 	swal(
				'Error!',
				'Please enter '+vt1+' severity perecentage.',
				'error'
			) 
		return false;
 	}
	 
	 
	if(v3 !=''){
		 try
			{
				var temp = parseFloat(v3);
				if(isNaN(temp))
					{
					$('#othSeverityId').focus();
					swal(
	        				'Error!',
	        				'Please enter valid '+vt1+' severity perecentage.',
	        				'error'
	        			) 
					return false;
					}
				
				var maxsev = $("#diseaseTypeId :selected").attr("max-sev");
				var minsev = $("#diseaseTypeId :selected").attr("min-sev");
				if($("#diseaseTypeId :selected").text().toLowerCase() == 'septoria')
					{
					if(v3.toString().trim().length < 2)
						{
						$('#othSeverityId').focus();
						swal(
		        				'Error!',
		        				vt1+' severity perecentage should be 2 digits.',
		        				'error'
		        			) 
						return false;
						}
					}
				
				
				if(temp > parseInt(maxsev))
				{
					$('#othSeverityId').focus();
					swal(
	        				'Error!',
	        				vt1+' severity Percentage should not exceed '+maxsev+'.',
	        				'error'
	        			) 
				return false;
				}
				
				if(temp < parseInt(minsev))
				{
					$("#othSeverityId").focus();
				swal(
						'Error!',
						vt1+'severity Percentage should not less than '+minsev+'.',
						'error'
					) 
				return false;
				}
				
				
			}
			catch(e)
			{
				$('#othSeverityId').focus();
				swal(
        				'Error!',
        				'Please enter valid '+vt1+' severity perecentage.',
        				'error'
        			) 
				return false;
			}
	}
   
	
    
    for(var i = 0; i < otherDisease.length; i++) {
        var cur = otherDisease[i];
        if(cur.diseaseTypeId == v1 ) {
        	swal(
    				'Error!',
    				'Already added '+vt1+' disease type !!',
    				'error'
    			) 
    		return false;
        }
 	}
    
    var v4='<a href="javascript:void(0);" onclick="clearRow4(this,\'' + v1 + '\');" class="btn btn-danger">Delete</a>';
    $("#dataTable4").show();
   
    var table = document.getElementById(tableID);

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    cell1.innerHTML = rowCount;

    var cell2 = row.insertCell(1);
    cell2.innerHTML = vt1;

    var cell3 = row.insertCell(2);
    cell3.innerHTML = v2;

    var cell4 = row.insertCell(3);
    cell4.innerHTML = (v3.trim() == '')?'--':v3;
	
    var cell5 = row.insertCell(4);
    cell5.innerHTML = v4;
	
   
    otherDisease.push({ 
	        "diseaseTypeId" : v1,
	        "othIncidentVal" : v2,
	        "othSeverityVal" : v3,
	        "DiseaseName":$("#diseaseTypeId :selected").text()
    }); 
    
    clearData4();
	       
	       
}

function clearData4(){
	$('#diseaseTypeId').val('-1');
	$('#othIncidentId').val('');
	$('#othSeverityId').val('');
	
	
	
	
}

function clearRow4(currElement,diseaseTypeId){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 
	 for(var i = 0; i < otherDisease.length; i++) {
	        var cur = otherDisease[i];
	        if(cur.diseaseTypeId == diseaseTypeId ) {
	        	otherDisease.splice(i, 1);
	          break;
	        }
	 }
	 
	 document.getElementById("dataTable4").deleteRow(parentRowIndex);
		// updateIndex1();
	 count=$('table#dataTable4 tr').length;
	 if(count==1){
	   	$("#dataTable4").hide();
	 }
	 
}

function updateIndex4() 
{	//
    $("#dataTable4 tr").each(function(){
    //	swal('hii'+$(this).index() + 1);
      $( this ).find( "td" ).first().html($(this).index() + 1 );
    });
}
 

// update or modify

$(document).ready(function()
		{
			
		var SurveyJSON = '${SurveyJSON}';
		$("#seasonId").val('${SeasonId}');
		SurveyJSON = atob(SurveyJSON);
		SurveyJSON = JSON.parse(SurveyJSON);
		try
		{
			var err_ = SurveyJSON.ServerSideErrorFound;
			if(err_ != undefined && err_ != null)
				{
				swal(
						'Error!',
						SurveyJSON.ServerSideError,
						'error'
					)
				$("#"+SurveyJSON.ServerSideErrorField).focus();
				}
		}
		catch(e){}
		//console.log(SurveyJSON);
		var seasonId = SurveyJSON.seasonId;
		//SeasonId
		 
		$("#othersurveyor").val(SurveyJSON.othersurveyor);
		$("#seasonId").val(seasonId);
		$("#regionId").val(SurveyJSON.regionId);
		$("#regionId").change();
		$("#zoneId").val(SurveyJSON.zoneId);
		$("#zoneId").change();
		$("#woredaId").val(SurveyJSON.woredaId);
		$("#woredaId").change();
		$("#kebeleId").val(SurveyJSON.kebeleId);
		$("#kebeleId").change();
		var kebelworedaaddr = SurveyJSON.kebelworedaaddr;
		$("#kebelworedaaddr").val(kebelworedaaddr);
		$("#altitudeId").val(SurveyJSON.altitudeId);
		$("#longitudeId").val(SurveyJSON.longitudeId);
		$("#latitudeId").val(SurveyJSON.latitudeId);
		$("#surveyDateId").val(SurveyJSON.surveyDateId);
		//(SurveyJSON.decimaldegree == true)?$("#decimal").prop("checked",true):$("#decimal").prop("checked",false);
		if(SurveyJSON.decimaldegree == true)
			{
		document.getElementById("decimal").checked = true;
			}
		else
			{
		document.getElementById("degree").checked = true;
			}
		
		$("#observationId").val(SurveyJSON.observationId);
		$("#plantingDate").val(SurveyJSON.plantingDate);
		$("#tilleringdate").val(SurveyJSON.tilleringdate);
		
		(SurveyJSON.contactedFarmerId == true)?$("#contactedFarmerId").prop("checked",true):$("#contactedFarmerId").prop("checked",false);
		
		$("#siteArea").val(SurveyJSON.siteInformation.siteArea);
		$("#surveySite").val(SurveyJSON.siteInformation.surveySite);
		$("#growthStage").val(SurveyJSON.siteInformation.growthStage);
		$("#varity").val(SurveyJSON.siteInformation.varity);
		$("#varity").change();
		if($("#varity :selected").text().trim().toLowerCase() == 'other')
			{
			$("#othervariety").val(SurveyJSON.siteInformation.OtherVariety);
			}
		$("#wheatType").val(SurveyJSON.siteInformation.wheatType);
		$("#wheatType").change();
		if($("#wheatType :selected").text().trim().toLowerCase() == 'other')
		{
			$("#otherwheat").val(SurveyJSON.siteInformation.OtherWheat);
			}
		(SurveyJSON.rustAffectedId == true)?$("#rustAffectedId").prop("checked",true):$("#rustAffectedId").prop("checked",false);
		(SurveyJSON.rustAffectedId == true)?$("#rustAffectedId").click():$("#demo-form-radio-4").click();
		(SurveyJSON.sampleCollectedId == true)?$("#sampleCollectedId").prop("checked",true):$("#sampleCollectedId").prop("checked",false);
		(SurveyJSON.sampleCollectedId == true)?$("#sampleCollectedId").click():$("#demo-form-radio-2").click();
		(SurveyJSON.fungisideId != null && SurveyJSON.fungisideId == true )?$("#fungisideId").prop("checked",true):(( SurveyJSON.fungisideId != null) ? $("#fungisideId").prop("checked",false) :$("#unknownfungicide").prop("checked",true));
		(SurveyJSON.fungisideId != null && SurveyJSON.fungisideId == true )?$("#fungisideId").click():(( SurveyJSON.fungisideId != null) ? $("#demo-form-radio-8").click() :$("#unknownfungicide").click());
		if(SurveyJSON.rustAffectedId == true)
			{
			 
				for(i=0;i<SurveyJSON.rustDetails.length;i++)
				{ 
					var  rustTypeId = SurveyJSON.rustDetails[i].rustTypeId;
					var  incident = SurveyJSON.rustDetails[i].incidentId;
					var  severityId = SurveyJSON.rustDetails[i].severityId;
					var  reactionId = SurveyJSON.rustDetails[i].reaction;
					var  headIncident = SurveyJSON.rustDetails[i].headIncidentId;
					var  headSeverity = SurveyJSON.rustDetails[i].headSeverityId;
					var b = false;
				 for(var i = 0; i < rustDetails.length; i++) {
				        var cur = rustDetails[i];
				        if(cur.rustTypeId == rustTypeId ) {
				        	b = true;
				        }
				 	}
		if(b)
			{
			continue;
			}
				$("#rustTypeId").val(rustTypeId);
				
				$("#incidentId").val(incident);
				$("#severityId").val(severityId);
				$("#rustTypeId").change();
				$("#reactionId").val(reactionId);
				$("#headIncidentId").val(headIncident);
				$("#headSeverityId").val(headSeverity);
				 $("#demo-text-input1").click();
			   
				
				}
			}
		
		if(SurveyJSON.sampleCollectedId == true)
		{
			sampleDetails = new Array();
			sampleDetails = SurveyJSON.sampleDetails;
			console.log(sampleDetails.length);
			console.log(sampleDetails);
			for(i=0;i<sampleDetails.length;i++)
			{
			var  sampleRemarks = sampleDetails[i].sampleRemarks;
			var  sampleCountId = sampleDetails[i].sampleCountId;
			var  sampleIds = sampleDetails[i].sampleIds;
			var  SampleTypeName = sampleDetails[i].SampleTypeName;
			var  sampleTypeId = sampleDetails[i].sampleTypeId; 
			
			  var v5='<a href="javascript:void(0);" onclick="clearRow1(this,\'' + sampleTypeId + '\');" class="btn btn-danger">Delete</a>';
			    $("#dataTable1").show();
			   
			    var table = document.getElementById("dataTable1");

			    var rowCount = table.rows.length;
			    var row = table.insertRow(rowCount);

			    var cell1 = row.insertCell(0);
			    cell1.innerHTML = rowCount;

			    var cell2 = row.insertCell(1);
			    cell2.innerHTML = SampleTypeName;

			    var cell3 = row.insertCell(2);
			    cell3.innerHTML = sampleCountId;

			    var cell4 = row.insertCell(3);
			    cell4.innerHTML = sampleIds;
				
			    var cell5 = row.insertCell(4);
			    cell5.innerHTML = sampleRemarks;
				
			    var cell6 = row.insertCell(5);
			    cell6.innerHTML = v5;
			    
			    $("#subMainDiv1").show();
			}
		}
		
		// fungicide
		$("#fungiUsed").val(SurveyJSON.fungicideJson.fungiUsed);
		$("#fungiUsed").change();
		if($("#fungiUsed :selected").text().trim().toLowerCase() == 'other')
			{
			$("#otherfungi").val(SurveyJSON.fungicideJson.OtherFungi);
			}
		$("#effectiveness").val(SurveyJSON.fungicideJson.effectiveness);
		$("#sprayDate").val(SurveyJSON.fungicideJson.sprayDate);
		$("#dose").val(SurveyJSON.fungicideJson.dose);
		
		// other disease
		
	 
			for(i=0;i<SurveyJSON.otherDisease.length;i++)
			{
			var  diseaseTypeId = SurveyJSON.otherDisease[i].diseaseTypeId;
			var  othIncidentVal = SurveyJSON.otherDisease[i].othIncidentVal;
			var  othSeverityVal = SurveyJSON.otherDisease[i].othSeverityVal;
			$("#diseaseTypeId").val(diseaseTypeId);
			$("#othIncidentId").val(othIncidentVal);
			$("#othSeverityId").val(othSeverityVal);
			 $("#demo-text-input4").click();
			
			}
		
		//otherDetails
		
		
	
			$("#soilColor").val(SurveyJSON.otherDetails.soilColor);
			$("#moisture").val(SurveyJSON.otherDetails.moisture);
			
			$("#remark").val(SurveyJSON.remark);
			
			(SurveyJSON.otherDetails.weedcontrol == true)?$("#weedcontrol").prop("checked",true):$("#weedcontrol").prop("checked",false);
			(SurveyJSON.otherDetails.irrigated == true)?$("#irrigated").prop("checked",true):$("#irrigated").prop("checked",false);
			
			
			// surveyor 
			for(i=0;i<SurveyJSON.surveyorJsa.length;i++)
			{
				var json_ = SurveyJSON.surveyorJsa[i];
				var val_ = json_.userId;
				$("#check_surveyor_"+val_).click();
			}

			//add by prasanta on 29-07-2020 to select the institue
			if(SurveyJSON.surveyorJsa.length==1){
				var json_ = SurveyJSON.surveyorJsa[0];
				//var val_ = json_.researchId;
				$("#institutionName").val(json_.researchId);
			}
			//end
			
			// other disease dtls
			
			
			for(i=0;i<SurveyJSON.anyOtherDiseaseJsa.length;i++)
			{
				var json_ = SurveyJSON.anyOtherDiseaseJsa[i];
				var val_ = json_.diseaseId;
				$("#check_disease_"+val_).click();
			}
			
			(SurveyJSON.capturedImageId == true)?$("#capturedImageId").prop("checked",true):$("#capturedImageId").prop("checked",false);
			(SurveyJSON.capturedImageId == true)?$("#capturedImageId").click():$("#demo-form-radio-6").click();
			/* for(i=0;i<SurveyJSON.Images.length;i++)
			{
				$(".noimage").append('<img alt="no image" src="public/load_image?imagePath='+btoa(SurveyJSON.Images[i])+'">');
			} */
			
			if(SurveyJSON.Images.length == 0)
				{
				
				$("#imgup").hide();
				}
			
	
		});

</script>
<script>
 
$(document).ready(function(){
	 
	 var text_max1 = 200;
	 $('#charNum').html('Maximum characters :' + text_max1);

	 $('#sampleRemarks').keyup(function() {
	     var text_length = $('#sampleRemarks').val().length;
	     var text_remaining = text_max1 - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
	   
	 var text_max = 200;
	 $('#charNum1').html('Maximum characters :' + text_max);

	 $('#remark').keyup(function() {
	     var text_length = $('#remark').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum1').html('Maximum characters :' + text_remaining);
	 });
	 
	 var text_max1 = 200;
	 $('#charNum2').html('Maximum characters :' + text_max);

	 $('#kebelworedaaddr').keyup(function() {
	     var text_length = $('#kebelworedaaddr').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum2').html('Maximum characters :' + text_remaining);
	 });
	   
	 var text_max3 = 200;
	 $('#charNum3').html('Maximum characters :' + text_max);

	 $('#othersurveyor').keyup(function() {
	     var text_length = $('#othersurveyor').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum3').html('Maximum characters :' + text_remaining);
	 });
	 
	 
	/* $('[data-toggle="tooltip"]').tooltip(); 
	setTimeout(function() {$("#messageId").hide(); }, 3000); */
	
});

//For other users tagged with no institution
var rcObj = '${InstitutionSelected}';
if(rcObj == null || rcObj=='' ){
	$("#institutionName").prop("disabled",false);
	$("#institutionName option[value='']").remove();
}

// default select the surveyor
var loginUserId = '${UserId}';

$("#check_surveyor_"+loginUserId).prop("checked",true);
var val_ = $("#check_val_"+loginUserId).html();
$("#sur").html(val_);
$("#check_surveyor_"+loginUserId).prop("disabled",true);
</script>

  <script>
 
 $(document).ready(function()
		 {
	 	
	 	$("#decimal,#degree").click(function()
	 			{
	 		//$(this).val()
	 		$("#longitudeId").attr("placeholder","Enter "+$(this).val()+" values");
	 		$("#latitudeId").attr("placeholder","Enter "+$(this).val()+" values");
	 			});
	 
		 });
 
 </script>
 
 <script>
 
 $(document).ready(function()
		 {
	 
	 		$("#diseaseTypeId").change(function()
	 				{
	 			var valu = $(this).val();
	 			if(valu == -1 || valu == '-1')
	 				{
	 				return false;
	 				}
	 			
	 			var severityRequired = $("#diseaseTypeId :selected").attr("severity-required");
	 			if(severityRequired == true || severityRequired == 'true')
	 				{
	 				$("#othSeverityId").val('');
 					$("#othSeverityId").prop('disabled',false);
	 				
	 				}
	 			else
	 				{
	 				$("#othSeverityId").val(' ');
	 				$("#othSeverityId").prop('disabled',true);
	 				}
	 			
	 				});
	 		
	 		
               // Add Debendra
	 		
	 		$("#rustTypeId").change(function()
	 				{
	 			var valu = $(this).val();
	 			if(valu == -1 || valu == '-1')
	 				{
	 				return false;
	 				}
	 			
	 			//var severityRequired = $("#diseaseTypeId :selected").attr("severity-required");
	 			if(valu == 1 || valu == '1' || valu == 2 || valu == '2')
	 				
	 			    {
	 				$("#headSeverityId").val(' ');
	 				$("#headSeverityId").prop('disabled',true);
	 				$("#headIncidentId").val(' ');
	 				$("#headIncidentId").prop('disabled',true);
	 				}
	 				
	 			else
	 			    {
	 				$("#headSeverityId").val(' ');
	 				$("#headSeverityId").prop('disabled',false);
	 				$("#headIncidentId").val(' ');
	 				$("#headIncidentId").prop('disabled',false);
	 				
	 				}
	 			
	 				});
	 
		 });
 
 </script>
 
 
 </script>
 
 
 
 
 //added By Shaktimaan
 //to set the severity vl as 0 if incident val =0 and if both is 0 the reaction dropdown will select as NA 
 
 <script>
 $(function(){
 $("#incidentId").on('keyup change', function(){
 
  $("#reactionId").val(-1);
   var incidentVal = $("#incidentId").val();
  
   if(incidentVal==0){
	   //set severityId value as 0
	   $('#severityId').val(0);
	   $('#severityId').prop('disabled', true);

	   }else{
		   $('#severityId').val(" ");
		   $('#severityId').prop('disabled', false);
		   }

   var severityVal=$("#severityId").val();
   if(incidentVal==0 && severityVal==0 ){
	   $("#reactionId").val(9);
	   $('#reactionId').prop('disabled', true);
	
	   }else{
		   
	$('#reactionId').prop('disabled', false);
		   }
   
 })
  
});

 
 </script>