<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Rust Incidence Severity (Range-Mean) Report</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">MIS Reprt</li>
                           <li class="breadcrumb-item active" aria-current="page">Rust Incidence Report</li>
                        </ol>
                     </nav>
                  </div>
    
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link 	active"  href="incidence-Severity-RustReport">View</a>
                           </ul>
                          
                            <div class="indicatorslist" id="iconeId">
                          
                              <button title="excel"   class="btn btn-outline-success btn-sm shadow-none" onclick="downloadExcel()"><i class="icon-excel-file" ></i></button>
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                        
                        <form action="searchIncidence-Severity-RustReport" method="POST" id="searchform">
                          <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           <div class="search-container">
                           <div class="search-sec" style="display:block;">
                           <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Year </label>
                                    <div class="col-lg-3">
                                       <select class="form-control" id="year" name="Year">
                                 
                                    </select>
                                    </div>
                                    <label class="col-lg-2 ">Season </label>
                                    <div class="col-lg-3">
                                     <select class="form-control" id="seasonId" name="SeasonId">
                                       <c:forEach items="${SeasionList}" var="seasionList">
                                   <option value="${ seasionList.intSeasoonId}" >${ seasionList.vchSeason}</option>
                                    </c:forEach>
									</select>
									</div>
                              	</div>
                              </div>
                              
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Region</label>
                                    <div class="col-lg-3">
                                        <select class="form-control" id="regionId" name="RegionId">
                                   <option value="0">--Select--</option>
                                     <c:forEach items="${RegionList}" var="regionList">
                                   <option value="${ regionList.demographyId}" >${ regionList.demographyName}</option>
                                    </c:forEach>
                                    </select>
                                    </div>
                                     
                                          <button class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
                                    
                                    </div>
                                    </div>
                                    <div class="form-group">
                              		 
                              </div>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" onclick="document.getElementById('searchform').submit()"> <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        </form>
                        
                        
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <form action="" autocomplete="off">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                         <div>
                        	<p style=" font-weight: bold;" >Season: <span id="seasonname"></span></p>
                        </div>
                            <div class="table-responsive"> 
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewtable">
                                 <thead>
                                    <tr>
                                       
                                         <th rowspan="3">Region</th>
                                       <th rowspan="3">Zone</th>
                                       <th colspan="4">Yellow Rust</th>
                                       <th colspan="4">Stem Rust</th>
                                       <th colspan="4">Leaf rust</th>
                                    </tr>
                                    <tr>
                                    <th colspan="2">Incidence</th>
                                    <th colspan="2">Severity</th>
                                    <th colspan="2">Incidence</th>
                                    <th colspan="2">Severity</th>
                                    <th colspan="2">Incidence</th>
                                    <th colspan="2">Severity</th>
                                    </tr>
                                    <tr>
                                    <th>Range</th>
                                    <th>Mean</th>
                                    <th>Range</th>
                                    <th>Mean</th>
                                    <th>Range</th>
                                    <th>Mean</th>
                                    <th>Range</th>
                                    <th>Mean</th>
                                    <th>Range</th>
                                    <th>Mean</th>
                                    <th>Range</th>
                                    <th>Mean</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    
                                 </tbody>
                              </table>
                             <hr>
                          
                          </div> 
                           
                           
                        </div>
                        </form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
          <form action="incidence-Severity-RustReportExcel" id="exceldownload" method="post">
       		<input type="hidden" id="YearXL" name="YearXL">
       		<input type="hidden" id="SeasonIdXL" name="SeasonIdXL">
       		<input type="hidden" id="RegionIdXL" name="RegionIdXL">
       		
            </form>
       
           <form action="incidence-Severity-RustReportPdf" target="_blank" id="pdfdownload" autocomplete="off"   method="post" class="noload">
        	<input type="hidden" id="YearPdf" name="Year">
       		<input type="hidden" id="SeasonIdPdf" name="SeasonId">
       		<input type="hidden" id="RegionIdPdf" name="RegionId">
		   </form>
      </div>
         
         
         
         
