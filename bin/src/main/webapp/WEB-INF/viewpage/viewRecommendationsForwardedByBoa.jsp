
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<style>
.fa-file-pdf-o {
	color: red;
}
</style>

<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Recommendation</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Recommendation</li>
						<li class="breadcrumb-item" aria-current="page">Forward Recommendation</li>
					</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link" href="viewRecommendationByBoa">New</a>
							<a class="nav-item nav-link active"
								href="viewRecommendationsForwardedByBoa">Forwarded Recommendation</a>
						</ul>
						<div class="indicatorslist">

						</div>
					</div>
					<!-- Search Panel -->
					<form:form action="viewRecommendationsForwardedByBoaSearch" modelAttribute="searchVo" method="post" autocomplete="off">
					
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

					<div class="search-container">
					<c:if test="${showSearch eq true }">
					<div class="search-sec" style="display: block;">
					</c:if>
					<c:if test="${showSearch eq false }">
					<div class="search-sec">
					</c:if>
						
							<div class="form-group">
								<div class="row">
									<label class="col-lg-2 ">Recommendation Type</label>
									<div class="col-lg-3">
										<form:select class="form-control" id="recomType" path="recomType">
											<form:option value="0">--Select--</form:option>
											<form:option value="1">General</form:option>
											<form:option value="2">Region Specific</form:option>
										</form:select>
									</div>
									<label class="col-lg-2 ">Recommendation No.</label>
									<div class="col-lg-3">
										<form:input class="form-control" path="recNo"
											placeholder="" data-bv-field="fullName" onkeypress="return checkRecNo(event);" maxlength="10" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<label class="col-lg-2 ">Recommendation Date From</label>
									<div class="input-group col-lg-3">
										<form:input class="form-control datepicker" data-date-end-date="0d"
											aria-label="Default"
											aria-describedby="inputGroup-sizing-default" path="startDate" id="startDate"/>
										<div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i
												class="icon-calendar1"></i></span>
										</div>
									</div>
									<label class="col-lg-2 ">Recommendation Date To</label>
									<div class="input-group col-lg-3">
										<form:input class="form-control datepicker" data-date-end-date="0d"
											aria-label="Default"
											aria-describedby="inputGroup-sizing-default" path="endDate" id="endDate"/>
										<div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i
												class="icon-calendar1"></i></span>
										</div>
									</div>
									<div class="col-lg-2">
										<button class="btn btn-primary" id="btnSubmit">
											<i class="fa fa-search"></i> Search
										</button>
									</div>
								</div>
							</div>

						</div>
						<div class="text-center">
							<a class="searchopen" title="" data-toggle="tooltip"
								data-placement="bottom" data-original-title="Search"> <i
								class="icon-angle-arrow-down"></i>
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
										<th>Recommendation No.</th>
										<th>Recommendation Date</th>
										<th>Forwarded Date</th>
										<th>Type of Recommendation</th>
										<th class="text-center">Recommendation
											Document</th>
										<th>Remark</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${recommendation}" var="rec"
										varStatus="counter">
										<tr>
											<td>${counter.count}</td>
											<td>${rec.recomendNoBean}</td>
											<td>${rec.recDate}</td>
											<td>${rec.forwardDate}</td> 
											<td><c:if test="${rec.recomendTypeBean eq 1}">
											General
											</c:if> <c:if test="${rec.recomendTypeBean eq 2}">
											Region Specific <a title="" data-placement="top" data-toggle="modal"
														data-target="#locationModal" onclick="viewLocation(${rec.recomendId})"><i class="fa fa-info-circle"
														aria-hidden="true" style="color: #83a750"></i></a>
											</c:if></td>
											<td class="text-center"><a title=""
												href="javascript:void(0)" id="downloadIcon"
												data-toggle="tooltip" data-placement="top"
												data-original-title="Download"
												onclick="downloadFile(${rec.recomendId})"><i
													class="fa fa-file-pdf-o " aria-hidden="true"></i></a>
											<!-- fa-2x --></td>
											<td>${rec.forwardRemarkBean}</td>
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
$(function() {
$('#myTable').dataTable({
				
'processing' : true,
'serverSide' : true,
"searching": false,
"ordering": false, 
"ajax" : {
	"url" : "viewRecommendationsForwardedByBoaPageWise",
	"data" : function(d) {
		d.recomType= $("#recomType").val();
		d.recoMendNo = $("#recNo").val();
		d.startDate =$("#startDate").val();
		d.endDate = $("#endDate").val();
		}
	},
	"dataSrc": "",
	"columns":[
	{"data":"sNo"},
	{"data":"recomendNoBean"},
	{"data":"recDate"},
	{"data":"forwardDate"},
	{"data":"recomendViewTypeBean"},
	{"data":"recFileName"},
	{"data":"forwardRemarkBean"} 
	]
	 
		});
			});	
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
$(document).ready(function(){
	if($("#recomType").val()!=2)
		{
		$('.location-filter').hide();
		$("#region").val(0);
		$("#zone").val(0);
		$("#woreda").val(0);
		$("#kebele").val(0);
		}
	else
		{
		$('.location-filter').show();
		}


$("#recomType").change(function(){
	if($("#recomType").val()!=2)
	{
	$('.location-filter').hide();
	$("#region").val(0);
	$("#zone").val(0);
	$("#woreda").val(0);
	$("#kebele").val(0);
	}
else
	{
	$('.location-filter').show();
	}
});

});
</script>
<script>
function viewLocation(id)
{
	//alert(id);
	$('#loctblHd').empty();
	$('#loctblBdy').empty();
	$('#modalMsg').empty(); 
	 $.ajax({
		type : "POST",
		url : "getRecLocDetailsForwardedByBoa", 
	 
		data : {
			"recId":id
		},
		success : function(response) {
			
			var val=JSON.parse(response);
		    if(val.length == 0 ){
				$('#modalMsg').html('No data available');
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
$(document).ready(function(){
	$("#btnSubmit").click(function(){
		if($("#startDate").val()!="" && $("#endDate").val()=="")
			{
				swal("Error","Please select Recommendation Date To","error").then(function(){
					$("#endDate").focus();
				});
				return false;
			}
		if($("#startDate").val()=="" && $("#endDate").val()!="")
		{
			swal("Error","Please select Recommendation Date From","error").then(function(){
				$("#startDate").focus();
			});
			return false;
		}
		if(Date.parse($("#startDate").val())>Date.parse($("#endDate").val()))
		{
			swal(
					'Error',
					'Recommendation Date From should be less than Recommendation Date To',
					'error'
					).then(function(){
						$("#startDate").focus()
					})
					return false; 
		}
	})
});
</script>
<script>
function checkRecNo(e){
var regex = new RegExp("^[a-zA-Z0-9]");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
var code = (e.keyCode ? e.keyCode : e.which);
if (regex.test(str) || code==8) {
   return true;
}
$("#recNo").focus();
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