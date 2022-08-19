<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="wrsis/pagejs/demography.js"></script>

<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Rust Incident Report</h4>
				<nav aria-label="breadcrumb"> 
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item active" aria-current="page">Rust Incident Report</li>
					</ol>
				</nav>
			</div>
			 
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="dashboardRustIncident">View</a>
						</ul>
						<div class="indicatorslist">
							 <a
								title="" href="Home" id="backIcon"
								 data-toggle="tooltip"
								data-placement="top" data-original-title="Back"><i
								class="icon-arrow-left1"></i></a>
 						</div>
 						<c:if test="${rustList > 0 }">
 						<div class="indicatorslist">
                              
                        
                        
                        <form action="downloadDashBoardRustIncidentExcel" method="post" id="exceldownload">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
 						<input type="text" style="display:none;" name="regionIdExcel" id="regionIdExcel">
                        <input type="text" style="display:none;" name="zoneIdExcel" id="zoneIdExcel"> 
                        <input type="text" style="display:none;" name="woredaIdExcel" id="woredaIdExcel">
                        <input type="text" style="display:none;" name="kebeleIdExcel" id="kebeleIdExcel">
                        <input type="text" style="display:none;" name="yearIdExcel" id="yearIdExcel">
                        <input type="text" style="display:none;" name="seasonTypeIdExcel" id="seasonTypeIdExcel"> 
                        
                        <button class="btn btn-outline-success btn-sm shadow-none"><i class="icon-excel-file" title="excel" ></i></button>
                        </form>
                        </div>
                        <div class="indicatorslist">
                        <form action="downloadRustIncidentPDF" target="_blank" id="pdfform" autocomplete="off"   method="post" class="noload">
                         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                          <input type="text" style="display:none;" name="regionIdExcel" id="regionIdPDF">
                        <input type="text" style="display:none;" name="zoneIdExcel" id="zoneIdPDF"> 
                        <input type="text"  style="display:none;" name="woredaIdExcel" id="woredaIdPDF">
                        <input type="text"  style="display:none;" name="kebeleIdExcel" id="kebeleIdPDF">
                        <input type="text"  style="display:none;" name="yearIdExcel" id="yearIdPDF">
                        <input type="text" style="display:none;"  name="seasonTypeIdExcel" id="seasonTypeIdPDF"> 
                         <button type="button" id="pdfdownload" title="print" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1"></i></button>
						  </form>
                        </div> 
                       </c:if>
					</div>
					<!-- Search Panel -->
					<form:form class="col-sm-12 form-horizontal customform" action="dashboardRustIncident"  method="post" modelAttribute="searchVo" autocomplete="off">
					<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
					<div class="search-container">   
                           <div class="search-sec">
                           	<div class="form-group">
								<div class="row">
 								<label class="col-lg-2 ">Region Name</label>
									<div class="col-lg-3">
										<form:select class="form-control" path="regionId"  id="region" onchange="getDemographyData(this.value,'zone')">
											<form:option value="0">--Select--</form:option>
											<c:forEach items="${regionList}" var="regname">
											<form:option value="${regname.demographyId}">${regname.demographyName}</form:option>
											</c:forEach>
										</form:select>
									</div>
								
									<label class="col-lg-2 ">Zone Name</label>
									<div class="col-lg-3">
										<form:select class="form-control" path="zoneId" id="zone" onchange="getDemographyData(this.value,'woreda')">
											<form:option value="0">--Select--</form:option>
											<c:forEach items="${zonelist}" var="demo">
											<form:option value="${demo.demographyId}">${demo.demographyName}</form:option>
											</c:forEach>
 										</form:select>
									</div>
								</div>
							</div>
							
							<div class="form-group">
                              <div class="row">
                               <label class="col-lg-2 ">Woreda Name</label>
                                    <div class="col-lg-3">
                                        <form:select class="form-control" path="woredaId" id="woreda" onchange="getDemographyData(this.value,'kebele')">
                                      <form:option value="0">--Select--</form:option>
                                      <c:forEach items="${woredalist}" var="demo">
											<form:option value="${demo.demographyId}">${demo.demographyName}</form:option>
											</c:forEach>
                                      </form:select>
                                    </div>
                               <label class="col-lg-2 ">Kebele Name</label>
                                    <div class="col-lg-3">
                                     <form:select class="form-control" id="kebele" path="kebeleId">
                                         <form:option value="0">--Select--</form:option>
                                         <c:forEach items="${kebelelist}" var="demo">
											<form:option value="${demo.demographyId}">${demo.demographyName}</form:option>
											</c:forEach>
                                       </form:select>
                                    </div>
                              </div>
                              </div>
                              
                              <div class="form-group">
                                 <div class="row">
                                     <label class="col-lg-2 ">Year</label>
                                    <div class="col-lg-3">
                                    <form:select  class="form-control" id="yearId" path="yearId">
											<form:option value="0">--Select--</form:option>
											<c:forEach items="${year}" var="vo">
											<form:option value="${vo}">${vo}</form:option>
											</c:forEach>
										</form:select>
                                    </div>
                                    <label class="col-lg-2 "> Season</label>
                                    <div class="col-lg-3">
                                     <form:select class="form-control" id="seasonTypeId" path="seasonTypeId">
										  <form:option value="0">--Select--</form:option>
											<c:forEach items="${seasonList}" var="seasonList">
												 <form:option value="${ seasonList.seasonId}">${ seasonList.seasonName}</form:option>
											</c:forEach>
										</form:select>  
                                    </div>
                                    <div class="col-lg-2">
										<button class="btn btn-primary" type="submit">
											<i class="fa fa-search"></i> Search
										</button>
									</div>
                                 </div>
                              </div>
                            
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        </form:form>
					<!-- Search Panel -->
					<!--===================================================-->
					<%-- <form action="viewsurveyForRaceanalysis" autocomplete="off" id="myForm1"   method="post">
			         <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
			       </form> --%>
					
					<div class="card-body">
						<div class="table-responsive">
 							<table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
								<thead>
									<tr>
									   <th width="40px">Sl#</th>
                                       <th>Incident Date</th>
                                       <th>Region</th>
                                       <th>Zone</th>
                                       <th>Woreda</th>
                                       <th>Kebele</th>
                                       <th>Year</th>
                                       <th>Season</th>
                                       <th>Longitude</th>
                                       <th>Latitude</th>
                                       <th>
                                       	Incident Submitted By
                                       </th>
                                        <c:forEach items="${Questions}" var="list" varStatus="count">
                                      <th> Question ${count.index+1 }
                                       <img src="images/information.jpg" title="${list }" alt="info" width="15px" class="ml-2" /></th>
                                       </c:forEach>
                                       
  									</tr>
 								</thead>
								<tbody> 
 								       <c:forEach items="${rustIncidendList}" var="list" varStatus="count">
                                      <tr>
                                      		<td>${count.index + 1 }</td>
                                        	<td>${list.incidendDate}</td>
                                        	<td>${list.regionName}</td>
                                        	<td>${list.zoneName}</td>
                                      		<td>${list.woredaName}</td>
                                         	<td>${list.kebeleName}</td>
                                         	<td>${list.year}</td>
                                       		<td>${list.seasonName}</td>
                                         	<td>${list.longitude}</td>
                                       		<td>${list.latitude}</td>
                                       		 <td>${list.userFullName}</td>
                                       		<c:if test="${empty list.questionsData }">
                                       			<c:forEach items="${Questions}" var="list" varStatus="count">
                                       				<td>--</td>
                                       			</c:forEach>
                                       		</c:if>
                                       		<c:if test="${not empty list.questionsData }">
                                      			<c:forEach items="${list.questionsData}" var="list1" varStatus="count">
                                       				<td>${list1 }</td>
                                      			 </c:forEach>
                                      		 </c:if>
                                      		
                                       </tr>
                                       </c:forEach>
                                 </tbody>
							</table>
	
						</div>
						<div id="showPageNId">
						</div>
						<div style="float: right;">
							<ul class="pagination">
  							</ul>
						</div>						
					</div>
					<div>
						
						<span id="p4"></span> 
					</div>
					<!--===================================================-->
				</div>
			</div>
		</div>
		<%-- <form action="monitorData-excel-download" id="excelForm" method="post">
       		<input type="hidden" id="regionEId" name="region">
       		<input type="hidden" id="zoneEId" name="zone">
       		<input type="hidden" id="monitorEId" name="monitor">
       		<input type="hidden" id="recNoEId" name="recNo">
        </form> --%>
	</div>
