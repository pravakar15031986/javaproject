<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Rust Type Chart Report</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">MIS Reprt</li>
						<li class="breadcrumb-item active" aria-current="page">Rust
							Type Chart Report</li>
					</ol>
				</nav>
			</div>
			
		</div>
	<c:if test="${not empty dateWiseData}">
		<script>
		$(document).ready(function(){
			
			$("#seasoinId").hide();
			$("#dateId").show();
			$("#redioDate").prop("checked", true);
			 
			});

		</script>
	</c:if>	
	<c:if test="${ empty dateWiseData}">
		<script>
		$(document).ready(function(){
			
			$("#seasoinId").show();
			$("#dateId").hide();
			$("#redioSeason").prop("checked", true);
			});

		</script>
	</c:if>	 
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link 	active" href="rustTypeChartReport">View</a>
							
						</ul>
						
					</div>
					<!-- Search Panel -->

					<!-- Search Panel -->
					<!--===================================================-->
					<div class="card-body">
					<div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Search By</label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <input type="radio" name="status"  value="0" class="magic-radio sampleyes"  name="form-radio-button"  id="redioSeason" onclick="changeSearchBy(this.value)"/>
                                    <label for="redioSeason" tabindex="4">Season</label>  
                             
                                    <input type="radio" name="status"  value="1" class="magic-radio sampleno"  name="form-radio-button" id="redioDate" onclick="changeSearchBy(this.value)"/>
                                    <label for="redioDate" tabindex="5">Date Range</label>
                                 </div>
                              </div>
                           </div>
                           </div>
                       <div class="card-body">    
					
					<form action="rustTypeChartReport" method="post" autocomplete="off">
					<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						
						<div class="card-body">
							<div class="form-group">
								<div class="row" id="seasoinId">
								
									<label class="col-sm-2 ">Year<span class="text-danger">*</span></label>
									<div class="col-sm-3">
									
									
									<select class="form-control" id="dropdownYear" name="year">
											<option value="0">--Select--</option>
											<c:forEach items="${year}" var="vo">
											<option value="${vo}">${vo}</option>
											</c:forEach>
									</select>
										
									</div>
									<label class="col-lg-2 ">Season<span class="text-danger">*</span></label>
									<div class="col-lg-3">
									
									<select class="form-control" name="seasonId" id="seasionId">
											<option value="0">--Select--</option>
											<c:forEach items="${seasons}" var="vo">
												<option value="${vo.intSeasoonId}">${vo.vchSeason}</option>
											</c:forEach>
										</select>
									
										
									</div>
								</div>
								<div class="row" id="dateId">
								<label class="col-lg-2 ">Survey Date From<span class="text-danger">*</span></label>
                                    <div class="input-group col-lg-3">
                                       
                                      <input type="text" class="form-control datepicker" data-date-end-date="0d" name="surveyDateFrom"  aria-label="Default" aria-describedby="inputGroup-sizing-default" id="surveyDateFrom"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                     <label class="col-lg-2 ">To Survey Date<span class="text-danger">*</span></label>
                                    <div class="input-group col-lg-3">
                                       
                                       <input type="text" class="form-control datepicker" data-date-end-date="0d" name="surveyDateTo"  aria-label="Default" aria-describedby="inputGroup-sizing-default" id="surveyDateTo"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
									</div>
								</div>
								<div class="form-group" >
								
									<div class="col-sm-6" style="width:800px; margin:0 auto;">
									<div style="padding-top: 10px;">
										<button class="btn btn-primary" id="btnSubmit">
											<i class="fa fa-search"></i> Show
										</button>
										</div>
									</div>
								
								</div>
							</div>
							
							<div id="chartContainerPai" style="width: 100%; height: 300px"></div>
						</div>
						</form>
					
					<!--===================================================-->
				</div>
				
				
				
								
			</div>
		</div>
	</div>
</div>

<script src="wrsis/js/jquery.canvasjs.min.js"></script>
<script>
function changeSearchBy(qType){
	
	if(qType==0)
	{
		var SelectedYear = '${SelectedYear}';
		$("#dropdownYear").val(SelectedYear);
		var SeasonId = '${SeasonId}';
		$("#seasionId").val(SeasonId);
		$("#seasoinId").show();
		$("#dateId").hide();
		$("#surveyDateFrom").val("");
		$("#surveyDateTo").val("");
	}
	if(qType==1)
	{
		
		$("#seasoinId").hide();
		$("#dateId").show();
		
		
	}
}
</script>

<script>
	window.onload = function() {
		var json = '${rustReportJson}';
		/* alert(json); */
		json = atob(json);
		json = JSON.parse(json);
		var rustchart = json;
		var total = 0;
		for (i = 0; i < rustchart.length; i++) {
			total += rustchart[i].y;
		}
		for (i = 0; i < rustchart.length; i++) {
			var js = rustchart[i];
			js.data = js.y;
			js.y = (((js.y) * 100) / total);
			rustchart[i] = js;
		}

		var chart = new CanvasJS.Chart("chartContainerPai", {
			animationEnabled : true,
			title : {
			//text: "Survey Statistic"
			},
			data : [ {
				type : "doughnut",
				//showInLegend: true, 
				// indexLabelPlacement: "inside",
				indexLabelLineColor : "red",
				//startAngle: 240,
				radius : "90%",
				indexLabelColor : "red",
				yValueFormatString : "##0\"%\"",
				indexLabel : "{label} ({data})",
				dataPoints : rustchart
			} ]
		});
		chart.render();

		//}
	}
</script>
<script>
$('#btnSubmit').click(function()
{
	
	var radioValue = $("input[name='status']:checked"). val();
	if(radioValue==0)
	{
		//$("#surveyDateFrom").val("");
	if($('#dropdownYear').val()==0 && $('#seasonId').val()!=0)
		{
		swal("Error", "Please select Year", "error").then(function() {
			   $("#dropdownYear").focus();
		   });
		return false;
		}
	
	if($('#seasonId').val()==0 && $('#dropdownYear').val()!=0 )
	{
	swal("Error", "Please select Season", "error").then(function() {
		   $("#seasonId").focus();
	   });
	return false;
	}	
	
	}else{

		
	var fromDate=$("#surveyDateFrom").val();
	
	var toDate=$("#surveyDateTo").val();
	if(fromDate=='')
	{
		swal('Warning!','Please enter From date!','warning')
			$("#surveyDateFrom").focus();
			return false; 
	}
	if(fromDate!='')
	{	
	
		if(toDate =='')
		{
			swal('Warning!','Please enter to date!','warning')
   			$("#surveyDateTo").focus();
   			return false; 
		}
		if(Date.parse(fromDate)>Date.parse(toDate))
		{
			swal('Warning!','From Date Should be less than To Date!','warning')
   			return false; 
		}
	}
	}
});
</script>

<script>

var SelectedYear = '${SelectedYear}';
$("#dropdownYear").val(SelectedYear);
var SeasonId = '${SeasonId}';
$("#seasionId").val(SeasonId);
var fDate='${fromDate}';
$("#surveyDateFrom").val(fDate);
var tDate='${toDate}';
$("#surveyDateTo").val(tDate);
</script>

<script>

	var year = new Date().getFullYear();
	
	$('#dropdownYear').change(function() 
	{
		
		if($('#dropdownYear').val()!=0)
			{
			$('#currentYear').val("notcurrent");
			}
	});
	$('#seasonId').change(function() 
	{
		
		if($('#seasonId').val()!=0)
			{
			$('#currentYear').val("notcurrent");
			}
	});
</script>

