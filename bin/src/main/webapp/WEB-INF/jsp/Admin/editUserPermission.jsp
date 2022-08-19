<%@page import="java.util.stream.Collectors"%>
<%@page import="com.csm.ORSAC.adminconsole.responsedto.PrimaryLinkResponseDto"%>
<%@page import="org.springframework.data.domain.PageRequest"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>

<style>
.datepicker-dropdown{z-index: 9999!important}
.mybtn{margin:5px;}
.mypanel{margin-bottom:10px;}


.mycollapse .panel {
    border: 0px solid #46bbff!important;
    margin-bottom: 5px!important;
}
.panel-group {
    margin-bottom: 0px!important;
}

.myradio{margin-bottom:9px}
.table-bordered td{
    padding: 1px!important;
	vertical-align: middle!important;
    padding-left: 16px!important;
    padding-top: 4px!important;
}
.panel-body {
    border: 1px solid #d4d0d0!important;
    border-top: 1px solid #f5f5f5!important;
}
</style>

<script>
$(function () {
    $('.select2').select2();
    });
 /*--------------------Set Permission --------------------------------------------*/
 
 function setPermission(){
	 
	 var data = new Object();
	 var user =[];
	 var plinks=[];
	 
//	data.uid=  ${data.userid};
	 
	
	 var i = 0;
	 
	 var k=0
	 $("#globallinks div div div div table tbody").find('tr').each(function(){
		//alert('Global link id'+ $(this).parent().parent().parent().parent().prop("id"));
		 i++;
		 $row = $(this).clone();
		if($row.find('td:eq( 0 ) input').is(':checked')){
			var plink = new Object();
			plink.pLinkId =$row.find('td:eq( 0 ) input').val();
			
			//alert('PrimaryLink id'+$row.find('td:eq( 0 ) input').val());
			  for(var j = 1 ; j< 4 ;j++){
				 if($row.find('td:eq('+ j +') input').is(':checked'))
					 {
					 plink.action = j;
						// alert('Action'+j);
					 }
			}  
			  plinks[k] = plink;
			  k= k+1;
		}
	 });
	 
	 data.primaryLink=plinks;
	   if(data.primaryLink.length == 0){
		   $("#errmsg span").html('Please select primary link.');
		   $("#errmsg").show();
		 return false;
	 } 
	 
	 else if(data.primaryLink.length > 0 && (data.primaryLink[0].action == undefined || data.primaryLink[0].action == 0)){
		 $("#errmsg span").html('Please select action.');
		 $("#errmsg").show();
		   return false;
	 }
	 
	   data.uid=  ${data.userid};
	   updateUserPermission(data);
		  
 }
 /*------------update user permission function ----------------------------------*/
 function updateUserPermission(data){
	 $.ajax({ 
		   type: "POST",
		   contentType: "application/json",
		   url: "/updateUserPermission",
		   data: JSON.stringify(data),
	 	   dataType: 'json',
	 	   timeout: 600000,
		   success: function(data){
			   console.log(data);
			   var d = data.status;
			   if(data.status=='SUCCESS'){
				   $("#msg span").html('Permission updated successfully.');
				   $("#msg").show();
			   }
			   else{
				   $("#errmsg span").html('Fail to update permission.');
				   $("#errmsg").show();
			   }
		   }
		}); 
 }
 /*-----------Uncheck Radio button when Primary Link ubchecked------------------*/
 function uncheckPrimaryLink(e){
	 var plinkid = $(e.target).val();
	
	 if(document.getElementById(plinkid+'plink').checked == false)
		 for( i=1 ;i<4 ; i++){
			 document.getElementById(plinkid+'rd'+i).checked = false;
		 }
	 else{
		 document.getElementById(plinkid+'rd'+1).checked = true;
	 }
 }
