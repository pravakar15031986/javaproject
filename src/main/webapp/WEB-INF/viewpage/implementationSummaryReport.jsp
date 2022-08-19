
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
				<h4>Implementation Summary Report</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">MIS Report</li>
						<li class="breadcrumb-item active" aria-current="page">Implementation Summary</li>
							
							
							
							
					</ol>
				</nav>
			</div>

		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link 	active"  href="implementationSummaryReport">View</a>
                           </ul>
						<div class="indicatorslist">
							
                            <button title="excel"   class="btn btn-outline-success btn-sm shadow-none" onclick="downloadExcel()"><i class="icon-excel-file" ></i></button>
						</div>
					</div>
					<!-- Search Panel -->
					<div class="search-container">
						<form action="implementationSummaryReportSearch"
							autocomplete="off" method="post">
							<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
							<div class="search-sec" style="display:block;">

								<div class="form-group">
									
									
									<div class="row">
										<label class="col-lg-2 ">Year</label>
										<div class="col-lg-2">
											<select id="year" name="Year" class="form-control">
											 
											</select>
										</div>
										<label class="col-lg-2 ">Season</label>
										<div class="col-lg-2">
											<select id="season" name="SeasonId" class="form-control">
											 <c:forEach items="${SeasionList}" var="seasionList">
                                   <option value="${ seasionList.intSeasoonId}" >${ seasionList.vchSeason}</option>
                                    </c:forEach>
											</select>
										</div>
										
									</div>
									<br>
									
									<div class="row">
										<label class="col-lg-2 ">Region Name</label>
										<div class="col-lg-2">
											<select id="regionId" name="RegionId" class="form-control">
												<option value="-1">--Select Region--</option>
												<c:forEach items="${RegionList}" var="dtls"
													varStatus="theCount">
													<option value="${dtls.demographyId }">${dtls.demographyName }</option>
												</c:forEach>
											</select>
										</div>
										<label class="col-lg-2 ">Recommendation</label>
										<div class="col-lg-2">
											<select class="form-control" id="recomendationId" name="RecomendationId">
												<option value="-1">--Select--</option>
												<c:forEach items="${Recomendations}" var="dtls"
													varStatus="theCount">
													<option value="${dtls[0] }">${dtls[1] }</option>
												</c:forEach>

											</select>
										</div>
										 <div class="col-lg-2">
											<button class="btn btn-primary" onclick="searchDate()">
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
						</form>
					</div>
					<!-- Search Panel -->
					<!--===================================================-->
					<div class="card-body">




						<div class="table-responsive">
							<table data-toggle="table"
								class="table table-hover table-bordered" id="viewTable">
								<thead>
									<tr>
										<th rowspan="2">#Sl No.</th>
										<th rowspan="2">Region</th>
										<th rowspan="2">Zone</th>
										<th rowspan="2">No of Woredas affected</th>
										<th rowspan="2">No of PAs affected</th>
										<th rowspan="2">Total area infected (Ha)</th>
										<th rowspan="2">Total area controlled (Ha)</th>
										<th rowspan="2">Total area controlled (%)</th>
										<th rowspan="2">Total fungicides used in kg(lit)</th>
										<th colspan="3">Numbers of farmers participated on
											spraying</th>
									</tr>
									<tr>
										<th>Male</th>
										<th>Female</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									 
								</tbody>


							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<form action="implementationSummaryReportExcelDownload" id="exceldownload" method="post">
   		<input type="hidden" id="YearXL" name="YearXL">
   		<input type="hidden" id="SeasonIdXL" name="SeasonIdXL">
   		<input type="hidden" id="RegionIdXL" name="RegionIdXL">
   		<input type="hidden" id="recomendationIdXL" name="recomendationIdXL">
        </form>
   
       <form action="#" target="_blank" id="pdfdownload" autocomplete="off"   method="post" class="noload">
       
    	<input type="hidden" id="YearPDF" name="YearPDF">
   		<input type="hidden" id="SeasonIdPDF" name="SeasonIdPDF">
   		<input type="hidden" id="RegionIdPDF" name="RegionIdPDF">
   		<input type="hidden" id="recomendationIdPDF" name="recomendationIdPDF">
   		
 </form>
	
</div>
 

<script>

function fetchRecomendationNos()
{
	var year = $("#year").val();
	var season = $("#season").val();
	
	 
	 $.ajax({
	 	type: "GET",
        url : 'fetchRecomendationNosSeasonYear?Year='+year+"&Season="+season,
		cache: false,
		async:false,
        success : function(data) {  	
          var html = '<option value="-1">-Select -</option>';
		 var jsa = JSON.parse(data);
		 for(i=0;i<jsa.length;i++)
			 {
			 	html += "<option value='"+jsa[i].RecId+"'>"+jsa[i].RecName+"</option>";
			 }
		 $("#recomendationId").html(html);
		 
		
		
			  
        },
		  error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
    });
	 
	 
}


var yearList = '${YearList}';
yearList = JSON.parse(atob(yearList));
for(i=0;i<yearList.length;i++)
	 {
	 	
	 $("#year").append('<option value="'+yearList[i]+'" >'+yearList[i]+'</option>');
	 
	 }
	 
	  
	
	 var RegionId = '${RegionId}';
		
		if(RegionId != null && RegionId != '' && RegionId != undefined)
		{
		$("#regionId").val(RegionId);
		}
		
   
		
