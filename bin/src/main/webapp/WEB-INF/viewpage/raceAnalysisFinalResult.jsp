<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Publish Race Analysis </h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Race Analysis</li>
                           <li class="breadcrumb-item active" aria-current="page">Race Analysis</li>
                        </ol>
                     </nav>
                  </div>
                 
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              
                              <a class="nav-item nav-link active "  href="javascript:void(0)" >Publish</a>
                           </ul>
                           <div class="indicatorslist">
                              <a  title="" href="javascript:void(0)" id="backIcon" onclick="history.back()" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                             <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                             
                           </div>
                        </div>
                       
                        
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                       
                           <!--Static-->
                           
                            
                           <div class="">
							<h3>Sample Details</h3>
							<div class="width50">

								  <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Survey No.</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="surveyNo">${SurveyNo }</span>
                              </div>
                           </div>
                          
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"> Rust Type</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                   <span id="rustType">${RustName }</span>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"> Sample Received On </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                   <span id="surveyDate"></span>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"> Region </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                   <span id="region"></span>
                              </div>
                           </div>
                           
                          
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"> Woreda </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                   <span id="woreda"></span>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"> Institution Name </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <span id="instituteName"></span>
                              </div>
                           </div>
                           
                              
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">  Variety </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <span id="variety"></span>
                              </div>
                           </div>
                           
                                   
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Altitude  </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <span id="altitude"></span>
                              </div>
                           </div>
                           
                           </div>
                           <div class="width50 mrgnl40">
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Sample Id</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <span id="sampleId">${SampleId }</span>
                              </div>
                           </div> 
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"> Survey Date </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="surveyDate1"></span>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"> Sample Received By </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <span id="userName">${UserName }</span>
                              </div>
                           </div>
                           
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"> Zone </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <span id="zone"></span>
                              </div>
                           </div>
                           
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"> Kebele </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                   <span id="kebele"></span>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"> Surveyor Name </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <span id="surveryors"></span>
                              </div>
                           </div>
                        
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input"> Lattitude </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="latitude"></span>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">  Longitude </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="longitude"></span>
                              </div>
                           </div>

								
							</div>
						</div>
                           
                           <div class="">
                           <div class="clearfix"></div>
                           <h3>Inoculation Details</h3>
                           <div class="width50">
                           <div class="container">
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Date of Inoculation </label>
                              <div class="col-12 col-md-8 col-xl-8">
                                <span class="colon">:</span>
                                 01-Oct-2019
                              </div>
                           </div>
                           </div>
                           </div>
                           
                           <div class="width50 mrgnl40">
                             <div class="form-group row" >
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Wheat Line</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 McNair
                              </div>
                           </div>
                           </div>
                           </div>
                           
                           <div class="">
                           <div class="clearfix"></div>
                           <h3>Inoculation Details On Differentials</h3>
                      	     <div id="subMainDiv">													
							 <div class="tablesec">
								<div class="table-responsive">
									<table id="dataTable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered">
								  <thead>
								  
							    <tr>
							      
							      <th>Repetition</th>
							      <th>Date of Inoculation</th>
							      <th>Recording Date</th>
							      <th>Race</th>
							    </tr>
							    
							    </thead>
							    <tbody>
							      <c:forEach items="${Inoculations}" var="inoculations" varStatus="loop">
							     <tr>
							     
							     
		
		
							     <td align="center"><a  href="raceAnalysisNewDetailsView?RustTypeId=${RustTypeId }&SurveyId=${SurveyId }&date=${date }&raceAnalysisId=${raceAnalysisId}&SampleId=${SampleId }&ShowAll=${loop.index+1}">${loop.index+1 }</a></td>
							     <td> <fmt:formatDate type = "date"  
         value = "${inoculations.inoculationDate }" /></td>
							     <td><fmt:formatDate type = "date" 
         value = "${inoculations.recordingDate }" /></td> 
							     <td>${inoculations.result }</td>
                                </tr>
                                 </c:forEach>
                                </tbody>
                                   </table>
								</div>
							</div>
							</div>
                           <form action="publishRaceAnalysis" method="POST" id="myform" enctype="multipart/form-data">
                          <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">
                             Upload File<span class="text-danger">*</span>
                              </label>
                               <div class="col-sm-3">
                                  <input type="file" name="document" id="demo-text-input1" class="form-control" placeholder="" accept=" image/jpeg, image/png,application/pdf">
                                  <input type="text" style="display:none;" name="AnalysisId" value="${AnalysisId }" class="form-control" placeholder="">
                                  <input type="text" style="display:none;" name="SampleId" value="${SampleTagId }" class="form-control" placeholder="">
                              		<small>Max size: 2MB<br> Allowed types: pdf,jpeg,jpg,png</small>
                              </div>
                              
                               <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">
                            Results<span class="text-danger">*</span>
                              </label>
                               <div class="col-sm-3">
                                 <select class="form-control" name="FinalResult" id="FinalResult">
                                 <option value="-1">Select Result</option>
                                  <c:forEach items="${Inoculations}" var="inoculations">
                                   <option value="${ inoculations.result}">${ inoculations.result}</option>
                                    </c:forEach>
                                 
                                 </select>
                              </div>
                              
                           </div>
                           
                           
                           
                           <div class="form-group row" >
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-info mb-1" onclick="return checkSubmit()" type="button">Publish</button>
								 <button class="btn btn-danger mb-1" onclick="location.href='raceanalysisresult'" type="button">Back</button>
							  </div>
							  
					     </div>
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
      
      function checkSubmit()
      {
    	  
    	  // check the file type and siz
    	  var chld = $('#demo-text-input1')[0];
    	  
    	  if(chld.value == '' || chld.value == null)
    		  {
    		  $('#demo-text-input1').val('');
				$('#demo-text-input1').focus();
				swal(
						'Error!',
						'Please provide file.',
						'error'
					) 
					return false;
    		  }
    	  
      	  FileUploadPath = chld.value;
	 		var Extension = FileUploadPath.substring(
                  FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

			//The file uploaded is an image
			
			if ( !(Extension == "pdf"  
			                  || Extension == "jpeg" || Extension == "jpg" || Extension == "png" )) {
				$('#demo-text-input1').val('');
				$('#demo-text-input1').focus();
				swal(
						'Error!',
						'File type should be PDF,JPEG,JPG and PNG. ',
						'error'
					) 
					return false;
				
				}
			 
			
			
			var filesize = ((chld.files[0].size/1024)/1024).toFixed(4); 
			if(filesize > 2.0)
				 {
				$('#demo-text-input1').val('');
				$('#demo-text-input1').focus();
				 swal(
						'Error!',
						'File size should not exceed 2MB. ',
						'error'
					) 
					return false;
				 }
			
			var result = $("#FinalResult").val();
			if(result.trim() == "-1" || result == -1)
				{
				$('#FinalResult').focus();
				 swal(
						'Error!',
						'Please select the final result. ',
						'error'
					) 
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
    		    		 $("#myform").submit();
    		    		  }
    		    	
    		    })
    	 
      }
