<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<h4>MoA Recommendation</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Recommendation</li>
						<li class="breadcrumb-item" aria-current="page">View Recommendation</li>
					</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="woredaExpertRecommendation">View</a>
							</ul>
						<div class="indicatorslist">
							<c:if test="${fn:length(recommendation) gt 0}">
                              <a class="btn btn-primary" data-placement="top" data-toggle="modal" data-target="#myModal" onclick="return fungicideInfo();">Fungicide Details</a>
                              </c:if> 
						</div>
					</div>

					<!-- Search Panel -->
					<form:form class="col-sm-12 form-horizontal customform"
						action="woredaExpertRecommendation" method="post"
						modelAttribute="searchVo" autocomplete="off">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						
						<div class="search-container">
							<div class="search-sec">
								<div class="form-group">
									<div class="row">
										<label class="col-lg-2 ">Recommendation Date From</label>
										<div class="input-group col-lg-3">
											<form:input type="text" id="recDtFrom" path="recDtFrom"
												class="form-control datepicker" aria-label="Default"
												aria-describedby="inputGroup-sizing-default" />
											<div class="input-group-append">
												<span class="input-group-text"
													id="inputGroup-sizing-default"><i
													class="icon-calendar1"></i></span>
											</div>
										</div>
										<label class="col-lg-2 ">Recommendation Date To</label>
										<div class="input-group col-lg-3">
											<form:input type="text" id="recDtTo" path="recDtTo"
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
										<label class="col-lg-2 ">Recommendation No.</label>
										<div class="col-lg-3">
											<form:input type="text" class="form-control" path="recNo"
												id="recNo" onkeypress="return checkRecNo(event);"
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
										<th>Recommendation no.</th>
										<th>Recommendation Date</th>
										<th class="text-center">Recommendation Document</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${recommendation}" var="rec"
										varStatus="counter">
										<tr>
											<td>${counter.count}</td>
											<td>${rec.recomendNoBean}</td>
											<td>${rec.recDate}</td>
											<td class="text-center"><a title=""
												href="javascript:void(0)" id="downloadIcon"
												data-toggle="tooltip" data-placement="top"
												data-original-title="Download"
												onclick="downloadFile(${rec.recomendId})"><i
													class="fa fa-file-pdf-o " aria-hidden="true"></i></a> <!-- fa-2x --></td>
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
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Fungicide Details</h4>
        </div>
        
        <div class="modal-body">
        		
         		<table data-toggle="table" class="table table-hover table-bordered">
                                 <thead id="tblHd">
                                    
                                 </thead>
                                 <tbody id="tblBdy">
                                   
                                 </tbody>
                              </table>
                              <p id="modalMsg"></p>
                          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<form action="recommendation-file-download" id="downloadForm"
	method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

	
	<input type="hidden" name="downId" id="downId">
</form>

<script>
 function downloadFile(id)
 {	
	
 	$.ajax({
 		type:"GET",
 		url:"recommendation-file-exists",
 		data:{
 				"downId":id
 		},
 		success:function(response){
			
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

<script>
function validate(){
	event.preventDefault();
	var form = event.target.form;
	var recNo=$("#advisoryNo").val();
	var fromDate=$("#recDtFrom").val();
	var toDate=$("#recDtTo").val();
	if(/^[a-zA-Z0-9]*$/.test(recNo) == false)
  	{
  		swal("Error", "Recommendation No. accept alphabets and numbers ", "error").then(function() {
				   $("advisoryNo").focus();
			});
			return false;
  	}
  	
	if(Date.parse(fromDate)>Date.parse(toDate))
	{
		swal(
				'Error',
				'Recommendation Date From should be less than Recommendation Date To',
				'error').then(function(){
					$("#recDtTo").focus();
				});
   		 	   		return false; 
	}
	if(fromDate!="" && toDate=="")
	{
		swal("Error","Please select Recommendation Date To","error").then(function(){
			$("#recDtTo").focus();
		});
		return false;
	}
	if(fromDate=="" && toDate!="")
	{
		swal("Error","Please select Recommendation Date From","error").then(function(){
			$("#recDtFrom").focus();
		});
		return false;
	}
    
	  form.submit();
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
return false;
}
</script>	
<script>
$(function(){

	   $( "#recNo" ).bind( 'paste',function()
	   {
	       setTimeout(function()
	       { 
	          //get the value of the input text
	          var data= $( '#recNo' ).val() ;
	          //replace the special characters to '' 
	          var dataFull = data.replace(/[^\w\s]/gi, '');
	          //set the new value of the input text without special characters
	          $( '#recNo' ).val(dataFull);
	       });

	    });
	});
</script>
<script>
function fungicideInfo()
{
	
	$('#tblHd').empty();
	$('#tblBdy').empty();
	$('#modalMsg').empty();
	 $.ajax({
		type : "POST",
		url : "getFungicideDetails", 
	 
		success : function(response) {
			
			var val=JSON.parse(response);
		    if(val.length == 0 ){
				$('#modalMsg').html('No data available');
			}else{
			    var htmlBody ="";
			    var htmlHead ='<tr><th width="40px">Sl#</th><th>Fungicide</th><th>Quantity kg/ha</th></tr>';
				$.each(val,function(i, item) {
					htmlBody += '<tr><td>' + parseInt(i+1) + '</td><td>' + item.fungicide + '</td><td>'+item.quantity+'</td></tr>';
				});
				$('#tblHd').append(htmlHead);
				$('#tblBdy').append(htmlBody);
			}
			
		},error : function(error) {
			 
		}
	});    
}
</script>