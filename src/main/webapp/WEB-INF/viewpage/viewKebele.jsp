<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="wrsis/pagejs/demography.js"></script>


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
  <form:form action="editKebele" name="form" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

  
<input type="hidden" name="demographyId" id="hdnKebeleId"/>
</form:form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Kebele</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Demography</li>
                           <li class="breadcrumb-item active" aria-current="page">Kebele </li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="addkebele">Add</a>
                              <a class="nav-item nav-link active"  href="viewkebele" >View</a>
                           </ul>
                    
                        </div>
                        <!-- Search Panel -->
                        <form:form class="col-sm-12 form-horizontal customform" action="viewkebele"  method="post" modelAttribute="searchVo">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        
                        <div class="search-container">
                           <div class="search-sec">
                              <div class="form-group">
                              <div class="row">
                                 <%-- <label class="col-sm-2 ">Country</label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="country" onchange="getDemographyData(this.value,'region')">
                                          <option value="0">--Select--</option>
                                          <c:forEach items="${countrylist}" var="vo">
                                          <option value="${vo.demographyId}">${vo.demographyName}</option>
                                          </c:forEach>
                                       </select>
                                    </div> --%>
                                    <label class="col-sm-2 ">Region</label>
                                    <div class="col-sm-3">
                                       <form:select class="form-control" path="regionId" id="region" onchange="getDemographyData(this.value,'zone')">
                                          <form:option value="0">--Select--</form:option>
                                          <form:options items="${regionlist}" itemLabel="demographyName" itemValue="demographyId" />
                                          <%-- <c:forEach items="${regionlist}" var="vo">
                                          <option value="${vo.demographyId}">${vo.demographyName}</option>
                                          </c:forEach> --%>
                                       </form:select>
                                    </div>
                                    <label class="col-sm-2 ">Zone</label>
                                    <div class="col-sm-3">
                                    <form:select class="form-control" path="zoneId" id="zone" onchange="getDemographyData(this.value,'woreda')">
                                          <form:option value="0">--Select--</form:option>
                                          <form:options items="${zonelist}" itemLabel="demographyName" itemValue="demographyId" />
                                    </form:select>
                                       <%-- <select class="form-control" name="zoneId" id="zone" onchange="getDemographyData(this.value,'woreda')">
                                          <option value="0">--Select--</option>
                                          <c:forEach items="${zonelist}" var="vo">
                                          <option value="${vo.demographyId}">${vo.demographyName}</option>
                                          </c:forEach>
                                       </select> --%>
                                    </div>
                                 </div>
                                </div>
                                <div class="form-group">
                                 <div class="row">
                                 
                                    <label class="col-sm-2 ">Woreda</label>
                                    <div class="col-sm-3">
                                    <form:select class="form-control" path="woredaId" id="woreda">
                                          <form:option value="0">--Select--</form:option>
                                          <form:options items="${woredalist}" itemLabel="demographyName" itemValue="demographyId" />
                                    </form:select>
                                       <%-- <select class="form-control" name="woredaId" id="woreda">
                                          <option value="0">--Select--</option>
                                          <c:forEach items="${woredalist}" var="vo">
                                          <option value="${vo.demographyId}">${vo.demographyName}</option>
                                          </c:forEach>
                                       </select> --%>
                                    </div>
                                   <label class="col-lg-2 ">Kebele Name</label>
                                    <div class="col-lg-3">
                                       <form:input type="text" class="form-control" path="kebeleName" placeholder="Kebele Name" data-bv-field="fullName" />
                                    </div>
                                 </div>
                              </div>
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
                                       <th>Country Name</th>
                                       <th>Region Name</th>
                                       <th>Zone Name</th>
                                       <th>Woreda Name</th>
                                       <th>Kebele Name</th>
                                       <th>Short Name</th>
                                       <th>Description</th>
                                       <th>Status</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                     <c:forEach items="${kebelelist}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.countryName}</td>
    <td>${vo.regionName}</td>
    <td>${vo.zoneName}</td>
    <td>${vo.woredaName}</td>
    <td>${vo.kebeleName}</td>
    <td>${vo.alias}</td>
    <td>${vo.description}</td>
    <td>
    	<c:choose>
          <c:when test="${vo.status == false}">Active</c:when>
			<c:otherwise>Inactive</c:otherwise>
		</c:choose>
	</td>
<td>
<a data-placement="top" data-toggle="tooltip" title="Edit" id="edit${vo.kebeleId}" onclick="editKebele('${vo.kebeleId}');">
<button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
<i class="icon-edit1"></i>
</button>
</a>
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
function editKebele(demographyId){
	//alert(globalLinkId);
	 $("#hdnKebeleId").val(demographyId);
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