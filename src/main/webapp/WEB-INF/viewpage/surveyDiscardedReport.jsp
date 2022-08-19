<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<script>
					function excelDownload()
					{
							var region = $("#regionId").val();
							
							document.getElementById("regionIdExcel").value = region;

							var zone = $("#zoneId").val();
							document.getElementById("zoneIdExcel").value = zone;

							var woreda = $("#woredaId").val();
							document.getElementById("woredaIdExcel").value = woreda;

							var kebele = $("#kebeleId").val();
							document.getElementById("kebeleIdExcel").value = kebele;

							var sdate = $("#startDate").val();
							
							document.getElementById("startDIdExcel").value = sdate;

							var edate = $("#endDate").val();
							document.getElementById("endDIdExcel").value = edate;

							var surveyno = $("#surveyNo").val();
							document.getElementById("surveyNoIdExcel").value = surveyno;

							var rustid = $("#rustTypeId").val();
							document.getElementById("rustIdExcel").value = rustid;
							//$("#exceldownload").submit();
							document.getElementById("exceldownload").submit();
					}
                        </script>
                    
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Discarded Survey</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Survey</li>
                           <li class="breadcrumb-item active" aria-current="page">Published Survey Data</li>
                        </ol>
                     </nav>
                  </div>
      
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link"  href="surveyPublishedReport">Published Survey</a>
                              <a class="nav-item nav-link active"  href="surveyDiscardedReport">Discarded Survey</a>
                           </ul>
                    <div class="indicatorslist">
                              <a  title="" href="javascript:void(0)" class="btn btn-outline-success btn-sm shadow-none" id="excelIcon" onclick="excelDownload()" data-toggle="tooltip" data-placement="top" data-original-title="Excel"><i class="icon-excel-file"></i></a>
                     </div>  
                     <div class="indicatorslist"> 
                         <form action="downloadsurveydiscardpdf" method="post" target="_blank" id="pdfform" class="noload">
						
