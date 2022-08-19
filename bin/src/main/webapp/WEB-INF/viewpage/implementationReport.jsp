<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
  <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  
                  <div class="title-details">
                     <h4>Implementation Report</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                            <li class="breadcrumb-item">MIS Report</li>
                           <li class="breadcrumb-item active" aria-current="page">Implementation Report</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link 	active"  href="implementationReport">View</a>
                           </ul>
                           <div class="indicatorslist">
                             
                            <button title="excel"   class="btn btn-outline-success btn-sm shadow-none" onclick="downloadExcel()"><i class="icon-excel-file" ></i></button>
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
						<form action="implementationReportSearch"
							autocomplete="off" method="post"><input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
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
<table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
<thead>
  <tr>
    <th rowspan="2">Region</th>
    <th rowspan="2">Zone</th>
    
    <th rowspan="2">No of PAs affected </th>
    
    <th rowspan="2">Type of rust </th>
    <th rowspan="2">Variety of crop affected</th>
    <th colspan="2">Plant  Disease Assessment</th>
    <th rowspan="2">Crop growth stage</th>
    <th rowspan="2">Sowing land(Ha)</th>
    <th rowspan="2">Total area infected (Ha)</th>
    <th rowspan="2">Total area controlled  (Ha)</th>
    <th colspan="3">Numbers of farmers participated on spraying</th>
	<th colspan="${fn:length(Fungicides)}" align="center">Type &amp; am't of fungicide used (kg(lit)</th>
  </tr>
  <tr>
    <th>Incidence (%)</th>
    <th>Severity (%)</th>
    <th>Male</th>
    <th>Female</th>
    <th>Total</th>
    
    <c:forEach items="${Fungicides}" var="fungi"
														varStatus="loop">
														<th>${fungi.fungicideName }</th>
														</c:forEach>
														
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

<form action="implementationReportExcelDownload" id="exceldownload" method="post">
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
<script type="text/javascript">

$(document).ready(function(){

		$('#viewTable').DataTable( {
			"pagingType": "full_numbers",
	        dom: 'Bfrtip',		
	        buttons: [
	            'print'
	        ]
	    } );
	});

</script>    

<script>
	var json = '${ReportJson}';
	json = JSON.parse(atob(json));
	
	for(i=0;i<json.length;i++)
		{
		var jsonObj = json[i];
		var regionName = jsonObj.regionname;
		
		var zonedetails = jsonObj.zonedetails;
		for(j=0;j<zonedetails.length;j++)
			{
			var zoneObj = zonedetails[j];
			var zonename = zoneObj.zonename;
			var finalcounts = zoneObj.finalcounts;
			finalcounts = finalcounts[0];
		var html_ = "";
			if(j==0)
				{
				regionName = (regionName != null)?regionName:"";
			html_ += "<tr><td>"+regionName+"</td>";
				}
			else
				{
				html_ += "<tr><td></td>";
				}
			zonename = (zonename != null)?zonename:"";
			html_ += '<td>'+zonename+'</td>';
			
		/* 	 
            "woredas":1,
            "fungicideused":298,
            "rust":"Leaf Rust,Stem Rust,Yellow Rust",
            "totalareaper":50,
            "fungiceideused":[],
            "male":30 */
            
			html_ += "<td>"+((finalcounts.kebels != null)?finalcounts.kebels:"NA")+"</td>";
			html_ += "<td>"+((finalcounts.rust != null)?finalcounts.rust:"NA")+"</td>";
			html_ += "<td>"+(( finalcounts.variety != null)?finalcounts.variety:"NA")+"</td>";
			html_ += "<td>"+((finalcounts.incidence != null)?finalcounts.incidence:"NA")+"</td>";
			html_ += "<td>"+((finalcounts.severity != null)?finalcounts.severity:"NA")+"</td>";
			html_ += "<td>"+((finalcounts.stages != null)?finalcounts.stages:"NA")+"</td>";
			html_ += "<td>"+((finalcounts.showingland != null)?finalcounts.showingland:"NA")+"</td>";
			html_ += "<td>"+((finalcounts.totalinfectedarea != null)?finalcounts.totalinfectedarea:"NA")+"</td>";
			html_ += "<td>"+((finalcounts.controlledarea != null)?finalcounts.controlledarea:"NA")+"</td>";
			html_ += "<td>"+((finalcounts.male != null)?finalcounts.male:"NA")+"</td>";
			html_ += "<td>"+((finalcounts.female != null)?finalcounts.female:"NA")+"</td>";
			html_ += "<td>"+((finalcounts.totalfamer != null)?finalcounts.totalfamer:"NA")+"</td>";
			var fungiceideused = finalcounts.fungiceideused;
			for(k=0;k<fungiceideused.length;k++)
				{
				html_ += "<td>"+fungiceideused[k].fused+"</td>";
				}
			
			html_ +="</tr>";
		$("#viewTable").append(html_);
			}
			
		}
</script>

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
		if($("#recomendationId").val() == null || $("#recomendationId").val() == undefined || $("#recomendationId").val() == '')
			{
			$("#recomendationId").val('-1');
			}
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
	
	$("#YearXL").val($("#year").val());
	$("#SeasonIdXL").val($("#season").val());
	$("#RegionIdXL").val($("#regionId").val());
	$("#recomendationIdXL").val($("#recomendationId").val());
	$("#exceldownload").submit(); 
}
function downloadPdf(){
	
	$("#YearPDF").val($("#year").val());
	$("#SeasonIdPDF").val($("#season").val());
	$("#RegionIdPDF").val($("#regionId").val());
	$("#recomendationIdPDF").val($("#recomendationId").val());
	$("#pdfdownload").submit();
	
}
</script>
     