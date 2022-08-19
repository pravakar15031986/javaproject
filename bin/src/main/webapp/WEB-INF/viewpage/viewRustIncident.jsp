<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<c:if test="${msg ne Empty}">
	<script>
	$(document).ready(function(){  
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	 });
</script>
</c:if>
<c:if test="${msg_1 ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${msg_1}"," ", "error"); 
	});
</script>
</c:if>
<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>View Rust Incident</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Manage Survey</li>
						<li class="breadcrumb-item active" aria-current="page">Rust
							Incident</li>

					</ol>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="viewRustIncident">View</a>
						</ul>
						<div class="indicatorslist">
							</div>
					</div>
					<!-- Search Panel -->
					<form:form action="viewRustIncident" modelAttribute="searchVo" autocomplete="off"
						id="searchFormId" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						
					<div class="search-container">
						<div class="search-sec">
							<div class="form-group">
								<div class="row">
									<label class="col-lg-2 ">Incident Date From</label>
									<div class="input-group col-lg-3">
										<form:input class="form-control datepicker"
											data-date-end-date="0d" aria-label="Default"
											aria-describedby="inputGroup-sizing-default" path="startDate"
											id="startDate"/>
										<div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i
												class="icon-calendar1"></i></span>
										</div>
									</div>
									<label class="col-lg-2 ">Incident Date To</label>
									<div class="input-group col-lg-3">
										<form:input class="form-control datepicker"
											data-date-end-date="0d" aria-label="Default"
											aria-describedby="inputGroup-sizing-default" path="endDate"
											id="endDate"/>
										<div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i
												class="icon-calendar1"></i></span>
										</div>
									</div>
									<div class="col-sm-2">
										<button class="btn btn-primary" id="searchId">
											<i class="fa fa-search"></i> Search
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="text-center">
							<a class="searchopen" title="Search" data-toggle="tooltip"
								data-placement="bottom"> <i class="icon-angle-arrow-down"></i>
							</a>
						</div>
					</div>
					</form:form>
					<!-- Search Panel -->
					<!--===================================================-->
					<div class="card-body">
						<div class="table-responsive">
							<table data-toggle="table"
								class="table table-hover table-bordered" id="viewTable">
								<thead>
									<tr>
										<th width="40px">Sl#</th>
										<th>Incident Date</th>
										<th>Woreda</th>
										<th>Kebele</th>
										<th>Season</th>
										<th>Longitude</th>
										<th>Latitude</th>
										<th width="100px">View Details</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${incidentList}" var="dtls" varStatus="count">
										<tr>
											<td>${count.index + 1 }</td>
											<td>${dtls.incidentDate}</td>
											<td>${dtls.woredaName}</td>
											<td>${dtls.kebeleName}</td>
											<td>${dtls.seasonName}</td>
											<td>${dtls.longitude}</td>
											<td>${dtls.latitude}</td>
											<td><a href="javascript:void(0)" data-toggle='modal' data-target='#myModal'
												class="fa fa-fw fa-eye-slash pass-i-tooltip"
												onclick="optionValue(${dtls.incidentId})"></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
					<!--===================================================-->
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Incident Details</h4>
				</div>
				<table id="checkId">

				</table>
				<div class="modal-body">

					<div id="molIdL">
						<div class="leftdiv"
							style="float: left; width: 50%; font-weight: bold;">
							Question
							<div id="qModalId"></div>
						</div>
						<div class="rightdiv"
							style="float: left; width: 50%; font-weight: bold;">
							Question Option
							<div id="opModalId"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</div>

<script>
 $(document).ready(function() {
	    $('#viewTable').DataTable({fnInitComplete : function() {
	        if ($(this).find('td').length<=1) {
	            $('.dataTables_wrapper').hide();
	            swal("No record found")
	            }
	         }});
	} );
 </script>
<script>
 function optionValue(id)
{
	 $("#qModalId").empty();
	 $("#opModalId").empty();
		$.ajax({
			type:"GET",
			url:"viewRustIncidentDetailsById",
			data:{
					"incidentId":id
				},
			success:function(response){
				var val=JSON.parse(response);
				
				var htmlQust="";
				var htmlOptionQust="";
				$.each(val.dtlArr,function(index,value){
						htmlQust=htmlQust+"<div style='font-weight: normal;'>"+value.quust_val+"</div>";
					htmlOptionQust=htmlOptionQust+"<div style='font-weight: normal;'>"+value.option_val+"</div>";

					});
				$("#qModalId").append(htmlQust);
				$("#opModalId").append(htmlOptionQust);
			}
		});
}
	
</script>
<script>
		$("#searchId").click(function(){
			//alert("In Search");
			var fromDate=$("#startDate").val();
			var toDate=$("#endDate").val();
			if(fromDate!= '' && toDate =='')
			{
					 swal(
			 	   				'Error', 
			 	   				'Please enter the Incident Date To',
			 	   				'error'
			 	   			).then(function() {
								   $("#endDate").focus();
							   });
			    		return false;
			}
			if(fromDate== '' && toDate !='')
			{
					 swal(
			 	   				'Error', 
			 	   				'Please enter the Incident Date From',
			 	   				'error'
			 	   			).then(function() {
								   $("#startDate").focus();
							   });
			    		return false;
			}
					var eDate = new Date(toDate);
				 	 var sDate = new Date(fromDate);
				  if(fromDate!= '' && fromDate!= '' && sDate> eDate)
				    {
				 	 swal(
			 	   				'Error', 
			 	   				'Incident Date From should not be greater than Incident Date To',
			 	   				'error'
			 	   			).then(function() {
								   $("#startDate").focus();
							   });
			    		return false;
				    }
		});
 </script>
