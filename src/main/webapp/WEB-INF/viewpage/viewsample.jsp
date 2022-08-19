<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<div class="mainpanel">
 <form:form action="editLabTaggedSample" name="form" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

 
<input type="hidden" name="sampleLabTagId" id="hdnsampleLabTagId"/>
</form:form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Tagged Samples</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Race Analysis</li>
                           <li class="breadcrumb-item active" aria-current="page">Tag Sample</li>
                        </ol>
                     </nav>
                  </div>
      
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link"  href="allocationforrestanalysis">Tag Sample</a>
                              <a class="nav-item nav-link active" href="viewsample">View Tagged Samples</a>
                           </ul>
                            <div class="indicatorslist">
                              <a  title="" href="javascript:void(0)" class="btn btn-outline-success btn-sm shadow-none"   id="excelIcon" data-toggle="tooltip" data-placement="top" data-original-title="Excel" onclick="downloadExcel()"><i class="icon-excel-file"></i></a>
                              <a  title="" href="javascript:void(0)" class="btn btn-outline-success btn-sm shadow-none"  id="pdfIcon" data-toggle="tooltip" data-placement="top" data-original-title="Print" onclick="downloadPdf()"><i class="icon-printer1"></i></a>
                           </div>
                           
                         
                           
                         
                        </div>
                        <!-- Search Panel -->
                        <form:form class="col-sm-12 form-horizontal customform" action="viewsample"  method="post" modelAttribute="searchVo" autocomplete="off">
                        
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        <div class="search-container">
                           <div class="search-sec">
                           <div class="form-group">
                           <div class="form-group">
                              <div class="row">
                              <label class="col-lg-2 ">Sample ID</label>
                                    <div class="col-lg-3">
                                       <form:input class="form-control" path="sampleId" placeholder="" maxlength="50"/>
                                    </div>
                              <label class="col-lg-2 ">Survey No.</label>
                                    <div class="col-lg-3">
                                       <form:input class="form-control" path="surveyNo" placeholder="" maxlength="50"/>
                                    </div>
                              </div>
                              </div>
                           </div>
                                  <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Survey Date From</label>
                                    <div class="input-group col-lg-3">
                                       <form:input class="form-control datepicker" path="surveyDateFrom" id="surveyDateFrom" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Survey Date To</label>
                                    <div class="input-group col-lg-3">
                                       <form:input class="form-control datepicker" path="surveyDateTo" id="surveyDateTo" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
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
                                       <form:select class="form-control" path="regionId">
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
                                       <button class="btn btn-primary" onclick="return checkSearch()" > <i class="fa fa-search"></i> Search</button>
                                    </div>
                              	</div>
                              </div>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        </form:form>
                        <form action="viewSurveyDetailsForTagSample" autocomplete="off" id="myForm1"   method="post">
                                  
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                                   <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
                               <input type="hidden"   name="r_url" value="viewsample"> 
                                 </form>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        
                        <div class="card-body">
                        
                            <div class="table-responsive"> 
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTagSample">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Sample ID</th>
                                       <th>Survey No.</th>
                                       <th>Survey Date</th>
                                       <th>Published Date</th>
                                       <th>Sample Tagged On</th>
                                       <th>Region</th>
                                       <th>Rust Type</th>
                                        <th>Lab Tagging</th>
                                       <th>Laboratory Name</th>
                                       <th>Action</th>
                                    </tr>
                                 </thead>
                                 <%-- <tbody>
                                  <c:forEach items="${taggedSamplesList}" var="vo" varStatus="counter">
                                  	<tr><td><c:out value="${counter.count}"/></td>
                                  	<td>${vo.sampleIdValue}</td>
                                  	  <td><a href="javascript:void(0);" class="viewsurvey" survey-id="${vo.surveyId }">${vo.surveyNo }</a></td>
                                  	<td>${vo.surveyNo}</td>
                                  	<td>${vo.surveyDate}</td>
                                  	<td>${vo.samplePublishedOn}</td>
                                  	<td>${vo.createdOn}</td>
                                  	<td>${vo.regionName}</td>
                                  	<td>${vo.rustType}</td>
                                  	<td><c:choose>
									 <c:when test="${vo.externalLab == 'false'}">
									        Internal
									  </c:when>    
									   <c:otherwise>
									        External 
									   </c:otherwise>
									</c:choose></td>
									<td><c:choose>
									 <c:when test="${vo.researchCenterName == 'null'}">
									        NA
									  </c:when>    
									   <c:otherwise>
									        ${vo.researchCenterName} 
									   </c:otherwise>
									</c:choose></td>
                                  	<td>${vo.researchCenterName}</td>
                                  	<td> <c:if test="${vo.raceStatus eq 0}">
                                  		<a data-placement="top" data-toggle="tooltip"  id="edit${vo.sampleLabTagId}"  onclick="editTaggedSamples('${vo.sampleLabTagId}');" title="Edit"  >
                                  	
                                  	<button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
                                  	<i class="icon-edit1"></i>
                                  	</button>
                                  	</a>
                                  	</c:if>
                                  	
                                  	</td>
                                 	</tr>
                                 </c:forEach>
                                 </tbody> --%>
                              </table>
                          </div> 
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
            
            <form action="tagsampleExcelDownload" id="tagExcelForm" method="post">
       		
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

       		<input type="hidden" id="sampleIdE" name="sampleIdE">
       		<input type="hidden" id="surveyNoE" name="surveyNoE">
       		<input type="hidden" id="fromDateE" name="fromDateE">
       		<input type="hidden" id="toDateE" name="toDateE">
       		<input type="hidden" id="regionIdE" name="regionIdE">
       		<input type="hidden" id="filterE" name="filterE">
            </form>
       
           <form action="tagsamplePdfDownload" target="_blank" id="tagPdfForm" autocomplete="off"   method="post" class="noload">
        	
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

        	<input type="hidden" id="sampleIdPDF" name="sampleIdPDF">
       		<input type="hidden" id="surveyNoPDF" name="surveyNoPDF">
       		<input type="hidden" id="fromDatePDF" name="fromDatePDF">
       		<input type="hidden" id="toDatePDF" name="toDatePDF">
       		<input type="hidden" id="regionIdPDF" name="regionIdPDF">
       		<input type="hidden" id="filterPDF" name="filterPDF">
		   </form>
            
         </div>

