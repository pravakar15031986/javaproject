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
                     <h4>View Survey Report By Global Rust</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">MIS Report</li>
                           <li class="breadcrumb-item active" aria-current="page">Global Rust Survey Report</li>
                        </ol>
                     </nav>
                  </div>
              
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                           <a class="nav-item nav-link active"  href="reportSurveyReportByGlobalRust" >View</a>
                              
                           </ul>
                           
                           
                           
                           
                            <div class="indicatorslist">
                            
                             <form action="reportSurveyReportByGlobalRustExcel" autocomplete="off"   method="post" class="noload">
                          <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           <input type="text" style="display: none;"  name="yearIdExcel" id="yearIdExcel">
                           <input type="text" style="display: none;"  name="seasionIdExcel" id="seasionIdExcel">
                           <input type="text" style="display: none;" name="startDateExcel" id="startDateExcel">
                           <input type="text" style="display: none;" name="endDateExcel" id="endDateExcel">
                           <input type="text" style="display: none;" name="regionIdExcel" id="regionIdExcel">
                           <input type="text" style="display: none;" name="rcIdExcel" id="rcIdExcel">
                           <input type="text" style="display: none;" name="surveyNoExcel" id="surveyNoExcel">
                           
                           <button type="submit" class="btn btn-outline-success btn-sm shadow-none"  title="Excel File" onclick="checkSearch()"><i class="icon-excel-file"></i></button>
						  </form>
                            
                            
                            
                           </div> 
                           
                           
                           <div class="indicatorslist">
                            
                             <form action="reportSurveyReportByGlobalRustCsv" autocomplete="off"   method="post" class="noload">
                         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           <input type="text" style="display: none;"  name="yearIdExcel" id="yearIdCSV">
                           <input type="text" style="display: none;"  name="seasionIdExcel" id="seasionIdCSV">
                           <input type="text" style="display: none;" name="startDateExcel" id="startDateCSV">
                           <input type="text" style="display: none;" name="endDateExcel" id="endDateCSV">
                           <input type="text" style="display: none;" name="regionIdExcel" id="regionIdCSV">
                           <input type="text" style="display: none;" name="rcIdExcel" id="rcIdCSV">
                           <input type="text" style="display: none;" name="surveyNoExcel" id="surveyNoCSV">
                           
                           <button type="submit" title="CSV File" class="btn btn-outline-success btn-sm shadow-none" onclick="checkSearch()"><i class="icon-excel-file"></i></button>
						  </form>
                            
                            
                            
                           </div> 
                        </div>
                        <!-- Search Panel -->
                         <form action="reportSurveyReportByGlobalRustSearch" autocomplete="off"   method="post">
                         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                         <input type="text" value="1" style="display:none;" id="pageindex" name="pageindex">
                        <div class="search-container">
                           <div class="search-sec" style="display:block;">
                           
                           
                           <div class="form-group row pad-ver">
                              <label class="col-sm-2 control-label">Search By</label>
                              <div class="col-sm-10">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <input type="radio" name="status" value="0" checked="checked" class="magic-radio sampleyes" id="radioSeason" >
                                    <label for="radioSeason" tabindex="4">Season</label>  
                             
                                    <input type="radio" name="status" value="1" class="magic-radio sampleno" id="radioDate" >
                                    <label for="radioDate" tabindex="5">Date Range</label>
                                 </div>
                              </div>
                           </div>
                           
                           
                           <div class="form-group" id="yearseasondiv">
                              	<div class="row">
                                    <label class="col-lg-2 ">Year</label>
                                    <div class="input-group col-lg-3">
                                       <select class="form-control" id="yearId" name="yearId">
                                       <option value="0">--Select--</option>
                                       <c:forEach items="${yearList}" var="year">
                                       	 <option value="${year}">${year}</option>
                                       </c:forEach>
                                       </select>
                                    </div>
                                    <label class="col-sm-2 ">Season</label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="seasionId" name="seasionId">
                                       <option value="0">--Select--</option>
                                       <c:forEach items="${seasonList}" var="season"> 
                                       	<c:if test="${season.intSeasoonId eq seasonName.intSeasoonId}">
                                       		<option value="${season.intSeasoonId}">${season.vchSeason}</option>
                                       	</c:if>
                                       		<option value="${season.intSeasoonId}">${season.vchSeason}</option>
                                       </c:forEach>
                                          
                                       </select>
                                    </div>
                              	</div>
                              	</div>
                           
                              <div class="form-group" id="daterangediv" style="display:none;">
                              	<div class="row">
                              	<label class="col-lg-2 ">Survey From Date</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" data-date-end-date="0d"  aria-label="Default" aria-describedby="inputGroup-sizing-default" name="startDate" id="startDate">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Survey To Date</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker"  data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="endDate" id="endDate">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                    </div>
                              </div>
                              
                               
                               <div class="form-group">
                              	<div class="row">
                                    <label class="col-lg-2 ">Region</label>
                                    <div class="input-group col-lg-3">
                                       <select class="form-control" id="regionId" name="regionId">
                                       <option value="0" selected="selected">--Select--</option>
                                       <c:forEach items="${regionList}" var="region">
                                         <option value="${region.demographyId}">${region.demographyName}</option>
                                       </c:forEach>
                                       </select>
                                    </div>
                                    <label class="col-sm-2 ">Institute Name</label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="rcId" name="rcId">
                                       <option value="0" selected="selected">--Select--</option>
                                       <c:forEach items="${rcList}" var="rcName"> 
                                       	    <option value="${rcName.researchCenterId}">${rcName.researchCenterName}</option>
                                       </c:forEach>
                                          
                                       </select>
                                    </div>
                              	</div>
                              	</div>
                              <div class="form-group">
                                 <div class="row">
                               <label class="col-lg-2 ">Survey No.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" id="surveyNo" name="surveyNo" placeholder="" data-bv-field="fullName">
                                    </div>
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary" id="searchbutton" onclick="return checkSearch()"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                 </div>
                              </div>
                      </form>
                           </div>
                           <div class="text-center" > <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                        <div>
                        	<%-- <p style='font:bold;'>Year :${SelectedYear}     Season  :${seasonName.vchSeason} </p> --%>  
                        </div>
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                                 <thead style=" border: 1px solid black;">
                                    <tr>
                                       <th rowspan="4" style=" border: 1px solid black;">Sl#</th>
                                       <th rowspan="4" style=" border: 1px solid black;">Survey No.</th>
                                       <th colspan="3" style="text-align:center; border: 1px solid black;">Surveyor Details</th>
                                       <th colspan="13" style="text-align:center; border: 1px solid black;">Survey Details</th>
                                       <th colspan="5" style="text-align:center; border: 1px solid black;">Site Information</th>
                                       <%-- <input type="text" value="${rustSize}"> --%>
                                       <th colspan="${rustSize.size()*3}" style="text-align:center; border: 1px solid black;">Rust Details</th>
                                      <th rowspan="4" style=" border: 1px solid black;">Sample Collected</th>
                                     
                                       <th colspan="${sampleList.size()*3}" style="text-align:center; border: 1px solid black;"> Sample Details</th>
                                       <th colspan="5" style="text-align:center; border: 1px solid black;"> Fungicide Details</th>
                                       
                                        <th colspan="${otherDisease.size()*2}" style="text-align:center; border: 1px solid black;"> Other Disease</th>
                                       
                                       <th colspan="4" style="text-align:center; border: 1px solid black;"> Other Details</th>
                                       
                                       <%-- <th colspan="${diseaseListAny.size()*diseaseListAny.size()}" style="border: 1px solid black;">Any Other Disease</th> --%>
                                    
                                       
                                    </tr>
                                   <tr>
								       <th rowspan="3" style="border: 1px solid black;">Country</th>
	                                   <th rowspan="3" style="border: 1px solid black;">Surveyor Name</th>
	                                   <th rowspan="3" style="border: 1px solid black;">Institution</th>
								       <th rowspan="3" style="border: 1px solid black;">Season</th>
	                                    <th rowspan="3" style="border: 1px solid black;">Region</th>
	                                    <th rowspan="3" style="border: 1px solid black;">Zone</th>
	                                    <th rowspan="3" style="border: 1px solid black;">Woreda</th>
	                                    <th rowspan="3" style="border: 1px solid black;">Kebele</th>
	                                    <th rowspan="3" style="border: 1px solid black;">Altitude</th>
									     <th rowspan="3" style="border: 1px solid black;">Longitude</th>
	                                     <th rowspan="3" style="border: 1px solid black;">Latitude</th>
									     <th rowspan="3" style="border: 1px solid black;">Survey Date</th>
	                                     <th rowspan="3" style="border: 1px solid black;"> Planting Date</th>
	                                     <th rowspan="3" style="border: 1px solid black;"> First Rust Observation Date</th>
									    <th rowspan="3" style="border: 1px solid black;">Contacted Farmer</th>
	                                    <th rowspan="3" style="border: 1px solid black;">Remarks</th>
	                                    <th rowspan="3" style="border: 1px solid black;">Survey Site</th>
								        <th rowspan="3" style="border: 1px solid black;">Wheat Type</th>
                                       <th rowspan="3" style="border: 1px solid black;">Variety</th>
                                       <th rowspan="3" style="border: 1px solid black;">Growth Stage</th>
								        <th rowspan="3" style="border: 1px solid black;">Area</th>
								        
								        <!-- Rust Details 2 Sub Heading Start-->
								        <c:forEach items="${rustSize}" var="rName">
								        
                                      	<th class="column" colspan="3" style="text-align:center; border: 1px solid black;">${rName.vchRustType}</th>
                                      	 </c:forEach>
                                      	<!-- Rust Details 2 Sub Heading End-->
                                      	
                                      	
                                      	<!-- Sample Details 2 Sub Heading Start-->
                                      	 <c:forEach items="${sampleList}" var="samplDtl">
                                      	 		<th class="column" colspan="3" style="text-align:center; border: 1px solid black;">${samplDtl.sampleName}</th>
                                      	 		
                                      	</c:forEach> 
                                      	<!-- Sample Details 2 Sub Heading End -->
                                      	
                                      	<!-- Fungicide 2 Sub Heading End -->
                                      	<th rowspan="2" style="border: 1px solid black;">Fungicide Applied</th>
                                      	<th rowspan="2" style="border: 1px solid black;">Fungicide Used</th>
                                      	<th rowspan="2" style="border: 1px solid black;">Dose</th>
                                      	<th rowspan="2" style="border: 1px solid black;">Spray Date</th>
                                      	<th rowspan="2" style="border: 1px solid black;">Effectiveness</th>
                                      	<!-- Fungicide 2 Sub Heading End -->
                                      	
                                      	<!-- Other Disease 2 Sub Heading Start-->
                                      	
                                      	  <c:forEach items="${otherDisease}" var="otherDiseaseDtl">
                                      	 		<th class="column" colspan="2" style="text-align:center; border: 1px solid black;">${otherDiseaseDtl.diseaseName}</th>
                                      	</c:forEach> 
                                      	
                                      	<!-- Other Disease 2 Sub Heading End-->
                                      	
                                      	<!-- Other Details 2 Sub Heading Start -->
                                      	<th rowspan="2"  style="border: 1px solid black;">Irrigated</th>
                                      	<th rowspan="2"  style="border: 1px solid black;">Weed Control</th>
                                      	<th rowspan="2"  style="border: 1px solid black;">Soil Color</th>
                                      	<th rowspan="2"  style="border: 1px solid black;">Moisture</th>
                                      	<!-- Other Details 2 Sub Heading End -->
                                     </tr>
                                     <tr> 	 
                                      		<!-- Rust Details 3 Sub Heading Start--> 
                                     	<c:forEach items="${rustSize}" var="rName">
								        <th class="column" rowspan="1" style="border: 1px solid black; font-family: sans-serif;">Incident</th>
								        <th class="column" rowspan="1" style="border: 1px solid black; font-family: sans-serif;">Severity</th>
								        <th class="column" rowspan="1" style="border: 1px solid black; font-family: sans-serif;">Reaction</th>
                                      	 </c:forEach>
                                      	 
                                      	 <!-- Rust Details 3 Sub Heading End--> 
                                      	 
                                      	 <!-- Sample Details 3 Sub Heading Start-->
                                      	 <c:forEach items="${sampleList}" var="samplDtl">
                                      			<th class="column" rowspan="1" style="border: 1px solid black; font-family: sans-serif;">No. Of Sample</th>
                                      			<th class="column" rowspan="1" style="border: 1px solid black; font-family: sans-serif;">Sample ID</th>
                                      			<th class="column" rowspan="1" style="border: 1px solid black; font-family: sans-serif;">Remarks</th>
                                      	</c:forEach> 
                                      	<!-- Sample Details 3 Sub Heading End -->
                                      	 
                                      	 
                                      	 <!-- Other Disease 3 Sub Heading Start-->
                                      	
                                      	  <c:forEach items="${otherDisease}" var="otherDiseaseDtl">
                                      			<th class="column" rowspan="1" style="border: 1px solid black; font-family: sans-serif;">Incident</th>
                                      			<th class="column" rowspan="1" style="border: 1px solid black; font-family: sans-serif;">Severity</th>
                                      	</c:forEach> 
                                      	
                                      	
								    </tr>
                                 </thead>
                                 <thead>
                                
                                 
                                 </thead>
                                 <tbody>
                                 <c:forEach items="${ExcelDataList}" var="excelIst" varStatus="count">
                                 <tr>
                                 	<td>${(count.count + (SelectedPage * 10))-10}</td>
                                 	<td>${excelIst.surveyNo}</td>
                                 	<td>${excelIst.country}</td>
                                 	<td>${excelIst.surveyourName}</td>
                                 	<td>${excelIst.rcName}</td>
                                 	<td>${excelIst.season}</td>
                                 	<td>${excelIst.region}</td>
                                 	<td>${excelIst.zone}</td>
                                 	<td>${excelIst.woreda}</td>
                                 	<td>${excelIst.kebele}</td>
                                 	<td>${excelIst.altitude}</td>
                                 	<td>${excelIst.longitude}</td>
                                 	<td>${excelIst.latitude}</td>
                                 	<td>${excelIst.surveyDate}</td>
                                 	<td>${excelIst.plantingDate}</td>
                                 	<td>${excelIst.firstRustObservationDate}</td>
                                 	<td>${excelIst.contactedFarmer}</td>
                                 	<td>${excelIst.remarks}</td>
                                 	<td>${excelIst.surveySite}</td>
                                 	<td>${excelIst.wheatType}</td>
                                 	<td>${excelIst.variety}</td>
                                 	<td>${excelIst.growthStage}</td>
                                 	<td>${excelIst.area}</td>
                                 	
                                 	<!-- Rust Type Start -->
                                 <c:forEach items="${rustSize}" var="rustType">
	                                <script>
	                                  var json =JSON.parse('${excelIst.mapData}') ;
	                                 
	                                 var keys=Object.keys(json)
	                               
	                                 var check = false;
	                                     var html_ = "";
	                                 for(i=0;i<keys.length;i++)
	                                     {
											var key_ = keys[i];
											if(key_ == '${rustType.intRustTypeId}')
												{
												check = true;
												html_ = "<td>"+json[key_][1]+"</td><td>"+json[key_][2]+"</td><td>"+json[key_][3]+"</td>";
												}
	                                     } 
                                     if(check == false)
                                         {
                                    	 var row = $("#viewTable").find('tbody > tr').not('.no').eq('${count.index}');
                                    	 $(row).append('<td></td><td></td><td></td>');
                                         }
                                     else
                                         {
                                    	 var row = $("#viewTable").find('tbody > tr').not('.no').eq('${count.index}');
                                    	 $(row).append(html_);
                                         }
	                                 </script> 
                                 	 </c:forEach>
                                 	 <!-- Rust Type End -->
                                 	  
                                 	  <td>${excelIst.rustAffected}</td>
                                 	  
                                 	  
                                 	  
                                 	  <!-- Sample details Start -->
                                 	   <c:forEach items="${sampleList}" var="samplDtl">
                                      	 		
                                      	 		<script>
	                                  var json =JSON.parse('${excelIst.mapSampleDetails}') ;
	                                 
	                                 var keys=Object.keys(json)
	                               
	                                 var check = false;
	                                     var html_ = "";
	                                 for(i=0;i<keys.length;i++)
	                                     {
											var key_ = keys[i];
											if(key_ == '${samplDtl.sampleId}')
												{
												check = true;
												html_ = "<td>"+json[key_][1]+"</td><td>"+json[key_][2]+"</td><td>"+json[key_][3]+"</td>";
												}
	                                     } 
                                     if(check == false)
                                         {
                                    	 var row = $("#viewTable").find('tbody > tr').not('.no').eq('${count.index}');
                                    	 $(row).append('<td></td><td></td><td></td>');
                                         }
                                     else
                                         {
                                    	 var row = $("#viewTable").find('tbody > tr').not('.no').eq('${count.index}');
                                    	 $(row).append(html_);
                                         }
	                                 </script> 
                                    	</c:forEach>
                                 	  
                                 	  <!-- Sample details End-->
                                 	
                                 	
                                 	<!-- Fungicide Details Start -->
                                 	<td>${excelIst.fungicideApplied}</td>
                                 	<td>${excelIst.fungicideName}</td>
                                 	<td>${excelIst.fungicideDose}</td>
                                 	<td>${excelIst.fungicideSprayDate}</td>
                                 	<td>${excelIst.fungicideEffectiveNessName}</td>
                                 	<!-- Fungicide Details End -->  
                                 	  
                                 	 
                                 	  
                                 	  <!-- Other Disease Start -->
                                	 <c:forEach items="${otherDisease}" var="otherDiseaseDtl">
                                      	 				
                                      	 		<script>
	                                  var json =JSON.parse('${excelIst.mapOtherDisease}') ;
	                                 
	                                 var keys=Object.keys(json)
	                               
	                                 var check = false;
	                                     var html_ = "";
	                                 for(i=0;i<keys.length;i++)
	                                     {
											var key_ = keys[i];
											if(key_ == '${otherDiseaseDtl.diseaseId}')
												{
												check = true;
												html_ = "<td>"+json[key_][1]+"</td><td>"+json[key_][2]+"</td>";
												}
	                                     } 
                                     if(check == false)
                                         {
                                    	 var row = $("#viewTable").find('tbody > tr').not('.no').eq('${count.index}');
                                    	 $(row).append('<td></td><td></td>');
                                         }
                                     else
                                         {
                                    	 var row = $("#viewTable").find('tbody > tr').not('.no').eq('${count.index}');
                                    	 $(row).append(html_);
                                         }
	                                 </script> 
                                    	</c:forEach>
                                 	  
                                 	  <!-- Other Disease End-->
                                 	  
                                 	  <td>${excelIst.irrigated}</td>
                                 	  <td>${excelIst.weedControl}</td>
                                 	  <td>${excelIst.soilColor}</td>
                                 	  <td>${excelIst.moisture}</td>
                                 	  
                                 	 
                                 	  
                                 	   <c:forEach items="${diseaseListAny}" var="anyOtherDiseaseDtl">
                                  	</c:forEach>
                                 	  
                                 </tr>
                                 </c:forEach>
                                    
                                       
                                </tbody>
                              </table>
                           </div>
                           <div id="paginated">
                           </div>
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
 <script>

 var buttons = '${Count}';

