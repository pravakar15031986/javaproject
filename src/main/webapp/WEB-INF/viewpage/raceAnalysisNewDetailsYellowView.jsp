<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Race Analysis Details</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Manage Race
								Analysis</li>
						<li class="breadcrumb-item active" aria-current="page">Race
							Analysis</li>
						
					</ol>
				</nav>
			</div>

		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="javascript:void(0)">View</a>
							
						</ul>
						<div class="indicatorslist">
							 <a
								title="" href="javascript:void(0)" id="backIcon"
								onclick="history.back()" data-toggle="tooltip"
								data-placement="top" data-original-title="Back"><i
								class="icon-arrow-left1"></i></a>
						 
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
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-readonly-input">Date of Inoculation </label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span> ${Date }
									</div>
								</div>
							</div>

							<div class="width50 mrgnl40">
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-email-input">Wheat Line</label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>${WheatLine }  
									</div>
								</div>
							</div>
						</div>



						<div class="clearfix"></div>
						<h3>Inoculation Details(On Differentials)</h3>
						<div id="accordion">



				<c:forEach var = "i" begin = "0" end = "${Repeatation }">
				<c:if test="${i lt 5 and Result[i]  ne '' and Result[i]  ne null}">
				
				<c:if test="${ ShowAll == 0 || ShowAll-1 ==i}">
										<div class="card" id="card_">
							</c:if>
							<c:if test="${ ShowAll ne 0 && ShowAll-1 ne i}">
										<div class="card" id="card_" style="display:none;">
							</c:if>
							
							
								<div class="card-header" id="headingThree">
									<h5 class="mb-0">
										<a href="#" class="collapsed" data-toggle="collapse"
											data-target="#collapseThree${i }" aria-expanded="false"
											aria-controls="collapseThree${i }"> Repetition ${i+1 }   
											<c:if test="${Repeatation ne i }">
											<span style="margin-left:40%;">Result &nbsp;:&nbsp - &nbsp; ${Result[i] }</span>
											</c:if>
											 </a>
									</h5>
								</div>
								<div id="collapseThree${i }" class="collapse"
									aria-labelledby="headingThree" data-parent="#accordion">
									<div class="card-body">


										<div class="clearfix"></div>

										<div class="width50">
											<div class="form-group row">
												<label class="col-12 col-md-4 col-xl-4 control-label"
													for="demo-readonly-input">Date of Inoculation (on
													Differentials) <span class="text-danger">*</span>
												</label>
												<div class="col-12 col-md-8 col-xl-8">
													<span class="colon">:</span>
													<div class="input-group">
														<input type="text" data-date-end-date="0d" class="form-control datepicker"
															id="inoculationDate${i}" aria-label="Default"
															aria-describedby="inputGroup-sizing-default">
														<div class="input-group-append">
															<span class="input-group-text"
																id="inputGroup-sizing-default"><i
																class="icon-calendar1"></i></span>
														</div>

													</div>
												</div>
											</div>
										</div>



										<div class="width50 mrgnl40">

											<div class="form-group row">
												<label class="col-12 col-md-4 col-xl-4 control-label"
													for="demo-readonly-input">Recording Date<span
													class="text-danger">*</span></label>
												<div class="col-12 col-md-8 col-xl-8">
													<span class="colon">:</span>
													<div class="input-group">
														<input type="text" class="form-control datepicker"
															id="recordingDate${i}" data-date-end-date="0d" aria-label="Default"
															aria-describedby="inputGroup-sizing-default">
														<div class="input-group-append">
															<span class="input-group-text"
																id="inputGroup-sizing-default"><i
																class="icon-calendar1"></i></span>
														</div>

													</div>
												</div>
											</div>
										</div>

										<div id="subMainDiv">
											<div class="tablesec">
												<div class="table-responsive">
													<table id="dataTable${i}" width="100%" border="0"
														cellspacing="0" cellpadding="0"
														class="table table-bordered">
														<thead>
															<tr>
																
																<th rowspan="2" style="display:none;">Sl No.</th>
																<th rowspan="2">Diff#</th>
																<th rowspan="2">Yr differential Line</th>
																<th rowspan="2">Seed Source</th>
																<th rowspan="2">Yr Gene</th>
																<th rowspan="2">Expected Low IT</th>
																<th colspan="3">Field# Iso-</th>
															</tr>

															<tr>
																<th>Infection <br> Type
																</th>
																<th>H vs L</th>
																<th>Name</th>
															</tr>
														</thead>
														<tbody>


														</tbody>
													</table>
												</div>





											</div>
										</div>

										<%-- <c:out value="${i }"></c:out> --%>
							 
							<c:if test="${Repeatation ne i }">
							<div class="col-lg-12" style="font-size: 20px;">
											Result : <span class=" "   ><b>${ResultsScore[i]}</b></span>
										</div>
							</c:if>

										<div class="clearfix"></div>





									</div>
								</div>
							</div>
							
							
							</c:if>
							</c:forEach>
							
							<c:if test="${IsPDF eq true or IsPDF eq false}">
							<div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">
                             Upload File
                              </label>
                               <div class="col-sm-3">
                               <c:if test="${IsPDF eq true }">
                               
                               <a href="public/showDocument?path=${File }" target="_blank" download="Survey_Uploaded_Success_Data">
                               <i class="fa fa-file-pdf-o " width="50" height="50"></i>
                               </a>
                              </c:if>
                               <c:if test="${IsPDF eq false }">
                              <a href="public/showDocument?path=${File }" target="_blank">
							    <img src="public/showDocument?path=${File }" alt="image" width="50" height="50">
							</a>
						</c:if>
                              
                              </div>
                              
                               <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">
                            Result
                              </label>
                               <div class="col-sm-3">
                                 <span>${FinalResult }</span>
                              </div>
                              
                           </div>
                           </c:if>
						</div>

					</div>


					<div class="clearfix"></div>
	<form action="saveInoculatedRepeatations" method="POST" id="submitInoculated">
	<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
	<input type="text" style="display:none;" id="EncodeJSON" name="EncodeJSON">
	<input type="text" style="display:none;" id="RustTypeId" name="RustTypeId">
	</form>

				</div>
				
			</div>
		</div>
	</div>