$(document).ready(function(){
  $(".sampleno").click(function(){
    $(".sampletext1").hide();
  });
  $(".sampleyes").click(function(){
    $(".sampletext1").show();
  });
  
 
	
	//Publish
	
	 $(document).on('click', '#btnSubmitId', function(e) {
		 
		    swal({
				title: "Are you sure?",
				//text: " http://inoculatedsample.html", 
				type: "warning",
				confirmButtonText: "Ok",
				showCancelButton: true
		    })
		    	.then((result) => {
					if (result.value) {
						window.location.href="raceanalysisresult";
					} else if (result.dismiss === 'cancel') {
					    swal(
					      'Cancelled',
					      'Your stay here :)',
					      'error'
					    )
					}
				})
		});
		
		
		
		// Back
		
	 $(document).on('click', '#btnCancelId', function(e) {
		 
		    swal({
				title: "Are you sure?",
				//text: " http://inoculatedsample.html", 
				type: "warning",
				confirmButtonText: "Ok",
				showCancelButton: true
		    })
		    	.then((result) => {
					if (result.value) {
						window.location.href="raceanalysisresult";
					} else if (result.dismiss === 'cancel') {
					    swal(
					      'Cancelled',
					      'Your stay here :)',
					      'error'
					    )
					}
				})
		});
	
	
	
  
});


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
		$("#kebele").html(SurveyJSON.KebeleName);
		$("#altitude").html(SurveyJSON.altitudeId);
		$("#latitude").html(SurveyJSON.latitudeId );
		$("#longitude").html(SurveyJSON.longitudeId );
		$("#surveyDate").html(SurveyJSON.surveyDateId);
		$("#surveyDate1").html(SurveyJSON.surveyDateId);
		$("#plantingDate").html(SurveyJSON.plantingDate);
		$("#rustDate").html(SurveyJSON.observationId);
		$("#contactedFarmer").html((SurveyJSON.contactedFarmerId == true)?"Yes":"No");
		$("#area").html(SurveyJSON.siteInformation.siteArea);
		$("#surveySite").html(SurveyJSON.siteInformation.SurveySiteName);
		$("#growthType").html(SurveyJSON.siteInformation.GrowthStageName);
		$("#wheatType").html(SurveyJSON.siteInformation.WheatTypeName);
		$("#variety").html(SurveyJSON.siteInformation.VarityName);
		$("#rustAffect").html((SurveyJSON.rustAffectedId == true)?"Yes":"No");
		$("#funApplied").html((SurveyJSON.fungisideId == true)?"Yes":"No");
		$("#sampleCollected").html((SurveyJSON.sampleCollectedId == true)?"Yes":"No");
		
		//rustTable
		
		for(i=0;i<SurveyJSON.rustDetails.length;i++)
			{
			var  rustType = SurveyJSON.rustDetails[i].RustTypeName;
			var  incident = SurveyJSON.rustDetails[i].incidentId;
			var  severityId = SurveyJSON.rustDetails[i].severityId;
			var  reactionName = SurveyJSON.rustDetails[i].ReactionName;
			var html = "<tr><td>"+(i+1)+"</td><td>"+rustType+"</td><td>"+incident+"</td><td>"+severityId+"</td><td>"+reactionName+"</td></tr>";
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
		$("#sprayDate").html(SurveyJSON.fungicideJson.sprayDate);
		$("#dose").html(SurveyJSON.fungicideJson.dose);
		
		// Other Details
		//otherDetails
		
		$("#remark").html(SurveyJSON.remark);
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
		$("#otherDisease").html(val_);
		
		// /public/load_image
		//
		
		$("#capturedImage").html((SurveyJSON.capturedImageId == true)?"Yes":"No");
		for(i=0;i<SurveyJSON.Images.length;i++)
			{
		$(".noimage").append('<img alt="no image" src="public/load_image?imagePath='+btoa(SurveyJSON.Images[i])+'">');
			}
		
		
		// Other disease
		//otherDisease
		
		for(i=0;i<SurveyJSON.otherDisease.length;i++)
			{
			var  DiseaseName = SurveyJSON.otherDisease[i].DiseaseName;
			var  othIncidentVal = SurveyJSON.otherDisease[i].othIncidentVal;
			var  othSeverityVal = SurveyJSON.otherDisease[i].othSeverityVal;
			var html = "<tr><td>"+(i+1)+"</td><td>"+DiseaseName+"</td><td>"+othIncidentVal+"</td><td>"+othSeverityVal+"</td></tr>";
			$("#otherDisease1").append(html);
			
			}
		
	
		});
		


 
 
</script>