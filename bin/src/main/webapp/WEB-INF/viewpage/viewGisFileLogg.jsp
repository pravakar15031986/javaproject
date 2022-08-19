<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<h4></h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Log Reports</li>
						<li class="breadcrumb-item active" aria-current="page">Gis File Log</li>
					</ol>
				</nav>
			</div>

		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="viewGisFileLog">view</a>
						</ul>
						<!-- ---------------PDF AND EXCEL DOWNLOAD------------- -->
						<div class="indicatorslist">
                     </div>  
                     <div class="indicatorslist"> 
                         <%-- <form action="downloadSucessWebLoginDetailsPdf" method="post" target="_blank" id="pdfform" class="noload">
						
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="text" style="display: none;"   name="organizationIdExcel" id="organizationIdPDF">
						<input type="text" style="display: none;"   name="roleIdExcel" id="roleIdPDF">
						<input type="text" style="display: none;"   name="researchCenterIdExcel" id="researchCenterIdPDF">
						<input type="text" style="display: none;"   name="intdesigidExcel" id="intdesigidPDF">
						<input type="text" style="display: none;"   name="startDateExcel" id="startDatePDF">
						<input type="text" style="display: none;"   name="endDateExcel" id="endDatePDF">
						<input type="text" style="display: none;"   name="fullNameExcel" id="fullNamePDF">
						<input type="text" style="display: none;"   name="statusExcel" id="statusPDF">
						<button type="button" id="pdfdownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1"></i></button>
					</form> --%>
                         </div> 
                        </div>

					<%-- <form action="downloadSucessWebLoginDetailsExcel" method="post" id="exceldownload">
						
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="text" style="display: none;"   name="organizationIdExcel" id="organizationIdExcel">
						<input type="text" style="display: none;"   name="roleIdExcel" id="roleIdExcel">
						<input type="text" style="display: none;"   name="researchCenterIdExcel" id="researchCenterIdExcel">
						<input type="text" style="display: none;"   name="intdesigidExcel" id="intdesigidExcel">
						<input type="text" style="display: none;"   name="startDateExcel" id="startDateExcel">
						<input type="text" style="display: none;"   name="endDateExcel" id="endDateExcel">
						<input type="text" style="display: none;"   name="fullNameExcel" id="fullNameExcel">
						<input type="text" style="display: none;"   name="statusExcel" id="statusExcel">
						
					</form> --%>
					
					
						<%-- <input type="text" id="searchOrganizationId" value="${organizationId}" style="display: none;">
     					<input type="text" id="searchRoleId" value="${roleId}" style="display: none;">
						<input type="text" id="searchResearchCenterId" value="${researchCenterId}" style="display: none;">
						<input type="text" id="searchIntdesigid" value="${intdesigid}" style="display: none;">
						<input type="text" id="searchStartDate" value="${startDate}" style="display: none;">
						<input type="text" id="searchEndDate" value="${endDate}" style="display: none;">
						<input type="text" id="searchFullName" value="${fullName}" style="display: none;">
						<input type="text" id="searchStatus" value="${statusId}" style="display: none;"> --%>
						
						<!-- ---------------PDF AND EXCEL DOWNLOAD------------------- -->
						
						
					





					<!-- /SEARCH PANNEL -->
					 <div class="search-container">
                          <c:if test="${showSearch eq true }">
					<div class="search-sec" style="display: block;">
					</c:if>
					<c:if test="${showSearch eq false }">
					<div class="search-sec">
					</c:if>
					<form class="col-sm-12 form-horizontal customform" action="searchViewGisFileLog" method="POST" id="myform" autocomplete="off">
					<div class="form-group">
                                 <div class="row">
                                 <label class="col-lg-2 ">Uploaded Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" id="uploadstartdate" name="uploadstartdate" value="${startDate}" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                    
                                    
                                    
                                   <label class="col-lg-2 ">Uploaded Date To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" id="uploadenddate" name="uploadenddate"  value="${endDate}" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary" onclick="searchData()"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                 </div>
                                 
                              </div>
					
					</form>
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
							<table data-toggle="table"
								class="table table-hover table-bordered" id="myView">
								<thead>
									                                     <tr>
                                      <th width="40px">Sl#</th>
                                       <th>Upload Date</th>
                                       <th>File Name</th>
                                       <th>File Uploaded on</th>
                                       <th>Status</th>
                                    </tr>
								</thead>
								 <tbody>
                                     <c:forEach items="${dataList}" var="vo" varStatus="myIndex">   
                                    <tr>
                                      <td><c:out value="${myIndex.index + 1 }"  /></td>
                                      <td>${vo.updateDate}</td>
                                      <td><a href='javascript:void(0)' onclick='generateExcel(${vo.fileId})'>${vo.fileName}</a> </td>
                                      <td>${vo.fileUploadedOn}</td>
                                      <td>${vo.status}</td>                                 
                                      
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
	<form action="downloadGisFile" method="post" id="downloadForm">
		<input type="hidden" name="fileId" id="gFileId">
	</form> 
