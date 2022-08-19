<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>IVR Survey Data</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Survey</li>
                           <li class="breadcrumb-item active" aria-current="page">IVR Survey Data</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                               
                              <a class="nav-item nav-link active"  href="wrSurveySummaryReports" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              <a  id="printicon" href="javascript:void(0)" class="btn btn-outline-success btn-sm shadow-none" data-toggle="tooltip" data-placement="top" title="" data-original-title="Print" onclick="downloadPdf()"><i class="icon-printer1"></i></a>
                              <a  title="" href="javascript:void(0)"  class="btn btn-outline-success btn-sm shadow-none" id="excelIcon" data-toggle="tooltip" data-placement="top" data-original-title="Excel" onclick="downloadExcel()"><i class="icon-excel-file"></i></a>
                              
                           </div> 
                        </div>
                        <input type="text" id="searchRegion" value="${region}" style="display: none;">
                        <input type="text" id="searchZone" value="${zone}" style="display: none;">
                        <input type="text" id="searchWoreda" value="${woreda}" style="display: none;">
                        
                        
                        <!-- Search Panel -->
                         <div class="search-container">
                           <c:if test="${showSearch eq false}">
                        <div class="search-sec">
                        </c:if>
                        <c:if test="${showSearch eq true}">
                        <div class="search-sec" style="display:block;">
                        </c:if> 
                                   <div class="form-group"> 
                                 <div class="row">
                                    <label class="col-lg-2 ">Region</label>
                                    <div class="col-lg-3">
                                        <select  class="form-control" id="regionId" name="regionId"  onchange="findZoneByRegionId(3,this.value);" required="required" tabindex="2">
                                         <option value="0">--Select--</option>
                                   <c:forEach items="${regionList}" var="regionid"> 
                                   		<c:choose>
												<c:when
													test="${regionid.demographyId eq region}">
													<option value="${regionid.demographyId}" selected="selected">${regionid.demographyName}</option>
												</c:when>
												<c:otherwise>
													<option value="${regionid.demographyId}">${regionid.demographyName}</option>
												</c:otherwise>
											</c:choose>
									</c:forEach>
                                    </select>
                                    </div>
                                    <label class="col-lg-2 ">Zone</label>
                                    <div class="col-lg-3">
                                        <select class="form-control" name="zoneId" id="zoneId" onchange=" findWoredaByZoneId(4,this.value);">
                                   <option value="0">--Select--</option>
                                    </select>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                               <div class="row">
                                <label class="col-lg-2 ">Woreda </label>
                                    <div class="col-lg-3">
                                       <select class="form-control" name="woredaId" id="woredaId" onchange="searchKebele(5,this.value);">
                                      <option value="0">--Select--</option>
                                      </select>
                                    </div>
                                    <label class="col-lg-2 ">Phone Number</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" id="mobId" value="${mob}" placeholder="" data-bv-field="fullName">
                                    </div>
                                   
                              </div>
                              </div>
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Uploaded Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" data-date-end-date="0d" aria-describedby="inputGroup-sizing-default"  name="startDate" id="startDate" autocomplete="off">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Uploaded Date To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" data-date-end-date="0d"  aria-describedby="inputGroup-sizing-default"  name="endDate" id="endDate" autocomplete="off">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary" onclick="searchData()"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                              	</div>
                              	
                              </div>
                                </div>
                           <div class="text-center"> <a class="searchopen" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Search"> <i class="icon-up-arrow"></i> </a></div>
                        </div>
                      
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                       
                       
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                                 <thead>
                                    <tr>
                                   
                                       <th width="40px">Sl#</th>
                                       <th width="40px">Uploaded Date</th>
                                       <th>Phone No.</th>
                                       <th>Call Date Time</th>
                                       <th>Region</th>
                                       <th>Zone</th>
                                       <th>Woreda</th>
                                   		 <c:forEach items="${qlength}" var="qust" varStatus="count">
                                      		<th>Question ${count.count}<a href="#" data-toggle="tooltip" data-placement="top" title="${qust}"><img src="wrsis/images/information.jpg" alt="info" width="15px" class="ml-2"/> </a> </th>
                                       </c:forEach> 
                                    </tr>
                                 </thead>
                                 <tbody>
                                 <c:forEach items="${ivrDataList}" var="ivr" varStatus="count">
                                      <tr>
                                      		<td>${count.index + 1 }</td>
                                      		<td>${ivr.uploadedDateView}</td>
                                        	<td>${ivr.phnNo}</td>
                                        	<td>${ivr.callDateView}</td>
                                        	 <td>${ivr.region}</td>
                                      		<td>${ivr.zone}</td>
                                         	<td>${ivr.woreda}</td>
                                       		
                                       		<c:if test="${not empty ivr.ivrQuestionsData }">
                                      			 <c:forEach items="${ivr.ivrQuestionsData}" var="data" varStatus="count">
                                       				<td>${data }</td>
                                      			 </c:forEach>
                                      		 </c:if> 
                                      		 
                                      		
                                      		
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
    
       <form action="wrSurveySummaryReportsSearch" id="searchForm" method="post">
       		
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

       		<input type="hidden" id="regId" name="region">
       		<input type="hidden" id="zonId" name="zone">
       		<input type="hidden" id="woreId" name="woreda">
       		<input type="hidden" id="mobl" name="mob">
       		<input type="hidden" id="sStartDate" name="startdate">
       		<input type="hidden" id="sEndDate" name="endDate">
       </form> 
        
        <form action="ivr-survey-data-excel-download" id="excelForm" method="post">
		<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
       		<input type="hidden" id="regionEId" name="region">
       		<input type="hidden" id="zoneEId" name="zone">
       		<input type="hidden" id="woredaEId" name="woreda">
       		<input type="hidden" id="mobE" name="mob">
       		<input type="hidden" id="startDateE" name="startDate">
       		<input type="hidden" id="endDateE" name="endDate">
       </form>
       
       <form action="ivr-survey-data-pdf-download" id="pdfForm" method="post" target="_blank">
       		
			<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
       		<input type="hidden" id="regionPDF" name="region">
       		<input type="hidden" id="zonePDF" name="zone">
       		<input type="hidden" id="woredaPDF" name="woreda">
       		<input type="hidden" id="mobPDF" name="mob">
       		<input type="hidden" id="startDatePDF" name="startDate">
       		<input type="hidden" id="endDatePDF" name="endDate">
       </form>
   
 <script>

	$(function() {
		$('#viewTable').dataTable({
			'paging':true,
			'lengthChange':true,
			'searching':false,
			'ordering':true,
			'info':true,
			'autoWidth':false,
		
	   //initialization params as usual
	   fnInitComplete : function() {
	      if ($(this).find('td').length<=1) {
	         $('.dataTables_wrapper').hide();
	         swal("No record found")
	         $('#actionDivId').hide();
	     	$('#actionBtnID').hide();
	         }
	      } 
		});
		});	
 </script> 