<script>




var ReportEncodeJson = '${ReportEncodeJson}';

var json = JSON.parse(atob(ReportEncodeJson));
console.log(json);
if(json.length == 0)
{
		$("#iconeId").hide();
}
var trhml = '';
for(i=0;i<json.length;i++)
	 {
	 var jsonObj  = json[i];
	
	 
	 var jsa  = jsonObj.zonedetails;
	 var fields = 0;
	
	 var yIncidenceHigh = 0;
	 var ySeverityHigh = 0;
	 
	 var sIncidenceHigh = 0;
	 var sSeverityHigh = 0;
	 
	 var lIncidenceHigh = 0;
	 var lSeverityHigh = 0;
	 
	 
	 var yIncidenceMeanHigh = 0;
	 var ySeverityMeanHigh = 0;
	 
	 var sIncidenceMeanHigh = 0;
	 var sSeverityMeanHigh = 0;
	 
	 var lIncidenceMeanHigh = 0;
	 var lSeverityMeanHigh = 0;
	 
	 
	 
	 for(j=0;j<jsa.length;j++)
		 {
		 trhml += "<tr>";
		 	if(j==0)
		 		{
		 		trhml += "<td>"+jsonObj.regionname+"</td>";
		 		}
		 	else
		 		{
		 		trhml += "<td></td>";
		 		}
		 	
		 	trhml += "<td>"+jsa[j].zonename+"</td>";
		 	
		 	
		 	var incsevdetails = jsa[j].incsevdetails;
		 	
		 	// 0 index yello
		 	// 1 index stem
		 	//2 index leaf
		 	
		 	
		 	var yellowI = incsevdetails[0];
		 	trhml += "<td>"+((((yellowI.incidence_range == null)?0:yellowI.incidence_range) == '0-')?"0-0":((yellowI.incidence_range == null)?0:yellowI.incidence_range)   )+"</td>";
		 	trhml += "<td>"+((yellowI.incidence_mean == null)?0:yellowI.incidence_mean)+"</td>";
		 	trhml += "<td>"+((((yellowI.severity_range == null)?0:yellowI.severity_range) == '0-')?"0-0":((yellowI.severity_range == null)?0:yellowI.severity_range)   ) +"</td>";
		 	trhml += "<td>"+((yellowI.severity_mean == null)?0:yellowI.severity_mean)+"</td>";
		 	
		 	if(parseInt(((((yellowI.incidence_range == null)?0:yellowI.incidence_range) == '0-')?"0-0":((yellowI.incidence_range == null)?0:yellowI.incidence_range)).split('-')[1]) > yIncidenceHigh)
		 		{
		 	yIncidenceHigh = parseInt(((((yellowI.incidence_range == null)?0:yellowI.incidence_range) == '0-')?"0-0":((yellowI.incidence_range == null)?0:yellowI.incidence_range)).split('-')[1]);
		 		}
		 	if(parseInt(((((yellowI.severity_range == null)?0:yellowI.severity_range) == '0-')?"0-0":((yellowI.severity_range == null)?0:yellowI.severity_range)).split('-')[1]) > ySeverityHigh)
		 	{
		 	ySeverityHigh = parseInt(((((yellowI.severity_range == null)?0:yellowI.severity_range) == '0-')?"0-0":((yellowI.severity_range == null)?0:yellowI.severity_range)).split('-')[1]);
		 	}
		 	
		 	yIncidenceMeanHigh = yIncidenceMeanHigh+parseFloat(((yellowI.incidence_mean == null)?0:yellowI.incidence_mean));
		 	ySeverityMeanHigh = ySeverityMeanHigh + parseFloat(((yellowI.severity_mean == null)?0:yellowI.severity_mean));
		 	
		 	var stemI = incsevdetails[1];
		 	
		 	trhml += "<td>"+((((stemI.incidence_range == null)?0:stemI.incidence_range) == '0-')?"0-0":((stemI.incidence_range == null)?0:stemI.incidence_range)  )+"</td>";
		 	trhml += "<td>"+((stemI.incidence_mean == null)?0:stemI.incidence_mean)+"</td>";
		 	trhml += "<td>"+((((stemI.severity_range == null)?0:stemI.severity_range) == '0-'?"0-0":((stemI.severity_range == null)?0:stemI.severity_range))  )+"</td>";
		 	trhml += "<td>"+((stemI.severity_mean == null)?0:stemI.severity_mean)+"</td>";
		 	
		 	
		 	if(parseInt(((((stemI.incidence_range == null)?0:stemI.incidence_range) == '0-')?"0-0":((stemI.incidence_range == null)?0:stemI.incidence_range)  ).split('-')[1]) > sIncidenceHigh)
	 		{
		 	sIncidenceHigh = parseInt(((((stemI.incidence_range == null)?0:stemI.incidence_range) == '0-')?"0-0":((stemI.incidence_range == null)?0:stemI.incidence_range)  ).split('-')[1])
		 		}
		 	if(parseInt(((((stemI.severity_range == null)?0:stemI.severity_range) == '0-'?"0-0":((stemI.severity_range == null)?0:stemI.severity_range))  ).split('-')[1]) > sSeverityHigh)
		 	{
		 	sSeverityHigh = parseInt(((((stemI.severity_range == null)?0:stemI.severity_range) == '0-'?"0-0":((stemI.severity_range == null)?0:stemI.severity_range))  ).split('-')[1]);
		 	}
		 	
		 	
			sIncidenceMeanHigh = sIncidenceMeanHigh+parseFloat(((stemI.incidence_mean == null)?0:stemI.incidence_mean));
		 	sSeverityMeanHigh = sSeverityMeanHigh + parseFloat(((stemI.severity_mean == null)?0:stemI.severity_mean));
		 	
		 	var leafI = incsevdetails[2];
		 	
		 	
		 	trhml += "<td>"+((((leafI.incidence_range == null)?0:leafI.incidence_range) == '0-')?"0-0":((leafI.incidence_range == null)?0:leafI.incidence_range)  )+"</td>";
		 	trhml += "<td>"+((leafI.incidence_mean == null)?0:leafI.incidence_mean)+"</td>";
		 	trhml += "<td>"+((((leafI.severity_range == null)?0:leafI.severity_range) == '0-')?"0-0":((leafI.severity_range == null)?0:leafI.severity_range)  )+"</td>";
		 	trhml += "<td>"+((leafI.severity_mean == null)?0:leafI.severity_mean)+"</td>";
		 	 
		 	
		 	if(parseInt(((((leafI.incidence_range == null)?0:leafI.incidence_range) == '0-')?"0-0":((leafI.incidence_range == null)?0:leafI.incidence_range)  ).split('-')[1]) > lIncidenceHigh)
	 		{
		 	lIncidenceHigh = parseInt(((((leafI.incidence_range == null)?0:leafI.incidence_range) == '0-')?"0-0":((leafI.incidence_range == null)?0:leafI.incidence_range)  ).split('-')[1]);
		 		}
		 	if(parseInt(((((leafI.severity_range == null)?0:leafI.severity_range) == '0-')?"0-0":((leafI.severity_range == null)?0:leafI.severity_range)  ).split('-')[1]) > lSeverityHigh)
		 	{
		 	lSeverityHigh = parseInt(((((leafI.severity_range == null)?0:leafI.severity_range) == '0-')?"0-0":((leafI.severity_range == null)?0:leafI.severity_range)  ).split('-')[1]);
		 	}
	 	
		 	lIncidenceMeanHigh = lIncidenceMeanHigh+parseFloat(((leafI.incidence_mean == null)?0:leafI.incidence_mean));
		 	lSeverityMeanHigh = lSeverityMeanHigh + parseFloat(((leafI.severity_mean == null)?0:leafI.severity_mean));
		 	
		 	
	 trhml += "</tr>";
		 }
	/*  yelloInfectedFieldPer = (((yelloInfectedFieldPer)*100)/(jsa.length*100));
	 stemInfectedFieldPer = (((stemInfectedFieldPer)*100)/(jsa.length*100));
	 leafInfectedFieldPer = (((leafInfectedFieldPer)*100)/(jsa.length*100));  */
	 trhml += "<tr>"+
	 "<td> </td>"+
	 "<td> <b>Total</b></td>"+
	 "<td><b>0-"+yIncidenceHigh+" </b></td>"+
	 "<td><b>"+((yIncidenceMeanHigh)/jsa.length).toFixed(2)+" </b></td>"+
	 "<td><b>0-"+ySeverityHigh+" </b></td>"+
	 "<td><b>"+((ySeverityMeanHigh)/jsa.length).toFixed(2)+" </b></td>"+
	 "<td><b>0-"+sIncidenceHigh+" </b></td>"+
	 "<td><b>"+((sIncidenceMeanHigh)/jsa.length).toFixed(2)+" </b></td>"+
	 "<td><b>0-"+sSeverityHigh+" </b></td>"+
	 "<td><b>"+((sSeverityMeanHigh)/jsa.length).toFixed(2)+" </b></td>"+
	 "<td><b>0-"+lIncidenceHigh+" </b></td>"+
	 "<td><b>"+((lIncidenceMeanHigh)/jsa.length).toFixed(2)+" </b></td>"+
	 "<td><b>0-"+lSeverityHigh+" </b></td>"+
	 "<td><b>"+((lSeverityMeanHigh)/jsa.length).toFixed(2)+" </b></td>"+
	 "</tr>";
	
	 }
