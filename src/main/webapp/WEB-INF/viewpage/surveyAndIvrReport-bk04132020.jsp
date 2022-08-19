<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
      
                  
<c:if test="${not empty dateWiseData }">
<script>
	$(document).ready(function(){
		$("#seasoinId").hide();
		$("#dateId").show();
		$("#redioDate").prop("checked",true);
		});
</script>
</c:if> 
<c:if test="${empty dateWiseData }">
<script>
$(document).ready(function(){
	$("#dateId").hide();
	$("#seasoinId").show();
	$("#redioSeason").prop("checked",true);
});
</script>
</c:if>                  
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link 	active"  href="surveyAndIvrReport">View</a>
                           </ul>
                           
                        </div>
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
                        <!-- Search Panel -->
                        <div class="search-container">
                        <form action="surveyAndIvrReport" autocomplete="off" id="findData" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        
                        <div class="card-body"> 
                        <div class="form-group">
                        		<div class="row" id="seasoinId">
                        		<label class="col-sm-2 ">Year<span class="text-danger">*</span></label>
                                    <div class="col-sm-3" >
                                      <select class="form-control" id="yearId" name="yearId">
                                       <c:forEach items="${yearList}" var="year">
                                       	 <option value="${year}">${year}</option>
                                       </c:forEach>
                                       </select>
                                    </div>
                        		<label class="col-lg-2 ">Season<span class="text-danger">*</span></label>
                                    <div class="col-lg-3">
                                       <select class="form-control" id="seasionId" name="seasionId">
                                       <c:forEach items="${seasonList}" var="seasonn"> 
                                       	<option value="${seasonn.intSeasoonId}">${seasonn.vchSeason}</option>
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
 
  var json = '${DashBoardJson}';
  json = atob(json);
  json = JSON.parse(json);
  
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      toolTip: {
        shared: true  //disable here. 
      },
      title:{
        //text: "Comparison Between Survey and Incident"       
      },
	  axisY: {
		title: " Survey Wise Incident"
	},
	legend: {
		cursor:"pointer",
		 itemclick: function (e) {
                   if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                    e.dataSeries.visible = false;
                } else {
                    e.dataSeries.visible = true;
                }

                e.chart.render();
            }
	},
	dataPointWidth: 40,
	data: [
	      {        
	       type: "column",       
	       name: "Survey",
		   showInLegend: true, 
	       dataPoints: json.survey
	     },
	     
	     {        
	       type: "column",       
	       name: "Incident",
		   showInLegend: true, 
	       dataPoints: json.incident
	     }
	     
	     ]
     
   });

chart.render();
}

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
</script>


<script>

var SelectedYear = '${SelectedYear}';

$("#yearId").val(SelectedYear);
var SeasonId = '${SeasonId}';
$("#seasionId").val(SeasonId);
var fromDate = '${fromDate}';
$("#surveyDateFrom").val(fromDate);
var toDate = '${toDate}';
$("#surveyDateTo").val(toDate);
</script>
<script>
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