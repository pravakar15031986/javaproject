<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script language="javascript">
	/* pageHeader="";
	strFirstLink="Welcome";
	strLastLink=""; */

	 function modifyData(levId){
		 $("#levelDetailId").val(levId);
	     $("form[name='modifyFrm']").submit();
		

	}

</script>

<form action="viewModifyCompany" name="modifyFrm" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


	<input type="hidden" name="levelDetailId" id="levelDetailId"/>
	<input type="hidden" name="hierarchyID" value="${companyvo.hierarchyId}" />
	<input type="hidden" name="subnodeid" value="${companyvo.subHierarchyId}"/> 
</form>

<div class="row">


                	
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
          	
           <ul class="nav nav-tabs">
             <li ><a href="addCompany?hierarchyID=${companyvo.hierarchyId}&subnodeid=${companyvo.subHierarchyId}" >Add</a></li>
              <li class="active"><a href="viewComany?hierarchyID=${companyvo.hierarchyId}&subnodeid=${companyvo.subHierarchyId}">View</a></li> 
            </ul>
            <div class="clearfix"></div>
            <div class="tab-content">
           
            
              <div class="tab-pane active" id="fa-icons">
    <section id="new">
	<div class="box collapsed-box">
       
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
                   <th>Sl.No</th>
                    <th>Company Name</th>
                     <th>Company Code</th>
                     <th>Status</th>
                      <th>Action</th>
                     
                   </thead>
              <tbody>
    
    <c:forEach items="${companyList}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.levelName}</td>
    <td>${vo.alias}</td>
    <td> <c:choose>
    <c:when test="${vo.bitStatus eq 0}"><font color="green">Active</font></c:when>
    <c:otherwise><font color="red">Inactive</font></c:otherwise>
    </c:choose></td>
  <td align="center">
   
    <a href="javascript:void(0);" onclick="modifyData('${vo.levelDetailId}');" ><span class="glyphicon glyphicon-pencil"></span></a>
  	
   
  </td>
    
     
     
    </tr>
    </c:forEach>
    </tbody>
        
</table>

<div class="clearfix"></div>

                
            </div>
               </div>
              

            </div>
          </div>
        </div>
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

