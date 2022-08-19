<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
 
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


 <div class="mainpanel">
  <form:form action="editRegion" name="form" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

  
<input type="hidden" name="demographyId" id="hdnRegionId"/>
</form:form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Region</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Demography</li>
                           <li class="breadcrumb-item active" aria-current="page">Region</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="addregion">Add</a>
                              <a class="nav-item nav-link active"  href="viewregion" >View</a>
                           </ul>
                    
                        </div>
                        <!-- Search Panel -->
                        <form:form class="col-sm-12 form-horizontal customform" action="viewregion"  method="post" modelAttribute="searchVo">
                      
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        <div class="search-container">
                           <div class="search-sec">
                              <%-- <div class="form-group">
                              <div class="row">
                                 <label class="col-sm-2 ">Country</label>
                                    <div class="col-sm-3">
                                       <select class="form-control">
                                          <option value="0">--Select--</option>
                                          <c:forEach items="${countrylist}" var="vo">
                                          <option value="${vo.demographyId}">${vo.demographyName}</option>
                                          </c:forEach>
                                       </select>
                                    </div>
                                    
                                 </div>
                                </div> --%>
                                <div class="form-group">
                                 <div class="row">
                                 <label class="col-lg-2 ">Region Name</label>
                                    <div class="col-lg-3">
                                       <form:input class="form-control" path="regionName" placeholder="Region Name"/>
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
                        </form:form>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        
                        <div class="card-body">
                           <div class="table-responsive">
                           		
                           
                                    <table data-toggle="table" id="myTable" class="table table-hover table-bordered">
                   
                   <thead>
                   <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Country Name</th>
                                       <th>Region Name</th>
                                       <th>Short Name</th>
                                       <th>Description</th>
                                       <th>Status</th>
                                       <th width="100px">Action</th>
                       </tr>
                   </thead>
              <tbody id="responseBody">
    
    <c:forEach items="${regionlist}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.countryName}</td>
    <td>${vo.regionName}</td>
    <td>${vo.alias}</td>
    <td>${vo.description}</td>
    <td>
    	<c:choose>
          <c:when test="${vo.status == false}">Active</c:when>
			<c:otherwise>Inactive</c:otherwise>
		</c:choose>
	</td>
<td><a data-placement="top" data-toggle="tooltip" title="Edit" id="edit${vo.regionId}" onclick="editRegion('${vo.regionId}');"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><i class="icon-edit1"></i></button></a></td>    </c:forEach>
    </tbody>
</table>
                            
                           </div>
                           
                           <div id="showPageNId">
                           </div>
                           
                           <div style="float: right;" id="pageId">
							<ul class="pagination">
  							</ul>
						</div>
						
					
                           
                          
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         

<script>

</script>
         
         
<script>
function editRegion(regionId){
	//alert(globalLinkId);
	 $("#hdnRegionId").val(regionId);
     $("form[name='form']").submit();
		}
</script>
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