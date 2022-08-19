<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<style>
.fa-file-pdf-o
{color:red;}
</style>
<!-- adding style for modal popup -->
<style>
.modal-dialog{
     
    overflow-y: auto;    
    
    
    min-width: 300px;  
}
</style>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Recommendation</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Recommendation</li>
                           <li class="breadcrumb-item" aria-current="page">Prepare Recommendation</li>
                        </ol>
                     </nav>
                  </div>
                  
                  <script>
                  $(document).ready(function(){
                	  var text='${recommendTypeId}'
                	  if(text==1)
                		  {
                		  	$("#recomType").val(text);
                		 	 $("#recomType").prop("checked", true);
                		  }else if(text==2)
                		  {
                  		  	$("#recomType").val(text);
                  		 	 $("#recomType").prop("checked", true);
                  		  }else
                		  {
                  		  	$("#recomType").val(text);
                  		 	 $("#recomType").prop("checked", true);
                  		  }
                		  });
                  </script>
                  
      
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                                <a class="nav-item nav-link"  href="recommendation">View Advisory</a>
                                <a class="nav-item nav-link active"  href="viewrecommendation">View Recommendation</a>
                           </ul>
                           <div class="indicatorslist">
                              </div> 
                        </div>
                        <!-- Search Panel -->
                         <div class="search-container">
                          <c:if test="${searchShow eq false}"> 
                         <div class="search-sec">
                         </c:if>
                         <c:if test="${searchShow eq true }">
                         <div class="search-sec" style="display:block;">
                         </c:if>
                         
                         <div class="form-group"> 
                      			 <div class="row">
									<label class="col-lg-2 ">Recommendation Type</label>
									<div class="col-lg-3">
										<select class="form-control" id="recomType" name="recomType">
											<option value="0">--Select--</option>
											<option value="1">General</option>
											<option value="2">Region Specific</option>
										</select>
									</div>
									
								
                              <label class="col-lg-2 ">Recommendation No.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" id="recoMendNo" placeholder="" data-bv-field="fullName" value="${recoMendNo}" onkeypress="return checkRecNo(event);" maxlength="10">
                                    </div>
                                    
                                    </div>
                                </div>
                         
                              <div class="form-group">
                                    <div class="row">
                                    <label class="col-lg-2 ">Recommendation Created On From</label>
                                    <div class="input-group col-lg-3">
                                        <input type="text" class="form-control datepicker" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default"  name="startDate" id="startDate" value="${sDate}" autocomplete="off">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <label class="col-lg-2 ">Recommendation Created On To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default"  name="endDate" id="endDate" value="${eDate}" autocomplete="off">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary" id="searchId"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                    
                                   </div>
                                  </div>
                            <div class="form-group" style="display:none">
                                 <div class="row">
                                    <label class="col-lg-2 ">Region Name</label>
                                    <div class="col-lg-3">
                                    
                                      <select  class="form-control" id="regionId" name="regionId"  onchange="findZoneByRegionId(3,this.value);"  tabindex="2">
                                   <option value="">--Select--</option>
                                   <c:forEach items="${regionList}" var="region"> 
                                   	<c:choose>
											<c:when test="${region.demographyId eq regionId}">
												<option value="${region.demographyId}" selected="selected">${region.demographyName}</option>
											</c:when>
											<c:otherwise>
												<option value="${region.demographyId}">${region.demographyName}</option>
											</c:otherwise>
									   </c:choose>
                                   </c:forEach>
                                    </select>
                                      
                                    </div>
                                    <label class="col-lg-2 ">Zone Name</label>
                                    <div class="col-lg-3">
                                        <select class="form-control" name="zoneId" id="zoneId" onchange=" findWoredaByZoneId(4,this.value);">
                                   <option value="">--Select--</option>
                                    </select>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group" style="display:none">
                              <div class="row">
                               <label class="col-lg-2 ">Woreda Name</label>
                                    <div class="col-lg-3">
                                        <select class="form-control" name="woredaId" id="woredaId" onchange="searchKebele(5,this.value);">
                                      <option value="">--Select--</option>
                                      </select>
                                    </div>
                               <label class="col-lg-2 ">Kebele Name</label>
                                    <div class="col-lg-3">
                                       <select class="form-control" name="kebeleId" id="kebeleId">
                                         	<option value="">--Select--</option>
                                       </select>
                                    </div>
                                    
                                    
                                     
                                    
                              </div>
                              </div>
                      			  
                                
                                
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div> 
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable" style="width: 1550px !important;">
                                 <thead>
                                    <tr>
                                       <th>Sl#</th>
                                       <th>Recom No.</th>
                                       <th>Recom<br> Created On</th>
                                       <th>Advisory No.</th>
                                      <th>Advisory Date</th>
                                       <th>Type of Recom</th>
                                       <th>Uploaded <br>Recom</th>
                                       <th>Published<br> On</th>
                                       <th>Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                  <%-- <c:forEach items="${recoList}" var="recommend" varStatus="count">
                                  	<tr>
                                  		<td>${count.count}</td>
                                  		<td>${recommend.recomendNoBean}</td>
                                  		<td>
                                 		<fmt:formatDate pattern="dd-MMM-yyyy" value="${recommend.createdOnBean}" />
                                 		</td>
                                 		<td>${recommend.advisoryNoBean}</td>
                                 		<td>
                                 			<fmt:formatDate pattern="dd-MMM-yyyy" value="${recommend.advisoryDateBean}" />
                                 		</td>
                                 		<c:if test="${recommend.recomendTypeBean eq 1}">
                                 		<td>General</td>
                                 		</c:if>
                                 		<c:if test="${recommend.recomendTypeBean eq 2}">
                                 		<td>Region Specific <a title="" data-placement="top" data-toggle="modal"
														data-target="#locationModal" onclick="viewLocation(${recommend.recomendId})"><i class="fa fa-info-circle"
														aria-hidden="true" style="color: #83a750"></i></a></td>
                                 		</c:if>
                                 		
                                       <td>
                                       
                                       <c:set var="fname" value="${recommend.recFileName}"/>   
                                        <c:choose>
                                        	<c:when test="${fn:endsWith(fname, '.pdf')==true}">
                                        		<a href='javascript:void(0)' onclick="recommendFileDownload(${recommend.recomendId})" ><center><i class="fa fa-file-pdf-o fa-1x" aria-hidden="true"></i></center></a>
                                        	</c:when>
                                        	<c:when test="${fn:endsWith(fname, '.doc')==true}">
                                        		<br><a href='javascript:void(0)' onclick="recommendFileDownload(${recommend.recomendId})" ><center><i class="fa  fa-file-word-o fa-1x" aria-hidden="true"></i></center></a>
                                        	</c:when>
                                        	<c:when test="${fn:endsWith(fname, '.docx')==true}">
                                        		<br><a href='javascript:void(0)' onclick="recommendFileDownload(${recommend.recomendId})" ><center><i class="fa fa-file-word-o fa-1x" aria-hidden="true"></i></center></a>
                                        	</c:when>
                                        </c:choose>
                                       
                                       
                                 			
                                 			
                                 		</td>
                                 		<td>
                                 			<fmt:formatDate pattern="dd-MMM-yyyy" value="${recommend.publishedDateBean}" />
                                 		</td>
                                 		 <td>
                                 		 	<c:if test="${recommend.recomendStatusBean eq 0}">
                                 		 		<a class="btn btn-info btn-sm editClass" data-toggle="tooltip" title="" id="btnModifyId" data-original-title="Edit" onclick="editRecommend(${recommend.recomendId})"><i class="icon-edit1"></i></a>
                                           		<a class="btn btn-danger btn-sm deleteClass" data-toggle="tooltip" title="" id="btnDeleteId" data-original-title="Delete" onclick="deleteRecommend(${recommend.recomendId})"><i class="icon-trash-21"></i></a>
                                           		<a class="btn btn-primary btn-sm publish" data-toggle="tooltip" title="" id="" data-original-title="" onclick="publishRecommend(${recommend.recomendId})"><i class="fa fa-volume-up" aria-hidden="true"></i></a>
                                           </c:if>
                                       </td>
                                  	</tr>
                                  </c:forEach> --%>
                                   
                                   
                                   
                                 </tbody>
                              </table>
                           </div>
                        </div>
                        
                        <!-- Modal -->
