<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>


<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>View Monitoring Data</h4>
				<nav aria-label="breadcrumb"> 
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item active" aria-current="page">Monitoring Data</li>
					</ol>
				</nav>
			</div>
			 
		</div>
		
		<c:if test="${seasonWiseData == 0 }">
        <script>
			$(document).ready(function(){
				$("#seasoinId").show();
				$("#dateId").hide();
				$("#startDate").val("");
				$("#endDate").val("");
				$("#redioSeason").prop("checked", true);
				
			});
        </script>
        </c:if>
        
        <c:if test="${dateWiseData == 1 }">
        <script>
			$(document).ready(function(){
				$("#seasoinId").hide();
				$("#year").val(0);
				$("#season").val(0);
				$("#dateId").show();
				$("#redioDate").prop("checked", true);	
			});
        </script>
        </c:if>
		
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="monitorDataReport">View</a>
						</ul>
						<div class="indicatorslist">
							 <a
								title="" href="Home" id="backIcon"
								 data-toggle="tooltip"
								data-placement="top" data-original-title="Back"><i
								class="icon-arrow-left1"></i></a>
 						</div>
 						<div class="indicatorslist">
                               
                             
                              <button title="Print" id="pdfId"
								class="btn btn-outline-success btn-sm shadow-none"
								onclick="downloadPdf()">
								<i class="icon-printer1"></i>
							</button>
                              <button title="excel" id="excelId"
								class="btn btn-outline-success btn-sm shadow-none"
								onclick="downloadExcel()">
								<i class="icon-excel-file"></i>
							</button>
							
                              
						</div> 
					</div>
					<!-- Search Panel -->
					<form:form class="col-sm-12 form-horizontal customform" action="monitorDataReport" id="myForm" method="post" modelAttribute="surveyImplementationBean" autocomplete="off">
					<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
					<div class="search-container">
                           <div class="search-sec">
                           
                           <div class="form-group row pad-ver">
								<label class="col-sm-2 control-label">Search By</label>
								<div class="col-sm-10">
								<span class="colon">:</span>
								   <div class="radio">
									  <form:radiobutton  path="searchBySeason" value="0" class="magic-radio sampleyes"  name="form-radio-button"  id="redioSeason" onclick="changeSearchBy(this.value)"/>
									  <label for="redioSeason" tabindex="4">Season</label>  
							   
									  <form:radiobutton   path="searchBySeason"  value="1" class="magic-radio sampleno"  name="form-radio-button" id="redioDate" onclick="changeSearchBy(this.value)"/>
									  <label for="redioDate" tabindex="5">Date Range</label>
								   </div>
								</div>
							 </div>
                           
                           	<div class="form-group" id="seasoinId">
								<div class="row">
								<label class="col-lg-2 ">Year</label>
										<div class="col-lg-3">
											<form:select id="year" path="year" class="form-control">
											 <form:option value="0">--Select--</form:option>
											</form:select>
										</div>
										<label class="col-lg-2 ">Season</label>
										<div class="col-lg-3">
											<form:select id="season" path="seasonId" class="form-control">
											<form:option value="0">--Select--</form:option>
											 <c:forEach items="${SeasionList}" var="seasionList">
                                   <option value="${ seasionList.intSeasoonId}" >${ seasionList.vchSeason}</option>
                                    </c:forEach>
											</form:select>
										</div>
								</div>
							</div>
                           
                              <div class="form-group" id="dateId">
								<div class="row">
								<label class="col-lg-2 ">Monitor From Date</label>
                                    <div class="input-group col-lg-3">
                                       <%-- <input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" value="${startDate}" name="startDate" id="startDate"> --%>
                                       <form:input class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" path="monitorFromDate" id="startDate"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Monitor To Date</label>
                                    <div class="input-group col-lg-3">
                                       <form:input class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" path="monitorToDate" id="endDate"/>
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
										<form:select class="form-control" id="regionId" path="regionId"  onchange="findZoneByRegionId(3,this.value);">
											<form:option value="0">--Select--</form:option>
											<c:forEach items="${regionList}" var="regname">
											<form:option value="${regname.demographyId}">${regname.demographyName}</form:option>
											</c:forEach>
										</form:select>
									</div>
								
									<label class="col-lg-2 ">Zone Name</label>
									<div class="col-lg-3">
										<form:select class="form-control" id="zoneId" path="zoneId"  >
											<form:option value="0">--Select--</form:option>
											
											 
 										</form:select>
										 
									</div>
                              	
                              	</div>
                              </div>
							
							<div class="form-group">
							<div class="row">
										<label class="col-lg-2 ">Monitor No.</label>
									<div class="col-lg-3">
									<form:input class="form-control" path="monitorno" placeholder="" data-bv-field="fullName" id="monitorId"  name="monitorId"
												autocomplete="off" maxlength="15"/>
 									</div>
									<label class="col-lg-2 ">Recommendation No.</label>
									<div class="col-lg-3">
										<form:input class="form-control" path="recomno" placeholder="" data-bv-field="fullName" id="recNoId" name="recNo"
												autocomplete="off" maxlength="15"/>
									</div>
										
										<div class="col-lg-2">
										<button class="btn btn-primary" type="button" id="btnSubmit">
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
					<%-- <form action="viewsurveyForRaceanalysis" autocomplete="off" id="myForm1"   method="post">
			         <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
			       </form> --%>
					
					<div class="card-body">
						<div class="table-responsive">
						 
						
							<table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
								<thead>
									<tr>
										<th rowspan="2">Sl#</th>
                                       <th rowspan="2">Monitor Ref No.</th>
                                       <th rowspan="2">Monitor<br> Created Date</th>
                                       <th rowspan="2">Recommendationa<br> No.</th>
                                       <th rowspan="2">Region</th>
                                       <th rowspan="2">Zone</th>
                                       <th rowspan="2">	Woreda</th>
                                       <th rowspan="2">No of PAs<br> Affected</th>
                                       <th rowspan="2">Total Area<br> Infected(ha)</th>
                                       <th rowspan="2">Total Area<br> Controlled(ha)</th>
                                       <th rowspan="2">Total Area Controlled(%)</th>
                                       <th rowspan="2">Total Fungicides<br> Used (kg(lit))</th>
                                       <th colspan="3">Numbers of <br>Farmers Participated<br> on Spraying</th>
 									</tr>
									
									<tr>
	                                    <th>Male</th>
								      <th>Female</th>
								      <th>Total</th>
                                    </tr>
								</thead>
								<tbody> 
								     
								       <%-- <c:forEach items="${monitorDataList}" var="list" varStatus="counter">
                                      <tr>
                                       <td>${counter.count}</td>
                                       <td>${list.monitorno}</td>
                                       <td>${list.monitordate}</td>
                                       <td>${list.recomno}</td>
                                       <td>${list.region}</td>
                                       <td>${list.zone}</td>
                                       <td>${list.woreda}</td>
                                       <td>${list.nopaeffected}</td>
                                       <td>${list.totalAreaInfested}</td>
                                       <td>${list.totalControlledha}</td>
                                       <td>${list.totalControlledpercent}</td>
                                       <td>${list.totalFungicidesUsed}</td>
                                       <td>${list.malefarmer}</td>
                                       <td>${list.femalefarmer}</td>
                                       <td>${list.totalfarmer}</td>
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
		<form action="monitorData-excel-download" id="excelForm" method="post">
		<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
       		<input type="hidden" id="regionEId" name="region">
       		<input type="hidden" id="zoneEId" name="zone">
       		<input type="hidden" id="monitorEId" name="monitor">
       		<input type="hidden" id="recNoEId" name="recNo">
       		<input type="hidden" id="fromdateEId" name="fromdate">
       		<input type="hidden" id="todateEId" name="todate">
       		<input type="hidden" id="yearEId" name="year">
       		<input type="hidden" id="seasonEId" name="season">
        </form>
        <form action="downloadMonitorDataPDF" target="_blank" id="pdfform" autocomplete="off"   method="post" class="noload">
        	<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
        	<input type="hidden" id="regionPDF" name="regionPDF">
       		<input type="hidden" id="zonePDF" name="zonePDF">
       		<input type="hidden" id="monitorPDF" name="monitorPDF">
       		<input type="hidden" id="recNoPDF" name="recNoPDF">
       		<input type="hidden" id="fromdatePDF" name="fromdatePDF">
       		<input type="hidden" id="todatePDF" name="todatePDF">
       		<input type="hidden" id="yearPDF" name="yearPDF">
       		<input type="hidden" id="seasonPDF" name="seasonPDF">
		
		</form>
	</div>
