<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>


<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>View Race Analysis</h4>
				<nav aria-label="breadcrumb"> 
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Race Analysis</li>
					</ol>
				</nav>
			</div>
			 
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="raceAnalysisReport">View</a>
						</ul>
						<div class="indicatorslist">
							 <a
								title="" href="Home" id="backIcon"
								 data-toggle="tooltip"
								data-placement="top" data-original-title="Back"><i
								class="icon-arrow-left1"></i></a>
 						</div>
 						<div class="indicatorslist">
 						<button title="Print" id="printId"  class="btn btn-outline-success btn-sm shadow-none" onclick="downloadPdf()"><i class="icon-printer1" ></i></button>
 						<button title="excel" id="excelId" class="btn btn-outline-success btn-sm shadow-none" onclick="downloadExcel()"><i class="icon-excel-file"></i></button>
                        </div> 
					</div>
					<!-- Search Panel -->
					<form:form class="col-sm-12 form-horizontal customform" action="raceAnalysisReportSearch"  method="post" modelAttribute="searchVo" autocomplete="off">
					<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
					<div class="search-container">
					<c:if test="${showSearch eq false}">
					<div class="search-sec">
					</c:if>
                    <c:if test="${showSearch eq true}">
					<div class="search-sec" style="display:block;">
					</c:if>
                              <div class="form-group">
								<div class="row">
									<label class="col-lg-2 ">Survey No.</label>
									<div class="col-lg-3">
									<form:input class="form-control" path="surveyNo" placeholder="" data-bv-field="fullName" id="surveyId"  name="surveyNo"
												autocomplete="off" maxlength="10" onkeypress="return checkRecNo(event);"/>
 									</div>
									<label class="col-lg-2 ">Sample ID</label>
									<div class="col-lg-3">
										<form:input class="form-control" path="sampleId" placeholder="" data-bv-field="fullName" id="sampId" name="sampleId"
												autocomplete="off" maxlength="10" onkeypress="return checkRecNo(event);"/>
									</div>
								</div>
							</div>
                              <div class="form-group">
								<div class="row">
									<label class="col-lg-2 ">Survey Date From</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" path="startDate"  id="startDateId"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Survey Date To</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" path="endDate"  id="endDateId"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<label class="col-lg-2 ">Race Date From</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" path="recDtFrom"  id="recDtFromId"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Race Date To</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" path="recDtTo"  id="recDtToId"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
 								<label class="col-lg-2 ">Region Name</label>
									<div class="col-lg-3">
										<form:select class="form-control" id="demographyId" path="regionId" name="demography">
											<form:option value="0">--Select--</form:option>
											<c:forEach items="${regionList}" var="regname">
											<form:option value="${regname.demographyId}">${regname.demographyName}</form:option>
											</c:forEach>
										</form:select>
									</div>
								
									<label class="col-lg-2 ">Type of Rust</label>
									<div class="col-lg-3">
										<form:select class="form-control" id="rustId" path="rustTypeId" name="rustType">
											<form:option value="0">--Select--</form:option>
											<c:forEach items="${rustTypeList}" var="trust">
											<form:option value="${trust.rustId}">${trust.typeOfRust}</form:option>
											</c:forEach>
										</form:select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
 								<label class="col-lg-2 ">Research Center</label>
									<div class="col-lg-3">
										<form:select class="form-control" id="centerId" path="rcId" name="center">
											<form:option value="0">--Select--</form:option>
											<c:forEach items="${researchCenterList}" var="resercen">
											<form:option value="${resercen.researchCenterId}">${resercen.researchCenterName}</form:option>
											</c:forEach>
										</form:select>
									</div>
								
									<label class="col-lg-2 ">Laboratory Name</label>
									<div class="col-lg-3">
										<form:select class="form-control" id="labCenterId" path="labtroyId" name="labCenter">
											<form:option value="0">--Select--</form:option>
											<c:forEach items="${laboratoryList}" var="lab">
											<form:option value="${lab.researchCenterId}">${lab.researchCenterName}</form:option>
											</c:forEach>
										</form:select>
									</div>
								
									<div class="col-lg-2">
										<button class="btn btn-primary" id="btnSubmit" type="submit">
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
					<form action="viewSurveyDetailsOnDashboard" autocomplete="off" id="myForm1"   method="post">
			        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
			         <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
			       <input type="hidden"   name="r_url" value="raceAnalysisReport">
			       </form>
					
					<div class="card-body">
						<div class="table-responsive">
						 
						
							<table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
								<thead>
									<tr>
										<th rowspan="2" width="40px">Sl#</th>
                                       <th rowspan="2">Survey No.</th>
                                       <th rowspan="2">Sample ID</th>
                                       <th rowspan="2">Rust Type</th>
                                       <th rowspan="2">Survey Date</th>
                                        <th colspan="4" class="text-center">Location</th>
                                       <th rowspan="2">Laboratory Name</th>
                                        <th rowspan="2">Race Published Date</th>
                                       <th rowspan="2">Race</th>
                                       <th rowspan="2">Race File</th>
                                       
 									</tr>
									
									<tr>
	                                    <th>Region</th>
	                                    <th>Zone</th>
	                                    <th>Woreda</th>
	                                    <th>Kebele</th>
                                    </tr>
								</thead>
								<tbody> 
								     
								      <%--  <c:forEach items="${raceReportList}" var="racelist" varStatus="theCount">
                                      <tr>
                                       <td>${theCount.index + 1 }</td>
                                       <td><a href="javascript:void(0);" class="viewsurvey" survey-id="${racelist.surveyId }">${racelist.surveyNo }</a></td>
                                       <td>${racelist.sampleValue }</td>
                                       <td>${racelist.rustType }</td>
                                       <td>${racelist.surveyDate }</td>
                                        <td>${racelist.region }</td>
                                       <td>${racelist.zone }</td>
                                       <td>${racelist.woreda }</td>
                                       <td>${racelist.kebel }</td>
                                       <td>
                                       <c:choose>
                                       <c:when test="${racelist.researchCenter == 'null'}">
                                       External
                                       </c:when>
                                       <c:otherwise>
                                       ${racelist.researchCenter }
                                       </c:otherwise>
                                       </c:choose>
                                       </td>
                                       <td> ${racelist.racePublishDate }</td>
                                        
                                       <td>${racelist.raceResult }</td>
                                        <td>
                                        <c:if test="${not empty racelist.raceDocument && racelist.raceDocument != 'null'}">
                                        <c:choose>
                                        <c:when test="${fn:endsWith(racelist.raceDocument, '.pdf') || fn:endsWith(racelist.raceDocument, '.PDF')}">
                                        <a title="" 
												href="javascript:void(0)" id="downloadIcon"
												data-toggle="tooltip" data-placement="top"
												data-original-title="Download"
												onclick="generateDocument(${racelist.analysisId})"><i
													class="fa fa-file-pdf-o " aria-hidden="true"></i></a>
                                        </c:when>
                                        <c:otherwise>
                                        <a title="" 
												href="javascript:void(0)" id="downloadIcon"
												data-toggle="tooltip" data-placement="top"
												data-original-title="Download"
												onclick="generateDocument(${racelist.analysisId})"><i
													class="fa fa-file-image-o" aria-hidden="true"></i></a>
                                        </c:otherwise>
                                        </c:choose>
                                        </c:if>
                                       </td>
                                       <td><a href='javascript:void(0)' onclick='generateDocument(${racelist.analysisId})'>${racelist.raceDocument}</a> </td>
                                         </tr>
                                       </c:forEach> --%>
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
		<form action="raceReport-excel-download" id="excelForm" method="post">
		<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
       		<input type="hidden" id="surveyEId" name="surveyNo">
       		<input type="hidden" id="sampEId" name="sampleId">
       		<input type="hidden" id="startDateEId" name="startDate">
       		<input type="hidden" id="endDateEId" name="endDate">
       		<input type="hidden" id="demographyEId" name="demography">
       		<input type="hidden" id="rustEId" name="rustType">
       		<input type="hidden" id="centerEId" name="center">
       		<input type="hidden" id="labCenterEId" name="labCenter">
       		<input type="hidden" id="recDtFromEId" name="recDtFrom">
       		<input type="hidden" id="recDtToEId" name="recDtTo">
       </form>
       
           <form action="downloadRaceAnalysisPDF" target="_blank" id="pdfform" autocomplete="off"   method="post" class="noload">
           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
        	<input type="hidden" id="surveyidPDF" name="surveyidPDF">
       		<input type="hidden" id="sampidPDF" name="sampidPDF">
       		<input type="hidden" id="startDatePDF" name="startDatePDF">
       		<input type="hidden" id="endDatePDF" name="endDatePDF">
       		<input type="hidden" id="demographyPDF" name="demographyPDF">
       		<input type="hidden" id="rustidPDF" name="rustidPDF">
       		<input type="hidden" id="centeridPDF" name="centeridPDF">
       		<input type="hidden" id="labCenteridPDF" name="labCenteridPDF">
       		<input type="hidden" id="recDtFromPDF" name="recDtFromPDF">
       		<input type="hidden" id="recDtToPDF" name="recDtToPDF">
		
		</form>
		
		<form action="downloadRaceFile" method="post" id="downloadForm">
		<input type="hidden" name="fileId" id="raceFileId">
	</form> 
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
	"url" : "raceAnalysisReportPagination",
	"data" : function(d) {
		d.surveyId =$("#surveyId").val();
		d.sampId =$("#sampId").val();
		d.startDate =$("#startDateId").val();
		d.endDate =$("#endDateId").val();
		d.recDtFrom =$("#recDtFromId").val();
		d.recDtTo =$("#recDtToId").val();
		d.demographyId =$("#demographyId").val();
		d.rustId =$("#rustId").val();
		d.rcId =$("#centerId").val();
		d.labId =$("#labCenterId").val();
		},