</div>
</div>

<script>
 
 
 
var repeatationCount = 0;
$(document).ready(function(){
  $(".sampleno").click(function(){
    $(".sampletext1").hide();
  });
  $(".sampleyes").click(function(){
    $(".sampletext1").show();
  });
  
  
 
 	 $("#btnCancelId").click(function(){
		 
			 window.location.href="inoculatedsample";
		  	  
	});  
	  
	  
 
	 
	 //Back
  
	$(".class1, .class_1").change(function() {
		

		var cls = $(this).attr('class').split(" ");
		var selectVal = $(this).val();
		var b= false;
		for(i=0;i<cls.length;i++)
			{
			if(cls[i] == 'class_1')
				{
				b = true;
				}
			}
		
		if(b == true) // class found
		{
			
			var racec = $(this).closest('td').find('span').html();
			//$(".class1_"+racec+"_val").html('sdsd');
			if($(this).val().trim().toLowerCase() == 'l')
 			{
 		$(this).closest('td').next('td').find('.result').html('-');
 			}
			if($(this).val().trim().toLowerCase() == 'h')
			{
 			var res = $(this).closest('td').prev('td').prev('td').prev('td').find('span').html();
 			$(this).closest('td').next('td').find('.result').html(res);
			}
			if($(this).val().trim().toLowerCase() == 'i')
			{
 			var res = $(this).closest('td').prev('td').prev('td').prev('td').find('span').html();
 			$(this).closest('td').next('td').find('.result').html('('+res+')');
			}
			
			 return false;
		}
		
		var x= $(this).closest('td').next('td').find('select');
 		$(x).val($(this).val());
	 	
 		if($(this).val().trim().toLowerCase() == 'l')
 			{
 		$(this).closest('td').next('td').next('td').find('.result').html('-');
 			}
 		if($(this).val().trim().toLowerCase() == 'h')
			{
 			var res = $(this).closest('td').prev('td').prev('td').find('span').html();
 			$(this).closest('td').next('td').next('td').find('.result').html(res);
			}
 		
 		if($(this).val().trim().toLowerCase() == 'i')
		{
			var res = $(this).closest('td').prev('td').prev('td').find('span').html();
			$(this).closest('td').next('td').next('td').find('.result').html('('+res+')');
		}
		  
	 
		});
	 
	});
	
	
	
	
	// dynamic table generation
	 
	var json = '${DynamicJson}';
	var jsonArr = JSON.parse(atob(json));
	
	var rJson = '${RJSON}';
	
	var rJsa = JSON.parse(atob(rJson));
	
	console.log(jsonArr);
	var html_ = "";
	var keys = Object.keys(jsonArr);
	var counter = 1;
	
	var infectionType = '${InfectionType}';
	infectionType = JSON.parse(infectionType);
	
	console.log(infectionType);
	var infectionTypeHtml  = '<option value="-1">Select</option>';
	
	var keys1 = Object.keys(infectionType);
	var hlhtml = "";
	var drophlhtml = '<option value="-1">Select</option>';
	for(i=0;i<keys1.length;i++)
		{
		infectionTypeHtml  += '<option value="'+infectionType[keys1[i]]+'">'+keys1[i]+'</option>';
		if(!hlhtml.includes(infectionType[keys1[i]]))
			{
			hlhtml += infectionType[keys1[i]]+",";
			drophlhtml  += '<option value="'+infectionType[keys1[i]]+'">'+ infectionType[keys1[i]]+'</option>';
			}
		
		}
	
	//infectionTypeHtml  += '<option value="X">X</option>';