buttons = Math.round(buttons/10);
var pag = '${SelectedPage}';

if('${Count}' > (buttons*10))
{
 buttons++;
}
var actv = buttons;
var ind = '${SelectedPage}'-1;
if(ind+9 > buttons)
 {
 ind = buttons - 5;
 }
if(buttons >5 )
 {
 buttons = 5;
 }
 
 
var pagdata = '<div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="myTable_info" role="status" aria-live="polite">Showing '+((pag*10)+1-10)+' to '+(("${Count}" > ((pag*10)))?((pag*10)):"${Count}")+' of ${Count} entries</div></div><div class="col-sm-12 col-md-7"><div style="margin-left:10%;" class="dataTables_paginate paging_simple_numbers" id="myTable_paginate">'+
	'<ul class="pagination"><li class="paginate_button page-item previous" onclick="nextPaginate('+((ind < 0 )?0:1 )+')" id="myTable_previous"><a href="#" aria-controls="myTable" data-dt-idx="0" tabindex="0" class="page-link">First</a></li>'+
	'<li class="paginate_button page-item previous" onclick="nextPaginate(${SelectedPage-1})" id="myTable_previous"><a href="#" aria-controls="myTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>';

	 
for(i=ind;i<buttons+ind;i++)
	{
	if(i < 0)
		{
		break;
		}
	if(i+1 != '${SelectedPage}')
		{
	pagdata += '<li class="paginate_button page-item"><a href="javascript:void(0)" aria-controls="myTable" onclick="nextPaginate('+(i+1)+')" id="paginate'+(i+1)+'" data-dt-idx="1" tabindex="0" class="page-link">'+(i+1)+'</a></li>';
		}
	else
		{
		pagdata += '<li class="paginate_button page-item active"><a href="#" aria-controls="myTable" onclick="nextPaginate('+(i+1)+')" id="paginate'+(i+1)+'" data-dt-idx="1" tabindex="0" class="page-link">'+(i+1)+'</a></li>';
		}
	}
