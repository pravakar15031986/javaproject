<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
function numbersonly(e){
    var unicode=e.charCode? e.charCode : e.keyCode;
    if ( ( (unicode>47)&&(unicode<58) ) || unicode == 9 || unicode == 8 || unicode == 46)
            return true;
    else {
    	 swal(
					'Error',
					'This field accepts numbers only!',
					'error'
				)
    	//swal('This field accepts numbers Only!');
    	return false;
    }
}

function numbers(e){
	var keyCode = e.which ? e.which : e.keyCode
	if (!(keyCode >= 48 && keyCode <= 57)) {
		swal(
				'Error',
				'This field accepts numbers only!',
				'error'
			)
	return false;
    }else{
    return true;
	}

}
</script>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <c:if test="${Update eq true || monitorId ne 0}">
                     <h4>Edit Recommendation Survey</h4>
                     </c:if>
                     
                     <c:if test="${Update eq false || monitorId eq 0}">
                     <h4>Add Recommendation Survey</h4>
                     </c:if>
                     
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Monitor Implementation</li>
                           <li class="breadcrumb-item active" aria-current="page">Recommendation Survey</li>
                        </ol>
                     </nav>
                  </div>
                  
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="woredaExpertImplementation">Add</a>
                           </ul>
                           <div class="indicatorslist">
                             <c:if test="${Update eq true || monitorId ne 0}">
		                     <a  title="" href="viewImplementation" id="backIcon" onclick="history.back()" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
		                     </c:if>
		                     
		                     <c:if test="${Update eq false || monitorId eq 0}">
		                     <a  title="" href="woredaExpertImplementation" id="backIcon" onclick="history.back()" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
		                     </c:if>
                             <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                       
                        
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                         <input type="hidden" name="recomendId" value="${recommendation.recomendId}" id="recomId">
                        <input type="hidden" name="recomendNoBean" value="${recommendation.recomendNoBean}" id="recomNo">
                        <input type="hidden" name="loginUserId" value="${recommendation.loginUserId}" id="userId">   
                        <form action="saveImplementationData" id="myForm" autocomplete="off" method="POST">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        
                         
                         <input type="text" id="jsonencode" name="jsonencode" style="display:none;">
                         <c:if test="${Update eq true }">
						 <input type="text"  autocomplete="off"  style="display:none;" name="monitorId" id="monitorId" value="${monitorId }">
						 </c:if>
						 <c:if test="${ Update eq false}">
						 <input type="text"  autocomplete="off"  style="display:none;" name="monitorId" id="monitorId" value="${monitorId }">
						 </c:if> 
                        <div class="card-body">
                       
                           <!--Static-->
                           <b style="font-size: 20px;">Recommendation No. : ${recommendation.recomendNoBean}</b>
                            
                            <div class="">
                          <h3>Monitor Implementation of Recommendations Details</h3>
								<div class="form-row">
									<div class="form-group col-md-5">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Region <span class="text-danger">*</span></label>
											<div class="col-12 col-md-8 col-xl-8">
			                                 <span class="colon">:</span>
			                                 <select class="form-control"  id="regionId">
			                                     <option value="-1">--Select--</option>
			                                     
			                                     <c:if test="${recomType eq 1 }">
			                                    <c:forEach items="${DemographList}" var="demographList">
			                                   <option value="${ demographList[0]}">${ demographList[1]}</option>
			                                    </c:forEach>
			                                    </c:if>
			                                     
			                                    <c:if test="${recomType eq 2 }">
			                                    <c:forEach items="${regionList}" var="demographList">
			                                   <option value="${ demographList.demographyId}">${ demographList.demographyName}</option>
			                                    </c:forEach>
			                                    </c:if>
			                                    
			                                 </select>
			                              </div>
										</div>
									</div>
									<div class="form-group col-md-5 offset-md-1">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Zone <span class="text-danger">*</span></label>
			                                <div class="col-12 col-md-8 col-xl-8">
			                                 <span class="colon">:</span>
			                                 <select class="form-control" id="zoneId">
			                                    <option value="-1">--Select--</option>
			                                   <c:forEach items="${zoneList}" var="demographList">
			                                   <option value="${ demographList.demographyId}">${ demographList.demographyName}</option>
			                                    </c:forEach>
			                                 </select>
			                              </div>
										</div>
									</div>
								</div>
								
								<div class="form-row">
									<div class="form-group col-md-5">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label"
												for="demo-email-input">Woreda <span
												class="text-danger">*</span></label>
											<div class="col-12 col-md-8 col-xl-8">
												<span class="colon">:</span> 
												<select class="form-control" id="woredaId">
													<option value="-1">--Select--</option>
													<c:forEach items="${woredaList}" var="demographList">
														<option value="${ demographList.demographyId}">${ demographList.demographyName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group col-md-5  offset-md-1">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label"
												for="demo-readonly-input">Kebele <span
												class="text-danger">*</span></label>
											<div class="col-12 col-md-8 col-xl-8">
												<span class="colon">:</span>
												<div class="dropdown-container">
													<div class="dropdown-button noselect">
														<div class="dropdown-label"></div>
														<div class="dropdown-quantity">
															<span class="quantity"></span>
														</div>
														<i class="fa fa-caret-down pull-right"></i>
													</div>
													<div class="dropdown-list" style="display: none;">
														<input type="search" placeholder="Search Kebele"
															class="dropdown-search">
														<ul>
															<li>
																<div class="checkbox">
																	<input id="demo-form-checkbox0_kebeleId"
																		class="magic-checkbox selectkebel nocheck"
																		type="checkbox"> <label
																		for="demo-form-checkbox0_kebeleId"></label>
																</div> <label for="AL">Select All</label>
															</li>
															<li id="kebeleId"></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="form-row">
									<div class="form-group col-md-5">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label"
												for="demo-email-input">Type of Rust <span
												class="text-danger">*</span></label>
											<div class="col-12 col-md-8 col-xl-8" id="rust">
												<span class="colon">:</span>

												<div class="dropdown-container">
													<div class="dropdown-button noselect">
														<div class="dropdown-label"></div>
														<div class="dropdown-quantity">
															<span class="quantity"></span>
														</div>
														<i class="fa fa-caret-down pull-right"></i>
													</div>
													<div class="dropdown-list" style="display: none;">
														<input type="search" placeholder="Search Rust"
															class="dropdown-search" />
														<ul>
															<li>
																<div class="checkbox">
																	<input id="demo-form-checkbox3_rust"
																		class="magic-checkbox selectall nocheck"
																		type="checkbox"> <label
																		for="demo-form-checkbox3_rust"></label>
																</div> <label for="AL">Select All</label>
															</li>
															<c:forEach items="${RustTypeList}" var="rustlist"
																varStatus="loop">
																<li>
																	<div class="checkbox">
																		<input id="check_rust_${rustlist.intRustTypeId }"
																			value="${rustlist.intRustTypeId }"
																			class="magic-checkbox individual" type="checkbox"
																			name="rustId"> <label
																			for="check_rust_${rustlist.intRustTypeId }"></label>
																	</div> <label for="check_rust_${rustlist.intRustTypeId }"
																	id="check_val_${rustlist.intRustTypeId }">${ rustlist.vchRustType}</label>
																</li>
															</c:forEach>
														</ul>
													</div>
												</div>

											</div>
										</div>
									</div>
									<div class="form-group col-md-5  offset-md-1">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label"
												for="demo-email-input">Variety of Crop Affected <span
												class="text-danger">*</span></label>
											<div class="col-12 col-md-8 col-xl-8" id="variety">
												<span class="colon">:</span>

												<div class="dropdown-container">
													<div class="dropdown-button noselect">
														<div class="dropdown-label"></div>
														<div class="dropdown-quantity">
															<span class="quantity"></span>
														</div>
														<i class="fa fa-caret-down pull-right"></i>
													</div>
													<div class="dropdown-list" style="display: none;">
														<input type="search"
															placeholder="Search Variety of Crop Affected"
															class="dropdown-search" />
														<ul>
															<li>
																<div class="checkbox">
																	<input id="demo-form-checkbox11_variety"
																		class="magic-checkbox addall nocheck" type="checkbox">
																	<label for="demo-form-checkbox11_variety"></label>
																</div> <label for="AL">Select All</label>
															</li>
															<c:forEach items="${VarietyList}" var="varietylist"
																varStatus="loop">
																<li>
																	<div class="checkbox">
																		<input
																			id="check_variety_${varietylist.varietyTypeId }"
																			value="${varietylist.varietyTypeId }"
																			class="magic-checkbox variety" type="checkbox"
																			name="varietyId"> <label
																			for="check_variety_${varietylist.varietyTypeId }"></label>
																	</div> <label
																	for="check_variety_${varietylist.varietyTypeId }"
																	id="check_variety_label_${varietylist.varietyTypeId }">${ varietylist.vchDesc}</label>
																</li>
															</c:forEach>

														</ul>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>

								<div class="form-row">
									<div class="form-group col-md-5">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label"
												for="demo-readonly-input">Incidences (%) <span
												class="text-danger">*</span></label>
											<div class="col-12 col-md-8 col-xl-8">
												<span class="colon">:</span> <input type="text"
													id="incidences" class="form-control" placeholder=""
													maxlength="20" onkeypress="return numbersonly(event)">
											</div>
										</div>
									</div>
									<div class="form-group col-md-5  offset-md-1">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label"
												for="demo-email-input">Severity (%) <span
												class="text-danger">*</span></label>
											<div class="col-12 col-md-8 col-xl-8">
												<span class="colon">:</span> <input type="text"
													id="severity" class="form-control" placeholder=""
													maxlength="20" onkeypress="return numbersonly(event)">
											</div>
										</div>
									</div>
								</div>

								<div class="form-row">
									<div class="form-group col-md-5">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label"
												for="demo-email-input">Crop Growth Stage <span
												class="text-danger">*</span></label>
											<div class="col-12 col-md-8 col-xl-8" id="growthId">
												<span class="colon">:</span>

												<div class="dropdown-container">
													<div class="dropdown-button noselect">
														<div class="dropdown-label"></div>
														<div class="dropdown-quantity">
															<span class="quantity"></span>
														</div>
														<i class="fa fa-caret-down pull-right"></i>
													</div>
													<div class="dropdown-list" style="display: none;">
														<input type="search"
															placeholder="Search Crop Growth Stage"
															class="dropdown-search" />
														<ul>
															<li>
																<div class="checkbox">
																	<input id="demo-form-checkbox20_growthId"
																		class="magic-checkbox cropstageAll nocheck"
																		type="checkbox"> <label
																		for="demo-form-checkbox20_growthId"></label>
																</div> <label for="AL">Select All</label>
															</li>
															<c:forEach items="${GrowthList}" var="growthlist"
																varStatus="loop">
																<li>
																	<div class="checkbox">
																		<input
																			id="check_growthId_${growthlist.intCrGrStageId }"
																			value="${growthlist.intCrGrStageId }"
																			class="magic-checkbox growthId" type="checkbox"
																			name="growthStageId"> <label
																			for="check_growthId_${growthlist.intCrGrStageId }"></label>
																	</div> <label
																	for="check_growthId_${growthlist.intCrGrStageId }"
																	id="check_cropstage_label_${growthlist.intCrGrStageId }">${ growthlist.vchStage}</label>
																</li>
															</c:forEach>

														</ul>
													</div>
												</div>

											</div>
										</div>
									</div>
									<div class="form-group col-md-5  offset-md-1">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label"
												for="demo-email-input">Sowing Land(ha) <span
												class="text-danger">*</span></label>
											<div class="col-12 col-md-8 col-xl-8">
												<span class="colon">:</span> <input type="text"
													id="sowingLand" class="form-control" placeholder=""
													maxlength="20" onkeypress="return numbersonly(event)">
											</div>
										</div>
									</div>
								</div>

								<div class="form-row">
									<div class="form-group col-md-5">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label"
												for="demo-text-input">Total Area Infected (ha) <span
												class="text-danger">*</span></label>
											<div class="col-12 col-md-8 col-xl-8">
												<span class="colon">:</span> <input type="text"
													id="totalArea" class="form-control" placeholder=""
													maxlength="20" onkeypress="return numbersonly(event)">
											</div>
										</div>
									</div>
									<div class="form-group col-md-5  offset-md-1">
										<div class="row">
											<label class="col-12 col-md-4 col-xl-4 control-label"
												for="demo-text-input">Total Area Controlled(ha) <span
												class="text-danger">*</span></label>
											<div class="col-12 col-md-8 col-xl-8">
												<span class="colon">:</span> <input type="text"
													id="totalAreaControlled" class="form-control"
													placeholder="" maxlength="20"
													onkeypress="return numbersonly(event)">
											</div>
										</div>
									</div>
								</div>
							
                           </div>
                           
                           
                          
                         
                           <div class="col-md-11 p-0">
                           <table class="table  table-bordered" id="tablecount">
					      <thead>
					      <tr>
						      <th>Type of Fungicide</th>
						      <th>Fungicide Used (kg(lit))</th>
						      <th>Action</th>
					      </tr>
					      </thead>
					      <tbody>
					      <tr>
						      <td><select class="form-control" id="fungicideId">
                                    <option value="0">--Select--</option>
                                    <c:forEach items="${FungiList}" var="fungiList">
                                   <option value="${ fungiList.fungicideId}">${ fungiList.fungicideName}</option>
                                    </c:forEach>
                                 </select></td>
						      <td><input type="text" id="fungicideUsed" class="form-control" placeholder="" maxlength="20" onkeypress="return numbersonly(event)"></td>
						      <td><input type="button" id="demo-text-input1" value="Add" class="btn btn-success" onclick="return addRow('dataTable');" ></td>
					       </tr>
					     </tbody>
					    </table>
                           
			           <div id="subMainDiv">													
					   <div class="tablesec">
						<div class="table-responsive">
					    <table id="dataTable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered">
							<tr>
								<th>Sl#</th>
								<th>Type of Fungicide</th>
								<th>Fungicide Used (kg(lit))</th>
								<th>Action</th>
							</tr>														
			                 
							</table>
						</div>
					</div>
					</div>
					
					   
                          <h3>Numbers of farmers participated on spraying</h3>
                         
					
					   <table class="table  table-bordered">
					      <thead>
					      <tr>
						      <th>Male Farmers</th>
						      <th>Female Farmers</th>
						      <th>Total Farmers</th>
					      </tr>
					      </thead>
					      <tbody>
					      <tr>
						      <td><input type="text" id="maleId" maxlength="3" class="form-control" placeholder="" onblur="calculationtotalFarmers()" onkeypress="return numbers(event)"></td>
						      <td><input type="text" id="femaleId" maxlength="3" class="form-control" placeholder="" onblur="calculationtotalFarmers()" onkeypress="return numbers(event)"></td>
						      <td><input type="text" id="total" class="form-control" placeholder=""  readonly="readonly"></td>
					       </tr>
					     </tbody>
					    </table> 
                           </div>
					      
                          
               
                       
					                          
                          
                              <div class="form-group row" >
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnSubmitId" onclick="return checkSubmit()">
								 <c:if test="${Update eq true || monitorId ne 0}">
								 Update
								 </c:if>
								 <c:if test="${ Update eq false &&  monitorId eq 0}">
								 Submit
								 </c:if>
								 </button>
								 
								  <c:if test="${Update eq true}">
								  <a class="btn btn-danger mb-1"  href="viewImplementation">Cancel</a>
								 </c:if>
								 <c:if  test="${Update eq false}">
								  <button type="reset" class="btn btn-danger mb-1" id="btnBack1">Reset</button>
								   
								 </c:if>
							  </div>
							  
					     </div>
                          
                        </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>


 		
        function checkSubmit(){
        
       // $(document).ready(function(){
         	
       	//$(document).on('click', '#btnSubmitId', function(e) {
           	 
    		 var regionval = $("#regionId").val();
    		 if(regionval == '-1'){
    			 swal(
    						'Error',
    						'Please select a Region',
    						'error'
    					).then(function(){
    	 	       $("#regionId").focus();
    					});
    	 	       return false; 
    		 }
    		 
    		 var zoneval = $("#zoneId").val();
    		 if(zoneval == '-1'){
    			 swal(
    						'Error',
    						'Please select a Zone',
    						'error'
    					).then(function(){
    	 	       $("#zoneId").focus();
    					});
    	 	       return false; 
    		 }
    		 
    		 var woredaval = $("#woredaId").val();
    		 if(woredaval == '-1'){
    			 swal(
    						'Error',
    						'Please select a Woreda',
    						'error'
    					).then(function(){
    	 	       $("#woredaId").focus();
    					});
    	 	       return false; 
    		 }

    		 	var checked = $("input[name=kebeleId]:checked").length;
    			if(checked== '0')
    			{
    				swal(
    						'Error',
    						'Please select at least one kebele ',
    						'error'
    						)
    				   		   		
    							$("#kebeleId").focus();
    						
    		   		return false;
    			}

    		 var locationDetails = new Array();
    		 

    		 $('.kebelcheck').each(function(){
    				var chkStatus = $(this).prop("checked");
    				if(chkStatus == true)
    					{
    					var regionId = $("#regionId").val();
    					var zoneId = $("#zoneId").val();
    					var woredaId = $("#woredaId").val();
    					var json = {"regionId":regionId,"zoneId":zoneId,"woredaId":woredaId,"kebeleId":$(this).val()};
    					locationDetails.push(json);
    					}
    			});

    		 //alert(JSON.stringify(locationDetails));
    		 
    		 var checked = $("input[name=rustId]:checked").length;
    			if(checked== '0')
    			{
    				swal(
    						'Error',
    						'Please select at least one type of rust ',
    						'error'
    						).then(function() 
    				   		   		{
    							$("#rust").focus();
    						});
    		   		return false;
    			}

    			 var checked = $("input[name=varietyId]:checked").length;
     			if(checked== '0')
     			{
     				swal(
     						'Error',
     						'Please select at least one variety of crop affected ',
     						'error'
     						).then(function() 
     				   		   		{
     							$("#variety").focus();
     						});
     		   		return false;
     			}
    		
           var rustDetails = new Array();
    		 

    		 $('.individual').each(function(){
    				var chkStatus = $(this).prop("checked");
    				if(chkStatus == true)
    					{
    					var json = {"rustId":$(this).val()};
    					rustDetails.push(json);
    					}
    			});
    		// alert(JSON.stringify(rustDetails));
    		 var varietyDetails = new Array();
    		 $('.variety').each(function(){
    				var chkStatus = $(this).prop("checked");
    				if(chkStatus == true)
    					{
    					var json = {"varietyId":$(this).val(),"varietyName":$("#check_variety_label_"+$(this).val()).html()};
    					varietyDetails.push(json);
    					}
    			});
    		
    		    //alert(JSON.stringify(varietyDetails));

    		    var incidencesVal = $("#incidences").val();
       		 if(incidencesVal == ''){
       			 swal(
       						'Error',
       						'Please enter incidences',
       						'error'
       					).then(function(){
       	 	       $("#incidences").focus();
       					});
       	 	       return false; 
       		 }
       		 
       		 
       		 var severityVal = $("#severity").val();
       		 if(severityVal == ''){
       			 swal(
       						'Error',
       						'Please enter Severity',
       						'error'
       					).then(function(){
       	 	       $("#severity").focus();
       					});
       	 	       return false; 
       		 }

       		 var checked = $("input[name=growthStageId]:checked").length;
  			if(checked== '0')
  			{
  				swal(
  						'Error',
  						'Please select at least one crop growth stage  ',
  						'error'
  						).then(function() 
  				   		   		{
  							$("#growthId").focus();
  						});
  		   		return false;
  			}
    		    var growthDetails = new Array();
    			 

    			 $('.growthId').each(function(){
    					var chkStatus = $(this).prop("checked");
    					if(chkStatus == true)
    						{
    						var json = {"growthId":$(this).val()};
    						growthDetails.push(json);
    						}
    				});
    			// alert(JSON.stringify(growthDetails));
  
    		 
    		 var sowingLandVal = $("#sowingLand").val();
    		 if(sowingLandVal == ''){
    			 swal(
    						'Error',
    						'Please enter sowing land ',
    						'error'
    					).then(function(){
    	 	       $("#sowingLand").focus();
    					});
    	 	       return false; 
    		 }
    		 
    		 var totalAreaVal = $("#totalArea").val();
    		 if(totalAreaVal == ''){
    			 swal(
    						'Error',
    						'Please enter total area infected ',
    						'error'
    					).then(function(){
    	 	       $("#totalArea").focus();
    					});
    	 	       return false; 
    		 }
    		 
    		 var totalAreaControlledVal = $("#totalAreaControlled").val();
    		 if(totalAreaControlledVal == ''){
    			 swal(
    						'Error',
    						'Please enter total area controlled ',
    						'error'
    					).then(function(){
    	 	       $("#totalAreaControlled").focus();
    					});
    	 	       return false; 
    		 }
            
    		 if(parseInt(totalAreaControlledVal) > parseInt(totalAreaVal)){
    			 swal(
    						'Error',
    						'Total area controlled should not be greater than total area infected ',
    						'error'
    					).then(function(){
    	 	       $("#totalAreaControlled").focus();
    					});
    	 	       return false; 
    		 }

             if(fungicideDetails.length == 0)
     		{
     		$("#fungicideId").focus();
     		swal(
     				'Error!',
     				'Please provide at least 1 fungicide details.',
     				'error'
     			) .then(function(){
     				$("#fungicideId").focus();
     			});
     		return false;
     		}
    		 
    		 var maleIdVal = $("#maleId").val();
    		 if(maleIdVal == ''){
    			 swal(
    						'Error',
    						'Please enter male farmers ',
    						'error'
    					).then(function(){
    	 	       $("#maleId").focus();
    					});
    	 	       return false; 
    		 }
    	
    		 var femaleIdVal = $("#femaleId").val();
    		 if(femaleIdVal == ''){
    			 swal(
    						'Error',
    						'Please enter female farmers ',
    						'error'
    					).then(function(){
    	 	       $("#femaleId").focus();
    					});
    	 	       return false; 
    		 }
    		 
          var totalfar = $("#total").val();
   		 var kebelejsa = new Array();
   		
   					var json = {"recomId":$("#recomId").val(),"recomNo":$("#recomNo").val(),"woredaId":woredaval,"severity":severityVal,"incidences":incidencesVal,"sowingLand":sowingLandVal,
   		   					"infectedLand":totalAreaVal,"controlledArea":totalAreaControlledVal,"malef":maleIdVal,"femalef":femaleIdVal,"totalf":totalfar};
   			        kebelejsa.push(json);		
   			    			
   			//alert(JSON.stringify(kebelejsa));
   			var finalJson  = {"kebelejsa":kebelejsa,"locationDetails":locationDetails,"rustDetails":rustDetails,"varietyDetails":varietyDetails,"growthDetails":growthDetails,"loginUserId":$("#userId").val(),
   			"fungicideDetails":fungicideDetails};
   			//alert(JSON.stringify(finalJson));
   		 //$("#jsonencode").val(btoa(finalJson));
   		console.log(JSON.stringify(finalJson));
		var dataString = btoa(JSON.stringify(finalJson));
		$("#jsonencode").val(dataString);
		var message = ('${monitorId}' != 0 || '${monitorId}' != '0')?'update ?' : 'submit ?';
   		 
   		swal({
			title: "Do you want to "+message,  
			type: "warning",
			confirmButtonText: "Yes",
			showCancelButton: true,
			cancelButtonText: "No",
	    })
	    	.then((result) => {
				if (result.value) {
					
					 
				$("#myForm").submit(); 
		
					
				} 
			})
		return false;

       //	});

       // }); 

        }
   function calculationtotalFarmers(a,b) {
	var tmale =  $("#maleId").val();
	var tfmale =  $("#femaleId").val();
	 if(tmale=='' || tfmale=='' ){
		 $("#total").val('');
			return false;
	  }
	var tmalefemale = parseInt( tmale ) + parseInt( tfmale ) ;
	$("#total").val(tmalefemale);
	  
	  
   }
</script>
<script>
$(document).ready(function(){
	
	$("#dataTable").hide();
	$("#dataTable1").hide();

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
		.on('change', '[type="checkbox"]', function() {/* 
	        var container = $(this).closest('.dropdown-container');
	        var numChecked = container. find('[type="checkbox"]:checked').length;
	    	container.find('.quantity').text(numChecked || 'Any'); */


			var attrId = $(this).attr("id");
	        var container = $(this).closest('.dropdown-container');
			 
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
	        	
	        	if(attrId.includes("rust") && numChecked == 0 )
		        	{
	        		container.find('.quantity').text('');
		        	}
	        	if(attrId.includes("rust"))
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
        		
		        	if(attrId.includes("variety") && numChecked == 0 )
		        	{
	        		container.find('.quantity').text('');
		        	}
	        	if(attrId.includes("variety"))
	        		{
	        		var valu = "";
	        		if(val1 != undefined && val1 != null  && val1.trim() != '')
	    			{
	        		valu += " , "+$("#check_variety_label_"+val1).html();
	    			}
	        		if(val2 != undefined && val2 != null  && val2.trim() != '')
	    			{
	        		valu +=  " , "+$("#check_variety_label_"+val2).html();
	    			}
	        		if(val3 != undefined && val3 != null  && val3.trim() != '')
	    			{
	        		valu +=  " , "+$("#check_variety_label_"+val3).html();
	    			}
	        		if(val4 != undefined && val4 != null  && val4.trim() != '')
	    			{
	        		valu +=  " , "+$("#check_variety_label_"+val4).html();
	    			}
	        		container.find('.quantity').text("");
	        		container.find('.quantity').text(valu.substring(2,valu.length));
	        		}

	        	
		        	if(attrId.includes("growthId") && numChecked == 0 )
		        	{
	        		container.find('.quantity').text('');
		        	}
	        	if(attrId.includes("growthId"))
	        		{
	        		var valu = "";
	        		if(val1 != undefined && val1 != null  && val1.trim() != '')
	    			{
	        		valu += " , "+$("#check_cropstage_label_"+val1).html();
	    			}
	        		if(val2 != undefined && val2 != null  && val2.trim() != '')
	    			{
	        		valu +=  " , "+$("#check_cropstage_label_"+val2).html();
	    			}
	        		if(val3 != undefined && val3 != null  && val3.trim() != '')
	    			{
	        		valu +=  " , "+$("#check_cropstage_label_"+val3).html();
	    			}
	        		if(val4 != undefined && val4 != null  && val4.trim() != '')
	    			{
	        		valu +=  " , "+$("#check_cropstage_label_"+val4).html();
	    			}
	        		container.find('.quantity').text("");
	        		container.find('.quantity').text(valu.substring(2,valu.length));
	        		}

		        	if(attrId.includes("kebeleId") && numChecked == 0 )
		        	{
	        		container.find('.quantity').text('');
		        	}
	        	if(attrId.includes("kebeleId"))
	        		{
	        		var valu = "";
	        		if(val1 != undefined && val1 != null  && val1.trim() != '')
	    			{
	        		valu += " , "+$("#check_kebele_label_"+val1).html();
	    			}
	        		if(val2 != undefined && val2 != null  && val2.trim() != '')
	    			{
	        		valu +=  " , "+$("#check_kebele_label_"+val2).html();
	    			}
	        		if(val3 != undefined && val3 != null  && val3.trim() != '')
	    			{
	        		valu +=  " , "+$("#check_kebele_label_"+val3).html();
	    			}
	        		if(val4 != undefined && val4 != null  && val4.trim() != '')
	    			{
	        		valu +=  " , "+$("#check_kebele_label_"+val4).html();
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
	    	<%-- '<input name="<%= abbreviation %>" type="checkbox">' +
	    	'<label for="<%= abbreviation %>"><%= capName %></label>' + --%>
	    '</li>'
	);

	// Populate list with states
	_.each(usStates, function(s) {
	    s.capName = _.startCase(s.name.toLowerCase());
	    $('ul').append(stateTemplate(s));
	});
	

});


var fungicideDetails = [];
function addRow(tableID) {
	
	var v1=$('#fungicideId').val();
	var vt1=$("#fungicideId :selected").text();
	if(v1=='0'){
		 swal(
					'Error',
					'Please select a type of fungicide ',
					'error'
				)
		$("#fungicideId").focus();
		return false;	
	}
	var v2=$('#fungicideUsed').val();
    if(v2==''){
   	 swal(
				'Error',
				'Please enter fungicide used ',
				'error'
			).then(function(){
		$("#fungicideUsed").focus();
			});
		return false;	
    }

    //
    
    for(var i = 0; i < fungicideDetails.length; i++) {
        var cur = fungicideDetails[i];
        if(cur.fungicideId == v1 ) {
        	swal(
    				'Error',
    				'Already added '+vt1+' type !!',
    				'error'
    			)
    		return false;
        }
 	}
    
    var v5='<a href="javascript:void(0);" onclick="clearRow(this,\'' + v1 + '\');" class="btn btn-danger">Delete</a>';
    $("#dataTable").show();
   
    var table = document.getElementById(tableID);

    var rowCount = table.rows.length;
   
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    cell1.innerHTML = (rowCount>1)?rowCount-1:rowCount;

    var cell2 = row.insertCell(1);
    cell2.innerHTML = vt1;

    var cell3 = row.insertCell(2);
    cell3.innerHTML = v2;

    /* var cell4 = row.insertCell(3);
    cell4.innerHTML = v3;
	
    var cell5 = row.insertCell(4);
    cell5.innerHTML = v4; */
	
    var cell4 = row.insertCell(3);
    cell4.innerHTML = v5; 
	
    fungicideDetails.push({ 
        "fungicideId" : v1,
        "fungicideUsed" : v2/* ,
        "severityId" : v3,
        "reaction"   : v4 */
}); 
   // alert(fungicideDetails);
    //alert(JSON.stringify(fungicideDetails));
    //total count show in table
    
    var rowCount = $('#dataTable tr').length;
    var count = 0;
    for(i=1;i<rowCount;i++)
    	{
    	if(document.getElementById("dataTable").rows[i].cells[0].innerHTML != '')
    		{
    		count += parseFloat(document.getElementById("dataTable").rows[i].cells[2].innerHTML)
    		}
    	}
    var tblHtml = "<tr><td></td><td><b>Total</b></td><td>"+count+"</td><td></td></tr>";
    if(rowCount > 2)
    	{
    	document.getElementById("dataTable").deleteRow(rowCount-2);
    	}
    
    $("#dataTable").append(tblHtml);
    // end
    clearData2();
	       
	       
}

function clearData2(){
	$('#fungicideId').val('0');
	$('#fungicideUsed').val('');
	//$('#severityId').val('');
	//$('#reactionId').val('Select');
	
	
	
}

function clearRow(currElement,fungicideId){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 
	 for(var i = 0; i < fungicideDetails.length; i++) {
	        var cur = fungicideDetails[i];
	        if(cur.fungicideId == fungicideId ) {
	        	fungicideDetails.splice(i, 1);
	          break;
	        }
	 }

	
    	
	 
	 document.getElementById("dataTable").deleteRow(parentRowIndex);
		// updateIndex();
	 count=$('table#dataTable tr').length;
	 if(count==2){
	   	$("#dataTable").hide();
	 }

	 var rowCount = $('#dataTable tr').length;
	    var count = 0;
	    for(i=1;i<rowCount;i++)
	    	{
	    	if(document.getElementById("dataTable").rows[i].cells[0].innerHTML != '')
	    		{
	    		document.getElementById("dataTable").rows[i].cells[0].innerHTML = i;
	    		}
	    	}


	    showTotal();
	 
}

function showTotal()
{
	var rowCount = $('#dataTable tr').length;
    var count = 0;
    for(i=1;i<rowCount;i++)
    	{
    	if(document.getElementById("dataTable").rows[i].cells[0].innerHTML != '')
    		{
    		count += parseFloat(document.getElementById("dataTable").rows[i].cells[2].innerHTML)
    		}
    	}
    var tblHtml = "<tr><td></td><td><b>Total</b></td><td>"+count+"</td><td></td></tr>";
    if(rowCount > 1)
    	{
    	document.getElementById("dataTable").deleteRow(rowCount-1);
    	}
    
    $("#dataTable").append(tblHtml);
}

function updateIndex() 
{	//
    $("#dataTable tr").each(function(){
    //	alert('hii'+$(this).index() + 1);
      $( this ).find( "td" ).first().html($(this).index() + 1 );
    });
}





</script>
<script>




	 
	 document.getElementById("dataTable1").deleteRow(parentRowIndex);
		// updateIndex();
	 count=$('table#dataTable1 tr').length;
	 if(count==2){
	   	$("#dataTable1").hide();
	 }
	 
}

function updateIndex1() 
{	//
    $("#dataTable1 tr").each(function(){
    //	alert('hii'+$(this).index() + 1);
      $( this ).find( "td" ).first().html($(this).index() + 1 );
    });
}



function numbersonly(e){
    var unicode=e.charCode? e.charCode : e.keyCode;
    if ( ( (unicode>47)&&(unicode<58) ) || unicode == 9 || unicode == 8 || unicode == 46)
            return true;
    else {
    	 swal(
					'Error',
					'This field accepts numbers only!',
					'error'
				)
    	//swal('This field accepts numbers Only!');
    	return false;
    }
}
</script>

<script>
$(document).ready(function(){
	<c:if test="${recomType eq 2}">
	$("#regionId").change(function()
   			{
   		
   		var val_ = $(this).val();
   		var recomId=$("#recomId").val();
  		 $("#woredaId").val('-1');
   		$("#woredaId").change();
   	 var dataString = 'parentId='+ val_;
	 $.ajax({
	 	type: "POST",
        /* url : 'getDemographicListZone', */
        url : 'getDemographicListZoneinRecom',
        /* data: dataString, */
        data:{"regionId":val_,
        	"recomId":recomId},
        async:false,
		cache: false,
        success : function(data) { 
        	//alert(data)
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
		 var html = '<option value="-1">--Select--</option>';
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
		var recomId=$("#recomId").val();
   		var val_ = $(this).val();
   		$("#woredaId").val('-1');
   		$("#woredaId").change();
   	 var dataString = {"regionId": $('#regionId').val(),"zoneId": val_,"recomId":recomId};
	 $.ajax({
	 	type: "POST",
        /* url : 'getDemographicListWoreda', */
        url : 'getDemographicListWoredainRecom',
        data: btoa(JSON.stringify(dataString)),
        contentType: "text/xml", 
		cache: false,
		async:false,
        success : function(data) { 
        	//alert(data)
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

	$("#woredaId").change(function()
   			{
   		
   		var val_ = $(this).val();
   		 
   		var recomId=$("#recomId").val();
   	 var dataString = {"regionId": $('#regionId').val(),
   			 "woredaId": val_,
   			 "zoneId":$("#zoneId").val(),
   			 "recomId":recomId};
   	 
	 $.ajax({
	 	type: "POST",
        /* url : 'getDemographicListKebele', */
        url : 'getKebeleListInRecom',
        data: btoa(JSON.stringify(dataString)),
        contentType: "text/xml", 
		cache: false,
		async:false,
        success : function(data) {
            //alert(data);
        	$("#kebeleId").val("-1");
        	$("#kebeleId").find('option').not(':first').remove();
            var html = '';
			var len = data.length;
			/* console.log(len)
			console.log(data)
			console.log((data[0])[0]) */
		if (data.length != 0 ){
			for ( var i = 0; i < len; i++) {
			
				/* html += '<option value="' + data[i].demographyId + '">'
						+ data[i].demographyName + '</option>'; */
                        //console.log(data[i].[1]);
						html=html+" <li><div class='checkbox'>";
						html=html+"<input type='checkbox' id='check_kebeleId_"+(data[i])[0]+"' value="+(data[i])[0]+"  class='magic-checkbox kebelcheck' name='kebeleId' />";
						html=html+"<label for='check_kebeleId_"+(data[i])[0]+"'></label></div>";
						html=html+"<label for='check_kebeleId_"+(data[i])[0]+"' id='check_kebele_label_"+(data[i])[0]+"'> "+(data[i])[1]+"</label></li>"; 
						/* <label for="check_rust_${rustlist.intRustTypeId }" id="check_val_${rustlist.intRustTypeId }">${ rustlist.vchRustType}</label> */
			}
       	    $('#kebeleId').html(html); 
       	   // console.log(html);
		}else{
		 var html = '';
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
	</c:if>	
	<c:if test="${recomType eq 1 }">
	$("#regionId").change(function()
   			{
   		
   		var val_ = $(this).val();

  		 $("#woredaId").val('-1');
   		$("#woredaId").change();
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
		 var html = '<option value="-1">--Select--</option>';
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
   		$("#woredaId").val('-1');
   		$("#woredaId").change();
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

	$("#woredaId").change(function()
   			{
   		
   		var val_ = $(this).val();
   		 
   		
   	 var dataString = {"regionId": $('#regionId').val(),"woredaId": val_,"zoneId":$("#zoneId").val()};
	 $.ajax({
	 	type: "POST",
        url : 'getDemographicListKebele',
        data: btoa(JSON.stringify(dataString)),
        contentType: "text/xml", 
		cache: false,
		async:false,
        success : function(data) {
           // alert(data);
        	$("#kebeleId").val("-1");
        	$("#kebeleId").find('option').not(':first').remove();
            var html = '';
			var len = data.length;
		if (data.length != 0 ){
			for ( var i = 0; i < len; i++) {
			
				/* html += '<option value="' + data[i].demographyId + '">'
						+ data[i].demographyName + '</option>'; */
                        console.log(data[i].demographyName);
						html=html+" <li><div class='checkbox'>";
						html=html+"<input type='checkbox' id='check_kebeleId_"+data[i].demographyId+"' value="+data[i].demographyId+"  class='magic-checkbox kebelcheck' name='kebeleId' />";
						html=html+"<label for='check_kebeleId_"+data[i].demographyId+"'></label></div>";
						html=html+"<label for='check_kebeleId_"+data[i].demographyId+"' id='check_kebele_label_"+data[i].demographyId+"'> "+data[i].demographyName+"</label></li>"; 
						/* <label for="check_rust_${rustlist.intRustTypeId }" id="check_val_${rustlist.intRustTypeId }">${ rustlist.vchRustType}</label> */
			}
       	    $('#kebeleId').html(html); 
       	    console.log(html);
		}else{
		 var html = '';
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
	</c:if>
});
</script>

<script>
	$(function(){

		   $(".selectall").click(function(){
			$(".individual").prop("checked",$(this).prop("checked"));
			});
		
		
	});

	$(function(){

		   $(".selectkebel").click(function(){
			$(".kebelcheck").prop("checked",$(this).prop("checked"));
			});
		
		
	});
	
$(function(){

	   $(".addall").click(function(){
		$(".variety").prop("checked",$(this).prop("checked"));
		});
	
	
});

$(function(){

		   $(".cropstageAll").click(function(){
			$(".growthId").prop("checked",$(this).prop("checked"));
			});
		
		
	});



$(document).ready(function()
		{
			
		var MonitorJSON = '${MonitorJSON}';
		MonitorJSON = atob(MonitorJSON);
		MonitorJSON = JSON.parse(MonitorJSON);
		
		$("#incidences").val(MonitorJSON.incidencespc);
		$("#severity").val(MonitorJSON.severitypc);
		$("#sowingLand").val(MonitorJSON.sowingland);
		$("#totalArea").val(MonitorJSON.infectedland);
		$("#totalAreaControlled").val(MonitorJSON.controlledland);
		$("#maleId").val(MonitorJSON.malefarmer);
		$("#femaleId").val(MonitorJSON.femalefarmer);
		$("#total").val(MonitorJSON.totalfarmer);
		$("#regionId").val(MonitorJSON.regionId);
		$("#regionId").change();
		$("#zoneId").val(MonitorJSON.zoneId);
		$("#zoneId").change();
		$("#woredaId").val(MonitorJSON.woredaId);
		$("#woredaId").change();
		$("#kebeleId").val(MonitorJSON.kebeleId);
		$("#kebeleId").change();

		// rust 
		for(i=0;i<MonitorJSON.rustJsa.length;i++)
		{
			var json_ = MonitorJSON.rustJsa[i];
			var val_ = json_.rustId;
			$("#check_rust_"+val_).click();
		}

		// variety 
		for(i=0;i<MonitorJSON.varietyjsa.length;i++)
		{
			var json_ = MonitorJSON.varietyjsa[i];
			var val_ = json_.varietyId;
			$("#check_variety_"+val_).click();
		}

		// grothStage 
		for(i=0;i<MonitorJSON.grothStagejsa.length;i++)
		{
			var json_ = MonitorJSON.grothStagejsa[i];
			var val_ = json_.grothId;
			$("#check_growthId_"+val_).click();
		}

		// location 
		for(i=0;i<MonitorJSON.locjsa.length;i++)
		{
			var json_ = MonitorJSON.locjsa[i];
			var regionval = json_.regionId;
			var zoneval = json_.zoneId;
			var woredaval = json_.woredaId;
			//var val_ = json_.kebeleId;
			
			$("#regionId").val(regionval);
			$("#regionId").change();
			$("#zoneId").val(zoneval);
			$("#zoneId").change();
			$("#woredaId").val(woredaval);
			$("#woredaId").change();
			
			//$("#check_kebeleId_"+val_).click();
		}

		for(i=0;i<MonitorJSON.locjsa.length;i++)
		{
			var json_ = MonitorJSON.locjsa[i];
			var val_ = json_.kebeleId;
			$("#check_kebeleId_"+val_).click();
		}
		
//fungicide
			for(i=0;i<MonitorJSON.fungijsa.length;i++)
			{ 
				var  fungicideId = MonitorJSON.fungijsa[i].fungiId;
				var  fungicideUsed = MonitorJSON.fungijsa[i].fungiUsed;
				var b = false;
			 for(var i = 0; i < fungicideDetails.length; i++) {
			        var cur = fungicideDetails[i];
			        if(cur.fungicideId == fungicideId ) {
			        	b = true;
			        }
			 	}
		    if(b)
			{
			continue;
			}
				$("#fungicideId").val(fungicideId);
				
				$("#fungicideUsed").val(fungicideUsed);
				//$("#severityId").val(severityId);
				//$("#rustTypeId").change();
				//$("#reactionId").val(reactionId);
				 $("#demo-text-input1").click();
			   
				
				}

		
	
		});


</script>