"dataSrc": function ( json ) {
    if(json.data.length>0)
        {
        $('#printId').show();
        $('#excelId').show();
        $('.card-body').show();
        }else{
        	 $('#printId').hide();
             $('#excelId').hide();
             $('.card-body').hide();
             swal('No record found','','')
            }
    return json.data;
}
	},
	
	"columns":[
		{"data":"sNo"},
		{"data":"surveyNo"},
		{"data":"sampleValue"},
		{"data":"rustType"},
		{"data":"surveyDate"},
		{"data":"region"},
		{"data":"zone"},
		{"data":"woreda"},
		{"data":"kebel"},
		{"data":"researchCenter"},
		{"data":"racePublishDate"},
		{"data":"raceResult"},
		{"data":"raceDocument"}
	]
		});
});	
</script>
<script>


$(document).on('click', '.viewsurvey', function()
			{
 			   var surveyId = $(this).attr('survey-id');
			   $("#surveyId1").val(surveyId);
			   $("#myForm1").submit();
 });
 
function downloadExcel(){
	//alert("In Excel");
	 $("#surveyEId").val($("#surveyId").val());
	$("#sampEId").val($("#sampId").val());
	$("#startDateEId").val($("#startDateId").val());
	$("#endDateEId").val($("#endDateId").val());
	$("#demographyEId").val($("#demographyId").val());
	$("#rustEId").val($("#rustId").val());
	$("#centerEId").val($("#centerId").val());
	$("#labCenterEId").val($("#labCenterId").val());
	$("#recDtFromEId").val($("#recDtFromId").val());
	$("#recDtToEId").val($("#recDtToId").val());
	$("#excelForm").submit(); 
}
function downloadPdf(){
 	
	$("#surveyidPDF").val($("#surveyId").val());
	$("#sampidPDF").val($("#sampId").val());
	$("#startDatePDF").val($("#startDateId").val());
	$("#endDatePDF").val($("#endDateId").val());
	$("#demographyPDF").val($("#demographyId").val());
	$("#rustidPDF").val($("#rustId").val());
	$("#centeridPDF").val($("#centerId").val());
	$("#labCenteridPDF").val($("#labCenterId").val());
	$("#recDtFromPDF").val($("#recDtFromId").val());
	$("#recDtToPDF").val($("#recDtToId").val());
	$("#pdfform").submit();
	
} 
</script>

