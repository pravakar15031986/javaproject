<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script language="javascript">
	/* pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";
 */

 function modifyData(levId){
	 $("#levelDetailId").val(levId);
     $("form[name='modifyFrm']").submit();
	

}
</script>



<form action="viewModifyCompany" name="modifyFrm" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


	<input type="hidden" name="levelDetailId" id="levelDetailId"/>
	<input type="hidden" name="hierarchyID" value="${countryVo.hierarchyId}" />
	<input type="hidden" name="subnodeid" value="${countryVo.subHierarchyId}"/>
	<input type="hidden" name="levelId" value="${levelId}"/>  
</form>	

<%-- <form action="viewModifyCountry" name="modifyFrm" method="post">
	<input type="hidden" name="levelDetailId" id="levelDetailId"/>
	<input type="hidden" name="hierarchyID" value="${countryVo.hierarchyId}" />
	<input type="hidden" name="subnodeid" value="${countryVo.subHierarchyId}"/>
	<input type="hidden" name="levelId" value="${levelId}"/>  
</form>	 --%>
<div class="row">
		 <div class="col-xs-12">
          <div class="nav-tabs-custom">
          	
           <ul class="nav nav-tabs">
              <li ><a href="addSubnodeInfo?hierarchyID=${countryVo.hierarchyId}&subnodeid=${countryVo.subHierarchyId}&levelId=${levelId}" >Add</a></li>
              <li class="active"><a href="viewCountry?hierarchyID=${countryVo.hierarchyId}&subnodeid=${countryVo.subHierarchyId}" >View</a></li>
           </ul>
            <div class="clearfix"></div>
            <div class="tab-content">
           
            
              <div class="tab-pane active" id="fa-icons">
    <section id="new">
	<div class="box collapsed-box">
        
        <!-- /.box-header -->
        
      </div></section>
                 </div>
						  <div class="table-responsive">
						   
                   <div class="col-md-12">
                   
                  		<c:if test="${not empty errMsg}">
                  			<div class="alert alert-custom-danger fade in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Error!</strong>${subnodeName[0]} ${errMsg}
							</div>
                  		</c:if>
                		<c:if test="${not empty msg}">
                			<div class="alert alert-custom-success fade in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Success!</strong>${subnodeName[0]} ${msg}
							</div>
                		</c:if>
                		
                	</div>
                
               <table class="mytable">
                   <c:if test="${levelId eq 1}">
                 
                   <thead>
                   		<th>Sl.No</th>
                    	<th>${subnodeName[0]} Name</th>
                     	<th>${subnodeName[0]} Code</th>
                     	<th>Status</th>
                     	<th>Action</th>
                   </thead>
              <tbody>
    
    <c:forEach items="${countryList}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.levelName}</td>
    <td>${vo.alias}</td>
    <td>
    <c:choose>
    <c:when test="${vo.bitStatus eq 0}"><font color="green">Active</font></c:when>
    <c:otherwise><font color="red">Inactive</font></c:otherwise>
    </c:choose>
    </td>
  	<td align="center">
  	
  	
  	 <a href="javascript:void(0);" onclick="modifyData('${vo.levelDetailId}');" ><span class="glyphicon glyphicon-pencil"></span></a>
  	</td>
     
    </tr>
    </c:forEach>
    </tbody>
          </c:if>
                      <c:if test="${levelId eq 2}">
                 
                   <thead>
                   		<th>Sl.No</th>
                    	<th>${subnodeName[0]} Name</th>
                     	<th>${subnodeName[1]} Name</th>
                     	<th>${subnodeName[1]} Code</th>
                     	<th>Status</th>
                     	<th>Action</th>
                   </thead>
              <tbody>
    
    <c:forEach items="${countryList1}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.levelname2}</td>
    <td>${vo.levelname1}</td>
    <td>${vo.levelalis}</td>
    <td>
    <c:choose>
    <c:when test="${vo.status eq 0}"><font color="green">Active</font></c:when>
    <c:otherwise><font color="red">Inactive</font></c:otherwise>
    </c:choose>
    </td>
  	<td align="center">
  	
  	
  	 <a href="javascript:void(0);" onclick="modifyData('${vo.leveldtid1}');" ><span class="glyphicon glyphicon-pencil"></span></a>
  	</td>
     
    </tr>
    </c:forEach>
    </tbody>
          </c:if>
          <c:if test="${levelId eq 3}">
                 
                   <thead>
                   		<th>Sl.No</th>
                    	<th>${subnodeName[0]} Name</th>
                     	<th>${subnodeName[1]} Name</th>
                     	<th>${subnodeName[2]} Name</th>
                     	<th>Status</th>
                     	<th>Action</th>
                   </thead>
              <tbody>
    
    <c:forEach items="${countryList1}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.levelname3}</td>
    <td>${vo.levelname2}</td>
    <td>${vo.levelname1}</td>
    <td>
    <c:choose>
    <c:when test="${vo.status eq 0}"><font color="green">Active</font></c:when>
    <c:otherwise><font color="red">Inactive</font></c:otherwise>
    </c:choose>
    </td>
  	<td align="center">
  	
  	
  	 <a href="javascript:void(0);" onclick="modifyData('${vo.leveldtid1}');" ><span class="glyphicon glyphicon-pencil"></span></a>
  	</td>
     
    </tr>
    </c:forEach>
    </tbody>
          </c:if>
           <c:if test="${levelId eq 4}">
                 
                   <thead>
                   		<th>Sl.No</th>
                    	<th>${subnodeName[0]} Name</th>
                     	<th>${subnodeName[1]} Name</th>
                     	<th>${subnodeName[2]} Name</th>
                     	<th>${subnodeName[3]} Name</th>
                     	<th>Status</th>
                     	<th>Action</th>
                   </thead>
              <tbody>
    
    <c:forEach items="${countryList1}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.levelname4}</td>
    <td>${vo.levelname3}</td>
    <td>${vo.levelname2}</td>
    <td>${vo.levelname1}</td>
    <td>
    <c:choose>
    <c:when test="${vo.status eq 0}"><font color="green">Active</font></c:when>
    <c:otherwise><font color="red">Inactive</font></c:otherwise>
    </c:choose>
    </td>
  	<td align="center">
  	
  	
  	 <a href="javascript:void(0);" onclick="modifyData('${vo.leveldtid1}');" ><span class="glyphicon glyphicon-pencil"></span></a>
  	</td>
     
    </tr>
    </c:forEach>
    </tbody>
          </c:if>
           <c:if test="${levelId eq 5}">
                 
                   <thead>
                   		<th>Sl.No</th>
                    	<th>${subnodeName[0]} Name</th>
                     	<th>${subnodeName[1]} Name</th>
                     	<th>${subnodeName[2]} Name</th>
                     	<th>${subnodeName[3]} Name</th>
                     	<th>${subnodeName[4]} Name</th>
                     	<th>Status</th>
                     	<th>Action</th>
                   </thead>
              <tbody>
    
    <c:forEach items="${countryList1}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.levelname5}</td>
    <td>${vo.levelname4}</td>
    <td>${vo.levelname3}</td>
    <td>${vo.levelname2}</td>
    <td>${vo.levelname1}</td>
    <td>
    <c:choose>
    <c:when test="${vo.status eq 0}"><font color="green">Active</font></c:when>
    <c:otherwise><font color="red">Inactive</font></c:otherwise>
    </c:choose>
    </td>
  	<td align="center">
  	
  	
  	 <a href="javascript:void(0);" onclick="modifyData('${vo.leveldtid1}');" ><span class="glyphicon glyphicon-pencil"></span></a>
  	</td>
     
    </tr>
    </c:forEach>
    </tbody>
          </c:if>
            <c:if test="${levelId eq 6}">
                 
                   <thead>
                   		<th>Sl.No</th>
                    	<th>${subnodeName[0]} Name</th>
                     	<th>${subnodeName[1]} Name</th>
                     	<th>${subnodeName[2]} Name</th>
                     	<th>${subnodeName[3]} Name</th>
                     	<th>${subnodeName[4]} Name</th>
                     	<th>${subnodeName[5]} Name</th>
                     	<th>Status</th>
                     	<th>Action</th>
                   </thead>
              <tbody>
    
    <c:forEach items="${countryList1}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.levelname6}</td>
    <td>${vo.levelname5}</td>
    <td>${vo.levelname4}</td>
    <td>${vo.levelname3}</td>
    <td>${vo.levelname2}</td>
    <td>${vo.levelname1}</td>
    <td>
    <c:choose>
    <c:when test="${vo.status eq 0}"><font color="green">Active</font></c:when>
    <c:otherwise><font color="red">Inactive</font></c:otherwise>
    </c:choose>
    </td>
  	<td align="center">
  	
  	
  	 <a href="javascript:void(0);" onclick="modifyData('${vo.leveldtid1}');" ><span class="glyphicon glyphicon-pencil"></span></a>
  	</td>
     
    </tr>
    </c:forEach>
    </tbody>
          </c:if>
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