<div class="modal fade" id="locationModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Location Details</h4>
			</div>

			<div class="modal-body">

				<table data-toggle="table" class="table table-hover table-bordered">
					<thead id="loctblHd">

					</thead>
					<tbody id="loctblBdy">

					</tbody>
				</table>
				<p id="locMsg"></p>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>
<!--  -->




 <!-- Modal For recommendation summary -->
<div class="modal fade" id="recommendationModal"  role="dialog">
	<div class="modal-dialog modal-dialog-scrollable">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Recommendation Details</h4>
			</div>

			<div class="modal-body">

				<table data-toggle="table" class="table table-hover table-bordered">
					<thead id="rectblHd"> </thead>
					<tbody id="rectblBdy">

					</tbody>
				</table>
				<p id="recMsg"></p>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>
<!--end of modal  -->





                        <!--===================================================-->
                     </div>
                      <form action="recommend-file-download" id="recommendFileForm"  method="POST">
						
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="hidden" name="fileId"  id="fileNameId">
 					</form>
 					<form action="recommend-search-download" id="recommendSearchForm"  method="POST">
						
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="hidden" name="startDateId"  id="startDateId">
						<input type="hidden" name="endDateId"  id="endDateId">
						<input type="hidden" name="regionIdSer"  id="regionIdSer">
						<input type="hidden" name="zoneIdSer"  id="zoneIdSer">
						<input type="hidden" name="woredaIdSer"  id="woredaIdSer">
						<input type="hidden" name="kebeleIdSer"  id="kebeleIdSer">
						<input type="hidden" name="recoMendNoSer"  id="recoMendNoSer">
						<input type="hidden" name="recomType"  id="recomTypeSer">
						
 					</form>
 					 <form action="editRecommendation" id="editForm"  method="POST">
						
						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="hidden" name="recomendId"  id="recomendEditId">
 					</form>
 					<form action="deleteRecommend" id="deleteForm"  method="POST">
						
						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="hidden" name="recommendId"  id="recomendDeleteId">
 					</form>
                  </div>
               </div>
            </div>
         </div>
        