</div>

 <script>
$(document).ready(function(){
	

	 $("#regionIdExcel").val($("#region").val());
	$("#zoneIdExcel").val($("#zone").val());
	$("#woredaIdExcel").val($("#woreda").val());
	$("#kebeleIdExcel").val($("#kebele").val());
	$("#yearIdExcel").val($("#yearId").val());
	$("#seasonTypeIdExcel").val($("#seasonTypeId").val());


	$("#pdfdownload").click(function()
			{
		 $("#regionIdPDF").val($("#region").val());
		$("#zoneIdPDF").val($("#zone").val());
		$("#woredaIdPDF").val($("#woreda").val());
		$("#kebeleIdPDF").val($("#kebele").val());
		$("#yearIdPDF").val($("#yearId").val());
		$("#seasonTypeIdPDF").val($("#seasonTypeId").val());
		$("#pdfform").submit();
			});
});

</script>
 
<script>
$(document).ready(function(){
		
		$('#viewTable').DataTable({
         "paging":   true,
         "ordering": true,
         "info":     true,
      //initialization params as usual
        fnInitComplete : function() {
           if ($(this).find('td').length<=1) {
              $('.dataTables_wrapper').hide();
              swal("No record found")
              }
           }
     })
     
     	/* $('#regionId').trigger('change');
	    $('#zoneId').trigger('change'); */
	   // $('#woredaId').trigger('change');
     
});

/* $(document).on('click', '.viewsurvey', function()
			{
 			   var surveyId = $(this).attr('survey-id');
			   $("#surveyId1").val(surveyId);
			   $("#myForm1").submit();
 }); */
 
  /* function downloadExcel(){
 	 $("#regionEId").val($("#regionId").val());
	$("#zoneEId").val($("#zoneId").val());
	$("#monitorEId").val($("#monitorId").val());
	$("#recNoEId").val($("#recNoId").val());
 	$("#excelForm").submit(); 
}  */ 
</script>