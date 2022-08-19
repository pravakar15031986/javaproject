<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<div class="mainpanel">

	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Web Log Details</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Log Reports</li>
						<li class="breadcrumb-item active" aria-current="page">Login
							Audit Trail</li>
					</ol>
				</nav>
			</div>

		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="viewSucessWebLoginDetails">Web Login </a>
							<a class="nav-item nav-link " href="viewSucessMobLoginDetails">Mobile Login </a>
						</ul>
						<!-- ---------------PDF AND EXCEL DOWNLOAD------------- -->
						<div class="indicatorslist">
                              <button  title="" href="javascript:void(0)" class="btn btn-outline-success btn-sm shadow-none" id="excelIcon" onclick="excelDownload()" data-toggle="tooltip" data-placement="top" data-original-title="Excel"><i class="icon-excel-file"></i></button>
                     </div>  
                     <div class="indicatorslist"> 
                         <form action="downloadSucessWebLoginDetailsPdf" method="post" target="_blank" id="pdfform" class="noload">
						
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="text" style="display: none;"   name="organizationIdExcel" id="organizationIdPDF">
						<input type="text" style="display: none;"   name="roleIdExcel" id="roleIdPDF">
						<input type="text" style="display: none;"   name="researchCenterIdExcel" id="researchCenterIdPDF">
						<input type="text" style="display: none;"   name="intdesigidExcel" id="intdesigidPDF">
						<input type="text" style="display: none;"   name="startDateExcel" id="startDatePDF">
						<input type="text" style="display: none;"   name="endDateExcel" id="endDatePDF">
						<input type="text" style="display: none;"   name="fullNameExcel" id="fullNamePDF">
						<input type="text" style="display: none;"   name="statusExcel" id="statusPDF">
						<button type="button" id="pdfdownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1"></i></button>
					</form>
                         </div> 
                        </div>

					<form action="downloadSucessWebLoginDetailsExcel" method="post" id="exceldownload">
						
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="text" style="display: none;"   name="organizationIdExcel" id="organizationIdExcel">
						<input type="text" style="display: none;"   name="roleIdExcel" id="roleIdExcel">
						<input type="text" style="display: none;"   name="researchCenterIdExcel" id="researchCenterIdExcel">
						<input type="text" style="display: none;"   name="intdesigidExcel" id="intdesigidExcel">
						<input type="text" style="display: none;"   name="startDateExcel" id="startDateExcel">
						<input type="text" style="display: none;"   name="endDateExcel" id="endDateExcel">
						<input type="text" style="display: none;"   name="fullNameExcel" id="fullNameExcel">
						<input type="text" style="display: none;"   name="statusExcel" id="statusExcel">
						
					</form>
					
					
						<input type="text" id="searchOrganizationId" value="${organizationId}" style="display: none;">
     					<input type="text" id="searchRoleId" value="${roleId}" style="display: none;">
						<input type="text" id="searchResearchCenterId" value="${researchCenterId}" style="display: none;">
						<input type="text" id="searchIntdesigid" value="${intdesigid}" style="display: none;">
						<input type="text" id="searchStartDate" value="${startDate}" style="display: none;">
						<input type="text" id="searchEndDate" value="${endDate}" style="display: none;">
						<input type="text" id="searchFullName" value="${fullName}" style="display: none;">
						<input type="text" id="searchStatus" value="${statusId}" style="display: none;">
						
						<!-- ---------------PDF AND EXCEL DOWNLOAD------------------- -->
						
						
						





					<!-- /SEARCH PANNEL -->
					 <div class="search-container">
                          <c:if test="${showSearch eq true }">
					<div class="search-sec" style="display: block;">
					</c:if>
					<c:if test="${showSearch eq false }">
					<div class="search-sec">
					</c:if>
					
							<form:form action="viewSucessWebLoginDetails" method="post" modelAttribute="trackbean" autocomplete="off">
								
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

								
								<div class="form-group">
									<div class="row">
										<label class="col-lg-2 ">Organization Name</label>
										<div class="col-lg-3">

											<form:select class="form-control" id="organizationId"
												path="organizationId" autofocus="autofocus" tabindex="1">
												<option value="0">--Select--</option>
												<c:forEach items="${orgList}" var="org">
													<form:option value="${org.levelDetailId}">${org.levelName}</form:option>
												</c:forEach>
											</form:select>
										</div>

										<label class="col-lg-2 ">User Role</label>
										<div class="col-lg-3">
										<form:select class="form-control" id="roleId" path="roleId">
												<option value="0">--Select--</option>
												<c:forEach items="${roles}" var="rle">
													<form:option value="${rle.roleId}">${rle.aliasName}</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>
								</div>
								 
								<div class="form-group">
									<div class="row">

										<label class="col-lg-2 ">Research Center</label>
										<div class="col-lg-3">
											<form:select class="form-control" id="researchCenterId"
												path="researchcenterName">
												<form:option value="0">--Select--</form:option>
												<c:forEach items="${rcList}" var="rcl">

													<form:option value="${rcl.researchCenterId}">${rcl.researchCenterName}</form:option>
												</c:forEach>
											</form:select>
										</div>
										<label class="col-lg-2 ">Designation</label>
										<div class="col-lg-3">
											<form:select class="form-control" id="intdesigid"
												path="designation">
												<form:option value="0">--Select--</form:option>
												<c:forEach items="${desingnationList}" var="des">

													<form:option value="${des.id}">${des.designation}</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>
								</div>


								 <div class="form-group">
									<div class="row">

										<label class="col-lg-2 ">Login From Date</label>
										<div class="input-group col-lg-3">
											<form:input type="text" class="form-control datepicker"
												data-date-end-date="0d" aria-label="Default"
												aria-describedby="inputGroup-sizing-default"
												path="startDate" id="startDate"></form:input>
											<div class="input-group-append">
												<span class="input-group-text"
													id="inputGroup-sizing-default"><i
													class="icon-calendar1"></i></span>
											</div>

										</div>
										<label class="col-lg-2 ">Login To Date</label>
										<div class="input-group col-lg-3">
											<form:input type="text" class="form-control datepicker"
												data-date-end-date="0d" aria-label="Default"
												aria-describedby="inputGroup-sizing-default" path="endDate"
												id="endDate"></form:input>
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

										<label class="col-lg-2 ">User ID/Name</label>
										<div class="col-lg-3">
											<form:input type="text" class="form-control" path="userName"
												placeholder="" data-bv-field="fullName" id="fullName"
												autocomplete="off" maxlength="50"></form:input>
										</div>
									<label class="col-lg-2 ">Log Status</label>
									<div class="col-lg-3">
											<form:select class="form-control" id="statusId" path="status">
												<form:option value="Y">Success</form:option>
												<form:option value="N">Failure</form:option>
											</form:select>
										</div>
									
									
										<div class="col-lg-2">
											<button class="btn btn-primary" type="submit"
												onclick="return searchData()">
												<i class="fa fa-search"></i> Search
											</button>
										</div>
									</div>
								</div> 
							</form:form>
						</div>
						<div class="text-center">
							<a class="searchopen" title="Search" data-toggle="tooltip"
								data-placement="bottom"> <i class="icon-angle-arrow-down"></i>
							</a>
						</div>
					</div>
			<!-- Search Panel -->

					<!--===================================================-->

					<div class="card-body">
						<div class="table-responsive">
							<table data-toggle="table"
								class="table table-hover table-bordered" id="myView">
								<thead>
									<tr>

										<th width="40px">Sl#</th>
										<th>Org. Name</th>
										<th>User ID</th>
										<th>User Name</th>
										<th>Designation</th>
										<th>Role Name</th>
										<th>R.C. Name</th>
										<th>IP Address</th>
										<th>Login Date</th>
										<th>Login Status</th>
										<th>Logout Date</th>

									</tr>
								</thead>
							</table>
						</div>
					</div>
					<!--===================================================-->
				</div>
			</div>
		</div>
	</div>
