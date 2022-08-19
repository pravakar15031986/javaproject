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
                     <h4>Rust Report</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Dashboard</li>
                           <li class="breadcrumb-item active" aria-current="page">Rust Report</li>
                        </ol>
                     </nav>
                  </div>
        <c:if test="${seasonWiseData == 0 }">
        <script>
			$(document).ready(function(){
				$("#seasoinId").show();
				$("#dateId").hide();
				$("#redioSeason").prop("checked", true);
				
			});
        </script>
        </c:if>
        
        <c:if test="${dateWiseData == 1 }">
        <script>
			$(document).ready(function(){
				$("#seasoinId").hide();
				$("#dateId").show();
				$("#redioDate").prop("checked", true);	
			});
        </script>
        </c:if>
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                               <a class="nav-item nav-link active"  href="rustReport">View</a>
                            </ul>
                    <div class="indicatorslist">
                             
                            <button title="Print" id="pdfDownload" onclick="downloadPdf()" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1" ></i></button>
                            
                            <button  title="" href="javascript:void(0)" class="btn btn-outline-success btn-sm shadow-none" id="excelIcon" onclick="downloadExcel()" data-toggle="tooltip" data-placement="top" data-original-title="Excel"><i class="icon-excel-file"></i></button>
                               <a
								title="" href="Home" id="backIcon"
								 data-toggle="tooltip"
								data-placement="top" data-original-title="Back"><i
								class="icon-arrow-left1"></i></a>
                               
                            
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                             <form:form action="rustReportDataSearch" modelAttribute="searchVo" autocomplete="off"   method="post">
                             <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           		<c:if test="${showSearch eq false }"><div class="search-sec"></c:if>
                           		<c:if test="${showSearch eq true }"><div class="search-sec" style="display:block;"></c:if>
                           		<div class="form-group row pad-ver">
								<label class="col-sm-2 control-label">Search By</label>
								<div class="col-sm-10">
								<span class="colon">:</span>
								   <div class="radio">
									  <form:radiobutton  path="searchBySeason" value="0" class="magic-radio sampleyes"  name="searchBy"  id="redioSeason" onclick="changeSearchBy(this.value)"/>
									  <label for="redioSeason" tabindex="4">Season</label>  
							   
									  <form:radiobutton   path="searchBySeason"  value="1" class="magic-radio sampleno"  name="searchBy" id="redioDate" onclick="changeSearchBy(this.value)"/>
									  <label for="redioDate" tabindex="5">Date Range</label>
								   </div>
								</div>
							 </div>
                           		<div class="form-group" id="seasoinId">
								<div class="row">
									<label class="col-sm-2 ">Year<span class="text-danger">*</span></label>
									<div class="col-sm-3">
										<form:select class="form-control" id="yearId"
											path="yearId">
											<form:option value="0">--Select--</form:option>
											<c:forEach items="${year}" var="vo">
											<form:option value="${vo}">${vo}</form:option>
											</c:forEach>
										</form:select>
									</div>
									<label class="col-lg-2 ">Season<span class="text-danger">*</span></label>
									<div class="col-lg-3">
										<form:select class="form-control" path="seasonId"
											id="seasonTypeId">
											<form:option value="0">--Select--</form:option>
											<c:forEach items="${seasons}" var="vo">
												<form:option value="${vo.intSeasoonId}">${vo.vchSeason}</form:option>
											</c:forEach>
										</form:select>
									</div>
								</div>
							</div>
							
							<div class="form-group" id="dateId">
                              	<div class="row">
                              	<label class="col-lg-2 ">Survey From Date </label>
                                    <div class="input-group col-lg-3">
                                       <%-- <input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" value="${startDate}" name="startDate" id="startDate"> --%>
                                       <form:input class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" path="startDate" id="startDate"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Survey To  Date</label>
                                    <div class="input-group col-lg-3">
                                       <form:input class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" path="endDate" id="endDate"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                              	</div>
                              </div>
							
                              <div class="form-group location-filter">
								<div class="row">
									<label class="col-lg-2 ">Region</label>
									<div class="col-lg-3">
										<form:select class="form-control" id="region" path="regionId" onchange="getDemographyData(this.value,'zone')">
                                   <form:option value="0">--Select--</form:option>
                                   <c:forEach items="${regionlist}" var="countr" >
                                    <form:option value="${countr.demographyId}">${countr.demographyName}</form:option>
                                    </c:forEach>
                                    </form:select>
									</div>
									<label class="col-lg-2 ">Zone</label>
									<div class="col-lg-3">
										<form:select class="form-control" path="zoneId" id="zone" onchange="getDemographyData(this.value,'woreda')">
                                          <form:option value="0">--Select--</form:option>
                                          <form:options items="${zonelist}" itemLabel="demographyName" itemValue="demographyId" />
                                    </form:select>
									</div>
								</div>
							</div>
							<div class="form-group location-filter">
								<div class="row">
									<label class="col-lg-2 ">Woreda</label>
									<div class="col-lg-3">
										<form:select class="form-control" path="woredaId" id="woreda" onchange="getDemographyData(this.value,'kebele')">
                                          <form:option value="0">--Select--</form:option>
                                          <form:options items="${woredalist}" itemLabel="demographyName" itemValue="demographyId" />
                                    </form:select>
									</div>
									<label class="col-lg-2 ">Kebele</label>
									<div class="col-lg-3">
										<form:select class="form-control" path="kebeleId" id="kebele">
                                          <form:option value="0">--Select--</form:option>
                                          <form:options items="${kebelelist}" itemLabel="demographyName" itemValue="demographyId" />
                                    </form:select>
									</div>
								</div>
							</div>
                              
                              <div class="form-group">
                                 <div class="row">
                               <label class="col-sm-2 ">Institution Name</label>
										<div class="col-sm-3">
											<form:select class="form-control" path="rcId" id="researchId">
												<form:option value="0">--Select--</form:option>
												<c:forEach items="${researchCenterList}" var="rc">
													<form:option value="${rc.researchCenterId}">${rc.researchCenterName}</form:option>
												</c:forEach>
											</form:select>
										</div>
										<label class="col-sm-2 ">Type of Rust</label>
										<div class="col-sm-3">
											<form:select class="form-control" path="rustTypeId" id="rustTypeId">
												<form:option value="0">--Select--</form:option>
												<c:forEach items="${rustTypeList}" var="rust">
													<form:option value="${rust.rustId}">${rust.typeOfRust}</form:option>
												</c:forEach>
											</form:select>
										</div>

									</div>
                              </div>
                              
                              <div class="form-group">
                                 <div class="row">
                               <label class="col-lg-2 ">Survey No.</label>
                                    <div class="col-lg-3">
                                        <%-- <input type="text" class="form-control"  placeholder="" data-bv-field="fullName" id="surveyNo" name="surveyNo" value="${surveyNo}"> --%>
                                    <form:input class="form-control"  placeholder="" data-bv-field="fullName" id="surveyNo" path="surveyNo" maxlength="10" onkeypress="return checkRecNo(event);"/>
                                    </div>
                                    <label class="col-sm-2 ">Mode of Data Collection</label>
										<div class="col-sm-3">
											<form:select class="form-control" path="dataId" id="dataModeId">
												<form:option value="0">--Select--</form:option>
												<c:forEach items="${dataModeList}" var="dm">
													<form:option value="${dm.dataCollectModeId}">${dm.dataCollectMode}</form:option>
												</c:forEach>
											</form:select>
										</div>

										<div class="col-lg-2">
                                       <button class="btn btn-primary" id="btnSubmit"> <i class="fa fa-search"></i> Search</button>
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
                                   
                                       <th width="40px">Sl#</th>
                                       <th>Survey No.</th>
                                       <th>Survey Date</th>
                                        <th>Region</th>
                                       <th>Zone</th>
                                       <th>Woreda</th>
                                       <th>Kebele</th>
                                       <th>Instituition Name</th>
                                       <th>Type of Rust</th>
                                       <th>Mode of Data Collection</th>
                                       
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <%-- <c:forEach items="${details}" var="dtls" varStatus="count">
                                    <tr>
                                       <td>${count.index + 1 }</td>
                                       <td><a href="javascript:void(0);" class="viewsurvey" survey-id="${dtls.surveyId }">${dtls.surveyNo }</a></td>
                                       <td> ${dtls.surveyDate }</td>
                                        <td>${dtls.region }</td>
                                       <td>${dtls.zone  }</td>
                                       <td>${dtls.woreda  }</td>
                                       <td>${dtls.kebele}</td>
                                       <td>${dtls.institutionName}</td>
                                       <td>${dtls.rust  }</td>
                                       <td>${dtls.mode  }</td>
                                     </tr>
                                   </c:forEach> --%>
                                   </tbody>
                              </table>
                           </div>
                           
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div> 
               <form action="viewRustDetailsOnDashboard" id="myForm1" method="post">
          	<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
          	<input type="hidden"  name="surveyId" id="surveyId1">
          	<input type="hidden"   name="r_url" value="rustReport">
          </form>
            <form action="rust-report-excel-download" id="excelForm" method="post">
       		<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
       		<input type="hidden" id="yearIdXl" name="yearIdXl">
       		<input type="hidden" id="seasonTypeIdXl" name="seasonTypeIdXl">
       		<input type="hidden" id="regionXl" name="regionXl">
       		<input type="hidden" id="zoneXl" name="zoneXl">
       		<input type="hidden" id="woredaXl" name="woredaXl">
       		<input type="hidden" id="kebeleXl" name="kebeleXl">
       		<input type="hidden" id="startDateXl" name="startDateXl">
       		<input type="hidden" id="endDateXl" name="endDateXl">
       		<input type="hidden" id="researchIdXl" name="researchIdXl">
       		<input type="hidden" id="rustTypeIdXl" name="rustTypeIdXl"> 
       		<input type="hidden" id="surveyNoXl" name="surveyNoXl"> 
        	<input type="hidden" id="dataModeIdXl" name="dataModeIdXl">
       </form>  
       
       <form action="rust-report-pdf-download" id="pdfForm" method="post"  target="_blank"  class="noload">
       		<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
       		<input type="hidden" id="yearIdPDF" name="yearIdXl">
       		<input type="hidden" id="seasonTypeIdPDF" name="seasonTypeIdXl">
       		<input type="hidden" id="regionPDF" name="regionXl">
       		<input type="hidden" id="zonePDF" name="zoneXl">
       		<input type="hidden" id="woredaPDF" name="woredaXl">
       		<input type="hidden" id="kebelePDF" name="kebeleXl">
       		<input type="hidden" id="startDatePDF" name="startDateXl">
       		<input type="hidden" id="endDatePDF" name="endDateXl">
       		<input type="hidden" id="researchIdPDF" name="researchIdXl">
       		<input type="hidden" id="rustTypeIdPDF" name="rustTypeIdXl"> 
       		<input type="hidden" id="surveyNoPDF" name="surveyNoXl"> 
        	<input type="hidden" id="dataModeIdPDF" name="dataModeIdXl">
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
	"url" : "rustReportDashboardPagination",
	"data" : function(d) {
		d.year=$("#yearId").val();
		d.seasonId=$("#seasonTypeId").val();
		d.surveyFromDate =$("#startDate").val();
		d.surveyToDate =$("#endDate").val();
		d.regionId =$("#region").val();
		d.zoneId =$("#zone").val();
		d.woredaId =$("#woreda").val();
		d.kebeleId =$("#kebele").val();
		d.rcId =$("#researchId").val();
		d.rustId =$("#rustTypeId").val();
		d.surveyNo =$("#surveyNo").val();
		d.dataCollectModeId =$("#dataModeId").val();
		},
