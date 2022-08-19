<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
 <form:form action="editOrganization" name="editOrgan" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

 
		<input type="hidden" name="intleveldetailid" id="leveldetailidHiddenId"/>
</form:form>
 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Organization</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage User</li>
                           <li class="breadcrumb-item active" aria-current="page">Organization Master</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="addOrganization">Add</a>
                              <a class="nav-item nav-link active"  href="viewOrganization" >View</a>
                           </ul>
                    
                        </div>
                        <!-- Search Panel -->
                        <%-- <form:form class="col-sm-12 form-horizontal customform" action="viewOrganization"  method="post" modelAttribute="searchVo">
                        <div class="search-container">
                           <div class="search-sec">
                                  
                              <div class="form-group">
                                 <div class="row">
                                 <label class="col-lg-2 ">Ministry</label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                   <option value="0">--Select--</option>
                                    <option value="2">MoA</option>
                                    </select>
                                    </div>
                                 
                                    <label class="col-lg-2 ">Organization</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="organizationName" placeholder="" data-bv-field="fullName">
                                    </div>
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
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        </form:form> --%>
                        <div class="search-container" style="display: none;">
                           <div class="search-sec">
                                   <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Country</label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                   <option value="0">--Select--</option>
                                    <option value="1">ETHOPIA</option>
                                    </select>
                                    </div>
                                     <label class="col-lg-2 ">Ministry</label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                   <option value="0">--Select--</option>
                                    <option value="2">MoA</option>
                                    </select>
                                    </div>
                                  
                                 </div>
                                 </div>
                                 <div class="form-group">
                                 <div class="row">
                                   <label class="col-lg-2 ">Organization</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                                    <label class="col-lg-2 ">Status</label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                   <option value="0">--Select--</option>
                                    <option value="1">Active</option>
                                    <option value="1">Inactive</option>
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
                                       <th>Country</th>
                                       <th>Ministry</th>
                                       <th>Organization</th>
                                       <th>Description</th>
                                       <th>Status</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                 <c:forEach items="${orgaList}" var="vo" varStatus="myIndex">   
                                    <tr>
                                      <td><c:out value="${myIndex.index + 1 }"  /></td>
                                       <td>${vo.couyntry}</td>	                	                
						                <td>${vo.ministry}</td> 
						                <td>${vo.organisation}</td>
						                <td>${vo.vchalias}</td>
						                 <td><c:choose>
						                <c:when test="${vo.status eq 'false'}">Active</c:when>
						                <c:otherwise>Inactive</c:otherwise>
						                </c:choose></td>
						                <td><a class="btn btn-primary" data-toggle="tooltip" title=""  data-original-title="Edit" onclick="edit('${vo.intleveldetailid}')"> <i id="actionId" class="fa fa-share" aria-hidden="true"></i></a></td>   
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
	   $('#btnSubmitId').click(function(){
		   if ($('#demo-text-input1').val() == ""){
	        	swal("Error", "Please enter the Type of Rust", "error");
	            /* alert('Please select the survey to date.'); */
	            return false;
	        }
		   if ($('#demo-text-input2').val() == ""){
	        	swal("Error", "Please enter the Short Name", "error");
	            /* alert('Please select the survey to date.'); */
	            return false;
	        }
           if($("input[name='form-radio-button']:checked").length==0){
           	swal("Error", "Please select Status", "error");
	            /* alert('Please select the survey to date.'); */
	            return false;
           }
           else{
           	swal({
           		title: ' Do you want to Submit?',
           		  type: 'warning',
           		  showCancelButton: true,
           		  confirmButtonText: 'Yes',
           		  cancelButtonText: 'No',
           		  /* reverseButtons: true */
       	    }).then((result) => {
       	    	  if (result.value) {
       	    		  swal("Success", "Submitted Successfully ", "success"); 
       	    		  window.location.href="viewTypeofRust.html";
       	    		  return true;
       	    		  }
       	    		})
       	    return false;
           }
	   });
	   $(".deleteClass").click(function () 
	       		{
			        	 swal({
		            		title: ' Do you want to delete?',
		            		  type: 'warning',
		            		  showCancelButton: true,
		            		  confirmButtonText: 'Yes',
		            		  cancelButtonText: 'No',
		            		  confirmButtonColor: '#d33',
		            		  /* reverseButtons: true */
		        	    }).then((result) => {
		        	    	  if (result.value) { 
		        	    		  swal("Success", "Deleted Successfully ", "success");
		        	    		  }
		        	    		})  
		        	    		return false;
	       		});
  		
	   $('#viewTable').DataTable( {
	        "pagingType": "full_numbers"
	    } );
 		
	});
function edit(intleveldetailid){
	$("#leveldetailidHiddenId").val(intleveldetailid);
	$("form[name='editOrgan']").submit();
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