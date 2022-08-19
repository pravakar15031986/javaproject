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
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Published Recommendation</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Recommendation</li>
                           <li class="breadcrumb-item" aria-current="page">Publish Recommendation</li>
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
                                <a class="nav-item nav-link "  href="pendingrecommendation">Pending Recommendation</a>
                                <a class="nav-item nav-link active"  href="publishingrecommendation">Published Recommendation</a>
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
					
 					  <form action="publishingrecommendationsearch" id="recommendSearchForm"  method="POST"> 
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

 					  
                         <div class="form-group"> 
                        
                      			 <div class="row">
									<label class="col-lg-2 ">Recommendation Type</label>
									<div class="col-lg-3">
										 <select class="form-control" id="recomType" name="recomType">
											<option value="0" selected="selected">--Select--</option>
											<option value="1">General</option>
											<option value="2">Region Specific</option>
										</select> 
									</div>
									
								
                              <label class="col-lg-2 ">Recommendation No.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="recoMendNo" id="recoMendNo" placeholder="" data-bv-field="fullName" value="${recoMendNo}" onkeypress="return checkRecNo(event);" maxlength="10">
                                    </div>
                                    
                                    </div>
                                </div>
                         
                              <div class="form-group">
                                    <div class="row">
                                    <label class="col-lg-2 ">Recommendation Created On From</label>
                                    <div class="input-group col-lg-3">
                                        <input type="text" class="form-control datepicker" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default"  name="startDate" id="startDate" value="${startDate}" autocomplete="off">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <label class="col-lg-2 ">Recommendation Created On To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default"  name="endDate" id="endDate" value="${endDate}" autocomplete="off">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary" id="searchId"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                   
                                   </div>
                                  </div>
                                    </form>  
                            <div class="form-group" style="display:none">
                              </div>
                              <div class="form-group" style="display:none">
                              </div>
                      			  
                                
                                
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div> 
                        
                        
                        
                        
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
                        
                        
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable" >
                                 <thead>
                                    <tr>
                                        <th width="20px" >Sl#</th>
                                       <th>Recom No.</th>
                                      <th>Recom Created On</th>
                                       <th>Advisory No.</th>
                                       <th>Type of Recom</th>
                                       <th>Uploaded Recom</th>
                                        <th>Published On</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                
                                   
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
                        <!--===================================================-->
                     </div>
                      <form action="recommend-file-download" id="recommendFileForm"  method="POST">
						
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="hidden" name="fileId"  id="fileNameId">
 					</form>
 					 <form action="editRecommendation" id="editForm"  method="POST">
						
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="hidden" name="recomendId"  id="recomendEditId">
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
function deleteRecommend(recommendId)
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
	"url" : "publishingRecommendationDataPageWise",
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
	{"data":"recomendViewTypeBean"},
	{"data":"recFileName"},
	{"data":"publishedRecDate"}
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
			var fromDate=$("#startDate").val();
				
			var toDate=$("#endDate").val();
			
			if(fromDate!= '')
			{
				if(toDate =='')
				{
					 swal(
			 	   				'Error', 
			 	   				'Please enter the Recommendation Created On To Date',
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
		 	   				'Please enter the Recommendation Created On From Date',
		 	   				'error'
		 	   			).then(function() {
							   $("#startDate").focus();
						   });
		    		return false; 
				}
			}
			
			/* 
				$("#startDateId").val(fromDate);
				$("#endDateId").val(toDate);
				$("#recoMendNoSer").val($("#recoMendNo").val());
				$("#regionIdSer").val($("#regionId").val());
				$("#zoneIdSer").val($("#zoneId").val());
				$("#woredaIdSer").val($("#woredaId").val());
				$("#kebeleIdSer").val($("#kebeleId").val());
				$("#recomTypeSer").val($("#recomType").val()); */
				
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
	swal("${msg_1}"," ", "error"); 
	});
</script>
</c:if>  

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

$("#recomType").val('${recommendTypeId}');
$("#recoMendNo").val('${recoMendNo}');
$("#startDate").val('${startDate}');
$("#endDate").val('${endDate}');
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