"dataSrc": function ( json ) {
    if(json.data.length>0)
        {
        $('#pdfDownload').show();
        $('#excelIcon').show();
        $('.card-body').show();
        }else{
        	 $('#pdfDownload').hide();
             $('#excelIcon').hide();
             $('.card-body').hide();
             swal('No record found','','')
            }
    return json.data;
}
	},
	
	"columns":[
		{"data":"sNo"},
		{"data":"surveyNo"},
		{"data":"surveyDate"},
		{"data":"region"},
		{"data":"zone"},
		{"data":"woreda"},
		{"data":"kebele"},
		{"data":"institutionName"},
		{"data":"rust"},
		{"data":"mode"}
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
</script>
  <script>
function downloadExcel(){

	var year=$("#yearId").val();
	$("#yearIdXl").val(year);
	
	var season=$("#seasonTypeId").val();
	$("#seasonTypeIdXl").val(season);	
	 
	var region=$("#region").val();
	$("#regionXl").val(region);
	
	var zone=$("#zone").val();
	$("#zoneXl").val(zone);
	
	var woreda=$("#woreda").val();
	$("#woredaXl").val(woreda);
	
	var kebele=$("#kebele").val();
	$("#kebeleXl").val(kebele);
	
	var startDate=$("#startDate").val();
	$("#startDateXl").val(startDate);
	
	var endDate=$("#endDate").val();
	$("#endDateXl").val(endDate);
	
	var researchId=$("#researchId").val();
	$("#researchIdXl").val(researchId);

	var rustTypeId=$("#rustTypeId").val();
	$("#rustTypeIdXl").val(rustTypeId);

	var surveyNo=$("#surveyNo").val();
	$("#surveyNoXl").val(surveyNo);

	var dataModeId=$("#dataModeId").val();
	$("#dataModeIdXl").val(dataModeId);
	
	$("#excelForm").submit();
}
</script>


<script>
function downloadPdf(){

	var year=$("#yearId").val();
	$("#yearIdPDF").val(year);
	//alert($("#yearIdPDF").val())
	
	var season=$("#seasonTypeId").val();
	$("#seasonTypeIdPDF").val(season);	
	//alert($("#seasonTypeIdPDF").val())
	 
	var region=$("#region").val();
	$("#regionPDF").val(region);
	
	var zone=$("#zone").val();
	$("#zonePDF").val(zone);
	
	var woreda=$("#woreda").val();
	$("#woredaPDF").val(woreda);
	
	var kebele=$("#kebele").val();
	$("#kebelePDF").val(kebele);
	
	var startDate=$("#startDate").val();
	$("#startDatePDF").val(startDate);
	
	var endDate=$("#endDate").val();
	$("#endDatePDF").val(endDate);
	
	var researchId=$("#researchId").val();
	$("#researchIdPDF").val(researchId);

	var rustTypeId=$("#rustTypeId").val();
	$("#rustTypeIdPDF").val(rustTypeId);

	var surveyNo=$("#surveyNo").val();
	$("#surveyNoPDF").val(surveyNo);

	var dataModeId=$("#dataModeId").val();
	$("#dataModeIdPDF").val(dataModeId);
	
	
	$("#pdfForm").submit();
}
</script>
<script>
$(document).ready(function(){
	$("#btnSubmit").click(function(){

		
		 var radioValue = $("input[name='searchBySeason']:checked").val();
		
		 if(radioValue == 0)
		{	 
			 if($("#yearId").val()!=0 && $("#seasonId").val()==0)
			{
				swal("Error","Please select Season","error").then(function(){
					$("#seasonId").focus();
				});
				return false;
			}
			if($("#yearId").val()==0 && $("#seasonId").val()!=0)
			{
				swal("Error","Please select Year","error").then(function(){
					$("#yearId").focus();
				});
				return false;
			}
 	}

		 if(radioValue == 1)
		{	
				if($("#startDate").val() =='')
				{
					swal("Error","Please select Survey Date ","error").then(function(){
						$("#startDate").focus();
					});
					return false;
				}
			if($("#startDate").val()!="" && $("#endDate").val()=="")
			{
				swal("Error","Please select Survey Date To","error").then(function(){
					$("#endDate").focus();
				});
				return false;
			}
			if($("#startDate").val()=="" && $("#endDate").val()!="")
			{
				swal("Error","Please select Survey Date From","error").then(function(){
					$("#startDate").focus();
				});
			return false;
			}
			if(Date.parse($("#startDate").val())>Date.parse($("#endDate").val()))
			{
				swal(
					'Error',
					'Survey Date From should be less than Survey Date To',
					'error'
					).then(function(){
						$("#startDate").focus()
					})
					return false; 
			}
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
$("#surveyNo").focus();
return false;
}
</script>
<script>
$(function(){

	   $( "#surveyNo" ).bind( 'paste',function()
	   {
	       setTimeout(function()
	       { 
	          //get the value of the input text
	          var data= $( '#surveyNo' ).val() ;
	          //replace the special characters to '' 
	          var dataFull = data.replace(/[^\w\s]/gi, '');
	          //set the new value of the input text without special characters
	          $( '#surveyNo' ).val(dataFull);
	       });

	    });
	});
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
		$("#yearId").val(0);
		$("#seasonTypeId").val(0);
		
	}
}
</script>   