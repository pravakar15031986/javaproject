<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	
	
	

<style>
.fa-file-pdf-o {
	color: red;
}

  .modal-body {
   
    height: 300px;
    overflow: auto;
} 
 


</style>

<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Mobile Service Log Details</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Log Report</li>
						<li class="breadcrumb-item" aria-current="page">Mobile Service Log Details</li>
					</ol>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
				<div class="card-header">
					
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="viewMobileLogDetails">View</a>
						</ul>
						<div class="indicatorslist"></div>
					</div>
					<!-- Search Panel -->
					
					

					<div class="search-container">
					
					
					
						<div class="search-sec">
						
						 
						
							<form:form class="col-sm-12 form-horizontal customform"
								action="viewMobileLogDetails" method="post"
								modelAttribute="searchVo" autocomplete="off">
								<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
								<div class="form-group">
									<div class="row">
										<label class="col-lg-2 ">Request From Date</label>
										<div class="input-group col-lg-3">
											<form:input type="text" id="startDate" path="startDate"
												class="form-control datepicker" data-date-end-date="0d"
												aria-label="Default"
												aria-describedby="inputGroup-sizing-default" ></form:input>
											<div class="input-group-append">
												<span class="input-group-text"
													id="inputGroup-sizing-default"><i
													class="icon-calendar1"></i></span>
											</div>
										</div>
										<label class="col-lg-2 ">Request To Date</label>
										<div class="input-group col-lg-3">
											<form:input type="text" id="endDate" path="endDate"
												class="form-control datepicker" data-date-end-date="0d"
												aria-label="Default"
												aria-describedby="inputGroup-sizing-default" ></form:input>
											
											
											
											
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
								


							</form:form>
						</div>
					
				
				
				
				<div class="text-center">
							<a class="searchopen" title="Search" data-toggle="tooltip"
								data-placement="bottom"> <i class="icon-angle-arrow-down"></i>
							</a>
						</div>
			 </div> 
			 
			

			<!-- Search Panel -->
			<!--===================================================-->
			<div class="card-body">
				<div class="table-responsive">
					<table data-toggle="table" class="table table-hover table-bordered"
						id="viewTable">
						<thead>
							<tr>
								<th width="40px">Sl#</th>
								<th>Organization</th>
								<th>Full Name</th>
								<th>User ID</th>
								<th>Designation</th>
								<th>Role</th>
								<th>Service URL</th>
								<th>Request Date</th>
								<th>Request Details</th>
								<th>Response Date</th>
								<th>Response Details</th>
							</tr>
						</thead>
						
					</table>
				</div>

			</div>
			<!--===================================================-->
		</div>

	</div>
</div>
<!-- Response Modal Start -->
<div class="container">
	<!-- Trigger the modal with a button -->
	<button style="display: none;" id="modalResponse" type="button"  
		class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModalResponse">Open Modal</button>

	<div class="modal fade" id="myModalResponse" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			 <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
				<div class="modal-header">
					
					<h4 class="modal-title">Response Details</h4>
				</div>

				<div class="modal-body">
<div class="modal-body">

				<table data-toggle="table" class="table table-hover table-bordered">
					
					<div id="loctblBdyResponse"  >

					</div>
				</table>
				<p id="locMsgResponse"></p>



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<!-- /Response Modal End -->
</div>
</div>



<!-- Request Modal -->
<div class="container">
	<!-- Trigger the modal with a button -->
	<button style="display: none;" id="modalOpen" type="button"
		class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModalI">Open Modal</button>


	<div class="modal fade" id="myModalI" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			 <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
				<div class="modal-header">
					
					<h4 class="modal-title">Request Details</h4>
				</div>

				
<div class="modal-body" id="loctblBdyR">

				<table data-toggle="table" class="table table-hover table-bordered">
					<thead id="loctblHd">

					</thead>
					<div  >

					</div>
				</table>
				<p id="locMsg"></p>



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	

		<script>
function validate(){
	
	 event.preventDefault();
	var form = event.target.form; 
	var fromDate=$("#startDate").val();
	var toDate=$("#endDate").val();

	if(fromDate!='')
	{	
	
		if(toDate =='')
		{
			$("#endDate").focus();
			swal('Warning','Please enter Login To Date','warning')
   			return false; 
		}
	}

	if(toDate!='')
	{	
	
		if(fromDate =='')
		{
			$("#startDate").focus();
			swal('Warning','Please enter Login From Date','warning')
   			return false; 
		}
	}
	if(fromDate!='' &&  toDate!='')
	{
		if(Date.parse(fromDate)>Date.parse(toDate))
		{
			$("#startDate").focus();
			swal('Warning','Login From Date Should be less than Login To Date','warning')
				return false; 
		}
	}
	
	form.submit();	
	//$("#searchForm").submit();
}
</script>

		<script>
		$(function() {    
			   $('#startDate').datepicker();
			   $('#startDate').datepicker('setDate','04/23/2014');
			});​
​
</script>


		<!-- --------------------i button click------------------ -->
		<script>

function userReqInfo(id){


	
	$("#modalOpen").click(); 
	$("#loctblBdyR").empty();
	 $.ajax({
			type : "POST",
			url : "getUserReqInfo", 
		 
			data : {
				"logId":id
				
			},
			success : function(response) {
				
				var val=JSON.parse(response);
				

				htmlBody=val.requestVal;
				$('#loctblBdyR').append(htmlBody);
				

				
			},error : function(error) {
				 
			}
		});
	
}

</script>
<script>

function userResInfo(iid){


	
	$("#modalResponse").click(); 
	$("#loctblBdyResponse").empty();
	  $.ajax({
			type : "POST",
			url : "getUserResInfo", 
		 
			data : {
				"logId":iid
				
			},
			success : function(response) {
				
				var val=JSON.parse(response);
				

				htmlBody=val.responseVal;
				
				
				$('#loctblBdyResponse').append(htmlBody);
				
			},error : function(error) {
				
			}
		}); 
	
}

</script>


<!-- ------------------------------------------------ -->

		

		<!-- --------------------/i button click------------------ -->
		<!-- -------------------------------------Dynamic Paging---------- -->
		<script type="text/javascript">
	$(function() {
		
		$('#viewTable').dataTable({

			'processing' : true,
			'serverSide' : true,
			"searching" : false,
			"ordering" : false,
			"ajax" : {
				"url" : "viewSucessMobilelogData",
				"data" : function(d) {
				
					d.startDate = $("#startDate").val();
					d.endDate = $("#endDate").val();
				

				}
			},
			"dataSrc" : "",
			"columns" : [ {
				"data" : "sNo"
			}, {
				"data" : "organisation"
			}, {
				"data" : "fullName"
			}, {
				"data" : "userName"
			}, {
				"data" : "designation"
			}, {
				"data" : "roll"
			}, {
				"data" : "serviceName"
			}, {
				"data" : "reqTime"
			}, {
				"data" : "modalLink"
			}, {
				"data" : "resTime"
			},{
				"data" : "modalLinkRes"
			}
			
			]

		});
	});
	//reqDetails //resDetails
</script>
		<!-- ---------------------------/Dynamic Paging------------ -->
		
		