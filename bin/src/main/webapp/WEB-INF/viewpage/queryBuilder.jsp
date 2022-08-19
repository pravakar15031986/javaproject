<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				<h4>Manage Queries</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Manage Master</li>
						<li class="breadcrumb-item active" aria-current="page">Query
							Builder</li>


					</ol>
				</nav>
			</div>

		</div>



		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
						</ul>
						<div class="indicatorslist">
							<p class="ml-2" style="color: red">(*) Indicates mandatory</p>
						</div>
					</div>
					<!-- BASIC FORM ELEMENTS -->
					<!--===================================================-->
					<div class="card-body">
						<!--Static-->

						<div class="width100">

							<form action="manageQueryBuilder" method="post">
								<input type="hidden" name="csrf_token_"
									value="<c:out value='${csrf_token_}'/>" />
								<div class="form-group">


									<div class="col-sm-7 col-lg-7">

										<input type="password" name="password"
											placeholder="Enter Password" class="form-control">


									</div>

									<input type="hidden"  name="ipaddress"
										id="ipaddress"> <br>
									<div class="col-sm-7 col-lg-7">

										<textarea placeholder="Enter Query" name="query" rows="4"
											cols="100" id="txtquery" class="form-control">
												${query}</textarea>
										<script>
                                           $("#txtquery").val($("#txtquery").val().trim());
                                           </script>


									</div>
									<div class="clearfix"></div>
								</div>


								<div class="form-group" style="float: left;">
									<div class="col-sm-6">

										<input type="submit" name="btnSubmit" value="Submit"
											id="btnSubmit" class="btn btn-success">

									</div>
								</div>


							</form>

						</div>
						<div class="clearfix"></div>


						<div class="col-md-12">
							<c:if test="${not empty columnNames and Error eq false}">
								<div class="table-responsive">
									<table id="dynamicTable"
										class="table table-bordered table-hover contractor_type_tbl">

										<thead>
											<tr>
												<c:forEach items="${columnNames}" var="coln">
													<th>${coln}</th>

												</c:forEach>


											</tr>

										</thead>

										<tbody>
											<c:forEach items="${columnData}" var="details">
												<tr>
													<c:forEach items="${details}" var="obj" varStatus="status">
														<td><c:out value="${obj}" /></td>
													</c:forEach>
												</tr>
											</c:forEach>



										</tbody>


									</table>
								</div>
							</c:if>

							<c:if test="${Error eq true }">
								<span style="color: red;">${Message }</span>
							</c:if>


						</div>

						<br> <br> <br> <br> <br> <br>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<script>

         $(document).ready(function(){
         	
         	
         	
         	$.ajax({
          		type : "GET",
          		url : "//api.ipify.org?format=jsonp=", 
          		success : setPublicIpSucess,
          		dataType : 'text',
         		contentType : 'text/xml',
          		asynch:false,
          		error : errorFun
          	}); 
          	function setPublicIpSucess(response)
          	{
          		
          		var ipaddress = response.toString();
          		
          		//document.getElementById("ipaddress").value = ipaddress;
          		$("#ipaddress").val(ipaddress);
          	
          	}
          	function errorFun(response)
         	{
         	}
        });
         </script>



<script>

$(document).ready(function()
		{
	$('#dynamicTable').DataTable({
         "paging":   true,
         "ordering": false,
         "info":     true
     });
		
		});
</script>
