<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="wrsis/css/dataTables.bootstrap4.min.css"/>
<script src="wrsis/js/jquery.dataTables.min.js"></script>
<script src="wrsis/js/dataTables.bootstrap4.min.js"></script>

<style>
.breadcrumb>li+li:before
{
display:none;
}
</style>
<script type="text/javascript">
function editFunctionMaster(functionId){
//alert(functionId);
$("#hdnfunctionId").val(functionId);
    $("form[name='form']").submit();
}

function deleteFunctionMaster(functionId,status){
//alert("status"+status);
$("#hiddenfunctionId").val(functionId);
$("#hiddenStatus").val(status);
    $("form[name='form1']").submit();
}
</script>

<div class="mainpanel">
<form:form action="editFunctionMaster" name="form" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


<input type="hidden" name="functionId" id="hdnfunctionId"/>
</form:form>

<form:form action="deleteFunctionMaster" name="form1" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


<input type="hidden" name="functionId" id="hiddenfunctionId"/>
<input type="hidden" name="status" id="hiddenStatus"/>
</form:form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Function</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Link</li>
                           <li class="breadcrumb-item active" aria-current="page">Function Master</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link " href="addFunctionMaster">Add</a>
                              <a class="nav-item nav-link active" href="viewFunctionMaster">View</a>
                           </ul>
                           
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                            
                  	 <form:form class="col-sm-12 form-horizontal customform" action="viewFunctionMaster"  method="post" modelAttribute="searchVo">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                  	 
		              
		              <div class="form-group">
                                 <div class="row">
                                    
                                    <label class="col-sm-2 ">Status</label>
                                    <div class="col-sm-3">
                                       <form:select path="dataId" id="status" class="form-control" style="width: 100%;" >
								          <option value="0">Select Status</option>
				     			          <form:options items="${statusList}" itemValue="dataId" itemLabel="dataName" />
									   </form:select>
                                    </div>
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                 </div>
                       </div>
		               
		       </form:form>  
                  	
                           </div>
                           <div class="text-center"> <a class="searchopen" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Search"> <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                           <div class="col-md-12">
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
                	</div>
                
               <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                   
                   <thead>
                   <tr>
                   <th>#Sl No</th>
                    <th>Function Name</th>
                     <th>File Name</th>
                     <th>Description</th>
                     <th>Status</th>
                      <th align="center" style="text-align:center">Edit</th>
                       <th align="center" style="text-align:center">Change Status</th>
                       </tr>
                   </thead>
              <tbody>
    
   <c:if test="${not empty functionList}"> 
    <c:forEach items="${functionList}" var="vo" varStatus="counter">
    <c:set var="i" value="${i+1}" />	
    
    
    <tr>
 
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.functionName}</td>
    <td>${vo.fileName}</td>
    <td>${vo.description}</td>
    <td> <c:choose>
          <c:when test="${vo.bitStatus == false}">Active</c:when>
<c:otherwise>Inactive</c:otherwise>
</c:choose></td>
    <td align="center" ><a data-placement="top" data-toggle="tooltip" title="Edit" id="edit${vo.functionId}" onclick="editFunctionMaster('${vo.functionId}',1);"><button class="btn btn-primary btn-sm" data-title="Edit" data-toggle="modal" data-target="#edit" ><i class="icon-edit1"></i></button></a></td>
    <td>
    <c:if test="${ vo.bitStatus eq true }">
						   	 <a   href="deactiveFunction/${vo.functionId}/0"  title="Active"><button class="btn  btn-info btn-sm" data-title="Active"  ><i class="fa fa-check" aria-hidden="true"></i></button></a>
						   </c:if>
						 
						  <c:if test="${ vo.bitStatus eq false }">
						 	  <a   href="deactiveFunction/${vo.functionId}/1"  title="Deactive"><button class="btn btn-danger btn-sm" data-title="Deactive"  ><i class="fa fa-times" aria-hidden="true"></i></button></a>
						  </c:if>
    </td>
    <%-- <td align="center"><a data-placement="top" data-toggle="tooltip" title="Delete" onclick="deleteFunctionMaster('${vo.functionId}','${vo.bitStatus}');"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><i class="icon-trash"></i></button></a></td> --%>
   
    </tr>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     
     
    </c:forEach>
    </c:if>
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
</script>








<%-- <div id="mainTable">

 
<form:form action="editFunctionMaster" name="form" method="post">
<input type="hidden" name="functionId" id="hdnfunctionId"/>
</form:form>

<form:form action="deleteFunctionMaster" name="form1" method="post">
<input type="hidden" name="functionId" id="hiddenfunctionId"/>
<input type="hidden" name="status" id="hiddenStatus"/>
</form:form>

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
              <li><a href="addFunctionMaster">Add</a></li>
              <li class="active"><a href="viewFunctionMaster" >View</a></li>
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
               
               
               
        <form:form class="col-sm-12 form-horizontal customform" action="viewFunctionMaster"  method="post" modelAttribute="searchVo">
        <form:hidden path="functionId"></form:hidden>  
            
       <form:hidden path="hdn_PageNo" id="hdn_PageNo" value="${intCurrPage}"/>
      <form:hidden path="hdn_RecNo" id="hdn_RecNo" value="${intPgSize}"/> 
      <form:hidden path="hdn_IsPaging" id="hdn_IsPaging" value="${isPaging}"/>
                 <div class="form-group" >
                  <label for="inputEmail3" class="col-sm-2 control-label">Status</label>
                  <div class="col-sm-4">
      <form:select path="dataId" id="status" class="form-control" style="width: 100%;" >
          <option value="0">Select Status</option>
                <form:options items="${statusList}" itemValue="dataId" itemLabel="dataName" />
      </form:select>
                  </div>
                  <label></label><div></div>
                </div> 
                
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                   <button type="submit" class="btn btn-default">Cancel</button>
                <button type="submit" class="btn btn-info">Search</button>
                  </div>
                </div>
               
       </form:form>  
                  
