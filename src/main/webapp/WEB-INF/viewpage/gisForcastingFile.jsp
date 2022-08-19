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
						<li class="breadcrumb-item">Gis Layer Details</li>
						
					</ol>
				</nav>
			</div>

		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							
							<a class="nav-item nav-link active" href="gisForcastingFile">View</a>
						</ul>
						
						<div class="indicatorslist">
                          
                     </div> 
                     <div class="indicatorslist"> 
                         
                         </div> 
                        </div>
		
					
					<!-- /SEARCH PANNEL -->
					 <div class="search-container">
                          <c:if test="${showSearch eq true }">
					<div class="search-sec" style="display: block;">
					</c:if>
					<c:if test="${showSearch eq false }">
					<div class="search-sec">
					</c:if>
					<form class="col-sm-12 form-horizontal customform" action="searchGisForcastingFile" method="POST" id="myform" autocomplete="off">
					
					<%----%>
					<div class="form-group">
                                 <div class="row">
                                 <label class="col-lg-2 ">Created Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" id="uploadstartdate" name="uploadstartdate" value="${startDate}" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                    
                                    
                                    
                                   <label class="col-lg-2 ">Created Date To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" id="uploadenddate" name="uploadenddate"  value="${endDate}" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                    
                                    
                                    
                                 </div>
                                 
                              </div>
                           <div class="form-group">
									<div class="row">
										<label class="col-lg-2 ">Rust Type</label>
										<div class="col-lg-3">

											<select class="form-control" id="rustTypeId"
												name="rustTypeId"  >
												<option value="0">--Select--</option>
												<c:forEach items="${rustList}" var="org">
													<option value="${org.rustId}">${org.typeOfRust}</option>
												</c:forEach>
											</select>
										</div>

										<label class="col-lg-2 ">Map Type</label>
										<div class="col-lg-3">
										<select class="form-control" id="mapTypeId" name="mapTypeId" >
												<option value="0">--Select--</option>
												<c:forEach items="${mapList}" var="rle">
													<option value="${rle.mapTypeId}">${rle.mapName}</option>
													
												</c:forEach>
											</select>  
										</div>
										
									</div>
								</div>   
					      <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Status</label>
                                      <div class="col-sm-3">
                                       <select class="form-control" id="statusId" name="status">
                                          <option value="0">Select</option>
                                          <option value="false">Active</option>
                                          <option value="true">Inactive</option>
                                          
                                       </select>
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
                                       
                                       <th>File Name</th>
                                       <th>Store Name</th>
                                       <th>Layer Name</th>
                                       <th>Rust Type</th>
                                       <th>Map Type</th>
                                       <th>Created On</th>
                                       <th>Status</th>
                                       
                                    </tr>
								</thead>
								 <tbody>
                                     <c:forEach items="${dataList}" var="vo" varStatus="myIndex">   
                                    <tr>
                                      <td><c:out value="${myIndex.index + 1 }"  /></td>
                                      <td>${vo.fileName}</td>
                                      <td>${vo.storeName}</td>
                                    <td>${vo.layerName}</td>
                                    <td>${vo.rustType}</td>
                                    <td>${vo.mapType}</td>
                                      <td>${vo.createdOn}</td> 
                                     <td>
           								<c:choose>
           								<c:when test="${vo.bitStatus == false}">Active</c:when>
           								<c:otherwise>Inactive</c:otherwise>
           								</c:choose>
           							</td>
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
	/* alert(date1);
	alert(date2); */
	var Difference_In_Time = date2.getTime() - date1.getTime(); 
	/* alert(Difference_In_Time); */
	// To calculate the no. of days between two dates 
	var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24); 

	/* alert(Difference_In_Days); */
	 if (Difference_In_Days > 15) {

		   $("#startDate").focus(); 
		   $("#endDate").focus(); 
			swal('Warning','Difference Between From Date and To Date Must Be Within 15 Days','warning') 
				
				return false; 
		   
		 }
	form.submit();	
	//$("#searchForm").submit();
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
 <script>
var status=${statusId};
$("#rustTypeId").val(${rustTypeId});
$("#mapTypeId").val(${mapTypeId});
$("#statusId").val(status.toString());

</script>

