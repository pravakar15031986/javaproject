<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	setTimeout(function() {$("#messageId").hide(); }, 5000);	
});
</script>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Designation</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage User</li>
                           <li class="breadcrumb-item active" aria-current="page">Designation Master</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link"  href="adddesignation">Add</a>
                              <a class="nav-item nav-link active"  href="viewdesignation" >View</a>
                           </ul>
                   
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                                   <div class="form-group">
                               
                                 
                                 
                                 <div class="form-group">
                                    <div class="row">
                                    <label class="col-lg-2 ">Created On From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <label class="col-lg-2 ">Created On To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Designation</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                                    <label class="col-sm-2 ">Status</label>
                                    <div class="col-sm-3">
                                       <select class="form-control">
                                          <option value="0">--Select--</option>
                                          <option value="1">Active</option>
                                          <option value="2">Inactive</option>
                                       </select>
                                    </div>
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                 </div>
                              </div>
                      
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
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
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Designation</th>
                                       <th>Description</th>
                                       <th>Status</th>
                                       <th>Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                     <c:forEach items="${allDesignationList}" var="designationList" varStatus="count">
           						    <tr>
           							<td>${count.count}</td>
           							<td>${designationList.designation}</td>
           							<td>${designationList.description}</td>
           							 <td>
           								<c:if test="${designationList.status eq false}">
           								<c:out value="Active"/>
           								</c:if>
           								<c:if test="${designationList.status eq true}">
           								<c:out value="Inactive"/>
           								</c:if>
           							</td>
           							<td>
           								<a class="btn btn-info btn-sm"  data-toggle="tooltip"  onclick="editDesignation(${designationList.id})" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                          
                                    </td>
           						  </tr>
           						
           						</c:forEach>
                                 </tbody>
                              </table>
                           </div>
                         
                        </div>
                        <form action="editdesignation" method="post" id="editDesignation" >
  							
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

  							<input type="hidden" name="userId" id="designationId">
  						</form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         </div>
         <script>
     	function editDesignation(id)
     	{
     		$('#designationId').val(id);
     		$('#editDesignation').submit();
     	}
    	$('#viewTable').DataTable( {
    		"pagingType": "full_numbers",
            dom: 'Bfrtip',		
            buttons: [
                'print'
            ]
        } );
     	
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