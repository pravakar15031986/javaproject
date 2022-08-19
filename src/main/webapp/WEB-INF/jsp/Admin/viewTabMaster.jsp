<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script language="javascript">
	pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";

</script>
<script>
function editTabMaster(tabId){
	//alert(tabId);
	 $("#hdnTabId").val(tabId);
    $("form[name='form']").submit();
		}

function deleteTabMaster(tabId,status){
	//alert(tabId);
	 $("#hiddenTabId").val(tabId);
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


<div id="mainTable">

<form:form action="editTabMaster" name="form" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


<input type="hidden" name="tabId" id="hdnTabId"/>
</form:form>

<form:form action="deleteTabMaster" name="form1" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


<input type="hidden" name="tabId" id="hiddenTabId"/>
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
              <li><a href="addTabMaster">Add</a></li>
              <li class="active"><a href="viewTabMaster" >View</a></li>
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
                  	<form:form class="col-sm-12 form-horizontal customform" action="viewTabMaster"  method="post" modelAttribute="searchVo">
		              
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

		              
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
                   <th>#Sl No</th>
                     <th>Function Name</th>
                     <th>Button Name</th>
                     <th>Tab Name</th>
                     <th>File Name</th>
                     <th>Action1</th>
                     <th>Action2</th>
                     <th>Action3</th>
                     <th>Status</th>
                      <th>Edit</th>
                       <th>Delete</th>
                   </thead>
              <tbody>
    
    <c:forEach items="${tabListData}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.functionName}</td>
    <td>${vo.buttonName}</td>
    <td>${vo.tabName}</td>
    <td>${vo.fileName}</td>
    <td><c:choose>
          <c:when test="${vo.addData == 1}">Add</c:when>
			<c:otherwise></c:otherwise>
		</c:choose></td>
    <td><c:choose>
          <c:when test="${vo.viewData == 1}">View</c:when>
			<c:otherwise></c:otherwise>
		</c:choose></td>
    <td><c:choose>
          <c:when test="${vo.manageData == 1}">Manage</c:when>
			<c:otherwise></c:otherwise>
		</c:choose></td>
    <td><c:choose>
          <c:when test="${vo.bitStatus == 0}">Active</c:when>
			<c:otherwise>Inactive</c:otherwise>
		</c:choose></td>
    <td><a data-placement="top" data-toggle="tooltip" title="Edit" onclick="editTabMaster('${vo.tabId}',1);"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></a></td>
    <td><a data-placement="top" data-toggle="tooltip" title="Delete" onclick="deleteTabMaster('${vo.tabId}','${vo.bitStatus}');"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></a></td>
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
               </div> </div>
              

            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
 

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
    