<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="wrsis/css/dataTables.bootstrap4.min.css"/>
<script src="wrsis/js/jquery.dataTables.min.js"></script>
<script src="wrsis/js/dataTables.bootstrap4.min.js"></script>



<style>
.breadcrumb>li+li:before
{
display:none;
}
</style>

<div class="mainpanel">
<div class="section">
 <form:form id="view" method="post" modelAttribute="pagination" action ="getRoles"> <input name="page" id="page" value="0" hidden=""> <input name="size" id="size" value="10" hidden=""></form:form>
<div class="page-title">
                  <div class="title-details">
                     <h4>View Role</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage User</li>
                           <li class="breadcrumb-item active" aria-current="page">Role Master</li>
                        </ol>
                     </nav>
                  </div>
                  </div>
<div class="row">
        <div class="col-md-12 col-sm-12">
          <div class="card">
          <div class="card-header">
          <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link " href="addRoleMaster">Add</a>
                              <a class="nav-item nav-link active " href="getRoles">View</a>
                           </ul>
                           
          </div>
          	
           
	<div class="card-body">
	<c:if test="${not empty errMsg}">
                  			<div class="alert alert-danger fade-in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Error!</strong>${errMsg}
							</div>
                  		</c:if>
                		<c:if test="${not empty msg}">
                			<div class="alert alert-success fade-in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Success!</strong>${msg}
							</div>
                		</c:if>
      <div class="table-responsive">
               <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                  <thead>
					<tr>
					<th>Sl No.</th>
					<th>Name</th>
					<th>Alias Name</th>
					<th>Description</th>
					<th>Location Tagging<br> Required</th>
					<th>Status</th>
					<th>Edit</th>
					<th>Change Status</th>
					</tr>
					</thead>
				<tbody>
				
					<c:forEach var="role" items="${data.listRoles}" varStatus="counter">
					 <tr>
					  	 <td><c:out value="${data.currentPage*10+counter.count}"></c:out></td>
						  <td><c:out value="${role.roleName}"></c:out></td>
						  <td><c:out value="${role.aliasName}"></c:out></td>
						  <td><c:out value="${role.description}"></c:out></td>
						  <td>
						  
						   <c:if test="${ role.locationTagged eq false }">
						  	<c:out value="No"></c:out>
						  </c:if>
						   <c:if test="${ role.locationTagged eq true }">
						  	<c:out value="Yes"></c:out>
						  </c:if>
						  
						  </td>
						  
						  <td>
						  <c:if test="${ role.bitStatus eq false }">
						  <c:out value="Active"></c:out>
						  </c:if>
						   <c:if test="${ role.bitStatus eq true }">
						  <c:out value="Inactive"></c:out>
						  </c:if>
    					  <td align="center"><a href="editRoleMaster/${role.roleId}"  data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-sm" data-title="Edit" data-toggle="modal" data-target="#edit" ><i class="icon-edit1"></i></button></a></td>
						  <td align="center">
						  
						   <c:if test="${ role.bitStatus eq true }">
						   	 <a   href="deactiveRole/${role.roleId}/0"  title="Active"><button class="btn  btn-info btn-sm" data-title="Active"  ><i class="fa fa-check" aria-hidden="true"></i></button></a>
						   </c:if>
						 
						  <c:if test="${ role.bitStatus eq false }">
						 	  <a   href="deactiveRole/${role.roleId}/1"  title="Deactive"><button class="btn btn-danger btn-sm" data-title="Deactive"  ><i class="fa fa-times" aria-hidden="true"></i></button></a>
						  </c:if>
						 
						 </td>
						 
						 <%--  <a  <c:if test="${ role.bitStatus eq true }"> href="deactiveRole/${role.roleId}/0" </c:if> title="Active"><button class="btn  btn-info" data-title="Active"  ><i class="fa fa-check" aria-hidden="true"></i></button></a>
						  --%> 
						<%--   <a   <c:if test="${ role.bitStatus eq false }"> href="deactiveRole/${role.roleId}/1" </c:if> title="Deactive"><button class="btn btn-danger" data-title="Deactive"  ><i class="fa fa-times" aria-hidden="true"></i></button></a></td>
					 --%> </tr>
					 </c:forEach>
				 </tbody>
