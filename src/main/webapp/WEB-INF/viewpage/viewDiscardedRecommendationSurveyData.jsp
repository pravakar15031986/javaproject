<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="wrsis/pagejs/demography.js"></script>

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Recommendation Survey Data</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Monitor Implementation</li>
                           <li class="breadcrumb-item active" aria-current="page">Recommendation Survey Data</li>
                        </ol>
                     </nav>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                                <a class="nav-item nav-link" href="viewPublishedRecommendationSurveyData">Published</a>
                                <a class="nav-item nav-link active" href="viewDiscardedRecommendationSurveyData">Discarded</a>
                           </ul>
                            <!-- ---------------PDF AND EXCEL DOWNLOAD------------- -->
						<div class="indicatorslist">
                              <button  title="" href="javascript:void(0)" class="btn btn-outline-success btn-sm shadow-none" id="excelIcon" onclick="excelDownload()" data-toggle="tooltip" data-placement="top" data-original-title="Excel"><i class="icon-excel-file"></i></button>
                     </div>  
                     <div class="indicatorslist"> 
                         <form action="downloadRecomendationSurveyDataDetailsWeDiscardPdf" method="post" target="_blank" id="pdfform" class="noload">
						
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="text" style="display: none;"   name="regionIdExcel" id="regionIdPDF">
						<input type="text" style="display: none;"   name="zoneIdExcel" id="zoneIdPDF">
						<input type="text" style="display: none;"   name="woredaIdExcel" id="woredaIdPDF">
						<input type="text" style="display: none;"   name="rNoExcel" id="rNoPDF">
						<input type="text" style="display: none;"   name="startDateExcel" id="startDatePDF">
						<input type="text" style="display: none;"   name="endDateExcel" id="endDatePDF">

						<button type="button" id="pdfdownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1"></i></button>
					</form>
                         </div> 
                        </div>

					<form action="downloadRecomendationSurveyDataDetailsWeDiscardExcel" method="post" id="exceldownload">
						
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="text" style="display: none;"   name="regionIdExcel" id="regionIdExcel">
						<input type="text" style="display: none;"   name="zoneIdExcel" id="zoneIdExcel">
						<input type="text" style="display: none;"   name="woredaIdExcel" id="woredaIdExcel">
						<input type="text" style="display: none;"   name="rNoExcel" id="rNoExcel">
						<input type="text" style="display: none;"   name="startDateExcel" id="startDateExcel">
						<input type="text" style="display: none;"   name="endDateExcel" id="endDateExcel">
						
						
					</form>
					
					
						<input type="text" id="searchRegionId" value="${region}" style="display: none;">
     					<input type="text" id="searchZoneId" value="${zone}" style="display: none;">
						<input type="text" id="searchworedaId" value="${woreda}" style="display: none;">
						<input type="text" id="searchrNo" value="${recomNo}" style="display: none;">
						<input type="text" id="searchStartDate" value="${fromDate}" style="display: none;">
						<input type="text" id="searchEndDate" value="${toDate}" style="display: none;">
						
						<!-- ---------------PDF AND EXCEL DOWNLOAD----------------- -->
                        <!-- Search Panel -->
                         <div class="search-container">
                           <div class="search-sec">
                            <form:form action="viewDiscardedRecommendationSurveyData" modelAttribute="searchVo" autocomplete="off"   method="post"  id="searchForm">
                            
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                            
                           <div class="form-group">
                              <div class="row">
                                    <label class="col-sm-2 ">Region</label>
                                    <div class="col-sm-3">
                                       <form:select class="form-control" path="regionId" id="region" onchange="getDemographyData(this.value,'zone')">
                                          <form:option value="0">--Select--</form:option>
                                          <form:options items="${regionlist}" itemLabel="demographyName" itemValue="demographyId" />
                                       </form:select>
                                    </div>
                                    <label class="col-sm-2 ">Zone</label>
                                    <div class="col-sm-3">
                                    <form:select class="form-control" path="zoneId" id="zone" onchange="getDemographyData(this.value,'woreda')">
                                          <form:option value="0">--Select--</form:option>
                                          <form:options items="${zonelist}" itemLabel="demographyName" itemValue="demographyId" />
                                    </form:select>
                                    </div>
                                 </div>
                                </div>
                                <div class="form-group">
                                 <div class="row">
                                 
                                    <label class="col-sm-2 ">Woreda</label>
                                    <div class="col-sm-3">
                                    <form:select class="form-control" path="woredaId" id="woreda">
                                          <form:option value="0">--Select--</form:option>
                                          <form:options items="${woredalist}" itemLabel="demographyName" itemValue="demographyId" />
                                    </form:select>
                                    </div>
                                   <label class="col-lg-2 ">Monitor Ref No. / Recommendation No.</label>
                                    <div class="col-lg-3">
                                       <form:input type="text" class="form-control" id="refNo" path="monitorRefNumber" data-bv-field="fullName"/>
                                    </div>
                                 </div>
                                 
                              </div>
                             <div class="form-group">
                              <div class="row">
                              
                              <label class="col-lg-2 ">Monitor Date From</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" class="form-control datepicker" id="fromDate" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default"  path="startDate" autocomplete="off"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Monitor Date To</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" class="form-control datepicker"  id="toDate" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default"  path="endDate" autocomplete="off"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <div class="col-lg-2">
                                       <button class="btn btn-primary" onclick="searchData()"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                              </div>
                              </div>
                             </form:form>
                      
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div> 
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                                 <thead>
                                     <tr>
                                      
                                       <th rowspan="2">Sl#</th>
                                       <th rowspan="2">Monitor Ref No.</th>
                                       <th rowspan="2">Monitor Date</th>
                                       <th rowspan="2">Recommendation no.</th>
                                       <th rowspan="2">Region</th>
                                       <th rowspan="2">Zone</th>
                                       <th rowspan="2">Woreda</th>
                                       <th rowspan="2">No of PAs<br> Affected</th>
                                       <th rowspan="2">Total Area<br> Infected(ha)</th>
                                       <th rowspan="2">Total Area<br> Controlled(ha)</th>
                                       <th rowspan="2">Total Area Controlled(%)</th>
                                       <th rowspan="2">Total Fungicides<br> Used (kg(lit))</th>
                                       <th colspan="3">Numbers of <br>Farmers Participated<br> on Spraying</th>
                                       <!-- <th rowspan="2">View</th> -->
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
                         <form:form action="viewRecommendationMoniterImpl" name="form" method="post">
							
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

							<input type="hidden" name="monitorId" id="hddenimpleid"/>
       					 </form:form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
