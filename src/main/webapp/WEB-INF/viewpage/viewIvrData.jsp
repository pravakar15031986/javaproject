<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

      <c:if test="${msg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${msg}"," ", "error"); 
	});
</script>
</c:if>  
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                   <div class="title-details">
                     <h4>View IVR Data</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                          <li class="breadcrumb-item">Manage Survey</li>
                           <li class="breadcrumb-item active" aria-current="page">Import IVR Data</li>
                        </ol>
                     </nav>
                  </div>
     
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                               <a class="nav-item nav-link 	"  href="uploadIvrData">Add</a>
                              <a class="nav-item nav-link active"  href="viewIvrData">View</a>
                           </ul>
                           <div class="indicatorslist">
                              </div> 
                        </div>
                        <!-- Search Panel -->
                        <form:form class="col-sm-12 form-horizontal customform"
								action="viewIvrSearch" method="post"
								modelAttribute="searchVo" autocomplete="off">
								<input type="hidden" name="csrf_token_"
									value="<c:out value='${csrf_token_}'/>" />
									
                        <div class="search-container">
                           <c:if test="${showSearch eq false }">
						<div class="search-sec">
						</c:if>
						<c:if test="${showSearch eq true }">
						<div class="search-sec" style="display:block;">
						</c:if>
							
								<div class="form-group">
									<div class="row">
										<label class="col-lg-2 ">Upload Date From</label>
										<div class="input-group col-lg-3">
											<form:input type="text" class="form-control datepicker"
												id="fromDate" data-date-end-date="0d" aria-label="Default"
												aria-describedby="inputGroup-sizing-default"
												path="startDate" autocomplete="off"/>
											<div class="input-group-append">
												<span class="input-group-text"
													id="inputGroup-sizing-default"><i
													class="icon-calendar1"></i></span>
											</div>
										</div>
										<label class="col-lg-2 ">Upload Date To</label>
										<div class="input-group col-lg-3">
											<form:input type="text" class="form-control datepicker"
												id="toDate" data-date-end-date="0d" aria-label="Default"
												aria-describedby="inputGroup-sizing-default" path="endDate"
												autocomplete="off"/>
											<div class="input-group-append">
												<span class="input-group-text"
													id="inputGroup-sizing-default"><i
													class="icon-calendar1"></i></span>
											</div>
										</div>
										<div class="col-lg-2">
											<button class="btn btn-primary" onclick="validate()">
												<i class="fa fa-search"></i> Search
											</button>
										</div>
									</div>

								</div>

							
						</div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div> 
                        </form:form>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                           <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                           	<thead>
                                 <tr>
                                 	<th>#Sl No.</th>
                                 	<th>Uploaded File Name</th>
                                 	<th>Uploaded On</th>
                                 	<th>No. of IVR Data</th>
                                 </tr>
                                 </thead>
                           <tbody id="responseBody">
                         
                           </tbody>
                           </table>
                          </div>
                            <div id="showPageNId">
						</div>
						<div style="float: right;" id="pageId">
							<ul class="pagination">
  							</ul>
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
		$('#viewTable').dataTable({

			'processing' : true,
			'serverSide' : true,
			"searching" : false,
			"ordering" : false,
			"ajax" : {
				"url" : "viewIvrDataPage",
				"data" : function(d) {
					d.startDate = $("#fromDate").val();
					d.endDate = $("#toDate").val();
				}
			},
			"dataSrc" : "",
			"columns" : [ {
				"data" : "slNo"
			}, {
				"data" : "fileName"
			}, {
				"data" : "uploadDate"
			}, {
				"data" : "ivrDataCount"
			} ]
		});
	});


	function validate() {
		event.preventDefault();
		var form = event.target.form;
		var fromDate = $("#fromDate").val();
		var toDate = $("#toDate").val();

		if (fromDate == "" && toDate == "") {
			swal("Error", "Upload Date From should not empty", "error").then(
					function() {
						$("#fromDate").focus();
					});
			return false;
		}
		if (Date.parse(fromDate) > Date.parse(toDate)) {
			swal('Error',
					'Upload Date From should be less than Upload Date To',
					'error')
			return false;
		}
		if (fromDate != "" && toDate == "") {
			swal("Error", "Upload Date To should not empty", "error").then(
					function() {
						$("#toDate").focus();
					});
			return false;
		}
		if (fromDate == "" && toDate != "") {
			swal("Error", "Upload Date From should not empty", "error").then(
					function() {
						$("#fromDate").focus();
					});
			return false;
		}
		form.submit();
	}

	
	function generateExcel(id) {

		$.ajax({
			type : "GET",
			url : "ivr-file-exist",
			data : {
				"fileId" : id
			},
			success : function(response) {
				
				var res = JSON.parse(response);

				if (res.msg == 'Yes') {
					$("#fileNameId").val(id);
					$("#excelReportForm").submit();
				} else {
					swal("File not found", " ", "error");

				}
			},
			error : function(error) {
			},

		});
	}

	function edit(id) {

		$("#fileId").val(id);
		$("#dataCountForm").submit();
	}
</script>



  <form action="ivr-data-excel-download" id="excelReportForm"  method="POST">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

  
		<input type="hidden" name="fileId"  id="fileNameId">
 </form> 
 
 <form action="ivr-data-excel-data-count" id="dataCountForm"  method="POST">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

 
		<input type="hidden" name="fileId"  id="fileId">
 </form>