<script>
function publishRecommend(recommendId)
{
	
	
	swal({
			
			title: "Do you want to publish?", 
			type: "warning",
 		  cancelButtonText: 'No',
			confirmButtonText: "Yes",
			showCancelButton: true
	    }).then((result) => {
				if (result.value) 
	  			{ 
					
			$.ajax({
				type:"POST",
				url:"publishRecommend",
				data:{
						"recommendId":recommendId
				},
			success:function(response)
			{	
				
				var val=JSON.parse(response);
				
				if(val.msg=='yes')
					{
					swal({
		                title: "Published successfully.",
		                text: "",
		                type: "success"
		            }).then(function() {
		            location.reload();
		            });
					}
				else
					{
				swal("Error", "Try Again ", "error");
					} 
			},error : function(error) {
				 
			}
		
		});
	  			 }
		});

}
 </script>
 <!-- recommendation summary in href popup -->

<script>
function viewRecommendation(id)
{
	
	
	 $('#rectblHd').empty();
	$('#rectblBdy').empty();
	$('#recMsg').empty();  
	$.ajax({
		type : "POST",
		url : "getRecSummaryDetails", 
	 
		data : {
			"recId":id
		},
		success : function(response) {
			var val=JSON.parse(response)
			
			if(val.length == 0 ){
				$('#rectblBdy').html('No data available');
			}else{
				
		     
			    var htmlBody ="";
			    var type=val.recomendTypeBean;
			    var sms=val.requiredSms;
			    
			 
				htmlBody +='<tr><td colspan="2">Recommendation No.</td><td colspan="2">'+val.recomendNoBean+'</td></tr>' ;
				htmlBody +='<tr><td colspan="2">Recommendation Date</td><td colspan="2">'+val.recDate+'</td></tr>' ;
				htmlBody +='<tr><td colspan="2">Advisory No.</td><td colspan="2">'+val.advisoryNoBean+'</td></tr>' ;
				htmlBody +='<tr><td colspan="2">Advisory Date</td><td colspan="2">'+val.viewAdvisoryDate+'</td></tr>' ;
				htmlBody +='<tr><td colspan="2">Recommendation Summary </td><td colspan="2">'+val.recomendSummaryBean+'</td></tr>';
				if(sms==true){
				htmlBody +='<tr><td colspan="2">SMS Content </td><td colspan="2">'+  val.smsContent  +'</td></tr>';
				}
				htmlBody +='<tr><td colspan="2">Recommendation Type</td><td colspan="2">'+( val.recomendTypeBean==1 ? 'General' : 'Region Specific') +'</td></tr>';
				var demodetails=JSON.parse(val.demographyDetails);
				if(type==2)
					{
						htmlBody += '<tr><th>Region</th><th>Zone</th><th>Woreda</th><th>Kebele</th></tr>';
						$.each(demodetails,function(i, item) 
						{
							htmlBody += '<tr><td>' + item.region + '</td><td>' + item.zone + '</td><td>' + item.woreda +'</td><td>' + item.kebele + '</td></tr>';
						});
					}	
				$('#rectblBdy').append(htmlBody);
			}  
		},error : function(error) {
			 console.log(error)
		}
	}); 
}
</script>  
<!-- recommendation summary in href popup (end) -->
 <script>
