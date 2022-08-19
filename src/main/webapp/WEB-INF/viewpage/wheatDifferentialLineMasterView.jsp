<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
 <form:form action="wheatDifferentialLineMasterEdit" name="myform" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

 
<input type="hidden" name="wheatDifLineId" id="hdnWheatDifLineId"/>
</form:form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Wheat Differential Line</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                            <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Wheat Differential Line</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                               <a class="nav-item nav-link "  href="wheatDifferentialLineMaster">Add</a>
                              <a class="nav-item nav-link active"  href="wheatDifferentialLineMasterView" >View</a>
                           </ul>
                            
                        </div>
                        <!-- Search Panel -->
                        <form:form class="col-sm-12 form-horizontal customform" action="wheatDifferentialLineMasterView"  method="post" modelAttribute="searchVo" autocomplete="off">
                        
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        <div class="search-container">
                           <div class="search-sec">
                           <div class="form-group">
                           <div class="form-group">
                              <div class="row">
                              <label class="col-sm-2 ">Rust Type </label>
                                    <div class="col-sm-3">
                                       <form:select class="form-control" path="rustTypeId">
                                          <form:option value="0">--Select--</form:option>
                                          <form:options items="${rustTypeList}" itemLabel="typeOfRust" itemValue="rustId" />
                                       </form:select>
                                    </div>
                              <label class="col-sm-2 ">Differential Set No.</label>
                                    <div class="col-sm-3">
                                       <form:select class="form-control" path="diffSetNo" id="diffSetNoId">
                                          <form:option value="0" selected="selected">--Select--</form:option>
                                          <c:forEach var = "i" begin = "1" end = "${diffsetno}">
                                          <form:option value="${i}">${i}</form:option>
                                          </c:forEach>
                                       </form:select>
                                    </div>
                              </div>
                              </div>
                           </div>
                                  
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Used for 1<sup>st</sup> Differential Line/ <br>Repetition</label>
                                    <div class="col-lg-3">
                                       <form:select class="form-control" path="isFirstDiffLine">
                                          <form:option value="-1" selected="selected">--Select--</form:option>
                                          <form:option value="0">Only Repetition</form:option>
                                          <form:option value="1">1<sup>st</sup> Differential Line</form:option>
                                          <form:option value="2">Both</form:option>
                                       </form:select>
                                    </div>
                                    <label class="col-sm-2 ">Status</label>
                                    <div class="col-sm-3">
                                       <form:select class="form-control" path="deleteFlag">
                                        <form:option value="-1">--Select--</form:option>
                                          <form:option value="0">Active</form:option>
                                          <form:option value="1">Inactive</form:option>
                                       </form:select>
                                    </div>
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
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
                                       <th>Type of Rust</th>
                                       <th>Differential Line Name</th>
                                       <th>Differential Set Number</th>
                                       <th>Sequence No.</th>
                                       <th>Seed Source</th>
                                       <th>Gene</th>
                                       <th>Expected Low IT</th>
                                       <th>Description</th>
                                       <th>Used for 1<sup>st</sup> Differential Line/ <br>Repetition</th>
                                       <th>Status</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                  <c:forEach items="${differentialLine}" var="vo" varStatus="counter">
                                    <tr>
                                    	<td><c:out value="${counter.count}"></c:out></td>
                                   		<td>${vo.rustTypeName}</td>
                                   		<td>${vo.difLine}</td>
                                   		<td>
                                   		<c:choose>
                                   		
                                   		<c:when test="${vo.rustTypeId eq 3}">
                                   		</c:when>
                                   		<c:otherwise>
                                   		${vo.diffSetNo}
                                   		</c:otherwise>
                                   		</c:choose>
                                   		</td>
                                   		<td>${vo.seqNo}</td>
                                   		<td>${vo.seedSourceName}</td>
                                   		<td>${vo.gene}<c:if test="${vo.rustTypeId eq 3}"> <c:if test="${vo.racephenotype!=''}"><span class="text-danger">(${vo.racephenotype})</span></c:if> </c:if> </td>
                                   		<td>${vo.expectLowIt}</td>
                                   		<td>${vo.desc}</td>
                                   		<td>
                                   		<c:if test="${vo.firstLine == 0}">only Repetition</c:if>
                                   		<c:if test="${vo.firstLine == 1}">1st Differential Line</c:if>
                                   		<c:if test="${vo.firstLine == 2}">Both</c:if>
                                   		</td>
                                   		<td>
                                   		<c:if test="${vo.status eq false}">
                                   		Active
                                   		</c:if>
                                   		<c:if test="${vo.status eq true}">
                                   		Inactive
                                   		</c:if>
                                   		</td>
                                   		<td><a data-placement="top" data-toggle="tooltip" title="Edit" id="edit${vo.wheatDifLineId}" onclick="editWheatDifLine('${vo.wheatDifLineId}');">
	                                 	<button class="btn btn-primary btn-xs" type="button" data-title="Edit">
	                                 	<i class="icon-edit1"></i>
	                                 	</button>
	                                 	</a></td>
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
function editWheatDifLine(wheatDifLineId){
	 $("#hdnWheatDifLineId").val(wheatDifLineId);
    $("form[name='myform']").submit();
		}
</script>
<script>
$(document).ready( function () {
    $('#myTable').DataTable({
            "paging":   true,
            "ordering": true,
            'searching':false,
            "info":     true
        });
    });
</script>

