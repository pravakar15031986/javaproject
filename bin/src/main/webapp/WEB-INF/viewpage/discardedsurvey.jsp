<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Discarded Survey</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Survey</li>
                           <li class="breadcrumb-item active" aria-current="page">Publish Survey</li>
                        </ol>
                        
 					
                     </nav>
                    
                  </div>
       
               </div>
               
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link"  href="pendingsurvey">Pending Survey</a>
                              <a class="nav-item nav-link"  href="publishedsurvey">Published Survey</a>
                              <a class="nav-item nav-link active"  href="discardedsurvey">Discarded Survey</a>
                           </ul>
                    <div class="indicatorslist">
                             
                              <form action="downloadDiscardSurveyExcel" method="post" id="exceldownload">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
 						<input type="text" style="display:none;" name="regionIdExcel" id="regionIdExcel">
                        <input type="text" style="display:none;" name="zoneIdExcel" id="zoneIdExcel"> 
                        <input type="text" style="display:none;" name="woredaIdExcel" id="woredaIdExcel">
                        <input type="text" style="display:none;" name="kebeleIdExcel" id="kebeleIdExcel">
                        <input type="text" style="display:none;" name="startrDIdExcel" id="startrDIdExcel">
                        <input type="text" style="display:none;" name="endDIdExcel" id="endDIdExcel"> 
                        <input type="text" style="display:none;" name="surveyNoIdExcel" id="surveyNoIdExcel">
                        <input type="text" style="display:none;" name="rustIdExcel" id="rustIdExcel">
                        <button title="Excel" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-excel-file" ></i></button>
                        </form>
                             
                           </div> 
                           
                           <div class="indicatorslist">
                             
                              <form action="downloadDiscardSurveyPdf" method="post" id="pdfform" target="_blank">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
 						<input type="text" style="display:none;" name="regionIdExcel" id="regionIdPdf">
                        <input type="text" style="display:none;" name="zoneIdExcel" id="zoneIdPdf"> 
                        <input type="text" style="display:none;" name="woredaIdExcel" id="woredaIdPdf">
                        <input type="text" style="display:none;" name="kebeleIdExcel" id="kebeleIdPdf">
                        <input type="text" style="display:none;" name="startrDIdExcel" id="startrDIdPdf">
                        <input type="text" style="display:none;" name="endDIdExcel" id="endDIdPdf"> 
                        <input type="text" style="display:none;" name="surveyNoIdExcel" id="surveyNoIdPdf">
                        <input type="text" style="display:none;" name="rustIdExcel" id="rustIdPdf">
                        <button title="Print" id="pdfdownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1" ></i></button>
                        </form>
                             
                           </div> 
                           
                        </div>
                        <!-- Search Panel -->
                         <!-- Search Panel -->
                        <div class="search-container">
                        <c:if test="${showSearch eq true}">
                        <div class="search-sec">
                        </c:if>
                        <c:if test="${showSearch eq false}">
                        <div class="search-sec" style="display:block;">
                        </c:if>
                        <form action="searchSurveyDetailsDiscardByStatus" autocomplete="off"   method="post" id="searchForm">
                           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                                 <input type="hidden"   name="r_url" value="searchSurveyDetailsDiscardByStatus">
                                   <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Region Name</label>
                                    <div class="col-lg-3">
                                       <select  class="form-control" id="regionId" name="regionId"  onchange="findZoneByRegionId(3,this.value);" required="required" tabindex="2">
                                   <option value="-1">--Select--</option>
                                   <c:forEach items="${regionList}" var="region"> 
                                   	<c:choose>
														<c:when test="${region.demographyId eq regionId}">
															<option value="${region.demographyId}"
																selected="selected">${region.demographyName}</option>
														</c:when>
														<c:otherwise>
															<option value="${region.demographyId}">${region.demographyName}</option>
														</c:otherwise>
													</c:choose>
                                   </c:forEach>
                                    </select>
                                    </div>
                                    <label class="col-lg-2 ">Zone Name</label>
                                    <div class="col-lg-3">
                                       <select class="form-control" name="zoneId" id="zoneId" onchange=" findWoredaByZoneId(4,this.value);">
                                   <option value="-1">--Select--</option>
                                    </select>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                              <div class="row">
                               <label class="col-lg-2 ">Woreda Name</label>
                                    <div class="col-lg-3">
                                         <select class="form-control" name="woredaId" id="woredaId" onchange="searchKebele(5,this.value);">
                                      <option value="-1">--Select--</option>
                                      </select>
                                    </div>
                               <label class="col-lg-2 ">Kebele Name</label>
                                    <div class="col-lg-3">
                                      <select class="form-control" name="kebeleId" id="kebeleId">
                                         	<option value="-1">--Select--</option>
                                       </select>
                                    </div>
                              </div>
                              </div>
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Survey Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default"  name="startDate" id="startDate" >
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Survey Date To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default"  name="endDate" id="endDate" >
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                              	</div>
                              </div>
                              <div class="form-group">
                                 <div class="row">
                               <label class="col-lg-2 ">Survey No.</label>
                                    <div class="col-lg-3">
                                        <input type="text" class="form-control"  placeholder="" data-bv-field="fullName" id="surveyNo" name="surveyNo" >
                                    </div>
                                    <label class="col-sm-2 ">Type of Rust</label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="rustTypeId" name="rustTypeId">
											<option value="-1">--Select--</option>
											<c:forEach items="${rustTypeList}" var="rustTypeList">
												<c:choose>
													<c:when
														test="${rustTypeList.rustId eq rustTypeId}">
														<option value="${rustTypeList.rustId}" selected="selected">${ rustTypeList.typeOfRust}</option>
													</c:when>
													<c:otherwise>
														<option value="${ rustTypeList.rustId}">${ rustTypeList.typeOfRust}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
                                    </div>
                                    
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary" id="searchID" onclick="return searchData()"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                 </div>
                              </div>
                      </form>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered"  id="viewTable">
                                 <thead>
                                    <tr>
                                   <th width="40px">Sl#</th>
                                       <th>Survey No.</th>
                                       <th>Survey Date</th>
                                       <th>Discarded Date</th>
                                       <th>Region</th>
                                       <th>Zone</th>
                                       <th>Woreda</th>
                                       <th>Kebele</th>
                                       <th>Instituition Name</th>
                                       <th>Type of Rust</th>
                                       <th>Mode of Data Collection</th>
                                       <th>Reason</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <%-- <c:forEach items="${details}" var="dtls" varStatus="count">
                                    <tr>
                                       
                                      
                                       <td>${count.index + 1 }</td>
                                       <td><a href="javascript:void(0);" class="viewsurvey" survey-id="${dtls.surveyId }">${dtls.surveyNo }</a></td>
                                       <td> ${dtls.surveyDate }</td>
                                       <td> ${dtls.discardDte }</td>
                                       <td>${dtls.region }</td>
                                       <td>${dtls.zone  }</td>
                                       <td>${dtls.woreda  }</td>
                                       <td>${dtls.kebele}</td>
                                       <td>${dtls.institutionName}</td>
                                       <td>${dtls.rust  }</td>
                                       <td>${dtls.mode  }</td>
                                        <td>${dtls.remark}</td>
                                     </tr>
                                   </c:forEach> --%>
                                 </tbody>
                              </table>
                           </div>
                           
                        </div>
                        <!--===================================================-->
                         <form action="viewsurveyDetailsOnPending" autocomplete="off" id="myForm1"   method="post">
                             <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                             <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
                           <input type="hidden"   name="r_url" value="discardedsurvey">
                           </form>
                     </div>
                  </div>
               </div>
            </div>
        
  
 <script>
         
