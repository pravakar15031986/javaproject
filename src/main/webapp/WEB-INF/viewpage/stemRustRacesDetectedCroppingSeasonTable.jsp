
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
 


<div class="mainpanel">
	<div class="section">
		<div class="page-title">

			<div class="title-details">
				<h4>Race By Variety Report</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						 <li class="breadcrumb-item">MIS Report</li>
						<li class="breadcrumb-item active" aria-current="page">Race By Variety</li>
					</ol>
				</nav>
			</div>

		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
                      <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link 	active"  href="stemRustRaces-DetectedCropping">View</a>
                           </ul>
						<div class="indicatorslist">
                            <button title="excel"   class="btn btn-outline-success btn-sm shadow-none" onclick="downloadExcel()"><i class="icon-excel-file" ></i></button>
						</div>
					</div>
					<!-- Search Panel -->
					<div class="search-container">
					
					<form action="searcharietyReport" method="POST"><input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

					
                           <div class="search-sec" style="display:block;">
                           <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Rust Type </label>
                                    <div class="col-lg-3">
                                       <select class="form-control" id="rust" name="RustId">
                                 
                                   <c:forEach items="${Rusts}" var="rusts">
                                    <option value="${rusts.intRustTypeId }">${rusts.vchRustType }</option>
                                    </c:forEach>
                                    </select>
                                    </div>
                                   <label class="col-lg-2 ">Region </label>
                                    <div class="col-lg-3">
                                       <select class="form-control" id="region" name="RegionId">
                                 <option value="-1">--Select--</option>
                                   <c:forEach items="${Regions}" var="regionList">
                                    <option value="${regionList.demographyId }">${regionList.demographyName }</option>
                                    </c:forEach>
                                    </select>
                                    </div>
                              	</div>
                              </div>
                              
                             
                                    <div class="form-group">
                              		<div class="row">
                                    <label class="col-sm-2 "> </label>
                                    <div class="col-sm-3">
                                        <button class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                     
                              	</div>
                              </div>
                           </div>
                             
                        </form>
                        
						<div class="search-sec">


							<div class="form-group">
								<div class="row">
									<label class="col-lg-2">Region</label>
									<div class="col-lg-2">
										<span class="colon">:</span>

										<div class="input-group">
											<input type="text" class="form-control" id="fromDate"
												aria-label="Default"
												aria-describedby="inputGroup-sizing-default"> <span
												class="text-danger">*</span>
										</div>
									</div>
									<label class="col-lg-2">Zone</label>
									<div class="col-lg-2">
										<span class="colon">:</span>

										<div class="input-group">
											<input type="text" class="form-control" id="fromDate"
												aria-label="Default"
												aria-describedby="inputGroup-sizing-default"> <span
												class="text-danger">*</span>
										</div>
									</div>

									<div class="col-lg-3">
										<button class="btn btn-primary" onclick="searchDate()">
											<i class="fa fa-search"></i> Search
										</button>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Search Panel -->
					<!--===================================================-->
					<div class="card-body">
						<div class="table-responsive">
							<table data-toggle="table" id="viewtable" class="table table-hover table-bordered">
								<thead>
									<tr>
										<th rowspan="2">Sl. No.</th>
										<th rowspan="2">Region</th>
										<th rowspan="2">Zone</th>
										<th rowspan="2">Race Name</th>
										<th rowspan="2">No. of Samples</th>
										<th colspan=" ${fn:length(Varieties)}"><center>Name of the Variety</center></th>
									</tr>
									<tr>
									<c:forEach items="${Varieties}" var="varieties">
									<th>${varieties.vchDesc }</th>
									</c:forEach>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
						</div>
					</div>
					<!--===================================================-->
				</div>
			</div>
		</div>
	</div>
	
<form action="raceByVarietyReportExcelDownload" id="exceldownload" method="post">
   		<input type="hidden" id="rustXL" name="rustXL">
   		<input type="hidden" id="regionXL" name="regionXL">
        </form>
   
       <form action="#" target="_blank" id="pdfdownload" autocomplete="off"   method="post" class="noload">
    	<input type="hidden" id="rustPDF" name="rustPDF">
   		<input type="hidden" id="regionPDF" name="regionPDF">
   		
 </form>	
</div>

<script>

 
  
  var SelectedRegion = '${SelectedRegion}';
  $("#region").val(SelectedRegion);
  

	var RustSelected = '${RustSelected}';
	$("#rust").val(RustSelected);

	var json = '${ReportJSON}';
	console.log(atob(json));
	json = JSON.parse(atob(json));
	var counter = 0;
	var total  = [];
	for(i=0;i<json.length;i++)
		{
		
		var regionJson = json[i];
		var region = regionJson.regionname;
		var zoneJsa = regionJson.zonedtls;
		for(j=0;j<zoneJsa.length;j++)
			{
				var zoneJson = zoneJsa[j];
				var zoneName = zoneJson.zonename;
				var raceResults = zoneJson.raceresults;
				for(k=0;k<raceResults.length;k++)
					{
						var raceResultJson = raceResults[k];
						
						var html_ = "<tr>";
						
						if(  k==0 && j==0)
							{
						counter++;
						html_ += "<td rowspan='"+raceResults.length+"'>"+counter+"</td>";
						html_ += "<td rowspan='"+raceResults.length+"'>"+region+"</td>";
						html_ += "<td rowspan='"+raceResults.length+"'>"+zoneName+"</td>";
						
							}
						 
						
						html_ += "<td>"+raceResultJson.raceresult+"</td>";
						html_ += "<td>"+raceResultJson.samplecollected+"</td>";
						if(total.length == 0)
							{
							total.push(raceResultJson.samplecollected);
							}
						else
							{
							total[0] = total[0]+raceResultJson.samplecollected;
							}
						
						
						var raceName = raceResultJson.raceresult;
						var resultwisevariety = raceResultJson.resultwisevariety;
						for(l=0;l<resultwisevariety.length;l++)
							{
							html_ += "<td>"+resultwisevariety[l].count+"</td>";
							if(total.length != resultwisevariety.length+1 )
								{
								total.push(resultwisevariety[l].count);
								}
							else
								{
								total[l+1] = total[l+1]+resultwisevariety[l].count;
								}
							}
						html_ += "</tr>";
						$("#viewtable").append(html_);
					
					}
			
			}
		
		}
	console.log(total);
	if(json.length > 0)
		{
	var html_ = "<tr><td></td><td></td><td></td><td><b>Total</b></td>";
	
	for(i=0;i<total.length;i++)
		{
		html_ += "<td><b>"+total[i]+"</b></td>";
		}
	html_ += "</tr>";
	$("#viewtable").append(html_);
		}


	//Print and Excel Download

	function downloadExcel(){
		//alert("In Excel");
		$("#rustXL").val($("#rust").val());
		$("#regionXL").val($("#region").val());
		$("#exceldownload").submit(); 
	}
	function downloadPdf(){
		//alert("in pdf");
		$("#rustPDF").val($("#rust").val());
		$("#regionPDF").val($("#region").val());
		$("#pdfdownload").submit();
		
	}	
</script>