</section>
              
            </div>
          </div>
        </div>
      </div>
      
      
      
      <div class="table-responsive">

               <div class="col-md-12">
                  <c:if test="${not empty errMsg}">
                  <div class="alert alert-custom-danger fade in alert-dismissible" style="margin-top:18px;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
    <strong>Error!</strong>${errMsg}
</div>
                  </c:if>
                <c:if test="${not empty msg}">
                <div class="alert alert-custom-success fade in alert-dismissible" style="margin-top:18px;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
    <strong>Success!</strong>${msg}
</div>
                </c:if>
                </div>  
               <table id="mytable" class="mytable">
                   
                   <thead>
                  
                   <th>#Sl No</th>
                    <th>Function Name</th>
                     <th>File Name</th>
                     <th>Description</th>
                     <th>Status</th>
                      <th align="center" style="text-align:center">Edit</th>
                       <th align="center" style="text-align:center">Delete</th>
                   </thead>
              <tbody>
              
              
                 <div class="pagingResult" style="text-align:right; margin:5px 10px;">
					 <c:choose>
 	  						<c:when test="${intTotalRec > intPgSize  && isPaging==0}">
     							<script type="text/javascript">
						    $(document).ready(function(){ 
							 ShowPaging("${intTotalRec}","${intCurrPage}","${intPgSize}",0);
						    });					   		    
						</script>
						<span class="utilBtnTotalPage" ><span id="pagg_results"></span> <strong><a onclick="AlternatePaging();" href="#">${intTotalRec}</a></strong></span>
			     </c:when>
   				 <c:otherwise>
         				<span class='utilBtnTotalPage'>All Results: <a onclick='AlternatePaging();' href='#'>${intTotalRec}</a></span>		    
        			<br />
   				 </c:otherwise>
   	 			</c:choose>	    					    				   					    
                </div> 
                
                
     <c:if test="${not empty functionList}"> 
    <c:forEach items="${functionList}" var="vo" varStatus="counter">
    <c:set var="i" value="${i+1}" />	
    						 	
	<c:if test="${vo.bitStatus == 0}" >		
 <tr>
 
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.functionName}</td>
    <td>${vo.fileName}</td>
    <td>${vo.description}</td>
    <td> <c:choose>
          <c:when test="${vo.bitStatus == 0}">Active</c:when>
<c:otherwise>Inactive</c:otherwise>
</c:choose></td>
    <td align="center" ><a data-placement="top" data-toggle="tooltip" title="Edit" id="edit${vo.functionId}" onclick="editFunctionMaster('${vo.functionId}',1);"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></a></td>
    <td align="center"><a data-placement="top" data-toggle="tooltip" title="Delete" onclick="deleteFunctionMaster('${vo.functionId}','${vo.bitStatus}');"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></a></td>
   
    </tr></c:if>
    
    
     <c:if test="${vo.bitStatus == 1}" >
     <tr>
    
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.functionName}</td>
    <td>${vo.fileName}</td>
    <td>${vo.description}</td>
    <td> <c:choose>
          <c:when test="${vo.bitStatus == 0}">Active</c:when>
<c:otherwise>Inactive</c:otherwise>
</c:choose></td>
    <td align="center" ><a data-placement="top" data-toggle="tooltip" title="Edit" id="edit${vo.functionId}" onclick="editFunctionMaster('${vo.functionId}',1);"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></a></td>
    <td align="center"><a data-placement="top" data-toggle="tooltip" title="Delete" onclick="deleteFunctionMaster('${vo.functionId}','${vo.bitStatus}');"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></a></td>
   
     
     </tr></c:if>
     
     
    </c:forEach>
    </c:if>
    </tbody>
        
</table>

<!-- <div class="clearfix"></div>
<ul class="pagination pull-right">
  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
  <li class="active"><a href="#">1</a></li>
  
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul>

 -->  
 
 <input type="hidden" name="hdnStartIndex" id="hdnStartIndex" value="${starrec+1}" >
   <input type="hidden" name="hdnEndIndex" id="hdnEndIndex"  value="${endrec}" >  
   
                 
            </div>
      
        <c:if test="${intTotalRec > intPgSize  && isPaging==0}">
		           
		          		 <div class="clearfix" align="right" style="margin-top:10px;">
                      		<div class="pagination pagination-right">
                       		<ul id='pagging'>                    
                       		</ul>
                      	  </div>
                   	</div>		 
		           </c:if>
      </section>
                 </div>
  
                 
                 
               </div>
              

            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
       --%>


