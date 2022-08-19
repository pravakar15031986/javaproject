<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	
<div class="mainpanel">
            <div class="section">
               <div class="page-title"> 
                  <div class="title-details">
                     <h4>View Race Analysis</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Race Analysis</li>
                           <li class="breadcrumb-item active" aria-current="page">Race Analysis Status</li>
                        </ol>
                     </nav>
                  </div>
    
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="viewRaceAnalysisStatus">view</a>
                           </ul>
                            <div class="indicatorslist">
                              
                           </div> 
                           <div class="indicatorslist excel">
                                <form action="downloadRaceAnalysisStatusExcel" method="post" id="excelDownloadForm">
 						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
 						<input type="text" style="display:none;" name="surveyNo" id="surveyNoExcel">
 						<input type="text" style="display:none;" name="sampleId" id="sampleIdExcel">
 						<input type="text" style="display:none;" name="surveyDateFrom" id="surveyDateFromExcel">
                        <input type="text" style="display:none;" name="surveyDateTo" id="surveyDateToExcel">
                        <input type="text" style="display:none;" name="regionId" id="regionIdExcel">
                        <input type="text" style="display:none;" name="rustId" id="rustIdExcel">
                        		 <button title="excel" id="excelDownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-excel-file" ></i></button>
                        </form>
                        </div>
                        <div class="indicatorslist pdf">
                            <form action="downloadRaceAnalysisStatusPdf" method="post" id="pdfDownloadForm" target="_blank">         
 						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
 						<input type="text" style="display:none;" name="surveyNo" id="surveyNoPdf">
 						<input type="text" style="display:none;" name="sampleId" id="sampleIdPdf">
 						<input type="text" style="display:none;" name="surveyDateFrom" id="surveyDateFromPdf">
                        <input type="text" style="display:none;" name="surveyDateTo" id="surveyDateToPdf">
                        <input type="text" style="display:none;" name="regionId" id="regionIdPdf">
                        <input type="text" style="display:none;" name="rustId" id="rustIdPdf">
                        		 <button title="Print" id="pdfDownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1" ></i></button>
                        </form>
                        </div>
                        </div>
                        <!-- Search Panel -->
                         <form:form class="col-sm-12 form-horizontal customform" action="viewRaceAnalysisStatus"  method="post" modelAttribute="searchVo" autocomplete="off">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                         
                        <div class="search-container">
                           <div class="search-sec">
                           <div class="form-group">
                           <div class="form-group">
                              <div class="row">
                              <label class="col-lg-2 ">Sample ID</label>
                                    <div class="col-lg-3">
                                       <form:input class="form-control" id="sampleId" path="sampleId" placeholder="" maxlength="50"/>
                                    </div>
                              <label class="col-lg-2 ">Survey No.</label>
                                    <div class="col-lg-3">
                                       <form:input class="form-control" id="surveyNo" path="surveyNo" placeholder="" maxlength="50"/>
                                    </div>
                              </div>
                              </div>
                           </div>
                                  <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Survey Date From</label>
                                    <div class="input-group col-lg-3">
                                       <form:input class="form-control datepicker" id="surveyDateFrom" path="surveyDateFrom" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Survey Date To</label>
                                    <div class="input-group col-lg-3">
                                       <form:input class="form-control datepicker" id="surveyDateTo" path="surveyDateTo" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
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
                                       <form:select class="form-control" id="regionId" path="regionId">
                                   <form:option value="0">--Select--</form:option>
                                    <c:forEach items="${regionlist}" var="countr" >
                                    <form:option value="${countr.demographyId}">${countr.demographyName}</form:option>
                                    </c:forEach>
                                    </form:select>
                                    </div>
                                    <label class="col-sm-2 ">Rust Type</label>
                                    <div class="col-sm-3">
                                       <form:select class="form-control" id="filter" path="rustTypeId">
                                          <form:option value="0">--Select--</form:option>
                                          <c:forEach items="${rust}" var="rust">
                                    	 	  	<form:option value="${rust.rustId}">${rust.typeOfRust}</form:option>
                                       		  </c:forEach>
                                       </form:select>
                                    </div>
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary" onclick="return checkSearch()"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                              	</div>
                              </div>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        </form:form>
                         <form action="viewRaceAnalysisStatusSurveyNo" autocomplete="off" id="myForm1"   method="post">
                                   
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                                   <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
                                 </form>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <form action="" autocomplete="off" name="myForm">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewRaceStatus">
                                 <thead>
                                    <tr>
                                   
                                       <th rowspan="2">Sl#</th>
                                       <th rowspan="2">Survey No.</th>
                                       <th rowspan="2">Sample ID</th>
                                       <th rowspan="2">Rust Type</th>
                                       <th rowspan="2">Survey Date</th>
                                       <th rowspan="2">Inoculation Date</th>
                                       <th colspan="4" class="text-center">Location</th>
                                       <th rowspan="2">Laboratory Name</th>
                                       <th rowspan="2"> Race Published Date</th>
                                       <th rowspan="2">Race Name</th>
                                       <th rowspan="2">Status</th>
                                    </tr>
                                    <tr>
	                                    <th>Region</th>
	                                    <th>Zone</th>
	                                    <th>Woreda</th>
	                                    <th>Kebele</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    
                                      <%-- <c:forEach items="${viewracelist}" var="racelist" varStatus="theCount">
                                      <tr>
                                       <td>${theCount.index + 1 }</td>
                                       <td><a href="javascript:void(0);" class="viewsurvey" survey-id="${racelist.surveyId }">${racelist.surveyNo }</a></td>
                                       <td>${racelist.sampleValue }</td>
                                       <td>${racelist.rustType }</td>
                                       <td>${racelist.surveyDate }</td>
                                       <td>${racelist.inoculationDate }</td>
                                       <td>${racelist.region }</td>
                                       <td>${racelist.zone }</td>
                                       <td>${racelist.woreda }</td>
                                       <td>${racelist.kebel }</td>
                                       <td>
                                       <c:choose>
                                       <c:when test="${racelist.researchCenter == 'null'}">
                                       External
                                       </c:when>
                                       <c:otherwise>
                                       ${racelist.researchCenter }
                                       </c:otherwise>
                                       </c:choose>
                                       </td>
                                       <td>${racelist.raceResult }</td>
                                     
                                        <td>
                                       <c:choose>
                                       <c:when test="${racelist.raceflag eq false}">
                                       --
                                       </c:when>
                                       <c:otherwise>
                                       ${racelist.racePublishDate }
                                       </c:otherwise>
                                       </c:choose>
                                       </td>
                                        <td>
                                       <c:choose>
                                       <c:when test="${racelist.raceResult == 'null'}">
                                       --
                                       </c:when>
                                       <c:otherwise>
                                       ${racelist.raceResult }
                                       </c:otherwise>
                                       </c:choose>
                                       </td>
                                       <td>${racelist.status }</td>
                                        </tr>
                                       </c:forEach> --%>
                                   
                               
                                 </tbody>
                              </table>
                             </div> 
                        </div>
                        </form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
 							/* $(document).ready(function(){

 								$('#viewTable').DataTable( {
 									"pagingType": "full_numbers",
 							        dom: 'Bfrtip',		
 							        buttons: [
 							            'print'
 							        ]
 							    } );
 							}); */

 							  $(document).on('click', '.viewsurvey', function()
 					       			{
 					       		 
 					       			
 					       			  //window.location.href="modifySurveyData";
 					       			   var surveyId = $(this).attr('survey-id');
 					       			   $("#surveyId1").val(surveyId);
 					       			   $("#myForm1").submit();

 					       	 
 					       			});  


     		$(function() {

     		$('#viewRaceStatus').dataTable({
     			
     				'processing' : true,
     				'serverSide' : true,
     				 "searching": false,
     		      "ordering": false, 
     				 "ajax" : {
     						"url" : "viewRaceAnalysisStatusData",
     						"data" : function(d) {
     							d.surveyNo= $("#surveyNo").val();
     							d.sampleId = $("#sampleId").val();
     							d.startDate =$("#surveyDateFrom").val();
     							d.endDate = $("#surveyDateTo").val();
     							d.regionId = $("#regionId").val();
     							d.rustTypeId = $("#filter").val();
     						}
     				},
     				"dataSrc": "",
     				"columns":[
     					{"data":"sNo"},
     					{"data":"surveyNo"},
     					{"data":"sampleValue"},
     					{"data":"rustType"},
     					{"data":"surveyDate"},
     					{"data":"inoculationDate"},
     					{"data":"region"},
     					{"data":"zone"},
     					{"data":"woreda"},
     					{"data":"kebel"},
     					{"data":"researchCenter"},
     					{"data":"racePublishDate"},
     					{"data":"raceResult"},
     					{"data":"status"}
     					
     				],
     				fnInitComplete : function() {
     		           if ($(this).find('td').length<=1) {
     		              $('.dataTables_wrapper,.excel,.pdf').hide();
     		              swal("No record found");
     		              }
     		           }
     		
     	  
     		});
     		});

	function checkSearch()
	{
		
		 var startDate = $("#surveyDateFrom").val();
		 var endDate =  $("#surveyDateTo").val();
		 if(startDate.trim() != '' && endDate.trim() == '')
			 {
			 $("#surveyDateTo").focus();
			 swal(
						'Error!',
						'Please select Survey Date To.',
						'error'
					)
					return false;
			 }
		 
		 if(startDate.trim() == '' && endDate.trim() != '')
		 {
		 $("#surveyDateFrom").focus();
		 swal(
					'Error!',
					'Please select Survey Date From.',
					'error'
				)
				return false;
		 }
		 
		 

	     if(Date.parse(startDate) > Date.parse(endDate)){
	   	  swal("Error", "Survey date to  should not be less than Survey date from", "error");
	       	 $("#surveyDateTo").focus();
	           return false;
	   	}
	     
		 
	}   								       			
 </script>
<script>
	$(document).ready(function(){
		
		$("#excelDownload").click(function(){
			$("#surveyNoExcel").val($("#surveyNo").val())
			$("#sampleIdExcel").val($("#sampleId").val())
			$("#surveyDateFromExcel").val($("#surveyDateFrom").val())
			$("#surveyDateToExcel").val($("#surveyDateTo").val())
			$("#regionIdExcel").val($("#regionId").val())
			$("#rustIdExcel").val($("#filter").val())
			$("#excelDownloadForm").submit() 
		})
		$("#pdfDownload").click(function(){
			$("#surveyNoPdf").val($("#surveyNo").val())
			$("#sampleIdPdf").val($("#sampleId").val())
			$("#surveyDateFromPdf").val($("#surveyDateFrom").val())
			$("#surveyDateToPdf").val($("#surveyDateTo").val())
			$("#regionIdPdf").val($("#regionId").val())
			$("#rustIdPdf").val($("#filter").val())
			$("pdfDownloadForm").submit() 
		})
	});
	</script>
	