</div>

 
 
<script>



/* function checkValidate(){
    var curyear=$("#year").val();
    var seasonVal=$("#seasonId").val();
    if(curyear == 0){
  		swal("Error", "Year should not blank.", "error").then(function() {
			   $("#year").focus();
		   });
	  		  return false;
  	     }
    if(seasonVal == 0){
  		swal("Error", "Season should not blank.", "error").then(function() {
			   $("#seasonId").focus();
		   });
	  		  return false;
  	     }
    
} */	  
 

function findZoneByRegionId(levelId,parentId)
{
 //alert(levelId,parentId);	
	$.ajax({
		type : "GET",
		url : "find-zone-by-region-id", 
	 
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			 
			//alert(response);
			var html = "<option value='0'>---Select---</option>";
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				$.each(val,function(index, value) {						
					html=html+"<option value="+value.zoneId+" >"+value.zoneName+"</option>";
				});
			}
			 $('#zoneId').empty().html(html);
 			 
		},error : function(error) {
			 
		}
	});
} 
  

$(document).ready(function(){
		
		/* $('#viewTable').DataTable({
         "paging":   true,
         "ordering": true,
         "info":     true,
         'searching':false,
      //initialization params as usual
        fnInitComplete : function() {
           if ($(this).find('td').length<=1) {
              $('.dataTables_wrapper').hide();
              swal("No record found")
              }
           }
     }) */
if($("#yearId").val()==null)
	
     
     $('#viewTable').dataTable({
			
    	 'processing' : true,
    	 'serverSide' : true,
    	 "searching": false,
    	 "ordering": false, 
    	 "ajax" : {
    	 	"url" : "monitorReportDashboardPagination",
    	 	"data" : function(d) {
    	 		d.year=$("#year").val();
    	 		d.seasonId=$("#season").val();
    	 		d.monitorFromDate =$("#startDate").val();
    	 		d.monitorToDate =$("#endDate").val();
    	 		d.regionId =$("#regionId").val();
    	 		d.zoneId =$("#zoneId").val();
    	 		d.monitorNo =$("#monitorId").val();
    	 		d.recommendationId =$("#recNoId").val();
    	 		},
    	 "dataSrc": function ( json ) {
    	     if(json.data.length>0)
    	         {
    	         $('#pdfId').show();
    	         $('#excelId').show();
    	         $('.card-body').show();
    	         }else{
    	         	 $('#pdfId').hide();
    	              $('#excelId').hide();
    	              $('.card-body').hide();
    	              swal('No record found','','')
    	             }
    	     return json.data;
    	 }
    	 	},
    	 	
    	 	"columns":[
    	 		{"data":"sNo"},
    	 		{"data":"monitorno"},
    	 		{"data":"monitordate"},
    	 		{"data":"recomno"},
    	 		{"data":"region"},
    	 		{"data":"zone"},
    	 		{"data":"woreda"},
    	 		{"data":"nopaeffected"},
    	 		{"data":"totalAreaInfested"},
    	 		{"data":"totalControlledha"},
    	 		{"data":"totalControlledpercent"},
    	 		{"data":"totalFungicidesUsed"},
    	 		{"data":"malefarmer"},
    	 		{"data":"femalefarmer"},
    	 		{"data":"totalfarmer"}
    	 	]
    	 		});
     
     $("#zoneId").val(${selectedZone})
});

