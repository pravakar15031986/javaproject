<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<div class="mainpanel">
            <div class="section">
               <div class="page-title"> 
                  <div class="title-details">
                     <h4>View Inoculated Sample</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Race Analysis</li>
                           <li class="breadcrumb-item active" aria-current="page">Race Analysis</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link"  href="stem-rust-race-analysis">Pending Samples</a>
                              <a class="nav-item nav-link active"  href="inoculatedsample">Inoculated Samples</a>
                              <a class="nav-item nav-link"  href="raceanalysisresult">Race Analysis Result</a>
                           </ul>
                            <div class="indicatorslist">
                              
                           </div> 
                        </div>
                        <!-- Search Panel -->
                         <div class="search-container">
                           <div class="search-sec">
                           <form action="stemRustRaceAnalysisInoculationSearch" method="POST" id="form_">
                         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           <div class="form-group">
                              <div class="row">
                              <label class="col-lg-2 ">Survey No.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="surveyNo" id="surveyNo" placeholder="" data-bv-field="fullName" autocomplete="off">
                                    </div>
                               <label class="col-lg-2 ">Sample ID</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="sampleId" id="sampleId" placeholder="" data-bv-field="fullName" autocomplete="off">
                                    </div>
                              </div>
                              </div>
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Allocation Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" name="allocationStartDate" id="allocationStartDate"  data-date-end-date="0d" aria-describedby="inputGroup-sizing-default" autocomplete="off">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Allocation Date To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" name="allocationEndDate" id="allocationEndDate"  data-date-end-date="0d" aria-describedby="inputGroup-sizing-default" autocomplete="off">
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
                                       <select class="form-control" name="regionId" id="regionId">
                                       
                                  	 <option value="0">--Select--</option>
                                   
                                      <c:forEach items="${DemographList}" var="demographList">
                                   <option value="${ demographList.demographyId}">${ demographList.demographyName}</option>
                                    </c:forEach>
                                    
                                    </select>
                                    </div>
                                     
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary" type="button" onclick="return checkSearch()"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                              	</div>
                              </div>
                                </form>
                                 </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        
                          <form action="viewsurveyForRaceanalysis" autocomplete="off" id="myForm1"   method="post">
        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
         <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
         <input type="hidden"   name="r_url" value="inoculatedsample">  
       </form>
       
        <form action="raceAnalysisNewDetails" method="post" id="viewFormId">
                              	<input type="hidden" id="viewRustTypeId" name="RustTypeId">
                              	<input type="hidden" id="viewSurveyId" name="SurveyId">
                              	<input type="hidden" id="viewDate" name="date">
                              	<input type="hidden" id="viewRaceAnalysisId" name="raceAnalysisId">
                              	<input type="hidden" id="viewSampleId" name="SampleId">
                          
                              </form>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <form action="" autocomplete="off" name="myForm">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" id="viewTable" class="table table-hover table-bordered">
                                 <thead>
                                    <tr>
                                  
                                       <th   width="40px">Sl#</th>
                                       <th  >Survey No.</th>
                                       <th  >Sample ID</th>
                                       <th  >Rust Type</th>
                                       <th  >Survey Date</th>
                                       <th  >Inoculation Date</th>
                                       <th  >Region</th>
	                                   <th  >Zone</th>
	                                   <th  >Woreda</th>
	                                   <th  >Kebele</th>
                                       <th  >Status</th>
                                       <th  width="100px">Action</th>
                                    </tr>
                                    
                                 </thead>
                                 <tbody>
                                  
                                 </tbody>
                              </table>
                              
                              <script>

	$(function() {


	$("#viewTable").DataTable({
		'processing' : true,
		'serverSide' : true,
		 "searching": false,
      "ordering": false, 
		 "ajax" : {
				"url" : "stemRustRaceAnalysisInoculationSearchDataTablePagination",
				"data" : function(d) {
					d.surveyNo = $("#surveyNo").val();
					d.sampleId = $("#sampleId").val();
					d.allocationStartDate =$("#allocationStartDate").val();
					d.allocationEndDate = $("#allocationEndDate").val();
					d.regionId =$("#regionId").val();
					 
				}
		},
		"dataSrc": "",
		"columns":[
			{"data":"sNo"},
			{"data":"surveyNo"},
			{"data":"sampleId"},
			{"data":"rustType"},
			{"data":"sampleCollectedOn"},
			{"data":"inoculationDate"},
			{"data":"region"},
			{"data":"zone"},
			{"data":"woreda"},
			{"data":"kebel"},
			{"data":"repeatation"},
			{"data":"action"}
			
		]
	})


	
	});
