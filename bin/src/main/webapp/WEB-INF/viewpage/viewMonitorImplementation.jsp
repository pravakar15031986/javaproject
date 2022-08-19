<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<style>
.fa-file-pdf-o
{color:red;}
</style>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Implementation Details</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Monitor Implementation</li>
                           <li class="breadcrumb-item" aria-current="page">Publish Implementation Details</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                                <a class="nav-item nav-link active" href="viewMonitorImplementation">New</a>
                                <a class="nav-item nav-link" href="publishedMonitorData">Published</a>
                                <a class="nav-item nav-link" href="discardedMonitorData">Discarded</a>
                           </ul>
                           <div class="indicatorslist">
                              
                           </div> 
                        </div>
                        <!-- Search Panel -->
                         <div class="search-container">
                          <c:if test="${showSearch eq true }">
					<div class="search-sec" style="display: block;">
					</c:if>
					<c:if test="${showSearch eq false }">
					<div class="search-sec">
					</c:if>
                           <form:form action="viewMonitorImplementationSearch" method="post" modelAttribute="searchVo">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                           
                              <div class="form-group">
                                    <div class="row">
                                    <label class="col-lg-2 ">Recommendation From Date </label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" class="form-control datepicker"  data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default" path="recDtFrom" id="startDate" autocomplete="off"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <label class="col-lg-2 ">Recommendation To Date </label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" class="form-control datepicker" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default" path="recDtTo" id="endDate" value="${eDate}" autocomplete="off"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                    
                                    
                                   </div>
                                  </div>
                                  <div class="form-group">
                              <div class="row">
                              <label class="col-lg-2 ">Recommendation No.</label>
                                    <div class="col-lg-3">
                                       <form:input type="text" class="form-control" placeholder="" data-bv-field="fullName" id="recoMendNo" path="recNo" value="${recoMendNo}"/>
                                    </div>
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary" id="searchId"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                    </div>
                               </div> 
                               </form:form>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Search"> <i class="icon-angle-arrow-down"></i> </a></div>
                        </div> 
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                                 <thead>
                                    <tr>
                                       <th width="40px" >Sl#</th>
                                       <th>Recommendation No.</th>
                                       <th>Recommendation Date</th>
                                       <th  class="text-center">Recommendation Document</th>
									   <th>Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                <%--  <c:forEach items="${moniterRecoList}" var="recomm" varStatus="count">
                                 <tr>
                                 	<td>${count.count}</td> 
                                 	<td>${recomm.recommendBeanNumber}</td>
                                 	<td>
                                 		<fmt:formatDate pattern="dd-MMM-yyyy" value="${recomm.recommendBeandate}" />
                                 	
                                 	</td>
                                 	<td class="text-center">
                                 
                                 		<a href='javascript:void(0)' onclick="recommendFileDownload(${recomm.recommendBeanId})" ><center><i class="fa fa-file-pdf-o fa-1x" aria-hidden="true"></i></center></a> 
                                 	</td>
                                 	<td class="text-center">
                                 		<a class="btn btn-info btn-sm"  title="" data-original-title="View Details" href='javascript:void(0)' onclick="viewPublishedMoniter('${recomm.recommendBeanNumber}')"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                 		<a class="btn btn-primary btn-sm publish" href='javascript:void(0)' onclick="publishedMoniter('${recomm.recommendBeanNumber}')">Publish</a> 
                                 		
                                 	</td>
                                 	
                                 </tr>
                                 </c:forEach> --%>
                                 </tbody>
                              </table>
                           </div>
                           
                        </div>
                        <!--===================================================-->
                         <form action="recommend-file-download" id="recommendFileForm"  method="POST">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                         
							<input type="hidden" name="fileId"  id="fileNameId">
 						</form>
 						 <form action="monitorRecommendationPublished" id="recommendMoniterPublishForm"  method="POST">
							
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

							<input type="hidden" name="rcId"  id="rcId">
 						</form>
 						<form action="monitorRecommendationPublishedView" id="recommendMoniterPublishViewForm"  method="POST">
							
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

							<input type="hidden" name="rcId"  id="rcIdview">
 						</form>
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
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "viewMonotorImpPageWise",
					"data" : function(d) {
						d.startDate =$("#startDate").val();
						d.endDate =$("#endDate").val();
						d.recoMendNo =$("#recoMendNo").val();
					}
			},
			"dataSrc": "",
			"columns":[
				{"data":"sNo"},
				{"data":"recommendBeanNumber"}, 
				{"data":"viewRCDate"},
				{"data":"recommendBeanFileName"}, 
				{"data":"actionLisnk"}
				
			]
         	
	});
	});
</script>
 <!-- Download File -->
 <script>
 function recommendFileDownload(id)
 {	
 	$.ajax({
 		type:"GET",
 		url:"recommend-file-exist",
 		data:{
 				"fileId":id
 		},
 		success:function(response){

 			var res=JSON.parse(response);
 			if(res.msg == 'Yes')
 			{	
 				$("#fileNameId").val(id);
 				$("#recommendFileForm").submit();
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
  <!-- Download File End-->
 <script>
$(document).ready(function (){
	
	$("#searchId").click(function(){

		var fromDate=$("#startDate").val();
		var toDate=$("#endDate").val();
		if(fromDate!= '')
		{
			if(toDate =='')
			{
				 swal(
		 	   				'Error', 
		 	   				'Please enter the Recommendation To Date',
		 	   				'error'
		 	   			).then(function() {
							   $("#toDate").focus();
						   });
		    		return false; 
				
			}
				var eDate = new Date(toDate);
			 	 var sDate = new Date(fromDate);
			  if(fromDate!= '' && fromDate!= '' && sDate> eDate)
			    {
			 	 swal(
		 	   				'Error', 
		 	   				'Please ensure that the Recommendation  To Date is greater than or equal to the Recommendation From Date',
		 	   				'error'
		 	   			).then(function() {
							   $("#toDate").focus();
						   });
		    		return false;
			    }
			    
		}
		if(toDate !='')
		{
			if(fromDate == '')
			{
			 swal(
	 	   				'Error', 
	 	   				'Please enter the Recommendation From Date',
	 	   				'error'
	 	   			).then(function() {
						   $("#toDate").focus();
					   });
	    		return false; 
			}
		}
		form.submit();
		});
});
 </script> 
 <script>
 
function publishedMoniter(id)
{
	
	$("#rcId").val(id);
	$("#recommendMoniterPublishForm").submit();
	
}
function viewPublishedMoniter(id)
{
	$("#rcIdview").val(id);
	$("#recommendMoniterPublishViewForm").submit();
}
 </script> 
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
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>