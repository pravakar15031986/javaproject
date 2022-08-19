<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

     
 <form:form action="editJobDelegation" name="editDelegation" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

 
		<input type="hidden" name="delegationId" id="applicationIdHiddenId"/>
		<input type="hidden" name="multiapprovalId" id="hiddenAuthorityId"/>
</form:form>

<form:form action="deleteJobDelegation" name="deleteDelegation" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


		<input type="hidden" name="delegationId" id="hiddenDelegationId"/>
</form:form>
 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Job Delegation</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Approval Process</li>
                           <li class="breadcrumb-item active" aria-current="page">Job Delegation</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="addJobDeligation">Add</a>
                              <a class="nav-item nav-link active"  href="viewJobDeligation" >View</a>
                           </ul>
                  
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container" style="display: none;">
                           <div class="search-sec">
                                  
                              	<div class="form-group">
								<div class="row">
									
									<label class="col-lg-2 ">From Date</label>
									<div class="col-lg-3">
										   <div class="input-group">
                                      <input type="text" class="form-control datepicker" name="datefrom" id="datefrom" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                       <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                   </div>
									</div>
									<label class="col-lg-2 ">To Date</label>
									<div class="col-lg-3">
										 <div class="input-group">
                                       <input type="text" class="form-control datepicker" name="dateto" id="dateto" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                       <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                    </div>
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
                                       <th>Process</th>
                                       <th>Level of Approval</th>
                                       <th>From Date</th>
                                       <th>To Date</th>
                                       <th>Approval By</th>
                                       <th>Approval To</th>
                                       <th>Description</th>
                                       <th>Status</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                <c:forEach items="${delegationList}" var="vo" varStatus="myIndex">          		
							 <tr>
							    <td><c:out value="${myIndex.index + 1 }"  /></td>
				                <td>${vo.processName}</td>
				                <td><c:choose>
				                <c:when test="${vo.stageNo eq '1'}">1st Level Approval</c:when>
				                <c:when test="${vo.stageNo eq '2'}">2nd Level Approval</c:when>
				                <c:otherwise>3rd Level Approval</c:otherwise>
				                </c:choose></td>
				                <td>${vo.datefrom}</td>	                	                
				                <td>${vo.dateto}</td> 
				                <td>${vo.approveBy}</td>
				                <td>${vo.approveTo}</td>
				                <td>${vo.remarks}</td>
				                <td><c:choose>
				                <c:when test="${vo.activeStatus eq true}">Active</c:when>
				                 <c:when test="${vo.activeStatus eq false}">Inactive</c:when>
				                <c:otherwise>-</c:otherwise>
				                </c:choose></td>  	                           
                                <td class="NOPRINT">
	                                <c:if test="${vo.activeStatus == null }">
	                                	<a class="btn btn-primary btn-sm"  title="Edit"  onclick="edit('${vo.delegationId}','${vo.multiapprovalId}')"> <i  class="fa fa-share" aria-hidden="true"></i></a>
	                                	<a class="btn btn-danger btn-sm"  title="Delete" onclick="deleteRow('${vo.delegationId}')"><i class="icon-trash-21"></i></a>
	                                </c:if>
                                </td>       			   			   	
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
$(document).ready(function(){

	$('#viewTable').DataTable( {
	    "pagingType": "full_numbers"
	    });
	  
	   });


  function edit(delegationId,authorityId){
		$("#applicationIdHiddenId").val(delegationId);
		$("#hiddenAuthorityId").val(authorityId);
		$("form[name='editDelegation']").submit();
	}

  function deleteRow(delegationId){
	  $("#hiddenDelegationId").val(delegationId);

	  swal({
     		title: "Are you sure  to delete this record?",
     		  type: 'warning',
     		  showCancelButton: true,
     		  confirmButtonText: 'Yes',
     		  cancelButtonText: 'No',
     		  /* reverseButtons: true */
 	    }).then((result) => {
 	    	  if (result.value) {
 	 	    		  
 	    		 $("form[name='deleteDelegation']").submit();
 	    		  return true;
 	    		  }
 	    		})
 	    return false;
	  
	  
	
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