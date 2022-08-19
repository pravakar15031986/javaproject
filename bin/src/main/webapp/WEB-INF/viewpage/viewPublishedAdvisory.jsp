     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<style>
.fa-file-pdf-o
{color:red;}
</style>

<form action="advisory-file-download" id="downloadForm" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


	<input type="hidden" name="downId" id="downId">
</form>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Advisory</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Recommendation</li>
                           <li class="breadcrumb-item" aria-current="page">View Advisory</li>
                        </ol>
                     </nav>
                  </div>
      
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="viewPublishedAdvisory">View</a>
                           </ul>
                           <div class="indicatorslist">
                           </div> 
                        </div>
                        <!-- Search Panel -->
                         <form:form class="col-sm-12 form-horizontal customform" action="viewPublishedAdvisory"  method="post" modelAttribute="searchVo" autocomplete="off">
                       
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        <div class="search-container">
                        <c:if test="${showSearch eq	false }"><div class="search-sec"></c:if>
                        <c:if test="${showSearch eq	true}"><div class="search-sec" style="display: block;"></c:if>
                           
                              <div class="form-group">
                                 <div class="row">
                                 <label class="col-lg-2 ">Advisory Date From</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" id="advUpldDtFrom" path="advDtFrom" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <label class="col-lg-2 ">Advisory Date To</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" id="advUpldDtTo" path="advDtTo" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                    <div class="row">
                                    <label class="col-lg-2 ">Advisory No.</label>
                                    <div class="col-lg-3">
                                       <form:input type="text" class="form-control" path="advNo" id="advisoryNo" onkeypress="return checkAdvNo(event);" maxlength="20"/>
                                    </div>
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary" onclick="validate()"> <i class="fa fa-search"></i> Search</button>
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
                              <table data-toggle="table" class="table table-hover table-bordered" id="myTable">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Advisory No.</th>
                                       <th>Advisory Date</th>
                                       <th class="text-center">Advisory Document</th>
                                       <th>Remark</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:forEach items="${advisory}" var="advisory" varStatus="counter" >
                                    <tr>
                                    <td>${counter.count}</td>
                                    <td>${advisory.advisoryNo}</td>
                                    <td>${advisory.publishDate}</td>
                                    <td  class="text-center">
                                       <a title="" href="javascript:void(0)" id="downloadIcon" data-toggle="tooltip" data-placement="top" data-original-title="Download" onclick="downloadFile(${advisory.advisoryId})"><i class="fa fa-file-pdf-o " aria-hidden="true"></i></a><!-- fa-2x -->
                                    </td>
                                    <td>${advisory.advRemark}</td>
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
				'Advisory Date From should be less than Advisory Date To',
				'error'
				).then(function(){
					$("#advUpldDtFrom").focus()
				})
   		 	   		return false; 
	}
	if(fromDate!="" && toDate=="")
	{
		swal("Error","Please select Advisory Date To","error").then(function(){
			$("#advUpldDtTo").focus();
		});
		return false;
	}
	if(fromDate=="" && toDate!="")
	{
		swal("Error","Please select Advisory Date From","error").then(function(){
			$("#advUpldDtFrom").focus();
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
					"url" : "viewPublishedAdvisoryPageWise",
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
				{"data":"advRemark"}
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
 <!-- Download File -->
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