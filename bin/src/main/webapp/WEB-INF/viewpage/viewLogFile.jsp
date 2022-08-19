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
				<h4>View Application Log</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Log Reports</li>
						<li class="breadcrumb-item active" aria-current="page">Application Log</li>
					</ol>
				</nav>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							
							<a class="nav-item nav-link active" href="viewLogFile">View</a>
						</ul>
						<!-- -------------- View Log File And DOWNLOAD------------- -->
						 
                     
                         </div> 
                         
                        
                        
                      <!--     ------------search pannel------------------ -->          
							
					<!-- /SEARCH PANNEL   (Date) -->
					 <div class="search-container">
                          <c:if test="${showSearch eq true }">
					<div class="search-sec" style="display: block;">
					</c:if>
					<c:if test="${showSearch eq false }">
					<div class="search-sec">
					</c:if>
					<form action="viewLogFile" method="POST" id="myForm"  >
					<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
					<input type="hidden" id="year" name="year" />
					<input type="hidden" id="month" name="month" >
					</form>
					<div class="form-group">
                                 <div class="row">
                                 <label class="col-lg-2 ">Year </label>
                                    <div class="col-lg-3">
                                       <select class="form-control" id="yearId" >
                                 
                                    </select>
                                    </div>
                                    <label class="col-lg-2 ">Month </label>
                                    <div class="col-lg-3">
                                       <select class="form-control" id="monthId">
											<c:forEach items="${monthList}" var="vo">
											<option value="${vo}">${vo}</option>
											</c:forEach>
                                    </select>
                                    </div>
                                    
                                    
                                   
                                    <div class="col-lg-2">
                                       <button type="button" onclick="searchData()" class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
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
					
					
			<!-- Search Panel -->
					

					<!--===================================================-->

					<div class="card-body">
						<div class="table-responsive">
							<table data-toggle="table"
								class="table table-hover table-bordered" id="myView">
								<thead>
									  <tr>                                   
                                      <th width="40px">Sl#</th>
                                       <th>Log Date</th>
                                       <th>File Name</th>
                                    </tr>
								</thead>
								 <tbody>
                                     <c:forEach items="${dataList}" var="vo" varStatus="myIndex">   
                                    <tr>
                                      <td><c:out value="${myIndex.index + 1 }"  /></td>
                                      <td>${vo.fileDate}</td>
                                      <%-- <td><a href='javascript:void(0)' onclick='generateExcel(${vo.fileId})'>${vo.fileName}</a> </td> --%>
	                                  <td><a href='public/downloadLogFile?fileName=${vo.fileName}' >${vo.fileName}</a> </td>                                
                                      
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
		




<script>
$(document).ready(function(){
	
	$('#myView').DataTable({
     
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

 $("#yearId").val("${selectedYear}");
$("#monthId").val("${selectedMonth}");
});
</script>

<script>
 
 var yearList = '${YearList}';
 yearList = JSON.parse(atob(yearList));
 for(i=0;i<yearList.length;i++)
	 {
	 	
	 $("#yearId").append('<option value="'+yearList[i]+'" >'+yearList[i]+'</option>');
	 
	 }
 function searchData(){
	 $("#year").val($("#yearId").val())
	 $("#month").val($("#monthId").val())
	 $("#myForm").submit()
	 }
</script>
	 