$(document).on('click', '.viewsurvey', function()
{
   var surveyId = $(this).attr('survey-id');
   $("#surveyId1").val(surveyId);
   $("#myForm1").submit();
});
</script>


<script>
function findZoneByRegionId(levelId,parentId)
{
	
	
	$.ajax({
		type : "GET",
		url : "find-zone-by-region-id", 
	 async:false,
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			//alert(response);
			var html = "<option value='-1'>--Select--</option>";
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				$.each(val,function(index, value) {						
					html=html+"<option value="+value.zoneId+" >"+value.zoneName+"</option>";
				});
			}
			$('#zoneId').empty().append(html);
			$('#woredaId').empty().append("<option value='-1'>--Select--</option>");
			$('#kebeleId').empty().append("<option value='-1'>--Select--</option>");
		},error : function(error) {
			 
		}
	});
}

function findWoredaByZoneId(levelId,parentId)
{
	$('#woredaId').change();
	$('#kebeleId').change();
	$.ajax({
		type : "GET",
		url : "find-woreda-by-zone-id", 
		async:false,
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			//alert(response);
			var html ="";
			var val=JSON.parse(response);
			html=html+"<option value='-1' >--Select--</option>";
			if (val != "" || val != null) {
				$.each(val,function(index, value) {			
					
							html=html+"<option value="+value.woridaId+" >"+value.woridaName+"</option>";
				});
			}
			$('#woredaId').empty().append(html);

			$('#kebeleId').empty().append("<option value='-1'>--Select--</option>");
		},error : function(error) {
			 
		}
	});
}
function searchKebele(levelId,woredaId)
{
	
	$('#kebeleId').change();
   
     $.ajax({
		type : "GET",
		 url : "find-multiple-kebele-by-woreda-id", 
		 async:false,
	   data : {
			"levelId":levelId,
			"woredaId":woredaId
			
		},
		success : function(response) {
			var html = " ";
			var val=JSON.parse(response);
			html=html+"<option value='-1' >--Select--</option>";
			if (val != "" || val != null) {
				$.each(val,function(index, value) {			
					
					html=html+"<option value="+value.kebeleId+" >"+value.kebeleName+"</option>";
				});
			}
			$('#kebeleId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});

	
} 


</script>

<script>
$(function() {
	

	$('#viewTable').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "discardedSurveyDataPageWise",
					"data" : function(d) {
						d.regionId= $("#regionId").val();
						d.zoneId = $("#zoneId").val();
						d.woredaId =$("#woredaId").val();
						d.kebeleId = $("#kebeleId").val();
						d.startDate =$("#startDate").val();
						d.endDate = $("#endDate").val();
						d.surveyNo = $("#surveyNo").val();
						d.rustTypeId = $("#rustTypeId").val();
					}
			},
			"dataSrc": "",
			"columns":[
				
				{"data":"sNo"},
				{"data":"surveyNo"},
				{"data":"surveyDate"},
				{"data":"discardDte"},
				{"data":"region"},
				{"data":"zone"},
				{"data":"woreda"},
				{"data":"kebele"},
				{"data":"institutionName"},
				{"data":"rust"},
				{"data":"mode"},
				{"data":"remark"}
				
				
			]
	
  
	});
	});	
	
</script>
<script>
var regionId = '${regionId}' ;
if(regionId != '' && regionId != undefined && regionId != null)
{
	
		$("#regionId").val('${regionId}');
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
<script>
function searchData(){
	
	var fromDate=$("#startDate").val();
	
	var toDate=$("#endDate").val();
	if(fromDate!='')
	{	
	
		if(toDate =='')
		{
			swal('Warning!','Please Enter Survey  Date To!','warning')
   			$("#toDate").focus();
   			return false; 
		}
		if(Date.parse(fromDate)>Date.parse(toDate))
		{
			swal('Warning!','Survey From Date Should be less than Survey To Date!','warning')
   			return false; 
		}
	}	
	$("#searchForm").submit();
}
</script>
<script>

$(document).ready(function(){
	$("#regionIdExcel").val($("#regionId").val());
	$("#zoneIdExcel").val($("#zoneId").val());
	$("#woredaIdExcel").val($("#woredaId").val());
	$("#kebeleIdExcel").val($("#kebeleId").val());
	$("#startrDIdExcel").val($("#startDate").val());
	$("#endDIdExcel").val($("#endDate").val());
	$("#surveyNoIdExcel").val($("#surveyNo").val());
	$("#rustIdExcel").val($("#rustTypeId").val());

	$("#pdfdownload").click(function(){
		$("#regionIdPdf").val($("#regionId").val());
		$("#zoneIdPdf").val($("#zoneId").val());
		$("#woredaIdPdf").val($("#woredaId").val());
		$("#kebeleIdPdf").val($("#kebeleId").val());
		$("#startrDIdPdf").val($("#startDate").val());
		$("#endDIdPdf").val($("#endDate").val());
		$("#surveyNoIdPdf").val($("#surveyNo").val());
		$("#rustIdPdf").val($("#rustTypeId").val());
		$("#pdfform").submit();
		});
	
});
 </script>
 