/*------------Primary Link check--------------------*/
 function primaryLinkCheck(plinkid,radioid){
	
	radioid = plinkid+'rd'+radioid;
	plinkid = plinkid+'plink';
	var chkPrimaryLink  = document.getElementById(plinkid).checked = true;
} 
$(document).ready(function(){
	$("#msg").hide();
	$("#errmsg").hide();
	  $('.btn.btn-success').click(function(){
		  setPermission();
	  });

if($("input[name='radio1']:checked ").val()== 1){
	$("#groupwiseid").hide();
	$("#userwise").show();
}
else if($("input[name='radio1']:checked ").val()== 2){
	$("#userwise").hide();
	$("#groupwiseid").show();
}
 $("input[name='radio1'] ").click(function(){
	if($(this).val() == 1){
		$("#groupwiseid").hide();
		$("#userwise").show();
	}
	else if($(this).val() == 2){
		$("#userwise").hide();
		$("#groupwiseid").show();
	}
}); 

});

</script>


<div id="mainTable">
 <div class="row" >
 
                <div class="col-md-12">
	                  			<div  id ="errmsg" class="alert alert-custom-danger fade in alert-dismissible" style="margin-top:18px;">
							    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
							    	<strong>Error! </strong><span></span>
								</div>
	                			<div id="msg" class="alert alert-custom-success fade in alert-dismissible" style="margin-top:18px;">
							    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
							    	<strong>Success! </strong><span></span>
								</div>
               </div>
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#fa-icons" >Edit Permission</a></li>
              <li><a href="getPermissionAsignedUsers" >View Permission</a></li>
            </ul>
              <div   class="content-body  tab-content ">
            
              <div class="tab-pane active" id="fa-icons">
               
               <c:if test="${!empty data.userName}">
                <div  class="form-group row">
							<div class="col-sm-1">
								<label class="control-label" style="font-weight: bold">
								  	User Name 
							   </label>
							   </div>
							   <div class="col-sm-4">
							   <span class="colon" style="top:0;">:</span>
								<label >
								  ${data.userName}
							   </label>
							   </div>
							
			    </div>
			    <br>
               </c:if>
			
			      <h3><span>  Global Link Details</span></h3>	<hr>	
					
					<div id="globallinks" >
					 <c:forEach items="${data.permissions}" var="globalLink"> 
					<div class="panel-group mycollapse">
					<div class="panel panel-default">
					<div class="panel-heading"><h4 class="panel-title">
					<a  data-toggle="collapse"  class="control-label" href="#${globalLink.globalLinkId}">${globalLink.globalLinkName}</a>
					</h4></div>
					<c:set var="plnks" value="${globalLink.primarylinks}"></c:set>
					<%
					Set<PrimaryLinkResponseDto> plinks = 	(Set<PrimaryLinkResponseDto>)pageContext.getAttribute("plnks");
					Iterator it  = plinks.iterator();
					List<PrimaryLinkResponseDto> list = new ArrayList();
					while(it.hasNext()){
						PrimaryLinkResponseDto obj = (PrimaryLinkResponseDto)it.next();
						if(obj.getAction() != null && new Integer(obj.getAction()) > 0)
						list.add(obj);
					}
					if(!list.isEmpty())
						pageContext.setAttribute("permissionExist", 1);
					else
						pageContext.setAttribute("permissionExist", 2);
					%>
					 <c:choose>
					<c:when test="${ (empty permissionExist) || (permissionExist == 1)}" >
					<div id="${globalLink.globalLinkId}" class="collapse in">
					</c:when>
					<c:otherwise>
					<div id="${globalLink.globalLinkId}" class="collapse">
					</c:otherwise>
					</c:choose> 
					<div class="panel-body">
					<table class="table table-bordered"><thead><th>Primary Link</th><th></th><th></th><th></th></thead>
					
					<tbody>
					
					<c:forEach items="${globalLink.primarylinks}" var="plink">
					<c:set var="action" value="${plink.action}"></c:set>
					
					<tr><td style="width: 250px;" >
					<c:choose>
						<c:when test="${ (empty action) || (action eq 0)}">
						<label class="mycheck">${plink.primaryLinkName}
					  	 <input type="checkbox" value="${plink.pLinkId }" name ="${plink.pLinkId}" id=${plink.pLinkId}plink  onclick="uncheckPrimaryLink(event)" /><span class="checkmark"></span></label></td>
						</c:when>
						<c:otherwise>
						<label class="mycheck">${plink.primaryLinkName}
						<input type="checkbox" value="${plink.pLinkId }" name ="${plink.pLinkId}" id=${plink.pLinkId}plink  onclick= "uncheckPrimaryLink(event)" checked/><span class="checkmark"></span></label></td>
						</c:otherwise>
					</c:choose>
					<%-- <c:if test="${ (empty action) || (action eq 0)}">
					<input type="checkbox" value="${plink.pLinkId }" name ="${plink.pLinkId}" id=${plink.pLinkId}plink  onclick="uncheckPrimaryLink(event)" />${plink.primaryLinkName}</td>
					</c:if>
					<c:if test="${not empty action}">
					<input type="checkbox" value="${plink.pLinkId }" name ="${plink.pLinkId}" id=${plink.pLinkId}plink  onclick= "uncheckPrimaryLink(event)" checked/>${plink.primaryLinkName}</td>
					</c:if> --%>
					
					<c:choose>
					  <c:when test="${action eq 1}">
					  <td ><label class="myradio"><input class="myradio" type="radio" value="1"  name="${plink.primaryLinkName}" id =${plink.pLinkId}rd1 onclick="primaryLinkCheck( ${plink.pLinkId},1)" checked= "checked"/><span class="checkmark1"></span>Add</label></td>
					  </c:when>
					  
					  <c:otherwise>
					  <td ><label class="myradio"><input class="myradio" type="radio" value="1"  name="${plink.primaryLinkName}" id =${plink.pLinkId}rd1 onclick="primaryLinkCheck( ${plink.pLinkId},1)"/><span class="checkmark1"></span>Add</label></td>
					  </c:otherwise>
					</c:choose>
					
					<c:choose>
					  <c:when test="${action eq 2}">
					   <td><label class="myradio"><input class="myradio" type="radio"  value="2" name="${plink.primaryLinkName}" id =${plink.pLinkId}rd2 onclick="primaryLinkCheck(${plink.pLinkId},2)" checked="checked" /><span class="checkmark1"></span>View</label></td>
					  </c:when>
						 <c:otherwise>
						  <td><label class="myradio"><input class="myradio" type="radio"  value="2" name="${plink.primaryLinkName}" id =${plink.pLinkId}rd2 onclick="primaryLinkCheck(${plink.pLinkId},2)" /><span class="checkmark1"></span>View</label></td>
     				 </c:otherwise>
					 </c:choose>
					  
					  <c:choose>
					    <c:when test="${action eq 3}">
					    <td><label class="myradio"><input class="myradio" type="radio"  value="3"  name="${plink.primaryLinkName}" id =${plink.pLinkId}rd3 onclick="primaryLinkCheck(${plink.pLinkId},3)" checked="checked"/><span class="checkmark1"></span>Manage</label></td></tr>
					    </c:when>
					    <c:otherwise>
					    <td><label class="myradio"><input class="myradio" type="radio"  value="3"  name="${plink.primaryLinkName}" id =${plink.pLinkId}rd3 onclick="primaryLinkCheck(${plink.pLinkId},3)" /><span class="checkmark1"></span>Manage</label></td></tr>
					    </c:otherwise>
					  </c:choose>
					  
					</c:forEach>
					</tbody>
					
				</table>
					</div>
					</div>
					</div>
					</div>
					
				 </c:forEach> 
					</div>
					<button class="btn btn-success">Update Permission</button>
		        	</div >
             	</div>
         	 </div>
       	 </div>
      <hr>
  </div>
</div>
    
