<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://code.highcharts.com/highcharts.js"></script>

 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Survey and Incident Report</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">MIS Reprt</li>
                           <li class="breadcrumb-item active" aria-current="page">Survey vs IVR Report</li>
                        </ol>
                     </nav>
                  </div>
      
                  
<script>


$(document).ready(function(){
	var dateval="${dateWiseData}";
	
	if(dateval== null || dateval== '' ){
		$("#dateId").hide();
		$("#seasoinId").show();
		$("#redioSeason").prop("checked",true);
		
	}else{
		$("#seasoinId").hide();
		$("#dateId").show();
		$("#redioDate").prop("checked",true);
	}

	var SelectedYear = '${SelectedYear}';
	$("#yearId").val(SelectedYear);
	var SeasonId = '${SeasonId}';
	$("#seasionId").val(SeasonId);
	var fromDate = '${fromDate}';
	$("#surveyDateFrom").val(fromDate);
	var toDate = '${toDate}';
	$("#surveyDateTo").val(toDate);
	
});		
</script>
                 
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active" 	  href="surveyAndIvrReport">View</a>
                            </ul>
                          
                        </div>
                       
                        <!-- Search Panel -->
                        <div class="search-container">
                        <form action="surveyAndIvrReport" autocomplete="off" id="findData" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        
						<div class="search-sec" style="display:block;"> 
							<div class="form-group row pad-ver">
								<label class="col-sm-2 control-label">Search By</label>
								<div class="col-sm-8">
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
                                    <div class="col-sm-3" >
										<span class="colon">:</span>
                                      <select class="form-control" id="yearId" name="yearId">
                                       <c:forEach items="${yearList}" var="year">
                                       	 <option value="${year}">${year}</option>
                                       </c:forEach>
                                       </select>
                                    </div>
                        		<label class="col-sm-2 offset-sm-2">Season<span class="text-danger">*</span></label>
                                    <div class="col-sm-3">
										<span class="colon">:</span>
                                       <select class="form-control" id="seasionId" name="seasionId">
                                       <c:forEach items="${seasonList}" var="seasonn"> 
                                       	<option value="${seasonn.intSeasoonId}">${seasonn.vchSeason}</option>
                                       </c:forEach>
                                          
                                       </select>
                                    </div>
                        		   </div> 
                        		  
                        		   <div class="row" id="dateId">
								<label class="col-sm-2 ">Survey Date From<span class="text-danger">*</span></label>
                                    <div class="input-group col-lg-3">
										<span class="colon">:</span>
                                      <input type="text" class="form-control datepicker" data-date-end-date="0d" name="surveyDateFrom"  aria-label="Default" aria-describedby="inputGroup-sizing-default" id="surveyDateFrom"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                     <label class="col-sm-2 offset-sm-2">To Survey Date<span class="text-danger">*</span></label>
                                    <div class="input-group col-sm-3">
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
									<div class="col-sm-6  offset-sm-2">
										<button class="btn btn-primary" id="btnSubmit">
											<i class="fa fa-search"></i> Show
										</button>
									</div>
									</div>
								</div>
                        </div>
                       <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                            </form>
                        </div>
                        
                       
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
         