$("#viewtable").append(trhml);
console.log(trhml);





</script>
         
 
 
 <script>
 
 var yearList = '${YearList}';
 yearList = JSON.parse(atob(yearList));
 for(i=0;i<yearList.length;i++)
	 {
	 	
	 $("#year").append('<option value="'+yearList[i]+'" >'+yearList[i]+'</option>');
	 
	 }
 
 var YearSeason = '${YearSeason}';
 YearSeason = JSON.parse(atob(YearSeason));
 $("#year").val(YearSeason.year);
 $("#seasonId").val(YearSeason.seasonid);
 
 
 var RegionId = '${SelectedRegion}';
  
 if(RegionId != null && RegionId != undefined && RegionId != '')
	 {
	 $("#regionId").val(RegionId);
	 $("#regionId").change();
	 }
  
 var SelectedYear = '${SelectedYear}';
 if(SelectedYear != null && SelectedYear != undefined && SelectedYear != '')
	 {
	 $("#year").val(SelectedYear);
	 }
 var SelectedSeasonId = '${SelectedSeasonId}';
 if(SelectedSeasonId != null && SelectedSeasonId != undefined && SelectedSeasonId != '')
	 {
	 $("#seasonId").val(SelectedSeasonId);
	 }
 $("#seasonname").html($("#seasonId option:selected").html());
 </script>
 
 <script>
//Print and Excel Download
 
 function downloadExcel(){
	
	$("#YearXL").val($("#year").val());
	$("#SeasonIdXL").val($("#seasonId").val());
	$("#RegionIdXL").val($("#regionId").val());
	$("#ZoneIdXL").val($("#zoneId").val());
	$("#exceldownload").submit(); 
}
function downloadPdf(){
	
	$("#YearPdf").val($("#year").val()); 
	$("#SeasonIdPdf").val($("#seasonId").val());
	$("#RegionIdPdf").val($("#regionId").val());
	//$("#ZoneId").val($("#zoneId").val());
	$("#pdfdownload").submit();
	
}
 </script>