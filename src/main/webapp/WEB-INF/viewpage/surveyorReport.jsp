<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>


<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>View Surveyor Details</h4>
				<nav aria-label="breadcrumb"> 
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item active" aria-current="page">Surveyors</li>
					</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="surveyorReport">View</a>
						</ul>
						<div class="indicatorslist">
							 <a
								title="" href="Home" id="backIcon"
								 data-toggle="tooltip"
								data-placement="top" data-original-title="Back"><i
								class="icon-arrow-left1"></i></a>
						 
						</div>
						<div class="indicatorslist">
						       <a  title="" href="javascript:void(0)" class="btn btn-outline-success btn-sm shadow-none"  id="pdfIcon" data-toggle="tooltip" data-placement="top" data-original-title="Print" onclick="downloadPdf()"><i class="icon-printer1"></i></a>
                        
                               <a  title="" href="javascript:void(0)" class="btn btn-outline-success btn-sm shadow-none"  id="excelIcon" data-toggle="tooltip" data-placement="top" data-original-title="Excel" onclick="downloadExcel()"><i class="icon-excel-file"></i></a>
                               </div>
					</div>
					<!-- Search Panel -->
					<form:form class="col-sm-12 form-horizontal customform" action="surveyorReport"  method="post" modelAttribute="searchVo" autocomplete="off">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

					
                        <div class="search-container">
                           <div class="search-sec">
                              <div class="form-group">
								<div class="row">
									<label class="col-lg-2 ">Research Center</label>
									<div class="col-lg-3">
										<form:select class="form-control" id="researchCenterId" path="center">
											<form:option value="" selected="selected">--Select--</form:option>
											<c:forEach items="${rcList}" var="rcl">
											<form:option value="${rcl.researchCenterId}">${rcl.researchCenterName}</form:option>
											</c:forEach>
										</form:select>
									</div>
									<label class="col-lg-2 ">Designation</label>
									<div class="col-lg-3">
										<form:select class="form-control" id="intdesigid" path="desn">
											<option value="" selected="selected">--Select--</option>
											<c:forEach items="${desingnationList}" var="des">
											<form:option value="${des.id}">${des.designation}</form:option>
											</c:forEach>
										</form:select>
									</div>
								</div>
							</div>
                              <div class="form-group">
								<div class="row">
									
									<label class="col-lg-2 ">Mobile no.</label>
									<div class="col-lg-3">
										<form:input class="form-control" path="mobileno"
											placeholder="" data-bv-field="fullName" id="mobile" autocomplete="off" maxlength="15"/>
									</div>
									<label class="col-lg-2 ">Email</label>
									<div class="col-lg-3">
										<form:input class="form-control" path="email"
											placeholder="" data-bv-field="fullName" id="email" autocomplete="off" maxlength="50"/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
								
								<label class="col-lg-2 ">Name</label>
									<div class="col-lg-3">
										<form:input class="form-control" path="fullname"
											placeholder="" data-bv-field="fullName" id="fullName" autocomplete="off" maxlength="50"/>
									</div>
								
									<div class="col-lg-2">
										<button class="btn btn-primary" type="submit" onclick="validate()">
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
										<th width="40px">Sl#</th>
										<th>Research Center Name</th>
										
										<th>Surveyor Name</th>
										<th>Gender</th>
										<th>Designation</th>
										<th>Role</th>
										<th>Mobile</th>
										<th>Email</th>
									</tr>
								</thead>
								     <tbody >
								     <!-- userdetails -->
								     
								      
                                 </tbody>	
							</table>
	
						</div>
						<div id="showPageNId">
						</div>
						<div style="float: right;">
							<ul class="pagination">
  							</ul>
						</div>						
					</div>
					<div>
						
						<span id="p4"></span> 
					</div>
					<!--===================================================-->
				</div>
			</div>
		</div>
	</div>
	<form action="surveyorExcelDownload" id="surveyorExcel" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

	
       		<input type="hidden" id="researchCenterIdE" name="researchCenterIdE">
       		<input type="hidden" id="intdesigidE" name="intdesigidE">
       		<input type="hidden" id="mobileE" name="mobileE">
       		<input type="hidden" id="emailE" name="emailE">
       		<input type="hidden" id="fullNameE" name="fullNameE">
       </form>
       
       <form action="surveyorPdfDownload" target="_blank" id="surveyorPdf" autocomplete="off"   method="post" class="noload">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

       
        	<input type="hidden" id="researchCenterIdPDF" name="researchCenterIdPDF">
       		<input type="hidden" id="intdesigidPDF" name="intdesigidPDF">
       		<input type="hidden" id="mobilePDF" name="mobilePDF">
       		<input type="hidden" id="emailPDF" name="emailPDF">
       		<input type="hidden" id="fullNamePDF" name="fullNamePDF">
		</form>
</div>


<script>
$(function() {
$('#viewTable').dataTable({
				
'processing' : true,
'serverSide' : true,
"searching": false,
"ordering": false, 
"ajax" : {
	"url" : "surveyorReportDashboardPagination",
	"data" : function(d) {
		d.rcId=$("#researchCenterId").val();
		d.desigId=$("#intdesigid").val();
		d.mobile =$("#mobile").val();
		d.email =$("#email").val();
		d.fullName =$("#fullName").val();
		},
"dataSrc": function ( json ) {
    if(json.data.length>0)
        {
        $('#pdfIcon').show();
        $('#excelIcon').show();
        $('.card-body').show();
        }else{
        	 $('#pdfIcon').hide();
             $('#excelIcon').hide();
             $('.card-body').hide();
             swal('No record found','','')
            }
    return json.data;
}
	},
	
	"columns":[
		{"data":"sNo"},
		{"data":"organizationName"},
		{"data":"fullName"},
		{"data":"gendr"},
		{"data":"designation"},
		{"data":"roleName"},
		{"data":"mobile"},
		{"data":"email"}
	]
		});
});	
</script>
<script>
function downloadExcel(){
	$("#researchCenterIdE").val($("#researchCenterId").val());
	$("#intdesigidE").val($("#intdesigid").val());
	$("#mobileE").val($("#mobile").val());
	$("#emailE").val($("#email").val());
	$("#fullNameE").val($("#fullName").val());
	$("#surveyorExcel").submit(); 
}
function downloadPdf(){
 	
	$("#researchCenterIdPDF").val($("#researchCenterId").val());
	$("#intdesigidPDF").val($("#intdesigid").val());
	$("#mobilePDF").val($("#mobile").val());
	$("#emailPDF").val($("#email").val());
	$("#fullNamePDF").val($("#fullName").val());
	$("#surveyorPdf").submit();
	
} 
</script>