<script>
$(document).ready(function(){
	$("#btnSubmit").click(function(){
		if($("#startDateId").val()!="" && $("#endDateId").val()=="")
			{
				swal("Error","Please select Survey Date To","error").then(function(){
					$("#endDateId").focus();
				});
				return false;
			}
		if($("#startDateId").val()=="" && $("#endDateId").val()!="")
		{
			swal("Error","Please select Survey Date From","error").then(function(){
				$("#startDateId").focus();
			});
			return false;
		}
		if(Date.parse($("#startDateId").val())>Date.parse($("#endDateId").val()))
		{
			swal(
					'Error',
					'Survey Date From should be less than Survey Date To',
					'error'
					).then(function(){
						$("#startDateId").focus()
					})
					return false; 
		}

		//Race Date Validation

		if($("#recDtFromId").val()!="" && $("#recDtToId").val()=="")
		{
			swal("Error","Please select Race Date To","error").then(function(){
				$("#recDtToId").focus();
			});
			return false;
		}
	if($("#recDtFromId").val()=="" && $("#recDtToId").val()!="")
	{
		swal("Error","Please select Race Date From","error").then(function(){
			$("#recDtFromId").focus();
		});
		return false;
	}
	if(Date.parse($("#recDtFromId").val())>Date.parse($("#recDtToId").val()))
	{
		swal(
				'Error',
				'Race Date From should be less than Race Date To',
				'error'
				).then(function(){
					$("#recDtFromId").focus()
				})
				return false; 
	}
	})
});
</script>
 <script>