<%-- <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/> --%>

						<input type="text" style="display: none;"   name="regionIdExcel" id="regionIdPDF">
						<input type="text" style="display: none;"   name="zoneIdExcel" id="zoneIdPDF">
						<input type="text" style="display: none;"   name="woredaIdExcel" id="woredaIdPDF">
						<input type="text" style="display: none;"   name="kebeleIdExcel" id="kebeleIdPDF">
						<input type="text" style="display: none;"   name="startDIdExcel" id="startDIdPDF">
						<input type="text" style="display: none;"   name="endDIdExcel" id="endDIdPDF">
						<input type="text" style="display: none;"   name="surveyNoIdExcel" id="surveyNoIdPDF">
						<input type="text" style="display: none;"   name="rustIdExcel" id="rustIdPDF">
						<button type="button" id="pdfdownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1"></i></button>
					</form>
                         </div> 
                        </div>

					<form action="surveyDiscardedReportDownload" method="post" id="exceldownload">

						<input type="text" style="display: none;"   name="regionIdExcel" id="regionIdExcel">
						<input type="text" style="display: none;"   name="zoneIdExcel" id="zoneIdExcel">
						<input type="text" style="display: none;"   name="woredaIdExcel" id="woredaIdExcel">
						<input type="text" style="display: none;"   name="kebeleIdExcel" id="kebeleIdExcel">
						<input type="text" style="display: none;"   name="startDIdExcel" id="startDIdExcel">
						<input type="text" style="display: none;"   name="endDIdExcel" id="endDIdExcel">
						<input type="text" style="display: none;"   name="surveyNoIdExcel" id="surveyNoIdExcel">
						<input type="text" style="display: none;"   name="rustIdExcel" id="rustIdExcel">
					</form>
					
                         <input type="text" id="searchRegionId" value="${regionId}" style="display: none;">
     					<input type="text" id="searchZoneId" value="${zoneId}" style="display: none;">
						<input type="text" id="searchWoredaId" value="${woredaId}" style="display: none;">
						<input type="text" id="searchKebeleId" value="${kebeleId}" style="display: none;">
						<input type="text" id="searchStartDId" value="${startDate}" style="display: none;">
						<input type="text" id="searchEndDId" value="${endDate}" style="display: none;">
						<input type="text" id="searchSurveyNoId" value="${surveyNo}" style="display: none;">
						<input type="text" id="searchRustId" value="${rustTypeId}" style="display: none;">
                        <!-- Search Panel -->
                        <div class="search-container">
                        <c:if test="${searchShow eq false}"> 
                         <div class="search-sec">
                         </c:if>
                         <c:if test="${searchShow eq true }">
                         <div class="search-sec" style="display:block;">
                         </c:if>
                            <form action="searchSurveyDetailsDiscardByUser" autocomplete="off"   method="post" onsubmit="return false">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                            
                                   <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Region Name</label>
                                    <div class="col-lg-3">
                                        <select  class="form-control" id="regionId" name="regionId"  onchange="findZoneByRegionId(3,this.value);" required="required" tabindex="2">
                                   <option value="-1">-Select-</option>
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
                                   <option value="-1">-Select-</option>
                                    </select>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                              <div class="row">
                               <label class="col-lg-2 ">Woreda Name</label>
                                    <div class="col-lg-3">
                                       <select class="form-control" name="woredaId" id="woredaId" onchange="searchKebele(5,this.value);">
                                      <option value="-1">-Select-</option>
                                      </select>
                                    </div>
                               <label class="col-lg-2 ">Kebele Name</label>
                                    <div class="col-lg-3">
                                     <select class="form-control" name="kebeleId" id="kebeleId">
                                         	<option value="-1">-Select-</option>
                                       </select>
                                    </div>
                              </div>
                              </div>
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Discarded Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" data-date-end-date="0d" aria-describedby="inputGroup-sizing-default"  name="startDate" id="startDate" value="${startDate}">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Discarded  Date To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" data-date-end-date="0d" aria-describedby="inputGroup-sizing-default"  name="endDate" id="endDate" value="${endDate}">
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
                                        <input type="text" class="form-control"  placeholder="" data-bv-field="fullName" id="surveyNo" name="surveyNo" value="${surveyNo}">
                                    </div>
                                    <label class="col-sm-2 ">Type of Rust</label>
                                    <div class="col-sm-3">
                                     <select class="form-control" id="rustTypeId" name="rustTypeId">
											<option value="-1">-select-</option>
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
                                       <button class="btn btn-primary" onclick="searchData();"> <i class="fa fa-search"></i> Search</button>
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
                                       
                                       <th>Type of Rust</th>
                                       <th>Mode of Data Collection</th>
                                       <th>Reason</th>
                                       <th>Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    
                                 </tbody>
                              </table>
                           </div>
                           <form action="viewSurveyDetailsByRC" autocomplete="off" id="myForm1"   method="post">
                             
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                           
                             <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
                          
                          
<input type="hidden"   name="r_url" value="viewSurveyDetailsByRC">
 </form>
                          
                          <form action="viewSurveyDetailsByRCDiscard" id="myFormBySurvNo" method="post">
						 <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/> 

                     
        				<input type="text"  style="display:none;" name="surveyNo" id="surveyIdByNo"> 
        		<input type="hidden"   name="r_url" value="viewSurveyDetailsByRCDiscard">
        			</form>  
                           
                           
                           <form action="viewSurveyDetailsByIdDiscardSurveyor" autocomplete="off" id="myForm"   method="post">
                             
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                             <input type="text" value="" style="display:none;" name="surveyId" id="surveyId">
                        
                           </form>
                           
                         
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <script>
$(function() {
	

	$('#viewTable').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "surveyDiscardedReportPageWise",
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
				{"data":"publishedDate"},
				{"data":"region"},
				{"data":"zone"},
				{"data":"woreda"},
				{"data":"kebele"},
				{"data":"rust"},
				{"data":"mode"},
				{"data":"remark"},
				{"data":"action"}
				
			]
	
  
	});
	});	
	
</script> 
      
  <script>
 function surveyDetl(id)
 {
	 $("#surveyIdByNo").val(id);
	 $("#myFormBySurvNo").submit();
}        