</table>
            </div>
            
            </div>
                 </div>
               </div>
            </div>
          </div>
</div>


<script>
$(document).ready(function(){
$('#viewTable').DataTable( {
    "pagingType": "full_numbers"
    });
});
</script>






<%-- <div id="mainTable">
 <form:form id="view" method="post" modelAttribute="pagination" action ="getRoles"> <input name="page" id="page" value="0" hidden=""> <input name="size" id="size" value="10" hidden=""></form:form>
<div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
          	<ul class="utility pull-right">
          		<li><a class="btn bg-orange btn-flat" data-toggle="tooltip" title="Refresh" data-placement="bottom"><i class="fa fa-refresh"></i> </a></li>
          		<li><a class="btn bg-purple btn-flat" data-toggle="tooltip" title="Print" data-placement="bottom"><i class="fa fa-print"></i> </a></li>
          		<li><a class="btn bg-olive btn-flat" data-toggle="tooltip" title="PDF" data-placement="bottom"><i class="fa fa-file-pdf-o"></i> </a></li>
          		<li><a class="btn bg-maroon btn-flat" data-toggle="tooltip" title="Close" data-placement="bottom"><i class="fa fa-close"></i> </a></li>
          	</ul>
           <ul class="nav nav-tabs">
              <li><a href="addRoleMaster">Add</a></li>
              <li class="active"><a href="#" >View</a></li>
            </ul>
            <div class="clearfix"></div>
            <div class="tab-content">
              <div class="tab-pane active" id="fa-icons">
    <section id="new">
	<div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title" data-widget="collapse">Search Panel</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
            <div class="col-md-12">
               <section id="new">
                  <div class="row">
                  	<form:form class="col-sm-12 form-horizontal customform" action="serchData" modelAttribute="VoData" method="post"> 
		               <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Status</label>
		                  <div class="col-sm-4">
	                  </div>
		                  <label ></label><div></div>
		                  </div>
                  </div>
				 </section>
            </div>
          </div>
        </div>
      </div>
      <div class="table-responsive">
               <table id="mytable" class="mytable">
                  <thead>
					<tr>
					<th>Sl No.</th>
					<!-- <th>RoleId</th> -->
					<th>Name</th>
					<th>Alias Name</th>
					<th>Description</th>
					<!-- <th>Create date</th> -->
					<!-- <th>Updated by</th> -->
					<th>Status</th>
					<th>Edit</th>
					<th>Change Status</th>
					</tr>
					</thead>
				<tbody>
				
					<c:forEach var="role" items="${data.listRoles}" varStatus="counter">
					 <tr>
					  	 <td><c:out value="${data.currentPage*10+counter.count}"></c:out></td>
						  <td><c:out value="${role.id}"></c:out></td>
						  <td><c:out value="${role.roleName}"></c:out></td>
						  <td><c:out value="${role.aliasName}"></c:out></td>
						  <td><c:out value="${role.description}"></c:out></td>
						  <td><fmt:formatDate  dateStyle = "medium" timeStyle = "medium"
                        value = "${role.create_date}" /></td>
						  <td><c:out value="${role.update_by}"></c:out></td>
						  <td>
						  <c:if test="${ role.bitStatus eq 0 }">
						  <c:out value="Active"></c:out>
						  </c:if>
						   <c:if test="${ role.bitStatus eq 1 }">
						  <c:out value="Deactive"></c:out>
						  </c:if>
    					  <td align="center"><a href="editRoleMaster/${role.roleId}"  data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></a></td>
						  <td align="center">
						  <a href="deactiveRole/${role.roleId}/0" title="Active"><button class="btn  btn-info" data-title="Active"  ><span class="glyphicon glyphicon-ok-sign"></span></button></a>
						  <a href="deactiveRole/${role.roleId}/1" title="Deactive"><button class="btn btn-danger" data-title="Deactive"  ><span class="glyphicon glyphicon-remove-sign"></span></button></a></td>
					 </tr>
					 </c:forEach>
				 </tbody>
</table>
<div class="clearfix"></div>
<ul class="pagination pull-right">
  <li><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
</ul>
            </div>
      </section>
                 </div>
               </div>
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div> --%>