function checkRecNo(e){
var regex = new RegExp("^[a-zA-Z0-9]");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
var code = (e.keyCode ? e.keyCode : e.which);
if (regex.test(str) || code==8) {
   return true;
}
return false;
}
</script>
<script>
$(function(){

	   $( "#sampId" ).bind( 'paste',function()
	   {
	       setTimeout(function()
	       { 
	          //get the value of the input text
	          var data= $( '#sampId' ).val() ;
	          //replace the special characters to '' 
	          var dataFull = data.replace(/[^\w\s]/gi, '');
	          //set the new value of the input text without special characters
	          $( '#sampId' ).val(dataFull);
	       });

	    });
	   $( "#surveyId" ).bind( 'paste',function()
			   {
			       setTimeout(function()
			       { 
			          //get the value of the input text
			          var data= $( '#surveyId' ).val() ;
			          //replace the special characters to '' 
			          var dataFull = data.replace(/[^\w\s]/gi, '');
			          //set the new value of the input text without special characters
			          $( '#surveyId' ).val(dataFull);
			       });

			    });
	});
</script>

<script>
function generateDocument(id)
{	
	 //alert("file =="+id);
	$.ajax({
		type:"GET",
		url:"race-download-file-exist",
		data:{
				"fileId":id
		},
		success:function(response){

			var res=JSON.parse(response);
			
			if(res.msg == 'Yes')
			{	
				$("#raceFileId").val(id);
				$("#downloadForm").submit();
			}else{
				swal("File not found"," ", "error"); 
				
				}
		},
		error:function(error)
		{
		},		
		
		});   
}
</script>