//	drophlhtml  += '<option value="X">X</option>';
	
	
	
	
	if(rJsa.length <= 5){
		console.log(jsonArr);
		console.log('********');
		console.log(rJsa);
		console.log('********');
		//alert('${Repeatation}');
		//jsonArr.sort(function(a,b){return a.SeqNo - b.SeqNo});
	for(k=0;k<=rJsa.length;k++)
		{
		var innerJson = rJsa[k];
		var inoculationId = "";
		try
		{
		inoculationId = ('IncoulationId' in innerJson)?innerJson.IncoulationId:"";
		}
		catch(e){}
		
	for(i=0;i<keys.length;i++)
		{
		repeatationCount++;
		var key = keys[i];
		var innerJsa = jsonArr[key];
		//innerJsa.sort(function(a,b){return a.SeqNo - b.SeqNo});
		for(j=0;j<innerJsa.length;j++)
			{
			
				var rowSpan = "";
				var slNo ="";
				var js = innerJsa[j];
				var dif = js.DiffLine;
				var src = (js.SeedSrc == undefined)?"":js.SeedSrc;
				var gen = js.Gene;
				var low = js.LowIt;
				var phenotype = js.PhenoType;
				
				/* if(j==0)
					{ */
				html_ += '  <tr>'+
				     '<td  align="center" style="display:none;">'+
			     //+(i+1)+
			     +counter+
			     '</td>'+
			     '<td>'
			     +js.SeqNo+
			     '</td>'+
			     '<td>'
			     +dif+
			     '</td>'+
			     '<td>'
			     +src+
			     '</td>'+
			     '<td>'
			     +gen+'<span style="display:none;" id="phenotype_'+k+'_'+(i+1)+'">'+phenotype+'</span>'+
			     '</td>'+
			     '<td>'
			     +low+
			     '</td>'+
			     '<td style="width:10%;height:50%;">'+
			     //'<input class="tdclass class'+(i+1)+'" type="text" size="1" id="fname'+counter+'" >'+
			     '<select class="tdclass class'+(i+1)+' class'+(i+1)+'_'+k+'" disable="disabled" id="fname'+counter+'_'+k+'">'+infectionTypeHtml+'</select><span style="display:none;">'+k+'</span>'+
			     '</td>'+
'			      <td>'+
			     //'<input class="hlclass class_'+(i+1)+'" type="text" size="1" id="gname'+counter+'" maxlength="1" >'+
			     '<select class="hlclass class_'+(i+1)+'" id="gname'+counter+'_'+k+'" disable="disabled">'+drophlhtml+'</select><span style="display:none;">'+k+'</span>'+
			     '</td>'+
			      '<td align="center">'+
'			      <p class="class'+(j+1)+'_'+k+'_val result" style="font-weight:bold"></p><span style="display:none;" id="repeatation_analysis_inoculation_'+k+'_'+counter+'">'+inoculationId+'</span>'+
				'<span style="display:none;" id="repeatation_analysis_'+k+'_'+counter+'">${AnalysisId}</span><span style="display:none;" id="repeatation_wheatline_'+k+'_'+counter+'">'+js.ID+'</span>'+
			     '</td>'+
			     '</tr>';
				 
				counter++;
			}
		 
		
		//table-bordered
		
		
		
		}
	
 
	
		$("#dataTable"+k).append(html_);
	 
		html_ = "";
		counter = 1;
	}
	
	}
	
	
	
	if(rJsa.length <= 5){
		console.log("##########");
		 console.log(JSON.stringify(rJsa));
		for(k=0;k<=rJsa.length;k++)
		{
			 	
				var innerJson = rJsa[k];
				var repeatation;
				try
				{
				repeatation = innerJson.Repeatation;
				}
				catch(e)
				{
					break;
				}
				var st = "";
				$("#inoculationDate"+k).val(innerJson.InoculationDate);
				$("#recordingDate"+k).val(innerJson.RecordingDate);
				/* for(j=0;j<repeatation.length;j++)
					{ */
						
						
						// plot in ui
						
						$('#dataTable'+k+'  tr').each(function(index, tr) { 
							 if(index >1)
								 {
								 var j = index-2;
									 var InfType = repeatation[j].InfType;
									var HL = repeatation[j].HL.toUpperCase();
									var remark = repeatation[j].Remark;
									
								 	document.getElementById('gname'+(j+1)+'_'+k).value = HL;
								 	var act = document.getElementById("fname"+(j+1)+"_"+k+"");
								 	
								 	if(HL.trim().toLowerCase() == 'l')
						 			{
								 		$(this).find('td:last').find('.result').html('-');
						 			}
								 	if(HL.trim().toLowerCase() == 'h')
									{
						 			var res = $(this).find('td:last').prev('td').prev('td').prev('td').prev('td').find('span').html();
						 			$(this).find('td:last').find('.result').html(res);
									}
								 	if(HL.trim().toLowerCase() == 'i')
									{
						 			var res = $(this).find('td:last').prev('td').prev('td').prev('td').prev('td').find('span').html();
						 			$(this).find('td:last').find('.result').html('('+res+')');
									}
								 	 
									
								 	
								 	var options = act.options;
									for(l=0;l<options.length;l++)
										{
										if(options[l].text == InfType)
											{
											options[l].setAttribute('selected', 'selected');
			
			
											}
										}
									
								 	
									//disable functionality
									
								 
										$(act).attr("disabled", "disabled");
										$('#inoculationDate'+k).attr("disabled", "disabled");
										$('#recordingDate'+k).attr("disabled", "disabled");
										document.getElementById('gname'+(j+1)+'_'+k).disabled = true;
									 
								 	
								 }
							   
							});
						
						
					//}
		}
	}
	
	
 
	$("td").on("keyup", "textarea.dynamictextarea", function(){
		 var text_max1 = 100;
		 var text_length = $(this).val().length;
	     var text_remaining = text_max1 - text_length;
	    
	     $( $(this).closest('td').find('div')).html('Maximum characters :' + text_remaining);
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