<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Race Analysis</h4>
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
							<a class="nav-item nav-link active" href="javascript:void(0)">Add</a>
							
						</ul>
						<div class="indicatorslist">
							  <a
								title="" href="javascript:void(0)" id="backIcon"
								onclick="history.back()" data-toggle="tooltip"
								data-placement="top" data-original-title="Back"><i
								class="icon-arrow-left1"></i></a>
							<p class="ml-2" style="color:red;">(*) Indicates mandatory</p>
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
										<span class="colon" >:</span> <span id="indate">${Date }</span>
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
				<c:if test="${i lt 5}">
							<div class="card" id="card_">
								<div class="card-header" id="headingThree">
									<h5 class="mb-0">
									
										<a href="#" class="collapsed" data-toggle="collapse"
											data-target="#collapseThree${i }" aria-expanded="false"
											aria-controls="collapseThree${i }"> Repetition ${i+1 } 
											<c:if test="${Repeatation ne i }">
											<span style="margin-left:50%;">Result &nbsp;:&nbsp - &nbsp; ${Result[i] }</span> 
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
																
																<th rowspan="2">Set</th>
																<th rowspan="2">Diff#</th>
																<th rowspan="2">Line</th>
																<th rowspan="2">Seed Source</th>
																<th rowspan="2">Gene</th>
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
							<c:if test="${Repeatation-1 eq i }">
							<button class="btn btn-primary submit" id="modify_${i }" >Modify</button>
										
										<br>
										
							
							</c:if>
							<c:if test="${Repeatation eq i }">
						
											<button class="btn btn-primary submit" id="submit_${i }"  >Submit</button>
								<br>		
						</c:if>
							
							

										<div class="clearfix"></div>





									</div>
								</div>
							</div>
							
							
							</c:if>
							</c:forEach>
							
										
							
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
	  
	  
	// Submit
 
	
	
		 $(document).on('click', '.submit', function(e) {
			 
			 var cls = $(this).attr('id');
			var	repeat = cls.split("_")[1];
				 
				 
				
			 var inoculationdateval = $("#inoculationDate"+(repeat)).val();
			 if(inoculationdateval == ''){
				 swal(
							'Warning!',
							'Date of inoculation in repetition ('+(parseInt(repeat)+1)+') should not be blank',
							/* 'You clicked the <b style="color:coral;">warning</b> button!', */
							'warning'
						)
		 	       $("#inoculationDate"+(repeat)).focus();
		 	       return false; 
			 }
			 
			 if(repeat == 0 || repeat == '0')
				 {
			  
				 var inoculatedDt = new Date(inoculationdateval);
				 var sampleCollectedDt = new Date($("#indate").html());
				 
				 if(inoculatedDt < sampleCollectedDt)
					 {
					 $("#inoculationDate"+(repeat)).focus();
					 swal(
								'Warning!',
								'Date of inoculation(Repetition 1) should not less from Inoculation date.',
								/* 'You clicked the <b style="color:coral;">warning</b> button!', */
								'warning'
							)
			 	       return false; 
					 }
				 
				  
				 
				 
				 
				 
				 }
			 else
				 {
				 
				 var inoculatedDt = new Date(inoculationdateval);
				 var sampleCollectedDt = new Date( $("#inoculationDate"+(parseInt(repeat)-1)).val());
				 
				 if(inoculatedDt < sampleCollectedDt)
					 {
					 $("#inoculationDate"+(repeat)).focus();
					 swal(
								'Warning!',
								'Date of inoculation(Repetition '+(parseInt(repeat)+1)+') should not less from Repetition '+(repeat)+' Inoculation date.',
								/* 'You clicked the <b style="color:coral;">warning</b> button!', */
								'warning'
							)
			 	       return false; 
					 }
				 
				 }
			 
			 var recordingdateval = $("#recordingDate"+repeat).val();
			 if(recordingdateval == ''){
				 swal(
							'Warning!',
							'Recording date in repetition ('+(parseInt(repeat)+1)+') should not be blank',
							/* 'You clicked the <b style="color:coral;">warning</b> button!', */
							'warning'
						)
		 	       $("#recordingDate"+(repeat)).focus();
		 	       return false; 
			 }
			 
			 
			 if(repeat == 0 || repeat == '0')
			 {
		  
			 var inoculatedDt = new Date(recordingdateval);
			 var sampleCollectedDt = new Date(inoculationdateval);
			 
			 if(inoculatedDt < sampleCollectedDt)
				 {
				  $("#recordingDate"+(repeat)).focus();
				 swal(
							'Warning!',
							'Date of Recording(Repetition 1) should not less from Inoculation date(Repetition 1).',
							/* 'You clicked the <b style="color:coral;">warning</b> button!', */
							'warning'
						)
		 	       return false; 
				 }
			 
			  
			 
			 
			 
			 
			 }
			 else
				 {
					
				 var inoculatedDt = new Date(recordingdateval);
				 var sampleCollectedDt = new Date($("#recordingDate"+(parseInt(repeat)-1)).val());
				 
				 if(inoculatedDt < sampleCollectedDt)
					 {
					  $("#recordingDate"+(repeat)).focus();
					 swal(
								'Warning!',
								'Date of Recording(Repetition '+(parseInt(repeat)+1)+') should not less from  Repetition '+(repeat)+' Date of recording .',
								/* 'You clicked the <b style="color:coral;">warning</b> button!', */
								'warning'
							)
			 	       return false; 
					 }
				 
				 }
		
			 
			 //dataTable
			 var rowCount = $('#dataTable'+repeat+' tr').length - 2;
			 var jsa = new Array();
			 var inid="";
			 for(i=0;i<rowCount;i++)
				 {
				 	var fname = "#fname"+(i+1)+"_"+repeat;
				 	var gname = "#gname"+(i+1)+"_"+repeat;
				 	var analysisId = "#repeatation_analysis_"+repeat+"_"+(i+1);
				 	var wheatlineId = "#repeatation_wheatline_"+repeat+"_"+(i+1);
				 	// inoculation
				 	
				 	var inoculationId = "#repeatation_analysis_inoculation_"+repeat+"_"+(i+1);
				 	
				 	
				 	if($(fname).val() == '-1')
				 		{
				 			$(fname).focus();
				 		swal(
				 				'Error!',
				 				'Please enter infection type. ',
				 				'error'
				 			)
				 		return false;
				 		}
				 	
				 	if($(gname).val() == '-1')
			 		{
			 			$(gname).focus();
			 		swal(
			 				'Error!',
			 				'Please enter H vs L Value. ',
			 				'error'
			 			)
			 		return false;
			 		}
				 	var remark_ = "";
				 	if($(fname).val() == "X")
				 		{
				 		remark_ =  $($(fname)).closest('td').find('textarea').not('.class1').val();
				 		if(remark_.trim() == '')
				 			{
				 			 $($(fname)).closest('td').find('textarea').not('.class1').focus();
					 		swal(
					 				'Error!',
					 				'Please Provide the remark. ',
					 				'error'
					 			)
					 		return false;
				 			}
				 		}
				 	inid = $(inoculationId).html();
				 	var json = {"InoculationId":$(inoculationId).html(),"AnalysisId":$(analysisId).html(),"WheatLineId":$(wheatlineId).html(),"HL":$(gname).val(),"InfectionType":$(fname+" option:selected").text(),"Remark":remark_};
				 	jsa.push(json);
				 }
			 
			 //class1_val
			 var count = rowCount/4;
			 var fJson = {};
			 var arr = new Array();
			 for(i=0;i<count;i++)
				 {
				 	var s = ".class"+(i+1)+"_"+repeat+"_val";
				 	arr.push($(s).html());
				 }
			 fJson.Data = jsa;
			 fJson.FinalResult = arr;
			 fJson.InoculatedDate= $("#inoculationDate"+(repeat)).val();
			 fJson.RecordingDate = $("#recordingDate"+(repeat)).val();
			 fJson.InoculationId = inid;
			 $("#EncodeJSON").val(btoa(JSON.stringify(fJson)));
			 $("#RustTypeId").val('${RustTypeId}');
			 
		
			 
			    swal({
					title: "Do you want to submit ?",
					//text: " http://inoculatedsample.html", 
					type: "warning",
					confirmButtonText: "Yes",
					cancelButtonText: "No",
					showCancelButton: true
			    })
			    	.then((result) => {
						if (result.value) {
							$("#submitInoculated").submit();
						} else if (result.dismiss === 'cancel') {
						     
						}
					})
			});
	 
	 //Back
	 
	 
	 
	 
	  
	 
	$(".class1, .class_1").change(function() {
		

		var cls = $(this).attr('class').split(" ");
		
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
			var chart = JSON.parse('${Chart}');
			var racec = $(this).closest('td').find('span').html();
			var str = "";
			var xVal = 0;
			$(".class1_"+racec+"_val").html('');
			 $( ".class1_"+racec ).each(function( index ) {
				var x= $(this).closest('td').next('td').find('select');
				str += x.val();		
				if(x.val() == 'X')
					{
					xVal = 1;
					}
			
			});
			 if(xVal == 1)
				 {
				 $(".class1_"+racec+"_val").html('X');
				 }
			 else
			 {
				 $(".class1_"+racec+"_val").html('');	 
			 }
			 if(str.length == 4)
				 {
			 var fChart = chart[str.toLowerCase()];
			 $(".class1_"+racec+"_val").html(fChart);
				 }
			 else
			 {
				 $(".class1_"+racec+"_val").html('');	 
			 }
			 return false;
		}
		
		
	 	if($(this).val().toUpperCase() == "X")
 		{
 		/* $(this).closest('td').append('<input type="text">'); */
 		$(this).closest('td').append('<textarea class="form-control dynamictextarea" rows="1" cols="4" maxlength="100"></textarea><div>Maximum 100 characters</div>');
 		var x= $(this).closest('td').next('td').find('select');
		$(x).val('X');
 		}
	 	else
	 		{
	 		$(this).closest('td').find('textarea').not('.class1').remove();
	 		$(this).closest('td').find('div').not('.class1').remove();	
	 		var x= $(this).closest('td').next('td').find('select');
	 		$(x).val($(this).val());
	 		}
	 	 
	 	
		var chart = JSON.parse('${Chart}');
		var racec = $(this).closest('td').find('span').html();
		var str = "";
		var xVal = 0;
		$(".class1_"+racec+"_val").html('');
		 $( ".class1_"+racec ).each(function( index ) {
			var x= $(this).closest('td').next('td').find('select');
			str += x.val();		
			if(x.val() == 'X')
				{
				xVal = 1;
				}
		
		});
		 if(xVal == 1)
			 {
			 $(".class1_"+racec+"_val").html('X');
			 }
		 else
		 {
			 $(".class1_"+racec+"_val").html('');	 
		 }
		 if(str.length == 4)
			 {
		 var fChart = chart[str.toLowerCase()];
		 $(".class1_"+racec+"_val").html(fChart);
			 }
		 else
		 {
			 $(".class1_"+racec+"_val").html('');	 
		 }
	 
		});
	
	
     $(".class2, .class_2").change(function() {
    	 
    	 
    	 var cls = $(this).attr('class').split(" ");
 		
 		var b= false;
 		for(i=0;i<cls.length;i++)
 			{
 			if(cls[i] == 'class_2')
 				{
 				b = true;
 				}
 			}
 		if(b == true) // class found
 		{

 		 	var chart = JSON.parse('${Chart}');
 		 	var racec = $(this).closest('td').find('span').html();
 		var str = "";
 		var xVal = 0;
 		$(".class2_"+racec+"_val").html('');
 		 $( ".class2_"+racec  ).each(function( index ) {
 			var x= $(this).closest('td').next('td').find('select');
 			str += x.val();		
 			if(x.val() == 'X')
 				{
 				xVal = 1;
 				}
 		
 		});
 		 if(xVal == 1)
 			 {
 			 $(".class2_"+racec+"_val").html('X');
 			 }
 		 else
 		 {
 			 $(".class2_"+racec+"_val").html('');	 
 		 }
 		 if(str.length == 4)
 			 {
 		 var fChart = chart[str.toLowerCase()];
 		 $(".class2_"+racec+"_val").html(fChart);
 			 }
 		 else
 		 {
 			 $(".class2_"+racec+"_val").html('');	 
 		 }
 	   	 	
 			return false;
 		}
    	 
    	 
   	 	if($(this).val().toUpperCase() == "X")
    		{
    		/* $(this).closest('td').append('<input type="text">'); */
    		$(this).closest('td').append('<textarea class="form-control dynamictextarea" rows="1" cols="4" maxlength="100"></textarea><div>Maximum 100 characters</div>');
    		var x= $(this).closest('td').next('td').find('select');
   		$(x).val('X');
    		}
   	 	else
   	 		{
   	 		$(this).closest('td').find('textarea').not('.class2').remove();	
   	 	$(this).closest('td').find('div').not('.class2').remove();
   	 var x= $(this).closest('td').next('td').find('select');
		$(x).val($(this).val());
   	 		}
		 
	 
   	 	
   	 
	 	var chart = JSON.parse('${Chart}');
	 	var racec = $(this).closest('td').find('span').html();
	var str = "";
	var xVal = 0;
	$(".class2_"+racec+"_val").html('');
	 $( ".class2_"+racec  ).each(function( index ) {
		var x= $(this).closest('td').next('td').find('select');
		str += x.val();		
		if(x.val() == 'X')
			{
			xVal = 1;
			}
	
	});
	 if(xVal == 1)
		 {
		 $(".class2_"+racec+"_val").html('X');
		 }
	 else
	 {
		 $(".class2_"+racec+"_val").html('');	 
	 }
	 if(str.length == 4)
		 {
	 var fChart = chart[str.toLowerCase()];
	 $(".class2_"+racec+"_val").html(fChart);
		 }
	 else
	 {
		 $(".class2_"+racec+"_val").html('');	 
	 }
   	 	
   	 	
		
		});
     
     
     $(".class3, .class_3").change(function() {
    	 
    	 
    	 var cls = $(this).attr('class').split(" ");
    	 var id_ = "#"+$(this).attr('id')+" option:selected";
 		var b= false;
 		var specialStem = false;
 		for(i=0;i<cls.length;i++)
 			{
 			if(cls[i] == 'class_3')
 				{
 				b = true;
 				}
 			
 			if(cls[i] == 'SPECIAL' && ($(id_).text()) =='2+')
 				{
 				specialStem = true;
 				}
 			
 			}
 		if(b == true) // class found
 		{
 			
    	 	var chart = JSON.parse('${Chart}');
    	 	var racec = $(this).closest('td').find('span').html();
    	var str = "";
    	var xVal = 0;
    	$(".class3_"+racec+"_val").html('');
    	 $( ".class3_"+racec  ).each(function( index ) {
    		var x= $(this).closest('td').next('td').find('select');
    		str += x.val();		
    		if(x.val() == 'X')
    			{
    			xVal = 1;
    			}
    	
    	});
    	 if(xVal == 1)
    		 {
    		 $(".class3_"+racec+"_val").html('X');
    		 }
    	 else
    	 {
    		 $(".class3_"+racec+"_val").html('');	 
    	 }
    	 if(str.length == 4)
    		 {
    	 var fChart = chart[str.toLowerCase()];
    	 $(".class3_"+racec+"_val").html(fChart);
    		 }
    	 else
    	 {
    		 $(".class3_"+racec+"_val").html('');	 
    	 }
    	 
    	 return false;
 	 	 
 		}
    	 
    		if($(this).val().toUpperCase() == "X")
    		{
    		/* $(this).closest('td').append('<input type="text">'); */
    		$(this).closest('td').append('<textarea class="form-control dynamictextarea" rows="1" cols="4" maxlength="100"></textarea><div>Maximum 100 characters</div>');
    		var x= $(this).closest('td').next('td').find('select');
   		   $(x).val('X');
    		}
   	 	   else
   	 		{
   	 		$(this).closest('td').find('textarea').not('.class3').remove();	
   	 	$(this).closest('td').find('div').not('.class3').remove();
   	 var x= $(this).closest('td').next('td').find('select');
		$(x).val($(this).val());
   	 		}
 		
    		
    		
    	 	var chart = JSON.parse('${Chart}');
    	 	var racec = $(this).closest('td').find('span').html();
    	var str = "";
    	var xVal = 0;
    	$(".class3_"+racec+"_val").html('');
    	 $( ".class3_"+racec  ).each(function( index ) {
    		var x= $(this).closest('td').next('td').find('select');
    		str += x.val();		
    		if(x.val() == 'X')
    			{
    			xVal = 1;
    			}
    	
    	});
    	 if(xVal == 1)
    		 {
    		 $(".class3_"+racec+"_val").html('X');
    		 }
    	 else
    	 {
    		 $(".class3_"+racec+"_val").html('');	 
    	 }
    	 if(str.length == 4)
    		 {
    	 var fChart = chart[str.toLowerCase()];
    	 $(".class3_"+racec+"_val").html(fChart);
    		 }
    	 else
    	 {
    		 $(".class3_"+racec+"_val").html('');	 
    	 }
    	 
    	 
 	 	 
    	 if(specialStem == true)
    		 {
    		 $(this).closest('td').next('td').find('select').val('h');
    		 }
 		
 		});
     
     
         $(".class4, .class_4").change(function() {
        	 
        	 
        	 var cls = $(this).attr('class').split(" ");
      		
      		var b= false;
      		for(i=0;i<cls.length;i++)
      			{
      			if(cls[i] == 'class_4')
      				{
      				b = true;
      				}
      			}
      		if(b == true) // class found
      		{
      			 
           	 var chart = JSON.parse('${Chart}');
        	 	var racec = $(this).closest('td').find('span').html();
        	var str = "";
        	var xVal = 0;
        	$(".class4_"+racec+"_val").html('');
        	 $( ".class4_"+racec  ).each(function( index ) {
        		var x= $(this).closest('td').next('td').find('select');
        		str += x.val();		
        		if(x.val() == 'X')
        			{
        			xVal = 1;
        			}
        	
        	});
        	 if(xVal == 1)
        		 {
        		 $(".class4_"+racec+"_val").html('X');
        		 }
        	 else
        	 {
        		 $(".class4_"+racec+"_val").html('');	 
        	 }
        	 if(str.length == 4)
        		 {
        	 var fChart = chart[str.toLowerCase()];
        	 $(".class4_"+racec+"_val").html(fChart);
        		 }
        	 else
        	 {
        		 $(".class4_"+racec+"_val").html('');	 
        	 }
        	 
        	 return false;
      		}
        	 
        	 if($(this).val().toUpperCase() == "X")
     		{
     		/* $(this).closest('td').append('<input type="text">'); */
     		$(this).closest('td').append('<textarea class="form-control dynamictextarea" rows="1" cols="4" maxlength="100"></textarea><div>Maximum 100 characters</div>');
     		var x= $(this).closest('td').next('td').find('select');
    		   $(x).val('X');
     		}
    	 	   else
    	 		{
    	 		$(this).closest('td').find('textarea').not('.class4').remove();	
    	 		$(this).closest('td').find('div').not('.class4').remove();
    	 		var x= $(this).closest('td').next('td').find('select');
    	 		$(x).val($(this).val());
    	 		}
       		
     	 	 	 
        	 
        	 
        	 var chart = JSON.parse('${Chart}');
     	 	var racec = $(this).closest('td').find('span').html();
     	var str = "";
     	var xVal = 0;
     	$(".class4_"+racec+"_val").html('');
     	 $( ".class4_"+racec  ).each(function( index ) {
     		var x= $(this).closest('td').next('td').find('select');
     		str += x.val();		
     		if(x.val() == 'X')
     			{
     			xVal = 1;
     			}
     	
     	});
     	 if(xVal == 1)
     		 {
     		 $(".class4_"+racec+"_val").html('X');
     		 }
     	 else
     	 {
     		 $(".class4_"+racec+"_val").html('');	 
     	 }
     	 if(str.length == 4)
     		 {
     	 var fChart = chart[str.toLowerCase()];
     	 $(".class4_"+racec+"_val").html(fChart);
     		 }
     	 else
     	 {
     		 $(".class4_"+racec+"_val").html('');	 
     	 }
     	 
     	  	
     	 		});
         
         
         $(".class5, .class_5").change(function() {
        	 
        	 
        	 var cls = $(this).attr('class').split(" ");
       		
       		var b= false;
       		for(i=0;i<cls.length;i++)
       			{
       			if(cls[i] == 'class_5')
       				{
       				b = true;
       				}
       			}
       		if(b == true) // class found
       		{
       		 
           	 
           	 
         	 	var chart = JSON.parse('${Chart}');
         	 	var racec = $(this).closest('td').find('span').html();
         	var str = "";
         	var xVal = 0;
         	$(".class5_"+racec+"_val").html('');
         	 $( ".class5_"+racec  ).each(function( index ) {
         		var x= $(this).closest('td').next('td').find('select');
         		str += x.val();		
         		if(x.val() == 'X')
         			{
         			xVal = 1;
         			}
         	
         	});
         	 if(xVal == 1)
         		 {
         		 $(".class5_"+racec+"_val").html('X');
         		 }
         	 else
         	 {
         		 $(".class5_"+racec+"_val").html('');	 
         	 }
         	 if(str.length == 4)
         		 {
         	 var fChart = chart[str.toLowerCase()];
         	 $(".class5_"+racec+"_val").html(fChart);
         		 }
         	 else
         	 {
         		 $(".class5_"+racec+"_val").html('');	 
         	 }
         	 return false;
         	 
       		}
       		
        	 
        	 if($(this).val().toUpperCase() == "X")
     		{
     		/* $(this).closest('td').append('<input type="text">'); */
     		$(this).closest('td').append('<textarea class="form-control dynamictextarea" rows="1" cols="4" maxlength="100"></textarea><div>Maximum 100 characters</div>');
     		var x= $(this).closest('td').next('td').find('select');
    		   $(x).val('X');
     		}
    	 	   else
    	 		{
    	 		$(this).closest('td').find('textarea').not('.class5').remove();	
    	 		$(this).closest('td').find('div').not('.class5').remove();
    	 		var x= $(this).closest('td').next('td').find('select');
    	 		$(x).val($(this).val());
    	 		}
        		
        	 
        	 
        	 
      	 	var chart = JSON.parse('${Chart}');
      	 	var racec = $(this).closest('td').find('span').html();
      	var str = "";
      	var xVal = 0;
      	$(".class5_"+racec+"_val").html('');
      	 $( ".class5_"+racec  ).each(function( index ) {
      		var x= $(this).closest('td').next('td').find('select');
      		str += x.val();		
      		if(x.val() == 'X')
      			{
      			xVal = 1;
      			}
      	
      	});
      	 if(xVal == 1)
      		 {
      		 $(".class5_"+racec+"_val").html('X');
      		 }
      	 else
      	 {
      		 $(".class5_"+racec+"_val").html('');	 
      	 }
      	 if(str.length == 4)
      		 {
      	 var fChart = chart[str.toLowerCase()];
      	 $(".class5_"+racec+"_val").html(fChart);
      		 }
      	 else
      	 {
      		 $(".class5_"+racec+"_val").html('');	 
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
		infectionTypeHtml  += '<option value="'+infectionType[keys1[i]].toLowerCase()+'">'+keys1[i]+'</option>';
		if(!hlhtml.includes(infectionType[keys1[i]]))
			{
			hlhtml += infectionType[keys1[i]]+",";
			drophlhtml  += '<option value="'+infectionType[keys1[i]].toLowerCase()+'">'+ infectionType[keys1[i]]+'</option>';
			}
		
		}
	
	infectionTypeHtml  += '<option value="X">X</option>';
	drophlhtml  += '<option value="X">X</option>';
	
	
	
	
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
				
				
				
				var rustType_ = '${RustTypeId}';
				var class_ = "";
				var seqNo = js.SeqNo;
				
				// condition for stem 12 sl no special case
				if( (rustType_ == 1 || rustType_ == '1')  && (seqNo == 12 || seqNo == '12')  )
					{
					class_ = "SPECIAL";
					}
				
				
				if(j==0)
					{
				html_ += '  <tr>'+
				     '<td rowspan="'+innerJsa.length+'" align="center">'+
			     +(i+1)+
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
			     +gen+
			     '</td>'+
			     '<td>'
			     +low+
			     '</td>'+
			     '<td style="width:10%;height:50%;">'+
			     //'<input class="tdclass class'+(i+1)+'" type="text" size="1" id="fname'+counter+'" >'+
			     '<select class="tdclass class'+(i+1)+' class'+(i+1)+'_'+k+'" id="fname'+counter+'_'+k+'">'+infectionTypeHtml+'</select><span style="display:none;">'+k+'</span>'+
			  
			     '</td>'+
'			      <td>'+
			     //'<input class="hlclass class_'+(i+1)+'" type="text" size="1" id="gname'+counter+'" maxlength="1" >'+
			     '<select class="hlclass class_'+(i+1)+'" id="gname'+counter+'_'+k+'">'+drophlhtml+'</select><span style="display:none;">'+k+'</span>'+
			     '</td>'+
			      '<td rowspan="'+innerJsa.length+'" align="center">'+
'			      <p class="class'+(i+1)+'_'+k+'_val" style="font-weight:bold"></p><span style="display:none;" id="repeatation_analysis_inoculation_'+k+'_'+counter+'">'+inoculationId+'</span>'+
				'<span style="display:none;" id="repeatation_analysis_'+k+'_'+counter+'">${AnalysisId}</span><span style="display:none;" id="repeatation_wheatline_'+k+'_'+counter+'">'+js.ID+'</span>'+
			     '</td>'+
			     '</tr>';
					}
				else
					{
					html_ += '<tr>'+
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
				     +gen+
				     '</td>'+
				     '<td>'
				     +low+
				     '</td>'+
				     '<td style="width:10%;height:50%;">'+
				     //'<input class="tdclass class'+(i+1)+'" type="text" size="1"  id="fname'+counter+'" >'+
				     '<select class="tdclass class'+(i+1)+' class'+(i+1)+'_'+k+' '+class_+'" id="fname'+counter+'_'+k+'">'+infectionTypeHtml+'</select><span style="display:none;">'+k+'</span>'+
				     '</td>'+
				      '<td>'+
				     //'<input class="hlclass class_'+(i+1)+'" id="gname'+counter+'" type="text" size="1" maxlength="1" >'+
				     '<select class="hlclass class_'+(i+1)+'" id="gname'+counter+'_'+k+'">'+drophlhtml+'</select><span style="display:none;">'+k+'</span>'+
				     ' <span style="display:none;" id="repeatation_analysis_inoculation_'+k+'_'+counter+'">'+inoculationId+'</span><span style="display:none;" id="repeatation_analysis_'+k+'_'+counter+'">${AnalysisId}</span><span style="display:none;" id="repeatation_wheatline_'+k+'_'+counter+'">'+js.ID+'</span>'+
					'</td>'+
				     '</tr>';
					}
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
				for(j=0;j<repeatation.length;j++)
					{
						var InfType = repeatation[j].InfType;
						var HL = repeatation[j].HL;
						var remark = repeatation[j].Remark;
						
						var InfTypeid_ = '.class'+Math.ceil( ((j+1)/4) )+'_'+k;		
						//$(InfTypeid_+" "+"option[value="+InfType+"]").attr('selected', 'selected');
						var sr = $(InfTypeid_);
						var act = sr[(j)%4];
						st += HL;
						if((j)%4 == 3)
							{
							var chart = JSON.parse('${Chart}');
							
							var fChart = chart[st.toLowerCase()];
							//alert(JSON.stringify(chart)+"    "+st+"    "+fChart);
							st = st.toLowerCase();
							if(st.includes('x'))
								{
								$('.class'+Math.ceil( ((j+1)/4) )+'_'+k+'_val').html('X');	
								}
							else
								{
							$('.class'+Math.ceil( ((j+1)/4) )+'_'+k+'_val').html(fChart);
								}
							st = "";
							}
						var x= $(act).closest('td').next('td').find('select');
						
						 if(InfType == 'X')
							{
							 $(act).closest('td').append('<textarea class="form-control dynamictextarea" rows="1" cols="4" maxlength="100">'+remark+'</textarea><div>Maximum 100 characters</div>');
							} 
						x.val(HL);
						var cou = (rJsa.length-2);
						if(cou >= k)
							{
							$(x).attr("disabled", "disabled");
							$(act).attr("disabled", "disabled");
							$(act).closest('td').find('textarea').attr("disabled", "disabled");
							$('#inoculationDate'+k).attr("disabled", "disabled");
							$('#recordingDate'+k).attr("disabled", "disabled");
							}
						var options = act.options;
						for(l=0;l<options.length;l++)
							{
							if(options[l].text == InfType)
								{
								options[l].setAttribute('selected', 'selected');


								}
							}
						
					 
					}
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
			$("#longitude").html(SurveyJSON.longitudeId);
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