<script>
/* $(function() {
	$('#myTable').dataTable({
		'paging':true,
		'lengthChange':true,
		'searching':true,
		'ordering':true,
		'info':true,
		'autoWidth':false,
	
   //initialization params as usual
   fnInitComplete : function() {
      if ($(this).find('td').length<=1) {
         $('.dataTables_wrapper').hide();
         swal("No record found")
         }
      } 
	});
	});	 */
</script>
<script>
function editTaggedSamples(sampleLabTagId){
	 $("#hdnsampleLabTagId").val(sampleLabTagId);
     $("form[name='form']").submit();
		}
</script>         
         
         
         <c:if test="${msg ne Empty}">

	<script>
	$(document).ready(function(){   
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	});
</script>
</c:if>
      <c:if test="${errMsg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>
<%-- <c:if test="${noRecordMsg ne Empty}">
	<script>
	swal("${noRecordMsg}","", ""); 
</script>
</c:if> --%>
<script type="text/javascript">
$(document).on('click', '.viewsurvey', function()
			{
		 
			
			  //window.location.href="modifySurveyData";
			   var surveyId = $(this).attr('survey-id');
			   $("#surveyId1").val(surveyId);
			   $("#myForm1").submit();

	 
			}); 


function downloadExcel(){
	//alert("In Excel");
	$("#sampleIdE").val($("#sampleId").val());
	$("#surveyNoE").val($("#surveyNo").val());
	$("#fromDateE").val($("#surveyDateFrom").val());
	$("#toDateE").val($("#surveyDateTo").val());
	$("#regionIdE").val($("#regionId").val());
	$("#filterE").val($("#filter").val());
	$("#tagExcelForm").submit(); 
}
function downloadPdf(){
 	
	$("#sampleIdPDF").val($("#sampleId").val());
	$("#surveyNoPDF").val($("#surveyNo").val());
	$("#fromDatePDF").val($("#surveyDateFrom").val());
	$("#toDatePDF").val($("#surveyDateTo").val());
	$("#regionIdPDF").val($("#regionId").val());
	$("#filterPDF").val($("#filter").val());
	$("#tagPdfForm").submit();
	
} 

$(function() {

	$('#viewTagSample').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "viewTagSampleDetailsData",
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
				{"data":"sampleIdValue"},
				{"data":"surveyNo"},
				{"data":"surveyDate"},
				{"data":"samplePublishedOn"},
				{"data":"createdOn"},
				{"data":"regionName"},
				{"data":"rustType"},
				{"data":"externalLab"},
				{"data":"researchCenterName"},
				{"data":"editLink"}
				
			]
	
  
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