function viewLocation(id)
{
	//alert(id);
	$('#loctblHd').empty();
	$('#loctblBdy').empty();
	$('#locMsg').empty(); 
	 $.ajax({
		type : "POST",
		url : "getRecLocDetails", 
	 
		data : {
			"recId":id
		},
		success : function(response) {
			
			var val=JSON.parse(response);
		    if(val.length == 0 ){
				$('#locMsg').html('No data available');
			}else{
			    var htmlBody ="";
			    var htmlHead ='<tr><th>Region</th><th>Zone</th><th>Woreda</th><th>Kebele</th></tr>';
				$.each(val,function(i, item) {
					htmlBody += '<tr><td>' + item.region + '</td><td>' + item.zone + '</td><td>' + item.woreda +'</td><td>' + item.kebele + '</td></tr>';
					
				});
				$('#loctblHd').append(htmlHead);
				$('#loctblBdy').append(htmlBody);
			}
			
		},error : function(error) {
			 
		}
	});  
}
</script>     
 <script>
 function deleteRecommend(id)
	{
		$('#recomendDeleteId').val(id);
		swal({
 		title: ' Do you want to delete ?',
 		  type: 'warning',
 		  showCancelButton: true,
 		  confirmButtonText: 'Yes',
 		  cancelButtonText: 'No',
	    }).then((result) => {
	    	  if (result.value) {
	    		  //form.submit();
	    		  $('#deleteForm').submit();
	    		  }
	    		})
	}







 
function deleteRecommend178(recommendId)
{
	swal({
		
		title: "Do you want to delete?", 
		type: "warning",
		  cancelButtonText: 'No',
		confirmButtonText: "Yes",
		showCancelButton: true
    }).then((result) => {
			if (result.value) 
  			{ 
				
		$.ajax({
			type:"POST",
			url:"deleteRecommend",
			data:{
					"recommendId":recommendId
			},
		success:function(response)
		{	
			//alert(response);
			var val=JSON.parse(response);
			//alert(val);
			if(val.msg=='yes')
				{
		
			swal({
                title: "Deleted successfully.",
                text: "",
                type: "success"
            }).then(function() {
            location.reload();
            });
				}
			else
				{
			swal("Error", "Try Again ", "error");
				} 
			
		},error : function(error) {
			 
		}
	
	});
  			 }
	});
}
 </script>     