<script src="wrsis/js/canvasjs.min.js"></script>
<script src="wrsis/js/jquery.canvasjs.min.js"></script>
  <script type="text/javascript">
 
  
 
  
  $(document).ready(function(){

	  var json = '${DashBoardJson}';
	  json = atob(json);
	  //alert(json);

	  json = JSON.parse(json);
     
	  var surveychart=json;
	  var regionArray=new Array();
	  var surveyRegionArr=new Array();
	  var incidentRegionArr=new Array();
	  var dataArray=new Array();
	  var yArray=null;
	  var objkeys = Object.keys(surveychart);
	  
	  if(surveychart.survey==null && surveychart.incident==null){
		  $("#chartContainer").hide()
		  swal("No record found")
	  }
				//push region names into the regionArray(no duplicate)
				for (var i = 0; i < objkeys.length; i++) {
					if(surveychart[objkeys[i]]!=null){
						for (var j = 0; j < surveychart[objkeys[i]].length; j++) {
							var region = ((surveychart[objkeys[i]])[j].label)
							if (regionArray.indexOf(region) > -1) {
							} else {
								regionArray.push(region);
							}
						}
					}
						
					}
				//push regions present in survey and incident into surveyRegionArr and IncidentRegionArr respectively
					for (var i = 0; i < objkeys.length; i++) {
						if (objkeys[i] == "survey" && surveychart.survey!=null) {
							for (var j = 0; j < surveychart[objkeys[i]].length; j++) {
								surveyRegionArr
										.push((surveychart[objkeys[i]])[j].label);
							}
						}
						if (objkeys[i] == "incident" && surveychart.incident!=null) {
							for (var j = 0; j < surveychart[objkeys[i]].length; j++) {
								incidentRegionArr
										.push((surveychart[objkeys[i]])[j].label);
							}
						}
					}
					//console.log("SR=" + surveyRegionArr)
					//console.log("IR=" + incidentRegionArr)
					//console.log(regionArray)

					//create data for chart
					for (var i = 0; i < objkeys.length; i++) {
						if (objkeys[i] == "survey" && surveychart.survey!=null) {
							yArray = new Array();
							for (var j = 0; j < regionArray.length; j++) {
								var region = regionArray[j];

								if (surveyRegionArr.includes(region, 0)) {
									var ydata = (surveychart[objkeys[i]])[surveyRegionArr
											.indexOf(region, 0)].y;
									yArray.splice(regionArray.indexOf(region), 0,
											ydata);
								} else {
									var ydata = 0;
									yArray.splice(regionArray.indexOf(region), 0,
											ydata);
								}
							}
							var obj = {
								name : objkeys[i].toUpperCase(),
								data : yArray
							}
							dataArray.push(obj);
						}
						if (objkeys[i] == "incident" && surveychart.incident!=null) {
							yArray = new Array();
							for (var j = 0; j < regionArray.length; j++) {
								var region = regionArray[j];

								if (incidentRegionArr.includes(region, 0)) {
									var ydata = (surveychart[objkeys[i]])[incidentRegionArr
											.indexOf(region, 0)].y;
									yArray.splice(regionArray.indexOf(region), 0,
											ydata);
								} else {
									var ydata = 0;
									yArray.splice(regionArray.indexOf(region), 0,
											ydata);
								}
							}
							var obj = {
								name : objkeys[i].toUpperCase(),
								data : yArray
							}
							dataArray.push(obj);
						}
					}

					
					Highcharts
							.chart(
									'chartContainer',
									{
										chart : {
											type : 'column'
										},credits: {
										    enabled: false
										},
										title : {
											text : 'Survey Wise Incident'
										},

										xAxis : {
											categories : regionArray,
											crosshair : true
										},
										yAxis : {
											min : 0,
											title : {
												text : 'Count'
											}
										},
										tooltip : {
											headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
											pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
													+ '<td style="padding:0"><b>{point.y} </b></td></tr>',
											footerFormat : '</table>',
											shared : true,
											useHTML : true
										},
										colors: ['#246b9c','#e3a821','#01a15c'],
										plotOptions : {
											column : {
												pointPadding : 0,
												borderWidth : 0,
											},
											series: {
									            pointWidth: 55
									        }
										},
										series : dataArray
									});
			
			
  });
		</script>

<script>
function changeSearchBy(value)
{
	if(value==0)
		{
			var SelectedYear = '${SelectedYear}';
			$("#yearId").val(SelectedYear);
			var SeasonId = '${SeasonId}';
			$("#seasionId").val(SeasonId);
			$("#dateId").hide();
			$("#seasoinId").show();
			$("#surveyDateFrom").val("");
			$("#surveyDateTo").val("");
		}
	if(value==1)
	{
		$("#dateId").show();
		$("#seasoinId").hide();
		$("#yearId").val("");
		$("#seasionId").val("");
	}
}

$('#btnSubmit').click(function()
{
	var radioValue = $("input[name='status']:checked"). val();
	if(radioValue==0)
	{
		if($('#yearId').val()==0 && $('#seasionId').val()!=0)
		{
		swal("Error", "Please select Year", "error").then(function() {
			   $("#yearId").focus();
		   });
		return false;
		}
	
	if($('#seasionId').val()==0 && $('#yearId').val()!=0 )
	{
	swal("Error", "Please select Season", "error").then(function() {
		   $("#seasionId").focus();
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