</script>
 <script>
         
$(document).on('click', '.viewsurvey f', function()
{
	
   var surveyId = $(this).attr('survey-id');
    $("#surveyId1").val(surveyId);
   $("#myForm1").submit();
});

$(document).on('click', '.editClass', function()
			{
		
	  //window.location.href="modifySurveyData";
	   var surveyId = $(this).attr('survey-id');
	   $("#surveyId").val(surveyId);
	   $("#myForm").submit();

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
			 
			//alert(response);
			var html = "<option value='0'>-Select-</option>";
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				$.each(val,function(index, value) {	
					
				var zoneDocId=$("#searchZoneId").val();
	     		if(zoneDocId==value.zoneId)	
				{									
					html=html+"<option value="+value.zoneId+" selected='selected'>"+value.zoneName+"</option>";
				}else{ 
					html=html+"<option value="+value.zoneId+" >"+value.zoneName+"</option>";
				}
					
				});
			}
			$('#zoneId').empty().append(html);
			$('#woredaId').empty().append("<option value='-1'>-Select-</option>");
			$('#kebeleId').empty().append("<option value='-1'>-Select-</option>");
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
			 
			//alert(response);
			var html ="";
			var val=JSON.parse(response);
			html=html+"<option value='-1' >-Select-</option>";
			if (val != "" || val != null) {
				$.each(val,function(index, value) {	
							
					var woredaDocId=$("#searchWoredaId").val();
					if(woredaDocId==value.woridaId)	
					{					
						html=html+"<option value="+value.woridaId+" selected='selected'>"+value.woridaName+"</option>";
					}else{
							html=html+"<option value="+value.woridaId+" >"+value.woridaName+"</option>";
					}
					
				});
			}
			$('#woredaId').empty().append(html);
			$('#kebeleId').empty().append("<option value='-1'>-Select-</option>");
		},error : function(error) {
			 
		}
	});
}
function searchKebele(levelId,woredaId)
{
	
   
     $.ajax({
		type : "GET",
		 url : "find-multiple-kebele-by-woreda-id", 
	   data : {
			"levelId":levelId,
			"woredaId":woredaId
			
		},
		success : function(response) {
			var html = " ";
			var val=JSON.parse(response);
			html=html+"<option value='-1' >-Select-</option>";
			if (val != "" || val != null) {
				$.each(val,function(index, value) {

				var kebeleDocId=$("#searchKebeleId").val();
				if(kebeleDocId==value.kebeleId)	
				{				
					html=html+"<option value="+value.kebeleId+" selected='selected'>"+value.kebeleName+"</option>";
				}else{
					html=html+"<option value="+value.kebeleId+" >"+value.kebeleName+"</option>";
				}
					
			});
			}
			$('#kebeleId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});

	
} 

$(document).ready(function(){
	
	findZoneByRegionId(3,${regionId});
	findWoredaByZoneId(4,${zoneId});
	searchKebele(5,${woredaId});
	
} );

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
			swal('Warning!','Please enter to date!','warning')
 			$("#toDate").focus();
 			return false; 
		}
		if(Date.parse(fromDate)>Date.parse(toDate))
		{
			swal('Warning!','From Date Should be less than To Date!','warning')
 			return false; 
		}
	}
	form.submit();	
	
}
</script>

<script>
var sNo = '${sNo}';
if(sNo != null && sNo != '')
	{
	
	swal("Success", sNo, "success");
	}

</script>
<script>
$(document).ready(function(){
	$("#pdfdownload").click(function()
			{
				 	$("#regionIdPDF").val($("#regionId").val());
					$("#zoneIdPDF").val($("#zoneId").val());
					$("#woredaIdPDF").val($("#woredaId").val());
					$("#kebeleIdPDF").val($("#kebeleId").val());
					$("#startDIdPDF").val($("#startDate").val());
					$("#endDIdPDF").val($("#endDate").val());
					$("#surveyNoIdPDF").val($("#surveyNo").val());
					$("#rustIdPDF").val($("#rustTypeId").val());
					$("#pdfform").submit();	

			});
});
</script>
					    