var SelectedYear = '${SelectedYear}';
	
	if(SelectedYear != null && SelectedYear != '' && SelectedYear != undefined)
	{
	$("#year").val(SelectedYear);
	}
	
var SelectedSeason = '${SelectedSeason}';
	
	if(SelectedSeason != null && SelectedSeason != '' && SelectedSeason != undefined)
	{
	$("#season").val(SelectedSeason);
	}
	
	fetchRecomendationNos();
	 var RecomendationId = '${RecomendationId}';
		
		if(RecomendationId != null && RecomendationId != '' && RecomendationId != undefined)
		{
		$("#recomendationId").val(RecomendationId);
		}

	 
</script>

<script>


var json = '${ReportJson}';
json = JSON.parse(atob(json));
var counter = 0;
var total  = [];

var nWoreda = 0;
var pas = 0;
var area = 0;
var carea = 0;
var careap = 0;
var fused = 0;
var males = 0;
var females = 0;

for(i=0;i<json.length;i++)
{

	var regionJson = json[i];
	var region = regionJson.regionname;
	var zoneJsa = regionJson.zonedetails;
	for(j=0;j<zoneJsa.length;j++)
	{
		var zoneJson = zoneJsa[j];
		var zoneName = zoneJson.zonename;
		
		var html_ = "<tr>";
		
		if(  j==0)
		{
			counter++;
			html_ += "<td rowspan='"+zoneJsa.length+"'>"+counter+"</td>";
			html_ += "<td rowspan='"+zoneJsa.length+"'>"+region+"</td>";
		}
		
		var finalcounts = zoneJson.finalcounts;

		var woredas = (finalcounts.length > 0)?finalcounts[0].woredas:'';
		
		html_ += "<td >"+zoneName+"</td>";
		html_ += "<td>"+woredas+"</td>";
		html_ += "<td>"+((finalcounts.length > 0)?finalcounts[0].kebels:'0')+"</td>";
		
		html_ += "<td>"+((finalcounts.length > 0)?finalcounts[0].totalinfectedarea:'0')+"</td>";
		html_ += "<td>"+((finalcounts.length > 0)?finalcounts[0].controlledarea:'0')+"</td>";
		html_ += "<td>"+((finalcounts.length > 0)?finalcounts[0].totalareaper:'0')+"</td>";
		html_ += "<td>"+((finalcounts.length > 0)?finalcounts[0].fungicideused:'0')+"</td>";
		html_ += "<td>"+((finalcounts.length > 0)?finalcounts[0].male:'0')+"</td>";
		
		html_ += "<td>"+((finalcounts.length > 0)?finalcounts[0].female:'0')+"</td>";
		html_ += "<td>"+((finalcounts.length > 0)?finalcounts[0].totalfamer:'0')+"</td>";
		
		html_ += "</tr>";
		
		nWoreda += woredas;
		pas += ((finalcounts.length > 0)?finalcounts[0].kebels:'0');
		area += ((finalcounts.length > 0)?finalcounts[0].totalinfectedarea:'0');
		carea += ((finalcounts.length > 0)?finalcounts[0].controlledarea:'0');
		careap += ((finalcounts.length > 0)?finalcounts[0].totalareaper:'0');
		fused += ((finalcounts.length > 0)?finalcounts[0].fungicideused:'0');
		males += ((finalcounts.length > 0)?finalcounts[0].male:'0');
		females += ((finalcounts.length > 0)?finalcounts[0].female:'0');

		
		
		$("#viewTable").append(html_);
		
		
		
	
	}


}

if(json.length > 0)
	{
		
	$("#viewTable").append('<td colspan="2"></b></td><td><b><b>Total</b></b></td><td><b>'+nWoreda+'</b></td><td><b>'+pas+'</b></td><td><b>'+area+'</b></td><td><b>'+carea+'</b></td><td><b>'+careap+'</b></td><td><b>'+fused+'</b></td><td><b>'+males+'</b></td><td><b>'+females+'</b></td><td><b>'+(males+females)+'</b></td>');
	
	}


</script>
<script>
$(document).ready(function()
		{
	
		$("#year").change(function()
				{
				fetchRecomendationNos();
				});
		$("#season").change(function()
				{
				fetchRecomendationNos();
				});
		
	
		});
		
//Print and Excel Download

function downloadExcel(){
	//alert("In Excel");
	$("#YearXL").val($("#year").val());
	$("#SeasonIdXL").val($("#season").val());
	$("#RegionIdXL").val($("#regionId").val());
	$("#recomendationIdXL").val($("#recomendationId").val());
	$("#exceldownload").submit(); 
}
function downloadPdf(){
	//alert("in pdf");
	$("#YearPDF").val($("#year").val());
	$("#SeasonIdPDF").val($("#season").val());
	$("#RegionIdPDF").val($("#regionId").val());
	$("#recomendationIdPDF").val($("#recomendationId").val());
	$("#pdfdownload").submit();
	
}
</script>