<script>
	$("#demo-form-inline-checkboxall").click(function() {
		$("input[type=checkbox]").prop('checked', $(this).prop('checked'));

	});
</script>
<script>
$(function() {

	$('#viewTable').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "viewMonitorDiscardDataByUserId",
					"data" : function(d) {
						d.regionId= $("#region").val();
						d.zoneId = $("#zone").val();
						d.woredaId =$("#woreda").val();
						d.monitorrefNo = $("#refNo").val();
						d.fromDate = $("#fromDate").val();
						d.toDate = $("#toDate").val();
					}
			},
			"dataSrc": "",
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
	});	
</script>

<script>
$(document).ready(function(){
	$("#searchRCNumber").val($("#tabRecId").val());
});
</script>
<script>
function searchData(){
	event.preventDefault();
	var form = event.target.form;
	var fromDate=$("#fromDate").val();
	var toDate=$("#toDate").val();
	if(fromDate!='')
	{	
	
		if(toDate =='')
		{
			$("#toDate").focus();
			swal('Error!','Please enter Moniter Date To','error')
   			return false; 
		}
	}

	if(toDate!='')
	{	
	
		if(fromDate =='')
		{
			$("#fromDate").focus();
			swal('Error!','Please enter Moniter Date From','error')
   			return false; 
		}
	}
	if(fromDate!='' &&  toDate!='')
	{
		if(Date.parse(fromDate)>Date.parse(toDate))
		{
			$("#fromDate").focus();
			swal('Error!','Moniter Date From Should be less than Moniter Date To','error')
				return false; 
		}
	}
	
	form.submit();	
	//$("#searchForm").submit();
}
</script>

<script>
function edit(impleId){
    //alert(impleId);
	$("#hddenimpleid").val(impleId);
	$("form[name='form']").submit();
}
</script>







<!-- -------------download excel and pdf (Start)---------- -->


<script>
					function excelDownload()
					{
							var region = $("#region").val();
							
							document.getElementById("regionIdExcel").value = region;

							var zone = $("#zone").val();
							document.getElementById("zoneIdExcel").value = zone;

							var woreda = $("#woreda").val();
							document.getElementById("woredaIdExcel").value = woreda;

							var recomNo = $("#refNo").val();
							document.getElementById("rNoExcel").value = recomNo; 
							
							
							
							var sdate = $("#fromDate").val();
							
							document.getElementById("startDateExcel").value = sdate;

							var edate = $("#toDate").val();
							document.getElementById("endDateExcel").value = edate;

							//$("#exceldownload").submit();
							document.getElementById("exceldownload").submit();
							
							}
                        </script>
                        
                        <script>
$(document).ready(function(){
	$("#pdfdownload").click(function()
			{
				 	$("#regionIdPDF").val($("#region").val());
					$("#zoneIdPDF").val($("#zone").val());
					$("#woredaIdPDF").val($("#woreda").val());
					$("#rNoPDF").val($("#refNo").val());
					$("#startDatePDF").val($("#fromDate").val());
					$("#endDatePDF").val($("#toDate").val());
					$("#pdfform").submit();	

			});
});
</script>
   
<!-- -------------download excel and pdf (End)---------- -->