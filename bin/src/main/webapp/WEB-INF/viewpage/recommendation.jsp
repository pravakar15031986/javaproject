<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
                     <h4>Recommendation</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Recommendation</li>
                           <li class="breadcrumb-item" aria-current="page">Prepare Recommendation</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                                <a class="nav-item nav-link active"  href="recommendation">View Advisory</a>
                                
                                <a class="nav-item nav-link"  href="viewrecommendation">View Recommendation</a>
                           </ul>
                           <div class="indicatorslist">
                              
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <form:form action="recommendationSearch" modelAttribute="searchVo" method="post" autocomplete="off">
                         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                         <div class="search-container">
                         <c:if test="${searchShow eq true }">
                         <div class="search-sec">
                         </c:if>
                         <c:if test="${searchShow eq false }">
                         <div class="search-sec" style="display:block;">
                         </c:if>
                           
                           <div class="form-group">
                                    <div class="row">
                                    <label class="col-lg-2 ">Advisory Date From</label>
                                    <div class="input-group col-lg-3">
                                       <form:input class="form-control datepicker" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="startDate" path="startDate"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <label class="col-lg-2 ">Advisory Date To</label>
                                    <div class="input-group col-lg-3">
                                       <form:input class="form-control datepicker" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="endDate" path="endDate"/>
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
                                       <form:input type="text" class="form-control"  placeholder="" data-bv-field="fullName" id="advisoryNo" path="advNo"  onkeypress="return checkAdvNo(event);" maxlength="20"/>
                                    </div>
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary" id="searchId"> <i class="fa fa-search"></i> Search</button>
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
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                                 <thead>
                                    <tr>
                                      
                                       <th width="40px">Sl#</th>
                                       <th>Advisory No.</th>
                                       <th>Advisory Uploaded On</th>
                                       <th class="text-center">Advisory Document</th>
                                       <th>Remark</th>
                                       <th>Add Recommendation</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                 <c:forEach items="${advisoryList}" var="advisory" varStatus="count">
                                 	<tr>
                                 		<td>${count.count}</td>
                                 		<td>${advisory.advisoryNo}</td>
                                 		<td>
                                 		<fmt:formatDate pattern="dd-MMM-yyyy" value="${advisory.publishDate}" />
                                 		</td>
                                 		<td class="text-center">
                                 			<a href='javascript:void(0)' onclick="generateExcel(${advisory.advisoryId})" ><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a>
                                 			
                                 		</td>
                                 		<td>${advisory.advRemark }</td>
                                 		<td>
                                 			<%-- <a href='javascript:void(0)' onclick="addRecomendation(${advisory.advisoryId})"></a> --%>
                                 			<a title="" href='javascript:void(0)' data-placement="top" data-original-title="Add" onclick="addRecomendation(${advisory.advisoryId},'${advisory.advisoryNo}')"><i class="fa fa-plus-square fa-2x" aria-hidden="true"></i></a>
                                 		</td>
                                 	</tr>
                                 	
                                 </c:forEach>
                                   
                                 </tbody>
                              </table>
                              </div>
                             
                         </div> 
                        </div>
                        <!--===================================================-->
                     </div>
                     <%-- <form action="recommendationSearch" method="post" id="searchFormId">
                     	<input type="hidden" id="fromDateId" name="fromDate">
                     	<input type="hidden" id="toDateId" name="toDate">
                     	<input type="hidden" id="surveyNoId" name="advisoryN">
                     </form> --%>
                     
                     <form action="advisory-file-recom-download" id="advisoryFileForm"  method="POST">
						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						<input type="hidden" name="fileId"  id="fileNameId">
 					</form> 
 					 <form action="addrecommendation" id="addRecomendForm"  method="POST">
						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						<input type="hidden" name="adviosryId"  id="adviosryId">
						<input type="hidden" name="adviosryNo"  id="adviosryNo">
 					</form> 
                  </div>
               </div>
            </div>
            
            <script>
$('select[multiple]').multiselect({
    columns: 2,
    placeholder: 'Select options'
});
</script>
<script>
$(function() {
	$('#viewTable').dataTable({
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
 
 <!-- Download File -->
 <script>
 function generateExcel(id)
 {	
	
 	$.ajax({
 		type:"GET",
 		url:"advisory-file-exist",
 		data:{
 				"fileId":id
 		},
 		success:function(response){

 			var res=JSON.parse(response);
 			//alert(res);
 			if(res.msg == 'Yes')
 			{	
 				$("#fileNameId").val(id);
 				$("#advisoryFileForm").submit();
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
	function addRecomendation(id,sNumber)
	{
		
		$("#adviosryId").val(id);
		$("#adviosryNo").val(sNumber);
		$("#addRecomendForm").submit();
	}
 </script>
 <script>
$(document).ready(function(){
	$("#searchId").click(function(){
		if($("#startDate").val()!="" && $("#endDate").val()=="")
			{
				swal("Error","Please select Advisory Date To","error").then(function(){
					$("#endDate").focus();
				});
				return false;
			}
		if($("#startDate").val()=="" && $("#endDate").val()!="")
		{
			swal("Error","Please select Advisory Date From","error").then(function(){
				$("#startDate").focus();
			});
			return false;
		}
		if(Date.parse($("#startDate").val())>Date.parse($("#endDate").val()))
		{
			swal(
					'Error',
					'Advisory Date From should be less than Advisory Date To',
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