<script>
function editRecommend(id)
{
	
	$("#recomendEditId").val(id);
	$("#editForm").submit();
	
}
</script>	
<script>
$(function() {
$('#viewTable').dataTable({
				
'processing' : true,
'serverSide' : true,
"searching": false,
"ordering": false, 
"ajax" : {
	"url" : "viewallrecommendationPage",
	"data" : function(d) {
		d.recomType= $("#recomType").val();
		d.recoMendNo = $("#recoMendNo").val();
		d.startDate =$("#startDate").val();
		d.endDate = $("#endDate").val();
		}
	},
	"dataSrc": "",
	"columns":[
	{"data":"sNo"},
	{"data":"recomendNoBean"},
	{"data":"recDate"},
	{"data":"advisoryNoBean"},
	{"data":"viewAdvisoryDate"},
	{"data":"recomendViewTypeBean"},
	{"data":"recFileName"},
	{"data":"publishedRecDate"},
	{"data":"editLink"} 
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
 <script>
	$(document).ready(function(){
	
		$("#searchId").click(function(){
			//alert("In Search");
			var fromDate=$("#startDate").val();
				
			var toDate=$("#endDate").val();
			
			//var seasonId=$("#seasonId").val();
			
			if(fromDate!= '')
			{
				if(toDate =='')
				{
					 swal(
			 	   				'Error', 
			 	   				'Please enter Recommendation Created On To !',
			 	   				'error' 
			 	   			).then(function() {
								   $("#endDate").focus();
							   });
			    		return false; 
					
				}
					var eDate = new Date(toDate);
				 	 var sDate = new Date(fromDate);
				  if(fromDate!= '' && fromDate!= '' && sDate> eDate)
				    {
				 	 swal(
			 	   				'Error',  
			 	   				'Recommendation Created On From should be less than  Recommendation Created On To',
			 	   				'error'
			 	   			).then(function() {
								   $("#endDate").focus();
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
		 	   				'Please enter Recommendation Created On From !',
		 	   				'error'
		 	   			).then(function() {
							   $("#startDate").focus();
						   });
		    		return false; 
				}
			}
			
			
				$("#startDateId").val(fromDate);
				$("#endDateId").val(toDate);
				$("#recoMendNoSer").val($("#recoMendNo").val());
				$("#regionIdSer").val($("#regionId").val());
				$("#zoneIdSer").val($("#zoneId").val());
				$("#woredaIdSer").val($("#woredaId").val());
				$("#kebeleIdSer").val($("#kebeleId").val());
				$("#recomTypeSer").val($("#recomType").val());
				
				$("#recommendSearchForm").submit();		
			});
		});
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
<script>
function findZoneByRegionId(levelId,parentId)
{
	$('#WoredaFirstZoneId').empty();
	
	$.ajax({
		type : "GET",
		url : "find-zone-by-region-id", 
		async:false,
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			
			var html = "<option value=''>---Select---</option>";
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				$.each(val,function(index, value) {						
					html=html+"<option value="+value.zoneId+" >"+value.zoneName+"</option>";
				});
			}
			$('#zoneId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});
}


function findWoredaByZoneId(levelId,parentId)
{

	$.ajax({
		type : "GET",
		url : "find-woreda-by-zone-id", 
		async:false,
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			var html = "<option value='0'>---Select---</option>";
			
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				$.each(val,function(index, value) {						
					html=html+"<option value="+value.woridaId+" >"+value.woridaName+"</option>";
				});
			}
			$('#woredaId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});
}


function searchKebele(levelId,woredaId)
{
	
   
     $.ajax({
		type : "GET",
		 url : "find-multiple-kebele-by-woreda-id", 
		 async:false,
		   data : {
			"levelId":levelId,
			"woredaId":woredaId
			
		},
		success : function(response) {
			var html = " ";
			var val=JSON.parse(response);
			var html = "<option value='0'>---Select---</option>";
			if (val != "" || val != null) {
				$.each(val,function(index, value) {			

					html=html+"<option value="+value.kebeleId+" >"+value.kebeleName+"</option>";
				});
			}
			$('#kebeleId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});

	
} 
</script>
<script>
function checkRecNo(e){
var regex = new RegExp("^[a-zA-Z0-9]");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
var code = (e.keyCode ? e.keyCode : e.which);
if (regex.test(str) || code==8) {
   return true;
}
$("#recoMendNo").focus();
return false;
}
</script>
<script>
$(function(){

	   $( "#recoMendNo" ).bind( 'paste',function()
	   {
	       setTimeout(function()
	       { 
	          //get the value of the input text
	          var data= $( '#recoMendNo' ).val() ;
	          //replace the special characters to '' 
	          var dataFull = data.replace(/[^\w\s]/gi, '');
	          //set the new value of the input text without special characters
	          $( '#recoMendNo' ).val(dataFull);
	       });

	    });
	});
</script>		
<script>

var regionId = '${regionId}' ;
if(regionId != '' && regionId != undefined && regionId != null && regionId !='0')
{
	
		$("#regionId").val('${regionId}');
		$("#regionId").change();
		 var zoneId='${zoneId}';
		if(zoneId != null && zoneId != undefined && zoneId != '')
		{
			$("#zoneId").val(zoneId);
			$("#zoneId").change();
			var woredaId='${woredaId}';
			if(woredaId != null && woredaId != undefined && woredaId != '')
			{
				$("#woredaId").val(woredaId);
				$("#woredaId").change();
				var kebeleId='${kebeleId}';
				if(kebeleId != null && kebeleId != undefined && kebeleId != '')
				{
					$("#kebeleId").val(kebeleId);
					$("#kebeleId").change();
				}
			}
		} 
		
		
}

</script>	











