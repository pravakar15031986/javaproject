
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>View Yellow Rust Race Phenotype</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Manage Master</li>
						<li class="breadcrumb-item active" aria-current="page">Yellow Rust Race
							Phenotype Type</li>
					</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link " href="addYellowRacePhenotype">Add</a>
							<a class="nav-item nav-link active"
								href="viewYellowRacePhenotype">View</a>
						</ul>
						<div class="indicatorslist">
						</div>
					</div>
					<!-- Search Panel -->
					<form:form action="viewYellowRacePhenotype"
						modelAttribute="searchVo" method="post" autocomplete="off">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						
						<div class="search-container">
							<div class="search-sec">
								<div class="form-group">
									<div class="row">
										<label class="col-lg-2">Group Name</label>
										<div class="col-lg-3">
											<form:select class="form-control" id="genGroupId"
												path="genGroupId">
												<form:option value="0">--Select--</form:option>
												<c:forEach items="${group}" var="group">
													<form:option value="${group.geneticGroupId}">${group.groupName}</form:option>
												</c:forEach>
											</form:select>
										</div>
										<label class="col-lg-2">Race Name</label>
										<div class="col-lg-3">
											<form:input type="text" id="nameID" class="form-control"
												path="raceName" placeholder="" data-bv-field="fullName" />
										</div>
									</div>
								</div>
								<div class="row">
									<label class="col-sm-2 ">Status</label>
									<div class="col-sm-3">
										<form:select class="form-control" path="status" id="statusID">
											<form:option value="select">--Select--</form:option>
											<form:option value="false">Active</form:option>
											<form:option value="true">Inactive</form:option>
										</form:select>
									</div>
									<div class="col-lg-2">
										<button class="btn btn-primary">
											<i class="fa fa-search"></i> Search
										</button>
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
								class="table table-hover table-bordered" id="myTable">
								<thead>
									<tr>
										<th width="40px">Sl#</th>
										<th>Group Name</th>
										<th>Race Name</th>
										<th>Virulence Phenotype</th>
										<th>Status</th>
										<th width="100px">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${yellowRacePhenotype}" var="vo"
										varStatus="counter">
										<tr>
											<td>${counter.count}</td>
											<td>${vo.geneticGroupName}</td>
											<td>${vo.raceName}</td>
											<td>${vo.virulencePhenotype}</td>
											<td><c:if test="${vo.status eq false}">Active</c:if> <c:if
													test="${vo.status eq true}">Inactive</c:if></td>
											<td><a class="btn btn-info btn-sm editClass"
												data-toggle="tooltip"
												onclick="editRacePhenotype(${vo.racePhenotypeId})" title=""
												id="btnModifyId${vo.racePhenotypeId}"
												data-original-title="Edit"><i class="icon-edit1"></i></a></td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
						</div>
					</div>
					<form action="editYellowRacePhenotype" method="post" id="editForm">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

					
						<input type="hidden" name="racePhenotypeId" id="racePhenotypeId">
					</form>
					<!--===================================================-->
				</div>
			</div>
		</div>
	</div>
</div>

<c:if test="${msg ne Empty}">
	<script>
	 $(document).ready(function(){   
		swal("Success", "<c:out value='${msg}'/> ", "success");
	 });
	</script>
</c:if>
<script>
function editRacePhenotype(id){
	$("#racePhenotypeId").val(id);
	$("#editForm").submit();
}
</script>
<script>
$(function() {
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
	});	
</script>