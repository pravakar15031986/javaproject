<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
</style>

<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>View Advisory</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Recommendation</li>
						<li class="breadcrumb-item" aria-current="page">Advisory</li>
					</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link" href="addadvisory">Add</a>
							<a class="nav-item nav-link active" href="viewadvisory">View</a>
						</ul>
						<div class="indicatorslist">
						
						</div>
					</div>
					<!-- Search Panel -->
					
						<div class="search-container">
						<c:if test="${searchShow eq false }">
						<div class="search-sec">
						</c:if>
						<c:if test="${searchShow eq true}">
						<div class="search-sec" style="display:block;">
						</c:if>
						<form class="col-sm-12 form-horizontal customform" action="viewadvisorySearchApp" method="post" autocomplete="off">
								
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

								<div class="form-group">
									<div class="row">
										<label class="col-lg-2 ">Advisory Date From</label>
										<div class="input-group col-lg-3">
											<input type="text" id="advUpldDtFrom"
												name="startDate" value="${startDate}" class="form-control datepicker"
												aria-label="Default"
												aria-describedby="inputGroup-sizing-default" />
											<div class="input-group-append">
												<span class="input-group-text"
													id="inputGroup-sizing-default"><i
													class="icon-calendar1"></i></span>
											</div>
										</div>
										<label class="col-lg-2 ">Advisory Date To</label>
										<div class="input-group col-lg-3">
											<input type="text" id="advUpldDtTo" name="endDate" value="${endDate }"
												class="form-control datepicker" aria-label="Default"
												aria-describedby="inputGroup-sizing-default" />
											<div class="input-group-append">
												<span class="input-group-text"
													id="inputGroup-sizing-default"><i
													class="icon-calendar1"></i></span>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="row">
										<label class="col-lg-2 ">Advisory No.</label>
										<div class="col-lg-3">
											<input type="text" class="form-control" name="advisoryNo" value="${advisoryNo}"
												id="advisoryNo" onkeypress="return checkAdvNo(event);"
												maxlength="20" />
										</div>
										<div class="col-lg-2">
											<button class="btn btn-primary" onclick="validate()">
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
					</form>
					<!-- Search Panel -->
					<!--===================================================-->
					<div class="card-body">
						<div class="table-responsive">
							<table data-toggle="table"
								class="table table-hover table-bordered" id="myTable">
								<thead>
									<tr>
										<th width="40px">Sl#</th>
										<th>Advisory No.</th>
										<th>Advisory Uploaded On</th>
										<th class="text-center">Uploaded Advisory</th>
										<th>Remark</th>
										<th>Published On</th>
										 <th class="text-center">Action</th>
									</tr>
								</thead>
								<tbody>
									<%-- <c:forEach items="${advisory}" var="advisory"
										varStatus="counter">
										<tr>
											<td>${counter.count}</td>
											<td>${advisory.advisoryNo}</td>
											<td>${advisory.createdOn}</td>
											<td class="text-center">
													<a title="" href="wrsis/advisory/Wheat Rust Advisory 8 Sept 2018.pdf" download="${advisory.advFileName}" id="downloadIcon" data-toggle="tooltip" data-placement="top" data-original-title="Download"><i class="fa fa-file-pdf-o fa-2x" aria-hidden="true"></i></a>
												<a title="" href="javascript:void(0)" id="downloadIcon"
												data-toggle="tooltip" data-placement="top"
												data-original-title="Download"
												onclick="downloadFile(${advisory.advisoryId})"><i
													class="fa fa-file-pdf-o " aria-hidden="true"></i></a> <!-- fa-2x -->
											</td>
											<td>${advisory.advRemark}</td>
											<td>${advisory.publishDate}</td>
											<td class="text-center"><c:if
													test="${advisory.advStatus eq 0}">
													<div class="btn-group" role="group"
													aria-label="Basic example">
													<a class="btn btn-info btn-sm editClass"
														data-toggle="tooltip"
														onclick="editAdvisory(${advisory.advisoryId})" title=""
														id="btnModifyId${advisory.advisoryId}"
														data-original-title="Edit"><i class="icon-edit1"></i></a>
													<a class="btn btn-danger btn-sm deleteClass"
														data-toggle="tooltip"
														onclick="deleteAdvisory(${advisory.advisoryId})" title=""
														id="btnDeleteId${advisory.advisoryId}"
														data-original-title="Delete"><i class="icon-trash-21"></i></a>
													<a class="btn btn-primary btn-sm publish" data-toggle="tooltip" title="" id="publish${advisory.advisoryId}"	onclick="publishAdvisory(${advisory.advisoryId})" data-original-title="Publish">Publish</a>
												</div>
											</c:if></td> --%>
											<%-- <td>
                                    <c:if test="${advisory.advStatus eq 0}">
                                    <a class="btn btn-primary btn-sm publish" data-toggle="tooltip" title="" id="publish${advisory.advisoryId}" onclick="publishAdvisory(${advisory.advisoryId})" data-original-title="">Publish</a>
                                    </c:if>
                                    </td>
										</tr>
									</c:forEach> --%>
								</tbody>
							</table>
						</div>
						
					</div>
					<!--===================================================-->
				</div>
				<form action="advisory-file-download" id="downloadForm"
					method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

					
					<input type="hidden" name="downId" id="downId">
				</form>
				<form action="editadvisory" method="post" id="editForm">
					
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

					<input type="hidden" name="advisoryId" id="editadvId">
				</form>
				<form action="deleteAdvisory" method="post" id="deleteForm">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

				
					<input type="hidden" name="advisoryId" id="deleteadvId">
				</form>
				<form action="publishAdvisory" method="post" id="publishForm">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

				
					<input type="hidden" name="advisoryId" id="publishadvId">
				</form>
			</div>
		</div>
	</div>
