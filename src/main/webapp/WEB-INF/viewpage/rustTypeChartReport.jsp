<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Rust Type Chart Report</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">MIS Report</li>
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
					<form action="rustTypeChartReport" method="post" autocomplete="off">
					<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
					<div class="search-container">
						<div class="search-sec" style="display:block;">
							<div class="form-group row pad-ver">
								<label class="col-sm-2 control-label">Search By</label>
								<div class="col-sm-10">
								<span class="colon">:</span>
								   <div class="radio">
									  <input type="radio" name="status"  value="0" class="magic-radio sampleyes"  name="form-radio-button"  id="redioSeason" onclick="changeSearchBy(this.value)"/>
									  <label for="redioSeason" tabindex="4">Season</label>  
							   
									  <input type="radio" name="status"  value="1" class="magic-radio sampleno"  name="form-radio-button" id="redioDate" onclick="changeSearchBy(this.value)"/>
									  <label for="redioDate" tabindex="5">Date Range</label>
								   </div>
								</div>
							 </div>
							 <div class="form-group">
								<div class="row" id="seasoinId">
								
									<label class="col-sm-2 ">Year<span class="text-danger">*</span></label>
									<div class="col-sm-3">
									
										<span class="colon">:</span>
									<select class="form-control" id="dropdownYear" name="year">
											<option value="0">--Select--</option>
											<c:forEach items="${year}" var="vo">
											<option value="${vo}">${vo}</option>
											</c:forEach>
									</select>
										
									</div>
									<label class="col-lg-2 offset-sm-2">Season<span class="text-danger">*</span></label>
									<div class="col-lg-3">
										<span class="colon">:</span>
									<select class="form-control" name="seasonId" id="seasionId">
											<option value="0">--Select--</option>
											<c:forEach items="${seasons}" var="vo">
												<option value="${vo.intSeasoonId}">${vo.vchSeason}</option>
											</c:forEach>
										</select>
									
										
									</div>
								</div>
								<div class="row" id="dateId">
								<label class="col-sm-2">Survey Date From<span class="text-danger">*</span></label>
                                    <div class="input-group col-sm-3">
										<span class="colon">:</span>
                                      <input type="text" class="form-control datepicker" data-date-end-date="0d" name="surveyDateFrom"  aria-label="Default" aria-describedby="inputGroup-sizing-default" id="surveyDateFrom"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                     <label class="col-sm-2 offset-sm-2">Survey Date To<span class="text-danger">*</span></label>
                                    <div class="input-group col-sm-3">
										<span class="colon">:</span>
                                       <input type="text" class="form-control datepicker" data-date-end-date="0d" name="surveyDateTo"  aria-label="Default" aria-describedby="inputGroup-sizing-default" id="surveyDateTo"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
									</div>
								</div>
								<div class="form-group mt-2" >
									<div style="row">
									<div class="col-sm-6 offset-sm-2 pl-sm-1" >
										<button class="btn btn-primary" id="btnSubmit">
											<i class="fa fa-search"></i> Show
										</button>	
										</div>
									</div>
								
								</div>
							</div>
						
						</div>
					</div>
					<div class="card-body">
							
							
							<div id="chartContainerPai" style="width: 100%; height: 400px"></div>
						</div>
						</form>
					
					<!--===================================================-->
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
		 
		json = atob(json);
		//alert(json);
		json = JSON.parse(json);
		var rustchart = json;
		//console.log(rustchart)
		var total = 0;
		
		var dataArray=new Array();
		
		if(rustchart.length<=0){
			  $("#chartContainerPai").hide()
			  swal("No recored found")
		  }
		
		for (i = 0; i < rustchart.length; i++) {
			//total += rustchart[i].y;
			var data=[rustchart[i].label,rustchart[i].y];
			dataArray.push(data);
		}
		//console.log(dataArray)
		//alert(dataArray);
		 for (i = 0; i < rustchart.length; i++) {
			var js = rustchart[i];
			js.data = js.y;
			js.y = (((js.y) * 100) / total);
			rustchart[i] = js;
		} 
		
		/* for (i = 0; i < rustchart.length; i++) {
			rust+=rustchart[i].label;
			num+=rustchart[i].y;
			dataItems+="[\'" + rust + "\'," 
				+ num + ",false" + "]" + ","
				rust='';
			num=0;
		}
		dataItems=dataItems.slice(0, -1);
		console.log('dataItems='+dataItems); */
		
		
		/* var chart = new CanvasJS.Chart("chartContainerPai", {
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
		chart.render(); */

		//}
		/* ['Yellow Rust', 30, false],
        ['leaf Rust', 30, false],
        ['Stem Rust', 40, false] */
        
        
        
		 Highcharts.chart('chartContainerPai', {

			 chart: {
			        plotBackgroundColor: null,
			        plotBorderWidth: null,
			        plotShadow: false,
			        type: 'pie'
			    },
			    credits: {
			        enabled: false
			    },
			    title: {
			        text: 'Rust Type Statistics'
			    },
			    tooltip: {
			        pointFormat: '{point.y}: <b>{point.percentage:.1f}%</b>'
			    },
			    accessibility: {
			        point: {
			            valueSuffix: '%'
			        }
			    },
			    colors: ['#da6366','#246b9c','#e3a821'],
			    plotOptions: {
			        pie: {
			            allowPointSelect: true,
			            cursor: 'pointer',
			            dataLabels: {
			                enabled: true,
			                format: '{point.percentage:.1f} %',
			                distance: -30
			            },
			    showInLegend: true
			        }
			    },
			series: [{
				colorByPoint: true,
			        keys: ['name', 'y', 'selected', 'sliced'],
			        data: dataArray,
			    }]
			})
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
		swal('Warning!','Please Enter Survey Date From !','warning')
			$("#surveyDateFrom").focus();
			return false; 
	}
	if(fromDate!='')
	{	
	
		if(toDate =='')
		{
			swal('Warning!','Please Enter Survey Date To !','warning')
   			$("#surveyDateTo").focus();
   			return false; 
		}
		if(Date.parse(fromDate)>Date.parse(toDate))
		{
			swal('Warning!','Survey Date From Should be less than Survey Date To!','warning')
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

