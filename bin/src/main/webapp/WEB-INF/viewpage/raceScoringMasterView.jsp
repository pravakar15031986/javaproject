<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<c:if test="${msg ne Empty}">
	<script>
	$(document).ready(function(){  
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	 });
</script>
</c:if>
      <c:if test="${errMsg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>   

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Race Scoring</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                          <li class="breadcrumb-item">Manage Master</li>
                            <li class="breadcrumb-item active" aria-current="page">Race Analysis Scoring</li>
                           
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                               <a class="nav-item nav-link "  href="raceScoringMaster">Add</a>
                              <a class="nav-item nav-link active"  href="raceScoringMasterView" >View</a>
                           </ul>
                    <div class="indicatorslist">
                              
                              
                               
                             
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                        <div class="search-sec">
                       <form:form action="raceScoringMasterViewSearch" autocomplete="off"   method="post"  modelAttribute="searchVo">
                         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>        
                              
                              <div class="form-group">
                                 <div class="row">
                                 <label class="col-sm-2 ">Rust Type</label>
                                    <div class="col-sm-3">
                                     <form:select class="form-control" id="rustTypeId" path="rustId">
											<form:option value="">--select--</form:option>
											<c:forEach items="${rustTypeList}" var="rustTypeList">
												<c:choose>
													<c:when
														test="${rustTypeList.rustId eq rustTypeId}">
														<form:option value="${rustTypeList.rustId}" selected="selected">${ rustTypeList.typeOfRust}</form:option>
													</c:when>
													<c:otherwise>
														<form:option value="${ rustTypeList.rustId}">${ rustTypeList.typeOfRust}</form:option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
									</form:select>
                                    </div>
                                  <label class="col-sm-2 ">H/L/I Type</label>
                                  <div class="col-sm-3">
                                     <form:select class="form-control" id="hlId" path="hlId">
										     
										     <form:option value="">--select--</form:option>    
										   	<form:option value="H">High</form:option>
											<form:option value="I">Intermediate</form:option>
											<form:option value="L">Low</form:option>
									</form:select>
                                    </div>
                                 
                                    
                                     
                                 </div>
                              </div>
                                <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Status</label>
                                    <div class="col-lg-3">
                                       <form:select  class="form-control" id="status" path="status" >
                                   		<form:option value="">--Select--</form:option>
                                   		<form:option value="false">Active</form:option>
                                   		<form:option value="true">Inactive</form:option>	
											</form:select>
                                    </div>
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                 </div>
                              </div>
                      </form:form> 
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered"  id="viewTable">
                                 <thead>
                                    <tr>
                                    
                                       <th width="40px">Sl#</th>
                                       <th>Rust Type</th>
                                       <th>Infection Type</th>
                                       <th>H/L Type</th>
                                       <th>Status</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:forEach items="${race}" var="dtls" varStatus="count"> 
                                    <tr>
                                       <td>${count.index + 1 }</td>
                                       
                                       <td> ${dtls.rustId.typeOfRust}</td>
                                       <td>${dtls.infectionType}</td>
                                       <td>
                                        <c:choose>
         
         								<c:when test = "${dtls.hlValue eq 'H'}">
           									High
        								 </c:when>
         
         								<c:when test = "${dtls.hlValue eq 'L'}">
           									Low
         								</c:when>
         
        								<c:when test = "${dtls.hlValue eq 'I'}">
          									Intermediate
         								</c:when>
      							</c:choose>
                                       
                                     </td>  
                                       <c:if test="${dtls.status  eq false}">
                                       	<td>Active</td>
                                       </c:if>
                                       <c:if test="${dtls.status  eq true}">
                                       	<td>Inactive</td>
                                       </c:if> 
                                       
                                       <td><a class='btn btn-info btn-sm' data-toggle='tooltip' data-original-title='Edit' onclick='edit(${dtls.raceScoreId })'><i class='icon-edit1'></i></a></td>
                                     <%--   <a href="javascript:void(0);" class="viewsurvey" survey-id="${dtls.raceScoreId }"></a></td> --%>
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
         <form action="raceScoringMasterEdit" method="post" id="editForm">
         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           	<input type="hidden" id="stagId" name="raceScoreId">
         </form>
 
 
 <script>
$(function() {
$('#viewTable').dataTable({
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
});
}); 
</script>
 
 <script>
         
 function edit(id){
		$("#stagId").val(id);
		$("#editForm").submit();
	}


</script>