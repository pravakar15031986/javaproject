<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Odisha Paddy Land Monitor</title>
<link rel="stylesheet" type="text/css" href="wrsis/css/style.css">
<link rel="stylesheet" type="text/css"
	href="wrsis/css/dataTables.bootstrap4.min.css" />
	<style>
	.table-responsive{
	margin-top:-3rem;
	}
	div.dataTables_wrapper div.dataTables_info{padding-top:0px}
	 .hideshowdiv {
            display: none;
            padding: 10px;
    		background-color: #fff;
        }

        .accordianBtn {
            width: 100%;
            padding: 8px 10px;
		    background-color: #f6f6f6;
		    border-bottom: 2px solid white;
        }
      
        .toogleIcon{
            float: right;
        }
        .accordianBtn:hover{
            cursor: pointer;
        }
        
         #spotlight .footer {width: 100%;text-align: center;}
        
        .acc_heading{color:#5a5a5a; font-size:18px; font-weight:500}
.acc_heading + span i{margin-top: 5px}
.hideshowdiv select.form-control {
    border: 1px solid #ddd;
    box-shadow: none;
}
.survey_tbl thead tr th{text-align:center; vertical-align:middle; font-size:18px;}
/* .survey_tbl tbody tr td{font-size:18px;} */
/* .viewDetails {font-size:16px!important}
.mapview{font-size:16px!important} */
	</style>
<script src="wrsis/js/jquery.dataTables.min.js"></script>
<script src="wrsis/js/dataTables.bootstrap4.min.js"></script>
<script src="/wrsis/js/bootstrap.min.js" defer></script>
</head>
<body>
	<div class="mainpanel">
		<div class="section">
			<div class="page-title">
				<div class="title-details">
					<h4>View Survey Report</h4>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="Home"><span
									class="icon-home1"></span></a></li>
							<li class="breadcrumb-item">Survey Report</li>
							<li class="breadcrumb-item active" aria-current="page">Survey
								Report</li>
						</ol>
					</nav>
				</div>

			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<ul class="nav nav-tabs nav-fill" role="tablist">
								<!-- <a class="nav-item nav-link " href="addGlobalLink">Add</a> -->
								<a class="nav-item nav-link active" href="viewSurveyReport">Survey Report</a>
							</ul>

						</div>
						<!-- Search Panel -->
						<form:form method="post" action="viewSurveyReport" modelAttribute="viewSurveyreport" autocomplete="off">
							<div class="search-container survey_report">
								<div class="search-sec">
									<div class="row ascr_view">

										<!-- <label for="inputJTitle" class="col-lg-3 col-md-5 col-sm-12 col-form-label label-left">Beneficiary Number<span class="text-danger">*</span> </label> -->
										<div class="col-lg-3 col-md-7 col-sm-12 mt-3">
											<form:select id="distId" class="form-control" path="districtId">
												<form:option value="0">--Select District--</form:option>
												<c:if test="${not empty districtList}">
												
													<form:options items="${districtList}" itemValue="districtId" itemLabel="districtName"/>
												
												</c:if>
												<c:if test="${not empty distCode}">
													<form:option value='${distCode}'>${distname}</form:option>
												</c:if> 
											</form:select>
										</div>

											<div class="col-lg-3 col-md-7 col-sm-12 mt-3">
											<form:select class="form-control" id="pacsId" path="pacsId">
												<form:option value="0">-- Select Society --</form:option>
												 <form:options items="${pacsList}" itemValue="pacsId" itemLabel="pacsName"/>

											</form:select>
										</div>


										<!-- <label for="inputJTitle" class="col-lg-3 col-md-5 col-sm-12 col-form-label label-left mt-3">Programme Name<span class="text-danger">*</span> </label> -->
										<div class="col-lg-3 col-md-7 col-sm-12 mt-3">
											<form:select class="form-control" id="tahasilId" path="tahasilId">
												<form:option value="0">-- Select Tehsil --</form:option>
												<form:options items="${tahasilList}" itemValue="tahasilId" itemLabel="tahsilName"/>

											</form:select>
										</div>
										<!--  <label for="inputJTitle" class="col-lg-3 col-md-5 col-sm-12 col-form-label label-left mt-3">Organization Name<span class="text-danger">*</span> </label> -->
										<div class="col-lg-3 col-md-7 col-sm-12 mt-3">
											<form:select class="form-control" id="villageId" path="villageId">
												<form:option value="0">-- Select Village --</form:option>
												<form:options items="${VillageList}" itemValue="villageId" itemLabel="villageName"/>
											</form:select>
										</div>

										<div class="col-lg-3 col-md-7 col-sm-12 mt-3">
											<form:select class="form-control" path="crop_status">
												<form:option value="0">-- Select Plot Category --</form:option>
												<form:option value="1">Paddy Cultivated</form:option>
												<form:option value="2">Paddy Not Cultivated</form:option>
												<form:option value="3">Not a crop land</form:option>
											</form:select>
										</div>
										<div class="col-lg-3 col-md-7 col-sm-12 mt-3">
											<form:input type="text" class="form-control"
												placeholder="Enter Plot No." path="plot_no"/>
										</div>


										

										<div class="col-lg-3 col-md-7 col-sm-12 mt-3">
											<div class="input-group">
												<form:input type="text" class="form-control datepicker"
													placeholder=" Select From Date" id="inputDate" value=""
													path="fromDate"/>
												<div class="input-group-prepend">
													<label class="input-group-text" for="inputDate"><i
														class="fa fa-calendar"></i></label>
												</div>
											</div>
										</div>
										<div class="col-lg-3 col-md-7 col-sm-12 mt-3">
											<div class="input-group">
												<form:input type="text" class="form-control datepicker"
													placeholder=" Select To Date" id="inputDate" value=""
													path="todate"/>
												<div class="input-group-prepend">
													<label class="input-group-text" for="inputDate"><i
														class="fa fa-calendar"></i></label>
												</div>
											</div>
										</div>
										<div class="col-lg-3 col-md-7 col-sm-12 mt-3">
											<form:select class="form-control" path="status">
												<form:option value="0">-- Select Status --</form:option>
												<form:option value="1">Pending</form:option>
												<form:option value="2">Approved</form:option>
												<form:option value="3">Rejected</form:option>
											</form:select>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 mt-4 text-center ">
											<button type="submit"
												class="btn btn-primary btn-md m-0 waves-effect waves-light"
												id="button2">Search</button>
										</div>
									</div>
						</form:form>


					</div>
					<div class="text-center">
						<a class="searchopen" title="" data-toggle="tooltip"
							data-placement="bottom" data-original-title="Search"> <i
							class="icon-angle-arrow-down"></i>
						</a>
					</div>
				</div>
				<div class="card-body">
				 <p class="count_section"><!-- <strong>Total Count : <span class="count_color">1076</span></strong> -->
              	<span class="red_dot">( <span></span> ) Recently Visited</span>
              </p>
					<!--  <p class=""><strong>Total Count : <span class="count_color">1076</span></strong></p> -->
    <div class="table-responsive survey_tbl ">
        <table class="table table-bordered viewTbl">
            <thead>
                <tr>
                    <th rowspan="2">Sl#</th>
                    <th rowspan="2">Plot No. / Khatian No.</th>
                    <th rowspan="2">Total Plot Area<br/><small>(In Acre)</small></th>
                    <th rowspan="2">Society Jurisdiction</th>
               
                    <th rowspan="2">Identified through satellite</th>
                    <th colspan="5">Reported from field Survey using app</th>
                    <th rowspan="2">Validation by Higher Authority</th>
                    <th rowspan="2" width="250px">View</th>
                 
                </tr>
                <tr>
                	<th>Result</th>
                	<th>Actual Cultivated Area<small>(In %)</small></th>
                	<th>Nearby Fields</th>
                	<th>Survey Date / Time</th>
                	<th>Position of Surveyor</th>
                <!-- 	<th></th> -->
                </tr>
            </thead>
            <tbody>
            <c:forEach var="listValue" items="${surveyReportDataList}"
									varStatus="myIndex">
            	<tr>
            		<td><c:out value="${(myIndex.index)+1}" /></td>
            		<td class="font-weight-bold activeClass">${listValue.plotNo}/${listValue.khataNo}</td>
            		<td>${listValue.total_area}</td>
            		<td>${listValue.villageName},${listValue.tahasilName},${listValue.distname}</td>
            		<td>${listValue.surveyReason}</td>
            		<td><c:if test="${listValue.cropStatus eq 1}">
												<span class="text-success">Paddy Cultivated</span>
											</c:if> <c:if test="${listValue.cropStatus eq 2}">
												<span class="text-warning">Paddy Not Cultivated</span>
											</c:if> <c:if test="${listValue.cropStatus eq 3}">
												<span class="text-danger">Not a crop land</span>
											</c:if></td>
            		<td>${listValue.area_valid}</td>
            		<td><c:if test="${listValue.nearbyfield eq 1}">
												<span class="text-success">Paddy Cultivated</span>
											</c:if> <c:if test="${listValue.nearbyfield eq 2}">
												<span class="text-danger">Paddy Not Cultivated</span>
											</c:if></td>
            		<td>${listValue.survey_time}</td>
            		<td><c:if test="${listValue.position eq 1}">
												<span class="text-success">Inside the plot</span>
											</c:if> <c:if test="${listValue.position eq 2}">
												<span class="text-warning">From the boundary</span>
											</c:if> <c:if test="${listValue.position eq 3}">
												<span class="text-danger">Away from the plot</span>
											</c:if></td>
            		<td><c:if test="${listValue.status eq 1}">
												<span class="text-warning">Pending</span>
											</c:if> <c:if test="${listValue.status eq 2}">
												<span class="text-success">Approved</span>
											</c:if> <c:if test="${listValue.status eq 3}">
												<span class="text-danger">Rejected</span>
											</c:if></td>
            		<td>
            			<a data-placement="top" data-toggle="tooltip" data-title="View Details" href="#" pid="${listValue.plot_code}" class="mb-2 btn btn-sm btn-primary waves-effect waves-light viewDetails mr-0">View Details</a>
                    	<a data-placement="top" data-toggle="tooltip" data-title="View Map" href="#" class="mb-2 btn btn-sm btn-warning waves-effect waves-light mr-0 mapview">View Map</a>
            		</td>
            	</tr>
            	</c:forEach>
            	
            	  
            	
            	  
            	
            	
            </tbody>
         
        </table>
    </div>
				</div>

				<!-- Submit Modal started-->
				<form action="actionOnSurveyDetails" method="post">
					<div class="modal fade" id="submitModal" tabindex="-1"
						role="dialog" aria-labelledby="submitModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header bg-maroon-700">
									<h5 class="modal-title text-white" id="submitModalLabel">View
										Plot Details</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span class="text-white" aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								<div class='accordianBtn'>
        <span class="acc_heading text-success"> Plot Details</span><span><i class="fa fa-minus toogleIcon" aria-hidden="true"></i></span>
    </div>
    <div class='hideshowdiv' style="display: block;">
	      <div class="row">
                              <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Plot No.</label>
                                    <input type="text" class="form-control" id="pltno" disabled>
                                 </div>
                              </div>
                              <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Khatian No. </label>
                                    <input type="text" class="form-control" id="khtNo" disabled>
                                 </div>
                              </div>
                              <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Crop Status</label>
                                    <input type="text" class="form-control" id="crStus" disabled>
                                 </div>
                              </div>
       							 <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Society Jurisdiction</label>
                                    <input type="text" class="form-control" id="sjd" disabled>
                                 </div>
                              </div>                   
       
                              <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Total Plot Area (in Acr) </label>
                                    <input type="text" class="form-control" id="tpa" disabled>
                                 </div>
                              </div>
                            <!--   <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Reported Cultivated Area (in Acr)</label>
                                    <input type="text" class="form-control" value="2.2" disabled>
                                 </div>
                              </div> -->
                              <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Actual  Area (in %)</label>
                                    <input type="text" class="form-control" id="aca" disabled>
                                 </div>
                              </div>
                           </div>
    </div>
    <div class='accordianBtn'>
        <span class="acc_heading text-success">Surveyor Details</span><span><i class="fa fa-plus toogleIcon" aria-hidden="true"></i></span>
    </div>
    <div class='hideshowdiv'>
	   <div class="row">
                                       <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Surveyor Name</label>
                                    <input type="text" class="form-control" id="name" disabled>
                                 </div>
                              </div>
                               <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Surveyor Designation</label>
                                    <input type="text" class="form-control" id="desig" value="Field Surveyor" disabled>
                                 </div>
                              </div>
                               <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Mobile No.</label>
                                    <input type="text" class="form-control" id="mob" disabled>
                                 </div>
                              </div>
                               <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Surveyor Position</label>
                                    <input type="text" class="form-control" id="sp" disabled>
                                 </div>
                              </div>
                              <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Survey Distance (in m)</label>
                                    <input type="text" class="form-control" id="surd" disabled>
                                 </div>
                              </div>
                               <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Reason For Survey</label>
                                    <input type="text" class="form-control" id="sr" disabled>
                                 </div>
                              </div>
                      
                               <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Surveyor Selfie</label>
                                 <div class="spotlight-group">
                                 
									<a class="spotlight" href="" id="selfeLink"> <!-- <i class="fa fa-search" aria-hidden="true"></i> -->
									<img src="" id="selfeImg" class="accordian_img">
									</a>
									</div>
                                 </div>
                              </div>
                            
                                       </div>
    </div>
    <div class='accordianBtn'>
        <span class="acc_heading text-success">Device Details During Survey</span><span><i class="fa fa-plus toogleIcon" aria-hidden="true"></i></span>
    </div>
    <div class='hideshowdiv'>
		       <div class="row">
                                       <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Mobile Device Id</label>
                                    <input type="text" class="form-control" id="deviceId" disabled>
                                 </div>
                              </div>
                               <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Mobile No.</label>
                                    <input type="text" class="form-control" id="mobNum" disabled>
                                 </div>
                              </div>
                              <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Latitude</label>
                                    <input type="text" class="form-control" id="lat" disabled>
                                 </div>
                              </div>
                              <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Longitude</label>
                                    <input type="text" class="form-control" id="long" disabled>
                                 </div>
                              </div>
                               <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Date / Time of Survey</label>
                                    <input type="text" class="form-control" id="surt" disabled>
                                 </div>
                              </div>
                               <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Synced to Server On</label>
                                    <input type="text" class="form-control" id="sso" disabled>
                                 </div>
                              </div>
                              
                                <div class="col-12 col-sm-6 col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">Plot Photo</label>
                                   <div class="spotlight-group">
                                   <div class="image_box ">
																	<a class="spotlight latd" href="" id="landImage1Link" > <!-- <i class="fa fa-search" aria-hidden="true"></i> -->
																		<img src="" id="LandImage1" class="accordian_img">
																	</a>
																	<div class="lat_div">
			                                	<span class="latImg"> </span>
			                                	<span class="d-block dat"></span>
			                                </div>
																	<div id="otherLandImg"></div>

																</div>
																</div>
                                 </div>
                              </div>
                             
                               
                                       </div>
    </div>
    <div class='accordianBtn'>
        <span class="acc_heading text-success">Final Plot Survey Status By Officer</span><span><i class="fa fa-plus toogleIcon" aria-hidden="true"></i></span>
    </div>
    <div class='hideshowdiv'>
    	 <div class="row">
          <div class="col-12 col-sm-6 col-md-4 blankDiv">
															<div class="form-group">
																<label class="control-label">Final Survey Status
																	<span class="text-danger">*</span>
																</label> <select class="form-control" name="status"
																	id="fsstatus">
																	<option value="0">-- Select Status --</option>
																	<option value="2">Approve</option>
																	<option value="3">Reject</option>
																</select>
															</div>
															 </div>
       <div class="col-12 col-sm-8 col-md-8 blankDiv">
															<div class="form-group rDiv" style="display: none;">
																<label class="control-label">Remark <span
																	class="text-danger">*</span></label> <input type="text"
																	class="form-control" id="remark" name="remark"
																	maxlength="100"> <input type="hidden" id="pc"
																	name="plot_code" />
															</div>
														</div>
															<div class="col-12 col-sm-8 col-md-8 prDiv " style="display: none;">
															<div class="form-group">
																<label class="control-label">Status <span
																	class="text-danger">*</span></label> <input type="text"
																	class="form-control" id="afStatus"
																	maxlength="100" readonly> 
															</div>
														</div>
      
    </div>

								</div>
								<div class="modal-footer">
									<button type="submit"
										class="btn btn-md btn-info waves-effect waves-light"
										id="statusSubmitBtn">Submit</button>

									<!-- <button type="button" class="btn btn-md btn-danger waves-effect waves-light"  data-dismiss="modal">Reject</button> -->
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	</div>
 <input  type="hidden" value="${message}" id="messageId"/>
	<script src="wrsis/js/spotlight.bundle.js"></script>
	<script>
    	$(document).ready(function(){
    		
    		   if($("#messageId").val()!=''){
    		    	swal({
    					
    					  text: $("#messageId").val(),  
    					  icon: "success",
    					  button: "Close",
    					})
    		    }
    		//search-form
    		$('.searchform').hide();
    			$('.searchbtn').click(function(){
    				$('.searchform').slideToggle();
    				$('.searchbtn .fa').toggleClass('fa-chevron-down fa-chevron-up');
    				if ($('.searchbtn span').text() == "Hide")
    				   $('.searchbtn span').text("Search")
    				else
    				   $('.searchbtn span').text("Hide");		
    			});
    			//search-form end
    	})
    </script>

	<script>
    	$(document).ready(function(){
    		
    		
    	    $('.searchform').show();
    	    
    	    $(".viewDetails").on("click",function(){
    	    var plotCode=$(this).attr("pid");
    	    	//$("#submitModal").modal('show');
    	    	$(this).parent().parent().siblings().find('.visited').removeClass("visited");
    	    	$(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().addClass("visited");
    	    	//.addClass("visited");
    	    	   $.ajax({
    	   			type : "POST",
    	   			url : "fetchPlotDetailsByPlotCode",
    	   			data : 'plotcode='+plotCode,
    	   			cache : false,
    	   			timeout : 600000,
    	   			success : function(response) {
    	   				console.log(response);
    	   				
    	   				$("#pltno").val(response.plotNo);
    	   				$("#khtNo").val(response.khataNo);
    	   				$("#crStus").val(response.cropStatus);
    	   				$("#sp").val(response.position);
    	   				$("#surd").val(response.distance);
    	   				$("#tpa").val(response.total_area);
    	   				$("#aca").val(response.area_valid);
    	   				$("#name").val(response.name);
    	   				$("#sjd").val(response.villageName+","+response.tahasilName+","+response.distname)
    	   				
    	   				$("#sr").val(response.surveyReason);
    	   				$("#mob").val(response.mobile);
    	   				$("#selfeImg").attr("src","data:image/jpeg;base64,"+response.selfeImage);
    	   				$("#selfeLink").attr("href","data:image/jpeg;base64,"+response.selfeImage);
    	   				$("#LandImage1").attr("src","data:image/jpeg;base64,"+response.fieldPhoto1);
    	   				$("#landImage1Link").attr("href","data:image/jpeg;base64,"+response.fieldPhoto1);
    	   				$("#landImage1Link").attr("data-description",parseFloat(response.latitude).toFixed(6)+","+parseFloat(response.longitude).toFixed(6)+" "+new Date(response.survey_time).toLocaleString("en-US").replace(",","") );
    	   				$(".latImg").text(parseFloat(response.latitude).toFixed(6)+","+parseFloat(response.longitude).toFixed(6));
    	   				$(".dat").text(new Date(response.survey_time).toLocaleString("en-US").replace(",","") );
    	   				var landImageArr=[];
    	   				
    	   				var html='';
                            
    	   				//debugger;
    	   				$("#otherLandImg").text('');
    	   				if(response.fieldPhoto2!=""){
    	   					landImageArr.push(response.fieldPhoto2);
    	   				}
    	   				if(response.fieldPhoto3!=""){
    	   					landImageArr.push(response.fieldPhoto3);
    	   				}
    	   				if(response.fieldPhoto4!=""){
    	   					landImageArr.push(response.fieldPhoto4);
    	   				}
    	   				
    	   				
    	   				for(var i=0;i<landImageArr.length;i++){
    	   					html+='<a class="spotlight d-none" href="data:image/jpeg;base64,'+landImageArr[i]+'"><img src="data:image/jpeg;base64,'+landImageArr[i]+'"></a>';
    	   				}
    	   				$("#otherLandImg").append(html);
    	   				
    	   				while(landImageArr.length > 0) {
    	   					landImageArr.pop();
    	   				}
    	   				
    	   				$("#deviceId").val(response.deviceId);
    	   				$("#mobNum").val(response.mobile);
    	   				$("#lat").val(parseFloat(response.latitude).toFixed(6));
    	   				$("#long").val(parseFloat(response.longitude).toFixed(6));
    	   				$("#surt").val(new Date(response.survey_time).toLocaleString("en-US").replace(",",""));
    	   				$("#sso").val(new Date(response.created_on).toLocaleString("en-US").replace(",","")); 
    	   				$("#pc").val(response.plot_code);
    	   				
    	   				//debugger;
    	   				//console.log(new Date(response.survey_time).toLocaleString("en-US").replace(",",""))
    	   				if(response.roleId==5){  //for state 
    	   					if(response.status=='2'){
        	   					$(".blankDiv").hide();
        	   					$("#afStatus").val("Approved");
        	   					$(".prDiv").show();
        	   					$("#statusSubmitBtn").hide();
        	   				}else if(response.status=='3'){
        	   					$(".blankDiv").hide();
        	   					$("#afStatus").val("Rejected");
        	   					$(".prDiv").show();
        	   					$("#statusSubmitBtn").hide();
        	   				}else{
        	   					$(".blankDiv").hide();
        	   					$("#afStatus").val("Pending");
        	   					$(".prDiv").show();
        	   					$("#statusSubmitBtn").hide();
        	   				}
    	   				}else{
    	   				
    	   				if(response.status=='2'){
    	   					$(".blankDiv").hide();
    	   					$("#afStatus").val("Approved");
    	   					$(".prDiv").show();
    	   					$("#statusSubmitBtn").hide();
    	   				}else if(response.status=='3'){
    	   					$(".blankDiv").hide();
    	   					$("#afStatus").val("Rejected");
    	   					$(".prDiv").show();
    	   					$("#statusSubmitBtn").hide();
    	   				}else{
    	   					$(".blankDiv").show();
    	   					$(".prDiv").hide();
    	   					$("#statusSubmitBtn").show();
    	   				}
    	   				}
    	   				
    	   				$("#submitModal").modal('show');

    	   			},
    	   			error:function(err){
    	   				console.log(err);
    	   			}
    	   			
    	   		});
    	    })
    	    

    	            
    	});
    	
    	
    </script>
	<script>
    $(document).ready(function(){
        $('input[name="inlineRadioOptions"]').on("click",function(){
       	 var radioVal=$(this).val();
       	/*  alert(radioVal)
       	 debugger; */
       	if(radioVal=="1"){
       		$(".ascr_view").show();
       		$(".dscr_view").hide()
       	}
       	else{
       		$(".dscr_view").show();
       		$(".ascr_view").hide();
       	}
        });
    });
    	</script>

	<script>
    	$(document).ready(function(){
    		$('.viewTbl').DataTable( {
    		    "pagingType": "full_numbers",
    		    searching: false
    		    });
    	})
    	
    	</script>

	<script type="text/javascript">
	$(document).ready(function(){
	
	
	$("#distId").on("change",function(){
	var distId=$(this).val();

	
	fetchPacsListByDistCode(distId);
	
	

   
   $.ajax({
		type : "POST",
		url : "fetchtahasilListByDistCode",
		data : 'distId='+distId,
		cache : false,
		timeout : 600000,
		success : function(response) {
			console.log(response)
			var len=response.length;
			var html='';
			html+='<option value="0">--Select Tahasil--</option>';
			for(var i=0;i<len;i++){
				
				html+='<option value="'+response[i].tahasilId+'">'+response[i].tahsilName+'</option>';
				
			}
			$("#tahasilId").empty();
			$('#villageId option:first').attr('selected',true);
			$("#tahasilId").append(html);

		},
		error:function(err){
			console.log(err);
		}
		
	});

});
	
function fetchPacsListByDistCode(distId){
	
	   $.ajax({
			type : "POST",
			url : "fetchPacsListByDistCode",
			data : 'distId='+distId,
			cache : false,
			timeout : 600000,
			success : function(response) {
				console.log(response)
				var len=response.length;
				var html='';
				html+='<option value="0">--Select Society--</option>';
				for(var i=0;i<len;i++){
					
					html+='<option value="'+response[i].pacsId+'">'+response[i].pacsName+'</option>';
					
				}
				$("#pacsId").empty();
				$('#villageId option:first').attr('selected',true);
				$("#pacsId").append(html);

			},
			error:function(err){
				console.log(err);
			}
			
		});
	
}
	
	
	$("#tahasilId").on("change",function(){
		var tahasilId=$(this).val();
		
		
	   $.ajax({
		type : "POST",
		url : "fetchvillageListByTahasilCode",
		data : 'tahasilId='+tahasilId,
		cache : false,
		timeout : 600000,
		success : function(response) {
			//console.log(response);
			var len=response.length;
			var html='';
			html+='<option value="0">--Select Village--</option>';
			for(var i=0;i<len;i++){
			
				html+='<option value="'+response[i].villageId+'">'+response[i].villageName+'</option>';
				
			}
			$("#villageId").empty();
			$("#villageId").append(html);

		},
		error:function(err){
			console.log(err);
		}
		
	});
	
	});
	
});
</script>
	<script>
    $(document).ready(function(){
    	$("#fsstatus").on("change",function(){
    		var status=$(this).val();
    		if(status=='3'){
    			$(".rDiv").show();
    		}else{
    			$(".rDiv").hide();
    		}
    	});
    	
    	$("#statusSubmitBtn").on("click",function(){
    		var status=$("#fsstatus").val();
    		var remark=$("#remark").val();
    		if(status=='3' && remark.trim()==''){
    			alert("Please Enter Remark")
    			return false;
    		}
    		if(status=='0'){
    			alert("Please Choose a Status")
    			return false;
    		}
    		
    	})
    });
    </script>
    
       <script>
        $(".accordianBtn").click(function(){
            $(this).next().slideToggle();
            $(this).find('.toogleIcon').toggleClass('fa-plus fa-minus');
        });
    </script>