</div>





<script>
 function downloadFile(id)
 {	
	
	
 	$.ajax({
 		type:"GET",
 		url:"advisory-file-exists",
 		data:{
 				"downId":id
 		},
 		success:function(response){
			//alert(response);
 			var res=JSON.parse(response);
 			if(res.msg == 'Yes')
 			{	
 				$("#downId").val(id);
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
     	function editAdvisory(id)
     	{
     		$('#editadvId').val(id);
     		$('#editForm').submit();
     	}
     </script>
<script>
     	function deleteAdvisory(id)
     	{
     		$('#deleteadvId').val(id);
     		swal({
        		title: ' Do you want to delete?',
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
     </script>
<script>
     	function publishAdvisory(id)
     	{
     		$('#publishadvId').val(id);
     		swal({
        		title: ' Do you want to publish?',
        		  type: 'warning',
        		  showCancelButton: true,
        		  confirmButtonText: 'Yes',
        		  cancelButtonText: 'No',
    	    }).then((result) => {
    	    	  if (result.value) {
    	    		  $('#publishForm').submit();
    	    		  }
    	    		})
     	}
     </script>
<script>
function validate(){
	event.preventDefault();
	var form = event.target.form;
	var advNo=$("#advisoryNo").val();
	var fromDate=$("#advUpldDtFrom").val();
	var toDate=$("#advUpldDtTo").val();
	if(/^[a-zA-Z0-9]*$/.test(advNo) == false)
  	{
  		swal("Error", "Advisory No. accept alphabets and numbers ", "error").then(function() {
				   $("advisoryNo").focus();
			});
			return false;
  	}
	if(Date.parse(fromDate)>Date.parse(toDate))
	{
		swal(
				'Error',
				'Advisory Uploaded Date From should be less than Advisory Uploaded Date To',
				'error'
				)
   		 	   		return false; 
	}
	if(fromDate != "" && toDate == "")
    {
		swal("Error", "Advisory Date To should not be blank  ", "error").then(function() {
			   $("advUpldDtTo").focus();
		});
		return false;
    }
	if(fromDate == "" && toDate != "")
    {
		swal("Error", "Advisory Date From should not be blank  ", "error").then(function() {
			   $("advUpldDtFrom").focus();
		});
		return false;
    }
	  form.submit();
}
</script>

<c:if test="${not empty msg}">

	<script>
	$(document).ready(function(){   
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	});
</script>
</c:if>
<c:if test="${not empty errMsg}">
	<script>
	$(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>



<script>
$(function() {
	

	$('#myTable').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "viewAdvisoryPageWiseApp",
					"data" : function(d) {
						d.startDate =$("#advUpldDtFrom").val();
						d.endDate = $("#advUpldDtTo").val();
						d.advisoryNo = $("#advisoryNo").val();
					}
			},
			"dataSrc": "",
			"columns":[
				{"data":"sNo"},
				{"data":"advisoryNo"},
				{"data":"createdOn"},
				{"data":"advFileName"},
				{"data":"advRemark"},
				{"data":"publishDate"},
				{"data":"action"}
			]
	
  
	});
	});	
	
</script>
<script>
function checkAdvNo(e){
var regex = new RegExp("^[a-zA-Z0-9]");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
var code = (e.keyCode ? e.keyCode : e.which);
if (regex.test(str) || code==8) {
   return true;
}
$("#advisoryNo").focus();
return false;
}
</script>
<script>
$(function(){

	   $( "#advisoryNo" ).bind( 'paste',function()
	   {
	       setTimeout(function()
	       { 
	          //get the value of the input text
	          var data= $( '#advisoryNo' ).val() ;
	          //replace the special characters to '' 
	          var dataFull = data.replace(/[^\w\s]/gi, '');
	          //set the new value of the input text without special characters
	          $( '#advisoryNo' ).val(dataFull);
	       });

	    });
	});
</script>
