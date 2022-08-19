<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Reaction to Rust Report</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">MIS Report</li>
                           <li class="breadcrumb-item active" aria-current="page">Rust Reaction Report</li>
                        </ol>
                     </nav>
                  </div>
     
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link 	active"  href="reaction-ToRustReport">View</a>
                           </ul>
                            <div class="indicatorslist">
                            
                            <button title="excel"   class="btn btn-outline-success btn-sm shadow-none" onclick="downloadExcel()"><i class="icon-excel-file" ></i></button>
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                        
                        <form action="searchReactionReport" method="post" id="searchform">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           <div class="search-container">
                           <div class="search-sec" style="display:block;">
                           <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Year </label>
                                    <div class="col-lg-3">
                                        <select class="form-control" id="year" name="year">
                                        
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
                              	<label class="col-lg-2 ">Variety</label>
                                    <div class="col-lg-3">
                                      <select class="form-control" id="variety" name="variety">
                                   <option value="0">--Select--</option>
                                     <c:forEach items="${VarietyType}" var="regionList">
                                   <option value="${ regionList.varietyTypeId}" >${ regionList.vchDesc}</option>
                                    </c:forEach>
                                    </select>
                                    </div>
                              	
                                    
                                    <label class="col-sm-2 "><button class="btn btn-primary" onclick="document.getElementById('searchform').submit()"> <i class="fa fa-search"></i> Search</button></label>
                                     
                                   
                              	</div>
                              </div>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
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
                                      
                                       <th rowspan="3">Variety</th>
                                       <th rowspan="3">TNF</th>
                                       <th colspan="3">Stem Rust</th>
                                       <th colspan="3">Leaf rust</th>
                                       <th colspan="3">Yellow Rust</th>
                                    </tr>
                                    <tr>
                                    <th colspan="2">Severity</th>
                                    <th>Incidence</th>
                                    <th colspan="2">Severity</th>
                                    <th>Incidence</th>
                                    <th colspan="2">Severity</th>
                                    <th>Incidence</th>
                                    </tr>
                                    <tr>
                                    <th>Range</th>
                                    <th>Mean</th>
                                    <th>Mean</th>
                                    <th>Range</th>
                                    <th>Mean</th>
                                    <th>Mean</th>
                                    <th>Range</th>
                                    <th>Mean</th>
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
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <form action="reactiontoRustReportExcelDownload" id="exceldownload" method="post">
         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
       		<input type="hidden" id="YearXL" name="YearXL">
       		<input type="hidden" id="SeasonIdXL" name="SeasonIdXL">
       		<input type="hidden" id="VarietyXL" name="VarietyXL">
            </form>
       
           <form action="rustPrevalenceReportPdfDownload" target="_blank" id="pdfdownload" autocomplete="off"   method="post" class="noload">
           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
        	<input type="hidden" id="Year" name="Year">
       		<input type="hidden" id="SeasonId" name="SeasonId">
       		<input type="hidden" id="RegionId" name="RegionId">
       		<input type="hidden" id="ZoneId" name="ZoneId">
       		
		   </form>
         
      </div>
         
         
<script>


var ReportEncodeJson = '${ReportEncodeJson}';
var json = JSON.parse(atob(ReportEncodeJson));
console.log(json);

//varietyname
//tnf
//rustinfos arrary
//sev_range
//mean
//yelcount

// (yelcount*100/tnf)
	
for(i=0;i<json.length;i++)
	{
	
		var jsonObj = json[i];
		var html_ = "<tr>";
		
		html_ += "<td>"+jsonObj.varietyname+"</td>";
		html_ += "<td>"+((jsonObj.tnf ==  null || jsonObj.tnf == undefined)?"0":jsonObj.tnf)+"</td>";
	
		var rustinfos = jsonObj.rustinfos;
		var stemArr = rustinfos[0];
		var leafArr = rustinfos[1];
		var yellow = rustinfos[2];
		var inc = parseFloat(((stemArr.yelcount*100)/jsonObj.tnf)).toFixed(2);
		
		
		html_ += "<td>"+((stemArr.sev_range == '0-')?"0-0":stemArr.sev_range )+"</td>";
		html_ += "<td>"+( (stemArr.mean == null || stemArr.mean == undefined)?"0":stemArr.mean )+"</td>";
		html_ += "<td>"+inc+"</td>";
		
		inc = parseFloat(((leafArr.yelcount*100)/jsonObj.tnf)).toFixed(2);
		html_ += "<td>"+((leafArr.sev_range == '0-')?"0-0":leafArr.sev_range )+"</td>";
		html_ += "<td>"+( (leafArr.mean == null || leafArr.mean == undefined)?"0":leafArr.mean )+"</td>";
		html_ += "<td>"+inc+"</td>";
		
		inc = parseFloat(((yellow.yelcount*100)/jsonObj.tnf)).toFixed(2);
		html_ += "<td>"+((yellow.sev_range == '0-')?"0-0":yellow.sev_range )+"</td>";
		html_ += "<td>"+( (yellow.mean == null || yellow.mean == undefined)?"0":yellow.mean )+"</td>";
		html_ += "<td>"+inc+"</td>";
		
		html_ += "</tr>";
		
		$("#viewtable").append(html_);
	}



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
 var variety = '${SelectedVariety}';
 if(variety != null && variety != undefined && variety != '')
	 {
	 $("#variety").val(variety);
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
 


 function downloadExcel(){
		//alert("In Excel");
		$("#YearXL").val($("#year").val());
		$("#SeasonIdXL").val($("#seasonId").val());
		$("#VarietyXL").val($("#variety").val());
		$("#exceldownload").submit(); 
	}


 function downloadPdf(){
		//alert("in pdf");
		$("#Year").val($("#year").val());
		$("#SeasonId").val($("#seasonId").val());
		$("#RegionId").val($("#regionId").val());
		$("#pdfdownload").submit();
		
	}
 </script>