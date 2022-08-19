<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Rust Prevalence Report</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">MIS Report</li>
                           <li class="breadcrumb-item active" aria-current="page">Rust Prevalence Report</li>
                        </ol>
                     </nav>
                  </div>
      
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link 	active"  href="prevalenceReport">View</a>
                           </ul>
                            <div class="indicatorslist">
                              
                              <button title="excel"   class="btn btn-outline-success btn-sm shadow-none" onclick="downloadExcel()"><i class="icon-excel-file" ></i></button>
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-container">
                           <form action="searchPrevelanceeport" method="POST">
                           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
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
                              	<label class="col-lg-2 " style="display:none;">Zone</label>
                                    <div class="col-lg-3" style="display:none;">
                                       <select class="form-control" id="zoneId" name="ZoneId">
                                   <option value="0">--Select--</option>
                                    
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
                                       
                                       <th rowspan="2">Region</th>
                                       <th rowspan="2">Zone</th>
                                       <th rowspan="2">No. of fields assessed</th>
                                       <th colspan="2">Yellow Rust</th>
                                       <th colspan="2">Stem Rust</th>
                                       <th colspan="2">Leaf rust</th>
                                    </tr>
                                    <tr>
                                    <th>Infected field</th>
                                    <th>Prev (%)</th>
                                    <th>Infected field</th>
                                    <th>Prev (%)</th>
                                    <th>Infected field</th>
                                    <th>Prev (%)</th>
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
         
         <form action="rustPrevalenceReportExcelDownload" id="exceldownload" method="post">
         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
       		<input type="hidden" id="YearXL" name="YearXL">
       		<input type="hidden" id="SeasonIdXL" name="SeasonIdXL">
       		<input type="hidden" id="RegionIdXL" name="RegionIdXL">
       		<input type="hidden" id="ZoneIdXL" name="ZoneIdXL">
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
  
  
  $("#regionId").change(function()
 			{
 		
 		var val_ = $(this).val();
 		 
 		
 	 var dataString = 'parentId='+ val_;
	 $.ajax({
	 	type: "POST",
      url : 'getDemographicListZone',
      data: dataString,
      async:false,
		cache: false,
      success : function(data) {  
      	$("#zoneId").val("0");
       
       
          var html = '<option value="0">--Select--</option>';
			var len = data.length;
		if (data.length != 0 ){
			for ( var i = 0; i < len; i++) {
			
				html += '<option value="' + data[i][0] + '">'
						+ data[i][1] + '</option>';
			}
     	    $('#zoneId').html(html); 
		}else{
		 var html = '<option value="0">-Select -</option>';
		 $('#zoneId').html(html); 
		}
			  
      },
		  error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
  });
 			});	
  
  
 var ReportEncodeJson = '${ReportEncodeJson}';
 var json = JSON.parse(atob(ReportEncodeJson));
 console.log(json);
 
 var trhml = '';
 for(i=0;i<json.length;i++)
	 {
	 var jsonObj  = json[i];
	
	 
	 var jsa  = jsonObj.zonedetails;
	 var fields = 0;
	 var yelloInfectedField = 0;
	 var stemInfectedField = 0;
	 var leafInfectedField = 0;
	 var yelloInfectedFieldPer = 0;
	 var stemInfectedFieldPer = 0;
	 var leafInfectedFieldPer = 0;
	 
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
		 	trhml += "<td>"+jsa[j].field+"</td>";
		 	fields += jsa[j].field;
		 	
		 	var rustJsa = jsa[j].rustdtls;
		 	
		 	
		 	var yellowRust = false;
		 	var stemRust = false;
		 	var leafRust = false;
		 	
		 	var yellowInner = {};
		 	var stemInner = {};
		 	var leafInner = {};
		 	
		 	
		 	
		 	for(k=0;k<(rustJsa != null && rustJsa.length);k++)
		 		{
		 			if(rustJsa[k].rusttype == 3)//yellow
		 				{
		 				yellowRust = true;
		 				yellowInner.infected = rustJsa[k].infected;
		 				yellowInner.infectedper = rustJsa[k].infectedper;
		 				
		 				}
		 			
		 			if(rustJsa[k].rusttype == 1) // stem
	 				{
		 				stemRust = true;
		 				stemInner.infected = rustJsa[k].infected;
		 				stemInner.infectedper = rustJsa[k].infectedper;
	 				}
		 			
		 			if(rustJsa[k].rusttype == 2) // leaf
	 				{
		 				leafRust = true;
		 				leafInner.infected = rustJsa[k].infected;
		 				leafInner.infectedper = rustJsa[k].infectedper;
	 				}
		 		}
		 	
		 	if(yellowRust == true)
		 		{
		 		trhml += "<td>"+yellowInner.infected+"</td>";
		 		trhml += "<td>"+yellowInner.infectedper+"</td>";
		 		yelloInfectedField += yellowInner.infected;
		 		yelloInfectedFieldPer += yellowInner.infectedper;
		 		}
		 	
		 	if(yellowRust == false)
	 		{
		 		trhml += "<td>0</td>";
		 		trhml += "<td>0</td>";
	 		}
		 	
		 	if(stemRust == true)
	 		{
		 		trhml += "<td>"+stemInner.infected+"</td>";
		 		trhml += "<td>"+stemInner.infectedper+"</td>";
		 		stemInfectedField += stemInner.infected;
		 		stemInfectedFieldPer += stemInner.infectedper;
	 		}
	 	
	 	if(stemRust == false)
 		{
	 		trhml += "<td>0</td>";
	 		trhml += "<td>0</td>";
 		}
	 	
	 	if(leafRust == true)
 		{
	 		trhml += "<td>"+leafInner.infected+"</td>";
	 		trhml += "<td>"+leafInner.infectedper+"</td>";
	 		leafInfectedField += leafInner.infected;
	 		leafInfectedFieldPer += leafInner.infectedper;
 		}
 	
 	if(leafRust == false)
		{
 		trhml += "<td>0</td>";
 		trhml += "<td>0</td>";
		}
		 	
		 	
	 trhml += "</tr>";
		 }
	 yelloInfectedFieldPer = (((yelloInfectedFieldPer)*100)/(jsa.length*100));
	 stemInfectedFieldPer = (((stemInfectedFieldPer)*100)/(jsa.length*100));
	 leafInfectedFieldPer = (((leafInfectedFieldPer)*100)/(jsa.length*100));
	 trhml += "<tr><td></td><td><b>Total</b></td><td><b>"+fields+"</b></td><td><b>"+yelloInfectedField+"</b></td><td><b>"+yelloInfectedFieldPer+"</b></td><td><b>"+stemInfectedField+"</b></td><td><b>"+stemInfectedFieldPer+"</b></td><td><b>"+leafInfectedField+"</b></td><td><b>"+leafInfectedFieldPer.toFixed(2)+"</b></td>";
	 
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
 $("#seasonname").html($("#seasonId option:selected").html());
 
 var RegionId = '${RegionId}';
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



 //Print and Excel Download
 
 function downloadExcel(){
	//alert("In Excel");
	$("#YearXL").val($("#year").val());
	$("#SeasonIdXL").val($("#seasonId").val());
	$("#RegionIdXL").val($("#regionId").val());
	$("#ZoneIdXL").val($("#zoneId").val());
	$("#exceldownload").submit(); 
}
function downloadPdf(){
	//alert("in pdf");
	$("#Year").val($("#year").val());
	$("#SeasonId").val($("#seasonId").val());
	$("#RegionId").val($("#regionId").val());
	$("#ZoneId").val($("#zoneId").val());
	$("#pdfdownload").submit();
	
}
 
 
 </script>