</div>







<script type="text/javascript">
	$(function() {
		$('#myView').dataTable({

			'processing' : true,
			'serverSide' : true,
			"searching" : false,
			"ordering" : false,
			"ajax" : {
				"url" : "viewSucessWebLoginDetailsData",
				"data" : function(d) {
					d.organizationId = $("#organizationId").val();
					d.roleId = $("#roleId").val();
					d.researchCenterId = $("#researchCenterId").val();
					d.intdesigid = $("#intdesigid").val();
					d.startDate = $("#startDate").val();
					d.endDate = $("#endDate").val();
					d.fullName = $("#fullName").val();
					d.logStatus=$("#statusId").val();

				}
			},
			"dataSrc" : "",
			"columns" : [ {
				"data" : "sNo"
			}, {
				"data" : "organizationName"
			}, {
				"data" : "userId"
			}, {
				"data" : "userName"
			}, {
				"data" : "designation"
			}, {
				"data" : "role"
			}, {
				"data" : "researchcenterName"
			}, {
				"data" : "ipAddress"
			}, {
				"data" : "loginTime"
			}, {
				"data" : "status"
			},{
				"data" : "logoutTime"
			}
			
			]

		});
	});
</script>
<script>
function searchData(){
	event.preventDefault();
	var form = event.target.form;
	var fromDate=$("#startDate").val();
	var toDate=$("#endDate").val();

	if(fromDate!='')
	{	
	
		if(toDate =='')
		{
			$("#endDate").focus();
			swal('Warning','Please enter Login To Date','warning')
   			return false; 
		}
	}

	if(toDate!='')
	{	
	
		if(fromDate =='')
		{
			$("#startDate").focus();
			swal('Warning','Please enter Login From Date','warning')
   			return false; 
		}
	}
	if(fromDate!='' &&  toDate!='')
	{
		if(Date.parse(fromDate)>Date.parse(toDate))
		{
			$("#startDate").focus();
			swal('Warning','Login From Date Should be less than Login To Date','warning')
				return false; 
		}
	}
	
	form.submit();	
	//$("#searchForm").submit();
}
</script>
<script>
					function excelDownload()
					{
							var organization = $("#organizationId").val();
							
							document.getElementById("organizationIdExcel").value = organization;

							var role = $("#roleId").val();
							document.getElementById("roleIdExcel").value = role;

							var researchCenter = $("#researchCenterId").val();
							document.getElementById("researchCenterIdExcel").value = researchCenter;

							var desig = $("#intdesigid").val();
							document.getElementById("intdesigidExcel").value = desig;

							var sdate = $("#startDate").val();
							
							document.getElementById("startDateExcel").value = sdate;

							var edate = $("#endDate").val();
							document.getElementById("endDateExcel").value = edate;

							var fullname = $("#fullName").val();
							document.getElementById("fullNameExcel").value = fullname;

							var status = $("#statusId").val();
							
							document.getElementById("statusExcel").value = status;
							

							
							//$("#exceldownload").submit();
							document.getElementById("exceldownload").submit();
					}
                        </script>
                        
                        <script>
$(document).ready(function(){
	$("#pdfdownload").click(function()
			{
				 	$("#organizationIdPDF").val($("#organizationId").val());
					$("#roleIdPDF").val($("#roleId").val());
					$("#researchCenterIdPDF").val($("#researchCenterId").val());
					$("#intdesigidPDF").val($("#intdesigid").val());
					$("#startDatePDF").val($("#startDate").val());
					$("#endDatePDF").val($("#endDate").val());
					$("#fullNamePDF").val($("#fullName").val());
					$("#statusPDF").val($("#statusId").val());
					$("#pdfform").submit();	

			});
});
</script>
   


