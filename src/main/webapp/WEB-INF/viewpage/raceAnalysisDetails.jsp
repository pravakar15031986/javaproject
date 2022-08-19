<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Race Analysis</h4>
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
                              <a class="nav-item nav-link active"  href="stem-rust-race-analysis">Add</a>
                             
                           </ul>
                           <div class="indicatorslist">
                              <a  title="" href="javascript:void(0)" id="backIcon" onclick="history.back()" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="history.back()"><i class="icon-arrow-left1"></i></a>
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
                                   <span id="rustType">${RustType }</span>
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
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Date of Inoculation <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                <div class="input-group">
                                  <input type="text" class="form-control datepicker" id="inoculationDate" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                    <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           
                           </div>
                           
                           <div class="width50 mrgnl40">
                             <div class="form-group row" > 
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Wheat Line <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <%-- <span>${WheatLine}</span> --%>
                                 <select id="wheatLineId" class="form-control">
                                 <option value="-1" >--Select Wheat Line--</option>
                                   <c:forEach items="${WheatLine}" var="dtls" varStatus="theCount">
                                   <option value="${dtls[0] }">${dtls[1] }</option>
                                   </c:forEach>
                                 </select>
                              </div>
                           </div>
                           </div>
                           </div>
                           
                           <div class="form-group row">
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnSubmitId">Submit</button>
								 <button class="btn btn-danger mb-1" onclick="history.back()" >Back</button>
							  </div>
							  
					     </div>
					                          
                          <div class="clearfix"></div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
          <form action="saveInoculationDate" autocomplete="off" id="myform1"   method="post">
        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
         <input type="text" value="" style="display:none;" name="surveyDate" id="surveyDatePost">
         <input type="text" value="" style="display:none;" name="wheatLine" id="wheatLine">
         <input type="text" value="" style="display:none;" name="inoculationDate" id="inoculationDate1">
         
       </form>
       
         <script>
$(document).ready(function(){
  $(".sampleno").click(function(){
    $(".sampletext1").hide();
  });
  $(".sampleyes").click(function(){
    $(".sampletext1").show();
  });
  
  
	
	 $(document).on('click', '#btnSubmitId', function(e) {
		 var inoculationDate = $("#inoculationDate").val();
		 if(inoculationDate == ''){
	 	       $("#inoculationDate").focus();
			 swal(
						'Warning!',
						'Date of inoculation should not be blank',
						/* 'You clicked the <b style="color:coral;">warning</b> button!', */
						'warning'
					)
			// swal('Please enter date of inoculation');
	 	       return false; 
		 }
		 
		 var sampleCollected  = $('#surveyDate').html();
		 
		 var inoculatedDt = new Date(inoculationDate);
		 var sampleCollectedDt = new Date(sampleCollected);
		 
		 if(inoculatedDt < sampleCollectedDt)
			 {
	 	       $("#inoculationDate").focus();
			 swal(
						'Warning!',
						'Date of inoculation should not less from Sample collected date.',
						/* 'You clicked the <b style="color:coral;">warning</b> button!', */
						'warning'
					)
	 	       return false; 
			 }
		 
		  
		
		 var wheatLine = $("#wheatLineId").val();
		 
		 if(wheatLine == -1 || wheatLine == '-1')
			 {
	 	       $("#wheatLine").focus();
			 swal(
						'Warning!',
						'Please select the wheat line.',
						/* 'You clicked the <b style="color:coral;">warning</b> button!', */
						'warning'
					)
			// swal('Please enter date of inoculation');
	 	       return false; 
			 }
		
		 
		    swal({
				title: "Do you want to Submit?",
				//text: " http://inoculatedsample.html", 
				type: "warning",
				confirmButtonText: "Yes",
				cancelButtonText:"No",
				showCancelButton: true
		    })
		    	.then((result) => {
					if (result.value) {
						//window.location.href="inoculatedsample";
						 var surveyDate = $("#surveyDate").html();
					 var inaculation = $("#inoculationDate").val();
					 var wheatLine = $("#wheatLineId").val();
					 
					 $("#inoculationDate1").val(inaculation);
					 $("#surveyDatePost").val(surveyDate);
					 $("#wheatLine").val(wheatLine);
					 
						$("#myform1").submit();
					} else if (result.dismiss === 'cancel') {
					    
					}
				})
		});
		
	// Back
	
	 $(document).on('click', '#btnCancelId', function(e) {
		 var inoculationDate = $("#inoculationDate").val();
		 
		    swal({
				title: "Are you sure?",
				//text: " http://inoculatedsample.html", 
				type: "warning",
				confirmButtonText: "Ok",
				showCancelButton: true
		    })
		    	.then((result) => {
					if (result.value) {
						window.location.href="raceanalysis";
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
		$("#latitude").html(SurveyJSON.latitudeId  );
		$("#longitude").html(SurveyJSON.longitudeId  );
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
		
		
		var Message = '${Message}';
		if(Message != null && Message.trim() != '' && Message != undefined)
			{
			swal(
					'Warning!',
					Message,
					/* 'You clicked the <b style="color:coral;">warning</b> button!', */
					'warning'
				)
			}
		
</script>