/* $(document).on('click', '.viewsurvey', function()
			{
 			   var surveyId = $(this).attr('survey-id');
			   $("#surveyId1").val(surveyId);
			   $("#myForm1").submit();
 }); */
 
  function downloadExcel(){
 	 $("#regionEId").val($("#regionId").val());
	$("#zoneEId").val($("#zoneId").val());
	$("#monitorEId").val($("#monitorId").val());
	$("#recNoEId").val($("#recNoId").val());
	$("#fromdateEId").val($("#startDate").val());
	$("#todateEId").val($("#endDate").val());
	$("#yearEId").val($("#year").val());
	$("#seasonEId").val($("#season").val());
 	$("#excelForm").submit(); 
    } 
 
 	function downloadPdf(){
 	
		$("#regionPDF").val($("#regionId").val());
		$("#zonePDF").val($("#zoneId").val());
		$("#monitorPDF").val($("#monitorId").val());
		$("#recNoPDF").val($("#recNoId").val());
		$("#fromdatePDF").val($("#startDate").val());
		$("#todatePDF").val($("#endDate").val());
		$("#yearPDF").val($("#year").val());
		$("#seasonPDF").val($("#season").val());
		$("#pdfform").submit();
		
} 


 	var zones = '${zoneList}';
 
	 
	if (zones != "" && zones != null) {
		var zlist=JSON.parse(zones);
		
		$.each(zlist,function(index, value) {						
			$("#zoneId").append("<option value="+value.zoneId+" >"+value.zoneName+"</option>");
		});
	}

	 
 	
 var yearList = '${YearList}';
 yearList = JSON.parse(atob(yearList));
 for(i=0;i<yearList.length;i++)
 	 {
 	 	
 	 $("#year").append('<option value="'+yearList[i]+'" >'+yearList[i]+'</option>');
 	 
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


	
</script>
<script>
function changeSearchBy(qType){
	
	if(qType==0)
	{
		/* var SelectedYear = '${SelectedYear}';
		$("#dropdownYear").val(SelectedYear);
		var SeasonId = '${SeasonId}';
		$("#seasionId").val(SeasonId); */
		$("#seasoinId").show();
		$("#dateId").hide();
		$("#startDate").val("");
		$("#endDate").val("");
	}
	if(qType==1)
	{
		
		$("#seasoinId").hide();
		$("#dateId").show();
		$("#year").val(0);
		$("#season").val(0);
		/* alert("value of year="+$("#year").val())
		alert("value of season="+$("#season").val()) */
	}
}
</script>
<script>
$(document).ready(function(){
	$("#btnSubmit").click(function(){
		
		
		 var radioValue = $("input[name='searchBySeason']:checked").val();
		
		 if(radioValue == 0)
		{	 
			 if($("#year").val()!=0 && $("#season").val()==0)
			{
				swal("Error","Please select Season","error").then(function(){
					$("#season").focus();
				});
				return false;
			}
			if($("#year").val()==0 && $("#season").val()!=0)
			{
				swal("Error","Please select Year","error").then(function(){
					$("#year").focus();
				});
				return false;
			}
 	}

		 if(radioValue == 1)
		{	
				if($("#startDate").val() =='')
				{
					swal("Error","Please select Monitor From Date ","error").then(function(){
						$("#startDate").focus();
					});
					return false;
				}
			if($("#startDate").val()!="" && $("#endDate").val()=="")
			{
				swal("Error","Please select Monitor To Date","error").then(function(){
					$("#endDate").focus();
				});
				return false;
			}
			if($("#startDate").val()=="" && $("#endDate").val()!="")
			{
				swal("Error","Please select Monitor From Date","error").then(function(){
					$("#startDate").focus();
				});
			return false;
			}
			if(Date.parse($("#startDate").val())>Date.parse($("#endDate").val()))
			{
				swal(
					'Error',
					'Monitor From Date should be less than Monitor To Date',
					'error'
					).then(function(){
						$("#startDate").focus()
					})
					return false; 
			}
		 } 
		 $("#myForm").submit()
	})
});
</script>