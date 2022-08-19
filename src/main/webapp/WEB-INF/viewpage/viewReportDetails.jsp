<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	
	<style>
	.rustType{display:none;}
	</style>
	<script>
	$(document).ready(function(){
		
		$("#excelDownload").click(function(){
			$("#surveyNoExcel").val($("#surveyNo").val())
			$("#sampleIdExcel").val($("#sampleId").val())
			$("#surveyDateFromExcel").val($("#startDate").val())
			$("#surveyDateToExcel").val($("#endDate").val())
			$("#labIdExcel").val($("#labId").val())
			$("#regionIdExcel").val($("#regionId").val())
			$("#rustIdExcel").val($("#rustId").val())
			$("#raceNameExcel").val($("#raceResult").val())
			$("#excelDownloadForm").submit() 
		})
		$("#pdfDownload").click(function(){
			$("#surveyNoPdf").val($("#surveyNo").val())
			$("#sampleIdPdf").val($("#sampleId").val())
			$("#surveyDateFromPdf").val($("#startDate").val())
			$("#surveyDateToPdf").val($("#endDate").val())
			$("#labIdPdf").val($("#labId").val())
			$("#regionIdPdf").val($("#regionId").val())
			$("#rustIdPdf").val($("#rustId").val())
			$("#raceNamePdf").val($("#raceResult").val())
			$("#pdfDownloadForm").submit() 
		})
	});
	</script>
	
