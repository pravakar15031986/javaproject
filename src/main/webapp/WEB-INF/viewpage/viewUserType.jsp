
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>User Type</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Library</li>
                           <li class="breadcrumb-item active" aria-current="page">Data</li>
                        </ol>
                     </nav>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="addusertype">Add</a>
                              <a class="nav-item nav-link active"  href="viewusertype" >View</a> 
                           </ul>
                       
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                                   <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">User Type</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                                    <label class="col-lg-2 ">Description</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <div class="row">
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
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                                 <thead>
                                    <tr>
                                   
                                       <th width="40px">Sl#</th>
                                       <th>User Type</th>
                                       <th>Description</th>
                                       <th>Status</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                 <c:forEach items="${userTypeList}" var="userList" varStatus="count">
           						<tr>
           							<td>${count.count}</td>
           							<td>${userList.userType}</td>
           							<td>${userList.userTypePrefix }</td>
           							<td>
           								<c:if test="${userList.isDelete eq true}">
           								<c:out value="Active"/>
           								</c:if>
           								<c:if test="${userList.isDelete eq false}">
           								<c:out value="Inactive"/>
           								</c:if>
           							</td>
           							<td>
           								<a class="btn btn-info btn-sm" data-toggle="tooltip"  onclick="edit(${userList.id})" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                          
                                    </td>
           						</tr>
           						</c:forEach>
                                   
                                 </tbody>
                              </table>
                           </div>
                        </div>
                         <form action="editUserType.htm" method="post" id="editForm" >
  							
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

  							<input type="hidden" name="userId" id="userId">
  						</form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
 

<link href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script>
	function edit(id)
	{
		$('#userId').val(id);
		$('#editForm').submit();
	}
</script>
<script>

	$(document).ready( function () {
	    $('#viewTable').DataTable();
	} );
</script>