if(buttons+ind == actv)
	{
	buttons = 0;
	}
else
	{
	buttons = buttons+ind+1;
	}
pagdata += 	'<li class="paginate_button page-item previous" onclick="nextPaginate('+((buttons < 0)?1:buttons)+')" id="myTable_previous"><a href="#" aria-controls="myTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a></li>';
pagdata += 	'<li class="paginate_button page-item previous" onclick="nextPaginate('+((buttons < 0)?1:actv)+')" id="myTable_previous"><a href="#" aria-controls="myTable" data-dt-idx="0" tabindex="0" class="page-link">Last</a></li>'+
'	</ul></div></div></div>'; 
$("#paginated").html(pagdata);
	function nextPaginate(butindex)
	{
		if(butindex == 0)
			{
			return false;
			}
		$("#pageindex").val(butindex);
		$("#searchbutton").click();
		
	}
 </script>     
  
 
 <script>


 function checkSearch()
 {
	
	 var startDate = $("#startDate").val();
	 var endDate =  $("#endDate").val();
	 if($('#radioDate').is(':checked')) 
		 {
		 
		 if(startDate.trim() == '' )
			 {
			 $("#startDate").focus();
			 swal(
						'Error!',
						'Survey from date cant be blank..',
						'error'
					)
					return false;
			 }
		 
		 if(endDate.trim() == '' )
		 {
		 $("#endDate").focus();
		 swal(
					'Error!',
					'Survey to date cant be blank..',
					'error'
				)
				return false;
		 }
	 
	 if(startDate.trim() != '' && endDate.trim() == '')
		 {
		 $("#endDate").focus();
		 swal(
					'Error!',
					'Please select Survey Date To.',
					'error'
				)
				return false;
		 }
	 
	 if(startDate.trim() == '' && endDate.trim() != '')
	 {
	 $("#startDate").focus();
	 swal(
				'Error!',
				'Please select Survey Date From.',
				'error'
			)
			return false;
	 }
	 
	 

      if(Date.parse(startDate) > Date.parse(endDate)){
    	  swal("Error", "Survey to date   should not be less than Survey from date", "error");
        	 $("#dateto").focus();
            return false;
    	}
      
		 }
	 else
		 {
		 
		 var seasonId = $("#seasionId").val();
		 var yearId = $("#yearId").val();
		 
		 if(seasonId == 0)
			 {
			 $("#seasionId").focus();
			  swal("Error", "Please select Season.", "error");
			  return false;
			 }
		 
		 if(yearId == 0)
		 {
		 $("#yearId").focus();
		  swal("Error", "Please select Year.", "error");
		  return false;
		 }
		 
		 }
	 
 }
 
 
 $(document).ready(function()
 {

	 $("#yearIdExcel").val($("#yearId").val());
	 $("#seasionIdExcel").val($("#seasionId").val());
	 $("#startDateExcel").val($("#startDate").val());
	 $("#endDateExcel").val($("#endDate").val());
	 $("#regionIdExcel").val($("#regionId").val());
	$("#rcIdExcel").val($("#rcId").val());
	$("#surveyNoExcel").val($("#surveyNo").val());


	$("#yearIdCSV").val($("#yearId").val());
	 $("#seasionIdCSV").val($("#seasionId").val());
	 $("#startDateCSV").val($("#startDate").val());
	 $("#endDateCSV").val($("#endDate").val());
	 $("#regionIdCSV").val($("#regionId").val());
	$("#rcIdCSV").val($("#rcId").val());
	$("#surveyNoCSV").val($("#surveyNo").val());

	
 
 });

 </script>

 
 
 <script>
 
 function(){
  
  
  var masterRust='${rustName}';
  //conlose.log(masterRust);
 var rustMapData=$("#rustMapData").val();
 var rustMapDataSize=$("#rustMapDataSize").val();
  };
  