</div>





<!--=============Date validation============-->


<script>
function searchData(){      
	event.preventDefault();  
	var form = event.target.form;  
	var fromDate=$("#uploadstartdate").val(); 
	var toDate=$("#uploadenddate").val(); 

	if(fromDate!='')  
	{	                 
	
		if(toDate =='') 
		{
			$("#endDate").focus(); 
			swal('Warning','Please enter Upload To Date','warning') 
   			return false; 
		}
	}

	if(toDate!='')
	{	
	
		if(fromDate =='')
		{
			$("#startDate").focus();
			swal('Warning','Please enter Upload From Date','warning')
   			return false; 
		}



		
	}
	if(fromDate!='' &&  toDate!='')
	{
		if(Date.parse(fromDate)>Date.parse(toDate))
		{
			$("#startDate").focus();
			swal('Warning','Upload From Date Should be less than Upload To Date','warning')
				return false; 
		}
	}

	var date1= new Date(fromDate);
	var date2=new Date(toDate);
	 
	var Difference_In_Time = date2.getTime() - date1.getTime(); 
	//alert(Difference_In_Time);
	// To calculate the no. of days between two dates 
	var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24); 

	 
	 if (Difference_In_Days >= 90) {

		   $("#startDate").focus(); 
		   $("#endDate").focus(); 
			swal('Warning','Difference Between From Date and To Date Must Be Within 90 Days','warning') 
				
				return false; 
		   
		 }

	
	form.submit();	
	//$("#searchForm").submit();
}
</script>


<script>
function generateExcel(id)
{	
	 //alert("file =="+id);
	$.ajax({
		type:"GET",
		url:"gis-file-exist",
		data:{
				"fileId":id
		},
		success:function(response){

			var res=JSON.parse(response);
			
			if(res.msg == 'Yes')
			{	
				$("#gFileId").val(id);
				$("#downloadForm").submit();
			}else{
				swal("File not found"," ", "error"); 
				
				}
		},
		error:function(error)
		{
		},		
		
		});   
}
</script>
<script>
					function excelDownload()
					{
							var organization = $("#organizationId").val();
							
							document.getElementById("organizationIdExcel").value = organization;

							var role = $("#roleId").val();
							document.getElementById("roleIdExcel").value = role;

							var researchCenter = $("#researchCenterId").val();
							document.getElementById("researchCenterIdExcel").value = researchCenter;

							var desig = $("#intdesigid").val();
							document.getElementById("intdesigidExcel").value = desig;

							var sdate = $("#startDate").val();
							
							document.getElementById("startDateExcel").value = sdate;

							var edate = $("#endDate").val();
							document.getElementById("endDateExcel").value = edate;

							var fullname = $("#fullName").val();
							document.getElementById("fullNameExcel").value = fullname;

							var status = $("#statusId").val();
							
							document.getElementById("statusExcel").value = status;
							

							
							//$("#exceldownload").submit();
							document.getElementById("exceldownload").submit();
					}
                        </script>
                        
                       

   
<script>
$(document).ready(function(){
	
	$('#myView').DataTable({
     /* "paging":   true,
     "ordering": true,
     "info":     true,
 */
     	'paging':true,
		'lengthChange':true,
		'searching':false,
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
 })
 
 
});
</script>