</script>
                              
                           
                           
                        
                        </div>
                        </form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
         
         
         function checkSearch()
         {
        
        	 var startDate = $("#allocationStartDate").val();
        	 var endDate =  $("#allocationEndDate").val();
        	 if(startDate.trim() != '' && endDate.trim() == '')
        		 {
        		 $("#allocationEndDate").focus();
        		 swal(
        					'Error!',
        					'Please select Allocation Date To.',
        					'error'
        				)
        				return false;
        		 }
        	 
        	 if(startDate.trim() == '' && endDate.trim() != '')
    		 {
    		 $("#allocationStartDate").focus();
    		 swal(
    					'Error!',
    					'Please select Allocation Date From.',
    					'error'
    				)
    				return false;
    		 }
        	 
        	 

		      if(Date.parse(startDate) > Date.parse(endDate)){
		    	  swal("Error", "Allocation date to  should not be less than Allocation date from", "error");
		        	 $("#dateto").focus();
		            return false;
		    	}
		      
        	 $("#form_").submit();
         }
         
   
         $(document).on('click', '.viewsurvey', function()
      			{
      		 
      			
      			  //window.location.href="modifySurveyData";
      			   var surveyId = $(this).attr('survey-id');
      			   $("#surveyId1").val(surveyId);
      			   $("#myForm1").submit();

      	 
      			});
				
				
				
 							$(document).ready(function(){
 								
 								 
 								
 								
 								
 							    $('#action').on('change', function() {
 							      if ( this.value == '2')
 							      //.....................^.......
 							      {
 							        $("#remark").show();
 							      }
 							      else
 							      {
 							        $("#remark").hide();
 							      }
 							    });
 							});
 							
 							
 							
 							

 							
							</script>
							
							
							 <script language="JavaScript">
							var card = document.getElementById("action")[0].value;
								function validateForm(f) {
								  if (action.value==0) {
								     alert("Please select Action");
								     return false;
								  }
								  else
								     return true;
								}
								function checkData(field) {
			                        	   if(action.value==2 && field.value==="")
			                        		   {
			                        		   alert("Please enter the remark.");
			                        		   }
			                        	 } 
								
								
							
													
							</script>

<script>
$(document).ready(function () {
var SaveMessage = '${SaveMessage}';
if(SaveMessage != null && SaveMessage != undefined && SaveMessage != '')
	{
	swal("Success", SaveMessage, "success");
	}

  var showStatus = '${ShowAlert}';
if(showStatus == true || showStatus == 'true')
	{
	swal("No records found.");
	}

});

var surveyNo = '${surveyNo}';
if(surveyNo != undefined && surveyNo != '' && surveyNo != null)
	{
	$("#surveyNo").val(surveyNo);
	}

var sampleId = '${sampleId}';
if(sampleId != undefined && sampleId != '' && sampleId != null)
	{
	$("#sampleId").val(sampleId);
	}


var allocationStartDate = '${allocationStartDate}';
if(allocationStartDate != undefined && allocationStartDate != '' && allocationStartDate != null)
	{
	$("#allocationStartDate").val(allocationStartDate);
	}


var allocationEndDate = '${allocationEndDate}';
if(allocationEndDate != undefined && allocationEndDate != '' && allocationEndDate != null)
	{
	$("#allocationEndDate").val(allocationEndDate);
	}


var regionId = '${regionId}';
if(regionId != undefined && regionId != '0' && regionId != null)
	{
	$("#regionId").val(regionId);
	}

var showStatus = '${ShowAlert}';
if(showStatus == true || showStatus == 'true')
	{
	swal("No records found.");
	}
</script>
<script>
function viewDetailss(RustTypeId,SurveyId,date,raceAnalysisId,SampleId)
{
  	$("#viewRustTypeId").val(RustTypeId);
	$("#viewSurveyId").val(SurveyId);
	$("#viewDate").val(date);
$("#viewRaceAnalysisId").val(raceAnalysisId);
$("#viewSampleId").val(SampleId);
$("#viewFormId").submit();
	
}
</script>



