<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="wrsis/css/dataTables.bootstrap4.min.css"/>
<script src="wrsis/js/jquery.dataTables.min.js"></script>
<script src="wrsis/js/dataTables.bootstrap4.min.js"></script>

<script>
function editGlobalLink(globalLinkId){
	//alert(globalLinkId);
	 $("#hdnGlobalLinkId").val(globalLinkId);
    $("form[name='form']").submit();
		}

function deleteGlobalLink(globalLinkId,status){
	//alert(globalLinkId);
	 $("#hiddenGlobalLinkId").val(globalLinkId);
	 $("#hiddenStatus").val(status);
    $("form[name='form1']").submit();
		}
</script>
<style>
.breadcrumb>li+li:before
{
display:none;
}
</style>


<%-- <div id="mainTable">

<form:form action="editGlobalLink" name="form" method="post">
<input type="hidden" name="globalLinkId" id="hdnGlobalLinkId"/>
</form:form>

<form:form action="deleteGlobalLink" name="form1" method="post">
<input type="hidden" name="globalLinkId" id="hiddenGlobalLinkId"/>
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
              <li><a href="addGlobalLink">Add</a></li>
              <li class="active"><a href="viewGlobalLink" >View</a></li>
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
                  	 <form:form class="col-sm-12 form-horizontal customform" action="viewGlobalLink"  method="post" modelAttribute="searchVo">
		              
		                 <div class="form-group">
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
                  	
                  </div>
                  
				 </section>
              
            </div>
          </div>
        </div>
      </div></section>
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
                
               <table class="mytable">
                   
                   <thead>
                   <tr>
                   <th>#Sl No</th>
                    <th>Global Link</th>
                     <th>Show on Home Page</th>
                     <th>Status</th>
                      <th>Edit</th>
                       <th>Delete</th>
                       </tr>
                   </thead>
              <tbody>
    
    <c:forEach items="${globalList}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.globalLinkName}</td>
    <td><c:choose>
          <c:when test="${vo.bitHomePage == 0}">Yes</c:when>
			<c:otherwise>No</c:otherwise>
		</c:choose></td>
    <td> <c:choose>
          <c:when test="${vo.bitStatus == 0}">Active</c:when>
			<c:otherwise>Inactive</c:otherwise>
		</c:choose></td>
    <td align="center" ><a data-placement="top" data-toggle="tooltip" title="Edit" id="edit${vo.globalLinkId}" onclick="editGlobalLink('${vo.globalLinkId}',1);"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></a></td>
    <td><a data-placement="top" data-toggle="tooltip" title="Delete" onclick="deleteGlobalLink('${vo.globalLinkId}','${vo.bitStatus}');"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></a></td>
    </tr>
    </c:forEach>
    </tbody>
        
</table>

<div class="clearfix"></div>
<ul class="pagination pull-right">
  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul>
                
            </div>
               </div>
              

            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div> --%>
 
 
 <div class="mainpanel">
 <form:form action="editGlobalLink" name="form" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

 
<input type="hidden" name="globalLinkId" id="hdnGlobalLinkId"/>
</form:form>

<form:form action="deleteGlobalLink" name="form1" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


<input type="hidden" name="globalLinkId" id="hiddenGlobalLinkId"/>
<input type="hidden" name="status" id="hiddenStatus"/>
</form:form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Global Link</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Link</li>
                           <li class="breadcrumb-item active" aria-current="page">Global Link</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link " href="addGlobalLink">Add</a>
                              <a class="nav-item nav-link active" href="viewGlobalLink">View</a>
                           </ul>
                           
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                            
                  	 <form:form class="col-sm-12 form-horizontal customform" action="viewGlobalLink"  method="post" modelAttribute="searchVo">
		              
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
                    <th>Global Link</th>
                     <th>Link Icon</th>
                     <th>Status</th>
                      <th>Edit</th>
                       <th>Change Status</th>
                       </tr>
                   </thead>
              <tbody>
    
    <c:forEach items="${globalList}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.globalLinkName}</td>
    <td>${vo.vchicon}</td>
    <%-- <td><c:choose>
          <c:when test="${vo.bitHomePage == 0}">Yes</c:when>
			<c:otherwise>No</c:otherwise>
		</c:choose></td> --%>
    <td> <c:choose>
          <c:when test="${vo.bitStatus == false}">Active</c:when>
			<c:otherwise>Inactive</c:otherwise>
		</c:choose></td>
    <td><a data-placement="top" data-toggle="tooltip" title="Edit" id="edit${vo.globalLinkId}" onclick="editGlobalLink('${vo.globalLinkId}',1);"><button class="btn btn-primary btn-sm" data-title="Edit" data-toggle="modal" data-target="#edit" ><i class="icon-edit1"></i></button></a></td>
    <td>
    
    
						   <c:if test="${ vo.bitStatus eq true }">
						   	 <a   href="deactiveGLink/${vo.globalLinkId}/0"  title="Active"><button class="btn  btn-info btn-sm" data-title="Active"  ><i class="fa fa-check" aria-hidden="true"></i></button></a>
						   </c:if>
						 
						  <c:if test="${ vo.bitStatus eq false }">
						 	  <a   href="deactiveGLink/${vo.globalLinkId}/1"  title="Deactive"><button class="btn btn-danger btn-sm" data-title="Deactive"  ><i class="fa fa-times" aria-hidden="true"></i></button></a>
						  </c:if>
    
   <%--  <a data-placement="top" data-toggle="tooltip" title="Delete" onclick="deleteGlobalLink('${vo.globalLinkId}','${vo.bitStatus}');"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><i class="icon-trash-21"></i></button></a>
    --%> 
    
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
</script>

         
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2();
    
  //Date range picker
    $('#reservation, #reservation1').daterangepicker()
    
  

    //Date picker
    $('#datepicker, #datepicker1').datepicker({
      autoclose: true
      
    })
    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    

    //Timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass   : 'iradio_minimal-blue'
    })
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass   : 'iradio_minimal-red'
    })
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass   : 'iradio_flat-green'
    })
  });
    </script>

