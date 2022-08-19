<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<div class="mainpanel">
 <form:form action="editextTaggedSample" name="form" method="post">
 <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
<input type="hidden" name="sampleLabTagId" id="hdnsampleLabTagId"/>
</form:form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View External Tagged Samples</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Race Analysis</li>
                           <li class="breadcrumb-item active" aria-current="page">External Tagged Samples</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="externalTaggedSamples">External Tagged Samples</a>
                              <a class="nav-item nav-link"  href="extRaceResult">External Race Result</a>
                           </ul>
                             
                        </div>
                        <!-- Search Panel -->
                        <form class="col-sm-12 form-horizontal customform" action="externalTaggedSamples"  method="post"  autocomplete="off">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="search-container">
                           <c:if test="${showSearch eq true }">
                        	 <div class="search-sec">
                        	</c:if>
                           <c:if test="${showSearch eq false }">
                        	 <div class="search-sec" style="display:block;"> 
                        	</c:if>
                           <div class="form-group">
                           <div class="form-group">
                              <div class="row">
                              <label class="col-lg-2 ">Sample ID</label>
                                    <div class="col-lg-3">
                                      <input type="text" class="form-control" name="sampleId" id="sampleId" placeholder="" value="${sampleId}" maxlength="50"/>
                                    </div>
                              <label class="col-lg-2 ">Survey No.</label>
                                    <div class="col-lg-3">
                                      <input type="text" class="form-control" name="surveyNo" id="surveyNo"  value="${surveyNo}" placeholder="" maxlength="50"/>
                                    </div>
                              </div>
                              </div>
                           </div>
                                  <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Survey Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker"data-date-end-date="0d"  name="surveyDateFrom" id="surveyDateFrom" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Survey Date To </label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" data-date-end-date="0d" name="surveyDateTo" id="surveyDateTo" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
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
                                    <c:forEach items="${regionlist}" var="countr" >
                                    <option value="${countr.demographyId}">${countr.demographyName}</option>
                                    </c:forEach>
                                    </select>
                                    </div>
                                    <label class="col-sm-2 ">Rust Type</label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="filter" name="rustTypeId">
                                          <option value="0">--Select--</option>
                                          <c:forEach items="${rust}" var="rust">
                                    	 	  	<option value="${rust.rustId}">${rust.typeOfRust}</option>
                                       		  </c:forEach>
                                       </select>
                                    </div>
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary" onclick="return searchData()"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                              	</div>
                              </div>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        </form>
                        <form action="viewSurveyDetailsOnExternalSample" autocomplete="off" id="myForm1"   method="post">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                                   <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
                                 </form>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        
                        <div class="card-body">
                        
                            <div class="table-responsive"> 
                              <table data-toggle="table" class="table table-hover table-bordered" id="myTable">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                      <th>Sample ID</th>
                                        <th>Survey No.</th>
                                      <th>Survey Date</th>
                                       <th>Sample Tagged On</th>
                                       <th>Region</th>
                                       <th>Rust Type</th>
                                       <th>Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                  <%-- <c:forEach items="${extTaggedSamplesList}" var="vo" varStatus="counter">
                                  	<tr>
                                  	<td><c:out value="${counter.count}"/></td>
                                  	<td>${vo.sampleIdValue}</td>
                                  	  <td><a href="javascript:void(0);" class="viewsurvey" survey-id="${vo.surveyId }">${vo.surveyNo }</a></td>
                                  	<td>${vo.surveyNo}</td>
                                  	<td>${vo.surveyDate}</td>
                                  	<td>${vo.createdOn}</td>
                                  	<td>${vo.regionName}</td>
                                  	<td>${vo.rustType}</td>
                                  	<td><a data-placement="top" data-toggle="tooltip"  id="edit${vo.sampleLabTagId}" onclick="editextTaggedSamples('${vo.sampleLabTagId}');" title="Update Race Result">
                                  	<button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
                                  	<i class="icon-edit1"></i>
                                  	</button>
                                  	</a></td>
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
            </div>
         </div>
<script>
 
$(function() {
	 $('#myTable').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "externalTaggedSamplesPageWise",
					"data" : function(d) {
						d.sampleId= $('#sampleId').val();
						d.surveyNo = $('#surveyNo').val();
						d.surveyDateFrom =$('#surveyDateFrom').val();
						d.surveyDateTo = $('#surveyDateTo').val();
						d.regionId =$('#regionId').val();
						d.filter = $('#filter').val();
						
					}
			},
			"dataSrc": "",
			"columns":[
				{"data":"sNo"},
				{"data":"sampleIdValue"},
				{"data":"surveyNoLink"},
				{"data":"surveyDate"},
				{"data":"createdOn"},
				{"data":"regionName"},
				{"data":"rustType"},
				{"data":"editLink"}
			]

	});
	});	


</script>   
  <script>
	var  sampleId='${sampleId}';
	$("#sampleId").val(sampleId);
	var surveyNo='${surveyNo}';
	$("#surveyNo").val(surveyNo);
	var  surveyDateFrom='${surveyDateFrom}';
	$("#surveyDateFrom").val(surveyDateFrom);
	var  surveyDateTo='${surveyDateTo}';
	$("#surveyDateTo").val(surveyDateTo);
	var  regionId='${regionId}';
	$("#regionId").val(regionId);
	var  rustTypeId='${rustTypeId}';
	$("#filter").val(rustTypeId);

	 function searchData(){
     	
     	var fromDate=$("#surveyDateFrom").val();
     	
     	var toDate=$("#surveyDateTo").val();
     	if(fromDate!='')
     	{	
     	
     		if(toDate =='')
     		{
     			swal('Error','Please enter Survey  to date!','error')
        			$("#toDate").focus();
        			return false; 
     		}
     		if(Date.parse(fromDate)>Date.parse(toDate))
     		{
     			swal('Error','Survey  From Date Should be less than Survey To Date!','error')
        			return false; 
     		}
     	}
     	if(toDate !='')
		{
			if(fromDate == '')
			{
			 swal(
	 	   				'Error', 
	 	   				'Please enter  Survey From date',
	 	   				'error'
	 	   			).then(function() {
						   $("#toDate").focus();
					   });
	    		return false; 
			}
		}	
     	$("#searchForm").submit();
     }
	
  </script>   
  <script>
	function editextTaggedSamples(sampleLabTagId) {
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
<script type="text/javascript">
$(document).on('click', '.viewsurvey', function()
			{
			   var surveyId = $(this).attr('survey-id');
			   $("#surveyId1").val(surveyId);
			   $("#myForm1").submit();
}); 
</script>