<script>
function findZoneByRegionId(levelId,parentId)
{
	$('#WoredaFirstZoneId').empty();
	
	$.ajax({
		type : "GET",
		url : "find-zone-by-region-id", 
	 
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			
			var html = "<option value='0'>--Select--</option>";
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				$.each(val,function(index, value) {	
					var zone=$("#searchZone").val();
					if(zone==value.zoneId)
					{					
						html=html+"<option value="+value.zoneId+" selected='selected'>"+value.zoneName+"</option>";
					}else{
						html=html+"<option value="+value.zoneId+" >"+value.zoneName+"</option>";
						}
				});
			}
			$('#zoneId').empty().append(html);
			$('#woredaId').empty().append("<option value='0' >--Select--</option>");
		},error : function(error) {
			 
		}
	});
}

function findWoredaByZoneId(levelId,parentId)
{
	$.ajax({
		type : "GET",
		url : "find-woreda-by-zone-id", 
	 
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			
			var html ="";
			var val=JSON.parse(response);
			html=html+"<option value='0' >--Select--</option>";
			if (val != "" || val != null) {
				$.each(val,function(index, value) {			
					var woreda=$("#searchWoreda").val();
					if(woreda==value.woridaId)
					{
						html=html+"<option value="+value.woridaId+" selected='selected'>"+value.woridaName+"</option>";
						}
					else{
						html=html+"<option value="+value.woridaId+" >"+value.woridaName+"</option>";
						}
							
				});
			}
			$('#woredaId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});
}

$(document).ready(function(){
	findZoneByRegionId(3,${region});
	findWoredaByZoneId(4,${zone})
});
function searchData(){
	//alert("In Search");
	$("#regId").val($("#regionId").val());
	$("#zonId").val($("#zoneId").val());
	$("#woreId").val($("#woredaId").val());
	$("#mobl").val($("#mobId").val());

	var fromDate=$("#startDate").val();
	var toDate=$("#endDate").val();

	if(fromDate!='')
	{	
	
		if(toDate =='')
		{
			swal('Error','Please enter Uploaded to date!','error').then(function() {
   			$("#toDate").focus();
   			});
   			return false; 
		}
		if(Date.parse(fromDate)>Date.parse(toDate))
		{
			swal('Error','Uploaded From Date Should be less than Uploaded To Date!','error')
   			return false; 
		}
	}	
	if(toDate !='' && fromDate =='')
	{
		swal('Error','Please enter Uploaded from date!','error').then(function() {
		$("#startDate").focus();
		 });
		return false;
	
	}

	$("#sStartDate").val(fromDate);
	$("#sEndDate").val(toDate); 
	
	$("#searchForm").submit();
	
}
function downloadExcel(){
	$("#regionEId").val($("#regionId").val());
	$("#zoneEId").val($("#zoneId").val());
	$("#woredaEId").val($("#woredaId").val());
	$("#mobE").val($("#mobId").val());
	$("#startDateE").val($("#startDate").val());
	$("#endDateE").val($("#endDate").val()); 
	$("#excelForm").submit();
}
function downloadPdf()
{
	$("#regionPDF").val($("#regionId").val());
	$("#zonePDF").val($("#zoneId").val());
	$("#woredaPDF").val($("#woredaId").val());
	$("#mobPDF").val($("#mobId").val());
	$("#startDatePDF").val($("#startDate").val());
	$("#endDatePDF").val($("#endDate").val());
	$("#pdfForm").submit();
	}
</script>

<script>

var regionId = '${regionId}' ;

if(regionId != '' && regionId != undefined && regionId != null)
{
	
		$("#regionId").val(regionId);
		$("#regionId").change();
		 var zoneId='${zoneId}';
		if(zoneId != null && zoneId != undefined && zoneId != '' && zoneId != -1)
		{
			$("#zoneId").val(zoneId);
			$("#zoneId").change();
			var woredaId='${woredaId}';
			if(woredaId != null && woredaId != undefined && woredaId != '' && woredaId != -1)
			{
				$("#woredaId").val(woredaId);
				$("#woredaId").change();
				var kebeleId='${kebeleId}';
				if(kebeleId != null && kebeleId != undefined && kebeleId != '' && kebeleId != -1)
				{
					$("#kebeleId").val(kebeleId);
					$("#kebeleId").change();
				}
			}
		} 
		
		
}

$("#startDate").val('${startDate}');
$("#endDate").val('${endDate}');
$("#surveyNo").val('${surveyNo}');



</script>