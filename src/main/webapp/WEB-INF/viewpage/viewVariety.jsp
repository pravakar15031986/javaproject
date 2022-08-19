<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>


<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Variety</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Variety Master</li>
                        </ol>
                     </nav>
                  </div>
     
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link"  href="addVariety">Add</a>
                              <a class="nav-item nav-link active"  href="viewVariety" >View</a>
                           </ul>
                   
                        </div>
                        <!-- Search Panel -->
                        <form:form class="col-sm-12 form-horizontal customform" action="viewVariety"  method="post" modelAttribute="searchVo">
                       
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        <div class="search-container">
                           <div class="search-sec">
                                   
                              <div class="form-group">
                                 <div class="row">
                                    <label class="col-sm-2 ">Status</label>
                                    <div class="col-sm-3">
                                       <form:select path="dataId" id="status" class="form-control" style="width: 100%;" >
							          <option value="0">--Select--</option>
			     			          <form:options items="${statusList}" itemValue="dataId" itemLabel="dataName" />
								      </form:select>
                                    </div>
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                 </div>
                              </div>
                      
                           </div>
                           <div class="text-center"> <a class="searchopen" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Search"> <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        </form:form>
                        <!-- Search Panel -->
                        <!--===================================================-->
                           <%-- <c:if test="${not empty  msg}"> 
		                  <div id="messageId">			
							<center><span style="color: green;font-weight: bold;">${msg}</span></center>
						</div>				 
						</c:if> 
						<c:if test="${not empty  errMsg}"> 
		                  <div id="messageId">			
							<center><span style="color: red;font-weight: bold;">${errMsg}</span></center>
						</div>				 
						</c:if>  --%>
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="myTable">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Variety</th>
                                       <th>Status</th>
                                       <th>Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                     <c:forEach items="${varietyList}" var="varietyList" varStatus="count">
           						    <tr>
           							<td>${count.count}</td>
           							<td>${varietyList.vchDesc}</td>
           							<td>
           								<c:choose>
           								<c:when test="${varietyList.bitStatus == false}">Active</c:when>
           								<c:otherwise>Inactive</c:otherwise>
           								</c:choose>
           							</td>
           							 <%-- <td>
           								<c:if test="${varietyList.bitStatus eq false}">
           								<c:out value="Active"/>
           								</c:if>
           								<c:if test="${varietyList.bitStatus eq true}">
           								<c:out value="Inactive"/>
           								</c:if>
           							</td> --%>
           							<td>
           								<a class="btn btn-info btn-sm"  data-toggle="tooltip"  onclick="editVariety(${varietyList.varietyTypeId})" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                          
                                    </td>
           						  </tr>
           						
           						</c:forEach>
                                 </tbody>
                              </table>
                           </div>
                         
                        </div>
                        <form action="editVariety" method="post" id="myForm" >
  							
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

  							<input type="hidden" name="varietyTypeId" id="varietyId">
  						</form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
<script>
$(function() {
	//
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
     	function editVariety(id)
     	{
     		$('#varietyId').val(id);
     		$('#myForm').submit();
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