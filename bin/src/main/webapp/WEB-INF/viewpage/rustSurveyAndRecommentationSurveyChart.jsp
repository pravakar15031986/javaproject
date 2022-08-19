<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="https://code.highcharts.com/highcharts.js"></script>



<script src="wrsis/js/chartist.min.js"></script>
<script src="wrsis/js/chartist-plugin-tooltip.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chartist-plugin-legend/0.6.1/chartist-plugin-legend.min.js"></script>
 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Rust Survey vs Recom Survey</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">MIS Report</li>
                           <li class="breadcrumb-item active" aria-current="page">Rust Survey vs Recom Survey</li>
                        </ol>
                     </nav>
                  </div>
       
                  <script>
	$(document).ready(function(){
		
		});
                  </script>
			<c:if test="${not empty dateWiseData}">
				<script>
					$(document).ready(function() {

						$("#seasoinId").hide();
						$("#dateId").show();
						$("#redioDate").prop("checked", true);

					});
				</script>
			</c:if>
			<c:if test="${ empty dateWiseData}">
				<script>
					$(document).ready(function() {

						$("#seasoinId").show();
						$("#dateId").hide();
						$("#redioSeason").prop("checked", true);
					});
				</script>
			</c:if>
		</div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link 	active"  href="rustSurveyAndRecommentationSurveyChart">View</a>
                              
                           </ul>
                           
                        </div>
                        
                        
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <form action="rustSurveyAndRecommentationSurveyChart"  method="post" autocomplete="off">
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
											<select class="form-control" name="seasonId" id="seasonId">
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
												<span class="colon">:</span>
											  <input type="text" class="form-control datepicker" data-date-end-date="0d" name="surveyDateFrom"  aria-label="Default" aria-describedby="inputGroup-sizing-default" id="surveyDateFrom"/>
											   <div class="input-group-append">
													<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
												</div>
											</div>
											 <label class="col-lg-2 offset-sm-2">Survey Date To<span class="text-danger">*</span></label>
											<div class="input-group col-lg-3">
												<span class="colon">:</span>
											   <input type="text" class="form-control datepicker" data-date-end-date="0d" name="surveyDateTo"  aria-label="Default" aria-describedby="inputGroup-sizing-default" id="surveyDateTo"/>
											   <div class="input-group-append">
													<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
												</div>
											</div>
										</div>
										
										
										</div>
									 <div class="form-group" >
										<div class="row">
										<div class="col-sm-6 offset-sm-2" >
											<button class="btn btn-primary" id="btnSubmit">
												<i class="fa fa-search"></i> Show
											</button>
											</div>
										</div>
									
									</div>
								</div>
							</div>


						<div class="card-body">
							
							</div>
							
							</form>
							<div id="chartContainerLine" style="height: 370px; width: 100%;"></div>
						</div>
					
                       
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
function changeSearchBy(qType){
	
	if(qType==0)
	{
		var SelectedYear = '${SelectedYear}';
		$("#dropdownYear").val(SelectedYear);
		var SeasonId = '${SeasonId}';
		$("#seasonId").val(SeasonId);
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
         
        





 <script src="wrsis/js/canvasjs.min.js"></script>
         <script src="wrsis/js/jquery.canvasjs.min.js"></script>
  <script type="text/javascript">

  window.onload = function () {
  
	  var json = '${rustReportJson}';
	        json = atob(json);
	        //console.log(json)
      json = JSON.parse(json);
	        var monsurvey = json.linemonitorsurvey
			var moninci = json.linemonitomonitoring;
	        var chartjson=json;
	        var montharr=new Array();
	        var surveyMonthArr = new Array();
			var monitorMonthArr = new Array();
			var dataArray = new Array();
			var objkeys = Object.keys(chartjson);

			if(chartjson.linemonitorsurvey==null && chartjson.linemonitomonitoring==null){
				  $("#chartContainerLine").hide()
				  swal("No recored found")
			  }
				//Push months present in both keys into montharr (no duplicate)
				for (var i = 0; i < objkeys.length; i++) {
					if(chartjson[objkeys[i]]!=null){
						for (var j = 0; j < chartjson[objkeys[i]].length; j++) {
							var month = ((chartjson[objkeys[i]])[j].label)
							if (montharr.indexOf(month) > -1) {
							} else {
								montharr.push(month);
							}
						}
					}
				}
				//console.log(montharr)

				//push months present in survey and monitor into surveyMonthArr and IncidentMonthArr respectively
				
			for (var i = 0; i < objkeys.length; i++) {
					if (objkeys[i] == "linemonitomonitoring" && chartjson[objkeys[i]] != null) {
							for (var j = 0; j < chartjson[objkeys[i]].length; j++) {
								monitorMonthArr
										.push((chartjson[objkeys[i]])[j].label);
							}
					}
					if (objkeys[i] == "linemonitorsurvey" && chartjson[objkeys[i]] != null) {
							for (var j = 0; j < chartjson[objkeys[i]].length; j++) {
								surveyMonthArr
										.push((chartjson[objkeys[i]])[j].label);
							}
					}
				}
				//console.log(chartjson[objkeys[1]]==null)
				//console.log( monitorMonthArr)
				//console.log( surveyMonthArr)
				
				//create data for chart
				for (var i = 0; i < objkeys.length; i++) {
						yArray = new Array();
						var dataName=null;
						for (var j = 0; j < montharr.length; j++) {
							var month = montharr[j];
							if (objkeys[i] == "linemonitomonitoring" && monitorMonthArr.includes(month, 0)) {
								var ydata = (chartjson[objkeys[i]])[monitorMonthArr
										.indexOf(month, 0)].y;
								yArray
										.splice(montharr.indexOf(month), 0,
												ydata);
								dataName='Monitor';
							}
							if (objkeys[i] == "linemonitorsurvey" && surveyMonthArr.includes(month, 0)) {
								var ydata = (chartjson[objkeys[i]])[surveyMonthArr
										.indexOf(month, 0)].y;
								yArray
										.splice(montharr.indexOf(month), 0,
												ydata);
								dataName='Survey';
							}
						}if(dataName!=null)
							{
							var obj = {
									name : dataName,
									data : yArray
								}
								dataArray.push(obj);
							}
					}
				//console.log(dataArray);

				//Monitoring Progress       		
				Highcharts.chart('chartContainerLine', {
					chart : {
						type : 'line'
					},credits: {
					    enabled: false
					},
					title : {
						text : 'Monitoring Progress'
					},
					xAxis : {
						categories : montharr
					},
					yAxis : {
						title : {
							text : 'Survey Record'
						}
					},
					colors: ['#e3a821','#01a15c'],
					plotOptions : {
						column: {
				            pointPadding: 0,
				            borderWidth: 2,
				            borderRadius: 5
				        },
						line : {
							dataLabels : {
								enabled : true
							},
							enableMouseTracking : false
						}
					},
					series : dataArray
				});

				/* static data [ {
						name : 'Survey',
						data : [ 7, 20 ]
					}, {
						name : 'Monitor',
						data : [ 17, 25 ]
					} ] */

				/* var options = {
						animationEnabled: true,
						theme: "light2",
						title:{
							//text: "Monitoring Progress"
						},
						axisX:{
							valueFormatString: "#,##0.##",
						},
						axisY: {
							title: "Survey Recorded",
							//suffix: "K",
							minimum: 20
						},
						toolTip:{
							shared:true
						},  
						legend:{
							cursor:"pointer",
							verticalAlign: "bottom",
							horizontalAlign: "left",
							dockInsidePlotArea: true,
							itemclick: toogleDataSeries
						},
						data: [{
							type: "line",
							showInLegend: true,
							name: "Survey",
							markerType: "square",
							xValueFormatString: "String",
							color: "#F08080",
							
							yValueFormatString: "##0\"\"",
							dataPoints: monsurvey
						},
						{
							type: "line",
							showInLegend: true, 
							name: "Monitor",
							markerType: "square",
							
							yValueFormatString: "##0\"\"",
							dataPoints: moninci
						}]
					};
					$("#chartContainerLine").CanvasJSChart(options); */

				/* function toogleDataSeries(e){
					if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
						e.dataSeries.visible = false;
					} else{
						e.dataSeries.visible = true;
					}
					e.chart.render();
				} */
			}
		</script>
	

<script>
$('#btnSubmit').click(function()
{

	var radioValue = $("input[name='status']:checked"). val();
	if(radioValue==0)
	{
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
		swal('Warning!','Please enter Survey Date From !','warning')
			$("#surveyDateFrom").focus();
			return false; 
	}
	if(fromDate!='')
	{	
	
		if(toDate =='')
		{
			swal('Warning!','Please enter Survey Date To !','warning')
   			$("#surveyDateTo").focus();
   			return false; 
		}
		if(Date.parse(fromDate)>Date.parse(toDate))
		{
			swal('Warning!','Survey Date From Should be less than Survey Date To !','warning')
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

$("#seasonId").val(SeasonId);
var fDate='${fromDate}';
$("#surveyDateFrom").val(fDate);
var tDate='${toDate}';
$("#surveyDateTo").val(tDate);
</script>
<script>
	var year = new Date().getFullYear();
	$('#dropdownYear').change(function() {
		if($('#dropdownYear').val()!=0)
			{
			$('#currentYear').val("notcurrent");
			}
	});
	$('#seasonId').change(function() {
		if($('#seasonId').val()!=0)
			{
			$('#currentYear').val("notcurrent");
			}
	});
</script>
