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
                     <h4>Published Survey</h4>
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
                              
                              <a class="nav-item nav-link active"  href="surveyPublishedReport">Published Survey</a>
                              <a class="nav-item nav-link"  href="surveyDiscardedReport">Discarded Survey</a>
                           </ul> 
                    <div class="indicatorslist">
                             <form action="survey-publish-excel-download" id="excelForm"	method="post" class="noload">

								<input type="hidden" id="regionEIdExcel" name="region"> 
								<input type="hidden" id="zoneEIdExcel" name="zone"> 
								<input type="hidden" id="woredaEIdExcel" name="woreda">
								<input type="hidden" id="kebeleEIdExcel" name="kebele">
	 							<input type="hidden" id="strtDateIdExcel" name="startDate"> 
	 							<input type="hidden" id="endDateIdExcel" name="endDate"> 
	 							<input type="hidden" id="surveyEnumberExcel" name="surveyNumber">
	  							<input type="hidden" id="rustEIdExcel" name="rustId">
	  							<button type="submit" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-excel-file"></i></button>
							</form>
                           </div> 
                           <div class="indicatorslist">
                           <form action="downloadsurveypublishpdf" id="pdfform"	method="post" target="_blank" class="noload">
	
								<input type="hidden" id="regionEIdPDF" name="region"> 
								<input type="hidden" id="zoneEIdPDF" name="zone"> 
								<input type="hidden" id="woredaEIdPDF" name="woreda">
								<input type="hidden" id="kebeleEIdPDF" name="kebele">
	 							<input type="hidden" id="strtDateIdPDF" name="startDate"> 
	 							<input type="hidden" id="endDateIdPDF" name="endDate"> 
	 							<input type="hidden" id="surveyEnumberPDF" name="surveyNumber">
	  							<input type="hidden" id="rustEIdPDF" name="rustId">
	  							<button type="button" id="pdfdownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1"></i></button>
							</form>
							</div>
                        </div>
                        
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
                            <form action="searchSurveyDetailsPublishedByUser" autocomplete="off"   method="post" onsubmit="return false">
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
                              	<label class="col-lg-2 ">Published Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" data-date-end-date="0d" aria-describedby="inputGroup-sizing-default"  name="startDate" id="startDate" value="${startDate}">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Published  Date To</label>
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
                                       <th>Published Date</th>
                                       <th>Region</th>
                                       <th>Zone</th>
                                       <th>Woreda</th>
                                       <th>Kebele</th>
                                       <th>Type of Rust</th>
                                       <th>Mode of Data Collection</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                
                                 </tbody>
                              </table>
                           </div>
                        
                        </div>
                        <!--===================================================-->
                     </div>
                     <form action="viewSurveyDetailsByRC" id="myForm1" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                     
        				<input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
        			<input type="hidden"   name="r_url" value="surveyPublishedReport">
        			</form>
        			
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
					"url" : "surveyPublishedReportPageWise",
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
				{"data":"mode"}
				
			]
	
  
	});
	});	
	
</script> 
 <script>
 function surveyDetl(id)
 {
	 $("#surveyId1").val(id);
	 $("#myForm1").submit();
}        

</script>
<script>
function findZoneByRegionId(levelId,parentId)
{
	$('#WoredaFirstZoneId').empty();
	
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
		 async:false,
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
		 async:false,
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

	$(document).ready(function()
	{
		
	 $("#regionEIdExcel").val($("#regionId").val());
	$("#zoneEIdExcel").val($("#zoneId").val());
	$("#woredaEIdExcel").val($("#woredaId").val());
	var t=$("#kebeleId").val();
	$("#kebeleEIdExcel").val($("#kebeleId").val());
	$("#strtDateIdExcel").val($("#startDate").val());
	$("#endDateIdExcel").val($("#endDate").val());
	$("#surveyEnumberExcel").val($("#surveyNo").val());
	$("#rustEIdExcel").val($("#rustTypeId").val());

	$("#pdfdownload").click(function()
	{
		 	$("#regionEIdPDF").val($("#regionId").val());
			$("#zoneEIdPDF").val($("#zoneId").val());
			$("#woredaEIdPDF").val($("#woredaId").val());
			var t=$("#kebeleId").val();
			$("#kebeleEIdPDF").val($("#kebeleId").val());
			$("#strtDateIdPDF").val($("#startDate").val());
			$("#endDateIdPDF").val($("#endDate").val());
			$("#surveyEnumberPDF").val($("#surveyNo").val());
			$("#rustEIdPDF").val($("#rustTypeId").val());
			$("#pdfform").submit();	

	});
});
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