<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>View Details</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">MIS Report</li>
						<li class="breadcrumb-item active" aria-current="page">Race
							By Sample</li>
					</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
						</ul>
						
							
                            
                        <div class="indicatorslist">
							<a title="" href="stemRustRaces-IdentifiedCropping" id="backIcon" , 								data-toggle="tooltip" data-placement="top"
								data-original-title="Back"><i class="icon-arrow-left1"></i></a>
			</div>   
						<div class="indicatorslist">
                                <form action="downloadReportExcel" method="post" id="excelDownloadForm">
 						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
 						<input type="text" style="display:none;" name="surveyNo" id="surveyNoExcel">
                        <input type="text" style="display:none;" name="sampleId" id="sampleIdExcel"> 
                        <input type="text" style="display:none;" name="surveyDateFrom" id="surveyDateFromExcel">
                        <input type="text" style="display:none;" name="surveyDateTo" id="surveyDateToExcel">
                        <input type="text" style="display:none;" name="labId" id="labIdExcel">
                        <input type="text" style="display:none;" name="regionId" id="regionIdExcel">
                        <input type="text" style="display:none;" name="rustId" id="rustIdExcel">
                        <input type="text" style="display:none;" name="raceResult" id="raceNameExcel">
         						 <button title="excel" id="excelDownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-excel-file" ></i></button>
                        </form>
                        </div>
                        <div class="indicatorslist">
                            <form action="downloadReportPdf" method="post" id="pdfDownloadForm" target="_blank">         
 						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
 						<input type="text" style="display:none;" name="surveyNo" id="surveyNoPdf">
                        <input type="text" style="display:none;" name="sampleId" id="sampleIdPdf"> 
                        <input type="text" style="display:none;" name="surveyDateFrom" id="surveyDateFromPdf">
                        <input type="text" style="display:none;" name="surveyDateTo" id="surveyDateToPdf">
                        <input type="text" style="display:none;" name="labId" id="labIdPdf">
                        <input type="text" style="display:none;" name="regionId" id="regionIdPdf">
                        <input type="text" style="display:none;" name="rustId" id="rustIdPdf">
                        <input type="text" style="display:none;" name="raceResult" id="raceNamePdf">
         						 <button title="Print" id="pdfDownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1" ></i></button>
                        </form>
                        </div>
					</div>
					<!-- Search Panel -->
					<form:form action="viewReportDetails" modelAttribute="searchVo"
						autocomplete="off" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						
						<form:hidden path="regionId" id="regionId"
							value="${SearchVo.regionId }" />
						
						<form:hidden path="raceResult" id="raceResult"
							value="${SearchVo.raceResult }" />
						<div class="search-container">
							<div class="search-sec">
								<div class="form-group">
									<div class="row">
										<label class="col-lg-2 ">Survey No.</label>
										<div class="col-lg-3">
											<form:input class="form-control" placeholder=""
												data-bv-field="fullName" id="surveyNo" path="surveyNo" />
										</div>
										<label class="col-lg-2 ">Sample ID</label>
										<div class="col-lg-3">
											<form:input class="form-control" placeholder=""
												data-bv-field="fullName" id="sampleNo" path="sampleId" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<label class="col-lg-2 ">Survey Date From</label>
										<div class="input-group col-lg-3">
											<form:input class="form-control datepicker" data-date-end-date="0d"
												aria-label="Default"
												aria-describedby="inputGroup-sizing-default"
												path="surveyDateFrom" id="startDate" />
											<div class="input-group-append">
												<span class="input-group-text"
													id="inputGroup-sizing-default"><i
													class="icon-calendar1"></i></span>
											</div>
										</div>
										<label class="col-lg-2 ">Survey Date To</label>
										<div class="input-group col-lg-3">
											<form:input class="form-control datepicker" data-date-end-date="0d"
												aria-label="Default"
												aria-describedby="inputGroup-sizing-default"
												path="surveyDateTo" id="endDate" />
											<div class="input-group-append">
												<span class="input-group-text"
													id="inputGroup-sizing-default"><i
													class="icon-calendar1"></i></span>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<label class="col-sm-2 rustType">Type of Rust</label>
										<div class="col-sm-3 rustType">
										<input type="text" name="rustId" value="${RustType}" id="rustId">
											<%-- <form:select class="form-control" id="rustTypeId"
												path="rustTypeId">
												<form:option value="-1">--Select--</form:option>
												<c:forEach items="${rustTypeList}" var="rustTypeList">
													<form:option value="${ rustTypeList.rustId}">${ rustTypeList.typeOfRust}</form:option>
												</c:forEach>
											</form:select> --%>
										</div>
										<label class="col-sm-2 ">Laboratory Name</label>
										<div class="col-sm-3">
											<form:select class="form-control" id="labId"
												path="labId">
												<form:option value="-1">--Select--</form:option>
												<c:forEach items="${laboratories}" var="lab">
													<form:option value="${ lab.researchCenterId}">${ lab.researchCenterName}</form:option>
												</c:forEach>
											</form:select>
										</div>
										<div class="col-lg-2">
											<button type="submit" class="btn btn-primary" id="btnSubmit">
												<i class="fa fa-search"></i> Search
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="text-center">
								<a class="searchopen" title="Search" data-toggle="tooltip"
									data-placement="bottom"> <i class="icon-angle-arrow-down"></i>
								</a>
							</div>
						</div>
					</form:form>
					<form action="viewSurveyForRaceSample" autocomplete="off"
						id="myForm1" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						
						<input type="text" value="" style="display: none;" name="surveyId"
							id="surveyId1">
					</form>
					<!-- Search Panel -->
					<!--===================================================-->
						<div class="card-body">
							<div class="table-responsive">
								<table data-toggle="table"
									class="table table-hover table-bordered" id="myTable">
									<thead>
										<tr>

											<th rowspan="2" width="40px">Sl#</th>
											<th rowspan="2">Survey No.</th>
											<th rowspan="2">Sample ID</th>
											<th rowspan="2">Rust Type</th>
											<th rowspan="2">Survey Date</th>
											<th rowspan="2">Inoculation Date</th>
											<th colspan="4" class="text-center">Location</th>
											<th rowspan="2">Laboratory Name</th>
											<th rowspan="2">Race Published Date</th>
											<th rowspan="2">Race Name</th>
										</tr>
										<tr>
											<th>Region</th>
											<th>Zone</th>
											<th>Woreda</th>
											<th>Kebele</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${viewracelist}" var="racelist"
											varStatus="theCount">
											<tr>
												<td>${theCount.index + 1 }</td>
												<td><a href="javascript:void(0);" class="viewsurvey"
													survey-id="${racelist.surveyId }">${racelist.surveyNo }</a></td>
												<td>${racelist.sampleValue }</td>
												<td>${racelist.rustType }</td>
												<td>${racelist.surveyDate }</td>
												<td>${racelist.inoculationDate }</td>
												<td>${racelist.region }</td>
												<td>${racelist.zone }</td>
												<td>${racelist.woreda }</td>
												<td>${racelist.kebel }</td>
												<td>${racelist.researchCenter }</td>
												<td>${racelist.racePublishDate }</td>
												<td>${racelist.raceResult }</td>
												<%-- <td>${racelist.status }</td> --%>
											</tr>
										</c:forEach>


									</tbody>
								</table>
							</div>
						</div>
					<!--===================================================-->
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).on('click', '.viewsurvey', function() {

		//window.location.href="modifySurveyData";
		var surveyId = $(this).attr('survey-id');
		$("#surveyId1").val(surveyId);
		$("#myForm1").submit();

	});
</script>
<script>
	$(function() {
		$('#myTable').dataTable({
			'paging' : true,
			'lengthChange' : true,
			'searching' : true,
			'ordering' : true,
			'info' : true,
			'autoWidth' : false,

			//initialization params as usual
			fnInitComplete : function() {
				if ($(this).find('td').length <= 1) {
					$('.dataTables_wrapper').hide();
					swal("No record found")
				}
			}
		});
	});
</script>
<script>
$('#btnSubmit').click(function()
		{
	if($('#startDate').val()!="" && $('#endDate').val()=="")
	{
	swal("Error","Please select Survey Date To","error").then(function() {
		   $("#endDate").focus();
	   });
	  return false;
	}
	  if($('#startDate').val()=="" && $('#endDate').val()!="")
		{
		swal("Error","Please select Survey Date From","error").then(function() {
			   $("#startDate").focus();
		   });
		  return false;
	}
		});
</script>