</script>       

<script>

var SelectedYear = '${SelectedYear}';

$("#yearId").val(SelectedYear);
var SeasonId = '${SeasonId}';
$("#seasionId").val(SeasonId);

var startDate='${startDate}';
$("#startDate").val(startDate);

var endDate='${endDate}';
$("#endDate").val(endDate);

var regionId='${regionId}';
if( regionId != null && regionId != undefined && regionId != '')
	{
$("#regionId").val(regionId);
	}

var rcId='${rcId}';
if( rcId != null && rcId != undefined && rcId != '')
	{
$("#rcId").val(rcId);
	}

var surveyNo='${surveyNo}';
$("#surveyNo").val(surveyNo);
var status = '${status}';
if(status != null && status != undefined && status != '')
	{
	if( status == 0)
		{
		$("#radioSeason").click();
		$("#yearseasondiv").show();
		$("#daterangediv").hide();
		}
	else
		{
		$("#radioDate").click();
		$("#yearseasondiv").hide();
		$("#daterangediv").show();
		}
	}
</script>

<script>

$(document).ready(function()
		{
	
	$("#radioSeason,#radioDate").change(function()
			{
		
		
		if($(this).val() == 1)
			{
			$("#yearseasondiv").hide();
			$("#daterangediv").show();
			$("#yearId").val('0');
			$("#seasionId").val('0');
			$("#startDate").val('');
			$("#endDate").val('');
			}
		else
			{
			$("#yearseasondiv").show();
			$("#daterangediv").hide();
			$("#yearId").val('0');
			$("#seasionId").val('0');
			$("#startDate").val('');
			$("#endDate").val('');
			}
			});
		});

</script>