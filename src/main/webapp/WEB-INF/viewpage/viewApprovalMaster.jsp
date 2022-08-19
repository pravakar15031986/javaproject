<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<script>
function editApprovalProcess(intProcessId){
	//alert(globalLinkId);
	 $("#hdnApId").val(intProcessId);
    $("form[name='form']").submit();
		}
</script>

 <div class="mainpanel">
 
 <form:form action="editApprovalMaster" name="form" method="post">
 
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

 
<input type="hidden" name="intProcessId" id="hdnApId"/>
</form:form>

            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Approval Process</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Approval Process</li>
                           <li class="breadcrumb-item active" aria-current="page">Approval Processes</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="addApprovalMaster">Add</a>
                              <a class="nav-item nav-link active"  href="viewApprovalMaster" >View</a>
                           </ul>
                    
                        </div>
                        <!-- Search Panel -->
                        <form:form class="col-sm-12 form-horizontal customform" action="viewApprovalMaster"  method="post" modelAttribute="searchVo">
                        
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        
                        <div class="search-container">
                           <div class="search-sec">
                              <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Process Name</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="approvalProcessName" id="processName" placeholder="" data-bv-field="fullName">
                                    </div>
                                    <label class="col-sm-2 ">Status</label>
                                    <div class="col-sm-3">
                                       <form:select path="dataId" id="status" class="form-control" style="width: 100%;" >
							          <option value="0">--Select--</option>
			     			          <form:options items="${statusList}" itemValue="dataId" itemLabel="dataName" />
								      </form:select>
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
                                     
                                       <th>Process Name</th>
                                       <th>Description</th>
                                       <th>Status</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                 <c:forEach items="${aplist}" var="vo" varStatus="counter" >
                                
	                                 <tr>
	                                 	<td><c:out value="${counter.count }"></c:out></td>
	                                 	<td>${vo.txtProcessName}</td>
	                                 	<td>${vo.desc}</td>
	                                 	<td><c:choose>
	                                 	<c:when test="${vo.intDeletedFlag == false}">Active</c:when>
	                                 	<c:otherwise>Inactive</c:otherwise>
	                                 	</c:choose></td>
	                                 	<td>
	                                 	<a data-placement="top" data-toggle="tooltip" title="Edit" id="edit${vo.intProcessId}" onclick="editApprovalProcess('${vo.intProcessId}');">
	                                 	<button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
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
$(function() {
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
function validate(){
	var processname = $('#processName').val();
	event.preventDefault();
	var form = event.target.form;
	  if(processname.charAt(0)== ' ' || processname.charAt(processname.length - 1)== ' '){
				   swal("Error", "White space is not allowed at initial and last place in Process Name", "error").then(function() {
					   $("#processName").focus();
				   });
		            return false;
			   }
	  if(processname!=null)
		{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<processname.length && i+1 < processname.length;i++)
		   		{
		   			if ((processname.charAt(i) == ' ') && (processname.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Process Name should not contain consecutive blank spaces", "error").then(function() {
					   $("#processName").focus();
					});
					return false;
				}
		}
	  if(/^[a-zA-Z ]*$/.test(processname) == false) {
	  	swal("Error","Process Name accept only alphabets", "error").then(function() {
					   $("#processName").focus();
				   });
	  	return false;
	  }
	  form.submit();
}
</script>
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