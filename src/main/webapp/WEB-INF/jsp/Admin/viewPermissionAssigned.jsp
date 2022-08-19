<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>

<link rel="stylesheet" type="text/css" href="wrsis/css/dataTables.bootstrap4.min.css"/>
<script src="wrsis/js/jquery.dataTables.min.js"></script>
<script src="wrsis/js/dataTables.bootstrap4.min.js"></script>


<script>
$(document).ready(function(){
$('#viewTable').DataTable( {
    "pagingType": "full_numbers"
    });
});
</script>

<script>

$(document).ready(	function(){

   // alert("${data.users}");

   /*  <c:if test="${ empty data.users}">
    		$('#userPagn').hide();
    		$('#userData').hide();
    </c:if> */
	
		if($("input:radio[name=radio1]:checked").val()==1)
			{
			$("#userTab").show();
			$("#groupTab").hide();
			}
		else if($("input:radio[name=radio1]:checked").val()==2){
			$("#userTab").hide();
			$("#groupTab").show();
		}
		
		$("input:radio[name=radio1]").on('change',function(){
			if($(this).val()==1)
			{
				$("#userTab").show();
				$("#groupTab").hide();
		    }
			else if($(this).val()==2){
				$("#userTab").hide();
				$("#groupTab").show();
				};
		});
	/*--------------------Pagination for users list------------------------------------------*/
		 $("#userTab .pagination.pull-right li").click(function(e){
			 var page =0;
			 var activePage = parseInt($("#userTab .pagination.pull-right li.active").text());
			 if($(this).find('span').hasClass('glyphicon glyphicon-chevron-left'))
			 {
				 if(activePage == 1)
				 return false;
				 else if(activePage > 1){
					 page = activePage-1;
				 }
			 }
			 else if($(this).find('span').hasClass('glyphicon glyphicon-chevron-right')){
				 if(activePage == ${data.total1}){
						$(this).addClass('disable');
						return false;
						}
						else{
							page = activePage + 1;
						}
							
			 } else {
				 page = parseInt($(this).text());
			 }
			 $("#userTab .pagination.pull-right li").each(function(){
				 if($(this).text() == page){
					 $(this).addClass('active');
				 }
				 else{
					 $(this).removeClass('active');
				 }
			 }); 	
			 viewUser(page);
			}); 
	
/*-------------------------Pagination for group list---------------------------------------------*/
		 /* $("#groupTab .pagination.pull-right li").click(function(e){
			 var page =0;
			 var activePage = parseInt($("#groupTab .pagination.pull-right li.active").text());
			 if($(this).find('span').hasClass('glyphicon glyphicon-chevron-left'))
			 {
				 if(activePage == 1)
				 return false;
				 else if(activePage > 1){
					 page = activePage-1;
				 }
			 }
			 else if($(this).find('span').hasClass('glyphicon glyphicon-chevron-right')){
				 if(activePage == ${data.total2}){
						$(this).addClass('disable');
						return false;
						}
						else{
							page = activePage + 1;
						}
			 } else {
				 page = parseInt($(this).text());
			 }
			 $("#groupTab .pagination.pull-right li").each(function(){
				 if($(this).text() == page){
					 $(this).addClass('active');
				 }
				 else{
					 $(this).removeClass('active');
				 }
			 }); 	
			 if(page > 0)
			 viewGroup(page);
			}); */
   });
	/*----------------function use for edit user permission -----------------------*/
	function editPermission(e){
		
		$("#userId").val($(e.target).closest('tr').find('td:eq(0)').text());
		$("#userName").val($(e.target).closest('tr').find('td:eq(3)').text());
		$("#editUserPermsn").submit();
	}
	/*--------------function use for edit group permission -------------------------*/
	function editGroupPermission(e){
		$("#groupId").val($(e.target).closest('tr').find('td:eq(0)').text());
		$("#groupName").val($(e.target).closest('tr').find('td:eq(2)').text());
		$("#editGroupPermsn").submit();
	}

 function viewGroup(page){
	 var data = {};
	 data.page = page;
	$.ajax({ 
		   type: "POST",
		   contentType: "application/json",
		   url: "/getGroups",
		   data: JSON.stringify(data),
	 	   dataType: 'json',
	 	   timeout: 600000,
		   success: function(data ){
			   
			   var d = data.status;
			   if(data.status=='SUCCESS'){
				   currentpage= data.currentPage;
				   total = data.total;
				   data = data.data;
				   var length = data.length;
				   var content ='';
				   for(var i =0 ;i< length ;i++ ){
					   content= content+'<tr><td hidden>'+data[i].roleId+'</td><td>'+parseInt(currentpage*10+i+1)+'</td>'+
					   '<td>'+data[i].aliasName+'</td><td>'+
					   data[i].description+'</td><td>'+data[i].created_on+'</td>'+
					   '<td onclick="editGroupPermission(event)"><a class="btn btn-primary" ><i class="glyphicon glyphicon-pencil"></i></a></td></tr>';
				   }
				   $('#groupTab table tbody').html(content);
			   }
		   }
		}); 
} 

 function viewUser(page){
	 var data = {};
	 data.page = page;
	$.ajax({ 
		   type: "POST",
		   contentType: "application/json",
		   url: "/getUsers",
		   data: JSON.stringify(data),
	 	   dataType: 'json',
	 	   timeout: 600000,
		   success: function(data){
			   currentpage= data.currentPage;
			   total = data.total;
			   data = data.data;
			   var length = data.length;
			   var content ='';
			   for(var i =0 ;i< length ;i++ ){
				   content= content+'<tr><td hidden="">'+data[i].userId+'</td><td>'+parseInt(currentpage*10+i+1)+'</td>'+
				   '<td>'+data[i].userName+'</td><td>'
				   +data[i].fullName+'</td><td>'+data[i].email+'</td>'+
				   '<td onclick="editPermission(event)"><a class="btn btn-primary" ><i class="glyphicon glyphicon-pencil"></i></a></td></tr>';
			   }
				/* if(length >0 ){
			    	$('#userPagn').show();
	    			$('#userData').show();
				} */
			   
			   $('#userTab table tbody').html(content);
		   }
		}); 
} 

  
  
  function searchUser(){
      var s=  $("#typeUsrId").val();
      var data = {};
      var pagination = {};
      data.name = s;
      var activePage = parseInt($("#userTab .pagination.pull-right li.active").text());
      pagination.page = activePage;
     // data.pagination=pagination;
      $.ajax({ 
		   type: "POST",
		   contentType: "application/json",
		   url: "/searchUser",
		   data: JSON.stringify(data),
	 	   dataType: 'json',
	 	   timeout: 600000,
		   success: function(data){
			   currentpage= data.currentPage;
			   total = data.total;
			   data = data.data;
			   var length = data.length;
			   var content ='';
			   for(var i =0 ;i< length ;i++ ){
				   content= content+'<tr><td hidden="">'+data[i].userId+'</td><td>'+parseInt(currentpage*10+i+1)+'</td>'+
				   '<td>'+data[i].userName+'</td><td>'+
				   data[i].fullName+'</td><td>'+data[i].mobile+'</td><td>'+data[i].email+'</td>'+
				   '<td onclick="editPermission(event)"><a class="btn btn-primary" ><i class="glyphicon glyphicon-pencil"></i></a></td></tr>';
			   }
			   $('#userTab table tbody').html(content);
		   }
		}); 
  }
</script>

<div class="mainpanel">

 <form id="editUserPermsn" action="editUserPermission" hidden="" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

 
<input id="userName" name="name" />
<input id="userId"  name="userId" />
</form>

<form id="editGroupPermsn" action="editGroupPermission" hidden="" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


 <input id="groupId" name="groupId" />
 <input id="groupName" name="name" />
</form>

            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Permission</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="#"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item"><a href="#">Manage Link</a></li>
                           <li class="breadcrumb-item active" aria-current="page">Set Permission</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link " href="addUserPermission">Set Permission</a>
                              <a class="nav-item nav-link active" href="getPermissionAsignedUsers">View Permission</a>
                           </ul>
                    
                        </div>
                        
                        <!--===================================================-->
                        <div class="card-body">
                        
                              		<div class="radio" style="display: none;">
		                                    <input id="demo-form-radio-1" class="magic-radio myradio" type="radio" name="radio1" value="1" >
		                                    <label for="demo-form-radio-1">Name Wise</label>
		                             
		                                    <input id="demo-form-radio-2" class="magic-radio myradio" type="radio" name="radio1" value="2" checked>
		                                    <label for="demo-form-radio-2">Role Wise</label>
                                 	</div>
                                
                           <div class="table-responsive">
                           
                                <div id="userTab" style="display: none;">
									<div class="form-group row">
						                  <label  class="col-sm-2 control-label">Search by user name</label>
						                  <div class="col-sm-3">
						                  <span class="colon">:</span>
						                 	 <input id="typeUsrId" type="text" class="form-control" placeholder="Type user name" onkeyup="searchUser()" onkeydown="searchUser()" />
						                  </div>
						            </div>
					 		
						           	<table class="table table-bordered" id="userData" >
						           	<thead>
						           	<tr>
						           	<th>Sl No.</th>
						           	<th>Username</th>
						           	<th>Full Name</th>
						           	<th>Email</th>
						           	<th>Mobile</th>
						           	<th>Action</th>
						           	</tr>
						           	</thead>
						           	<tbody>
						           	<c:forEach items="${data.users}" var="user" varStatus="counter">
						           	   <tr>
						           	   <td hidden="">${user.userId}</td>
						           	   <td>${counter.count}</td>
						           	   <td>${user.userName}</td><td>${user.fullName}</td><td>${user.email}</td><td>${user.mobile}</td>
						           	   <td onclick="editPermission(event)"><a class="btn btn-primary" ><i class="icon-edit1"></i></a></td>
						           	   </tr>
						           	 </c:forEach>
						           	</tbody>
						           	
						           	</table>
					           		
						           	<ul id="userPagn" class="pagination pull-right">
						           		<c:set var="tot1" value="${data.total1}"></c:set>
						           		<c:set var="currentPage1" value="${data.currentPage1}"></c:set>
						           		 <li><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
						           		<%
						           		for(int i=1;i<= (int)pageContext.getAttribute("tot1") ; i++){
						           			if(i == (int)pageContext.getAttribute("currentPage1")+1) {%>
						           			 <li class="active" ><a href="#"><%= i%></a></li>
						           		<%}
						           			else {%>
						           			 <li><a href="#"><%= i%></a></li>
						           			<%}
						           		}					           		
						           		%>
						           		<li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
						           	</ul>
                        		</div> 
                                 <!--  -----------------Group Table --------------------------------->  
					    <div id="groupTab">
					     	 <table class="table table-bordered" id="viewTable">
					           	<thead>
					           	<tr>
					           	<th>Sl No.</th>
					           	<th>Role Name</th>
					           	<th>Description</th>
					           	<th>Create On</th>
					           	<th>Action</th>
					           	</tr>
					           	</thead>
					           	<tbody>
					           	<c:forEach items="${data.groups}" var="group" varStatus="counter">
					           	<c:set var="date" value="${group.created_on}"/>
					           	   <tr>
					           	   <td hidden="">${group.roleId}</td>
					           	   <td>${counter.count}</td><td>${group.aliasName}</td><td>${group.description}</td>
					           	   <td><% SimpleDateFormat format  = new SimpleDateFormat("dd-MMM-yyyy");
					           	   Timestamp date = (Timestamp) pageContext.getAttribute("date"); 
					               String s =  	format.format(date).toUpperCase();
					           	    pageContext.setAttribute("formatedDate", s);%>
					           	    ${formatedDate} </td>
					           	    <td onclick="editGroupPermission(event)"><a class="btn btn-primary" ><i class="icon-edit1"></i></a></td>
					           	   </tr>
					           	 </c:forEach>
					           	</tbody>
					           	
					         </table> 
					         
					           	<%--  <ul id="groupPagn" class="pagination pull-right">
					           		<c:set var="tot2" value="${data.total2}"></c:set>
					           		<c:set var="currentPage2" value="${data.currentPage2}"></c:set>
					           		 <li><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
					           		<%
					           		for(int i=1;i<= (int)pageContext.getAttribute("tot2") ; i++){
					           			if(i == (int)pageContext.getAttribute("currentPage2")+1) {%>
					           			 <li class="active" ><a href="#"><%= i%></a></li>
					           		<%}
					           			else {%>
					           			 <li><a href="#"><%= i%></a></li>
					           			<%}
					           		}					           		
					           		%>
					           		<li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
					           	</ul> --%>
					     </div> 
                           </div>
                           
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>









<%-- <div id="mainTable">
 <div class="row" >
 <form id="editUserPermsn" action="editUserPermission" hidden="" method="post">
<input id="userName" name="name" />
<input id="userId"  name="userId" />
</form>

<form id="editGroupPermsn" action="editGroupPermission" hidden="" method="post">
 <input id="groupId" name="groupId" />
 <input id="groupName" name="name" />
</form>
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li ><a href="addUserPermission" >Set Permission</a></li>
              <li class="active"><a href="#" >View Permission</a></li>
            </ul>
              <div   class="content-body  tab-content ">
            
              <div class="tab-pane active" >
               <div  class="form-group row">
							<div class="col-sm-1">
								<label class="myradio">
								  <input  type="radio" name="radio1"  value="1" checked />  Name Wise <br>
								  	<span class="
								  	checkmark1"></span>
										</label></div>
							<div class="col-sm-1">
								<label class="myradio">
								   <input  type="radio"  name="radio1"  value="2" />Group Wise<br>
								     <span class="checkmark1"></span>
								</label>
							</div>
						</div>
					<!-- ----------------------User table--------------------------------  -->
					<div id="userTab">
					<div class="form-group row">
		                  <label  class="col-sm-2 control-label">Search by user name</label>
		                  <div class="col-sm-3">
		                  <span class="colon">:</span>
		                 	 <input id="typeUsrId" type="text" class="form-control" placeholder="Type user name" onkeyup="searchUser()" onkeydown="searchUser()" />
		                  </div>
		            </div>
		                  
					 		
					           	<table class="table table-bordered" id="userData" >
					           	<thead>
					           	<tr>
					           	<th>Sl No.</th>
					           	<th>Username</th>
					           	<th>Full Name</th>
					           	<th>Email</th>
					           	<th>Mobile</th>
					           	<th>Action</th>
					           	</tr>
					           	</thead>
					           	<tbody>
					           	<c:forEach items="${data.users}" var="user" varStatus="counter">
					           	   <tr>
					           	   <td hidden="">${user.userId}</td>
					           	   <td>${counter.count}</td>
					           	   <td>${user.userName}</td><td>${user.fullName}</td><td>${user.email}</td><td>${user.mobile}</td>
					           	   <td onclick="editPermission(event)"><a class="btn btn-primary" ><i class="glyphicon glyphicon-pencil"></i></a></td>
					           	   </tr>
					           	 </c:forEach>
					           	</tbody>
					           	
					           	</table>
					           		
					           	<ul id="userPagn" class="pagination pull-right">
					           		<c:set var="tot1" value="${data.total1}"></c:set>
					           		<c:set var="currentPage1" value="${data.currentPage1}"></c:set>
					           		 <li><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
					           		<%
					           		for(int i=1;i<= (int)pageContext.getAttribute("tot1") ; i++){
					           			if(i == (int)pageContext.getAttribute("currentPage1")+1) {%>
					           			 <li class="active" ><a href="#"><%= i%></a></li>
					           		<%}
					           			else {%>
					           			 <li><a href="#"><%= i%></a></li>
					           			<%}
					           		}					           		
					           		%>
					           		<li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
					           	</ul>
					           	
					           
					           
                        </div>
					     <!--  -----------------Group Table --------------------------------->  
					    <div id="groupTab">
					     	 <table class="table table-bordered" >
					           	<thead>
					           	<tr>
					           	<th>Sl No.</th>
					           	<th>Group Name</th>
					           	<th>Description</th>
					           	<th>Create On</th>
					           	<th>Action</th>
					           	</tr>
					           	</thead>
					           	<tbody>
					           	<c:forEach items="${data.groups}" var="group" varStatus="counter">
					           	<c:set var="date" value="${group.created_on}"/>
					           	   <tr>
					           	   <td hidden="">${group.roleId}</td>
					           	   <td>${counter.count}</td><td>${group.aliasName}</td><td>${group.description}</td>
					           	   <td><% SimpleDateFormat format  = new SimpleDateFormat("dd-MMM-yyyy");
					           	   Timestamp date = (Timestamp) pageContext.getAttribute("date"); 
					               String s =  	format.format(date).toUpperCase();
					           	    pageContext.setAttribute("formatedDate", s);%>
					           	    ${formatedDate} </td>
					           	    <td onclick="editGroupPermission(event)"><a class="btn btn-primary" ><i class="glyphicon glyphicon-pencil"></i></a></td>
					           	   </tr>
					           	 </c:forEach>
					           	</tbody>
					           	
					         </table> 
					         
					           	 <ul id="groupPagn" class="pagination pull-right">
					           		<c:set var="tot2" value="${data.total2}"></c:set>
					           		<c:set var="currentPage2" value="${data.currentPage2}"></c:set>
					           		 <li><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
					           		<%
					           		for(int i=1;i<= (int)pageContext.getAttribute("tot2") ; i++){
					           			if(i == (int)pageContext.getAttribute("currentPage2")+1) {%>
					           			 <li class="active" ><a href="#"><%= i%></a></li>
					           		<%}
					           			else {%>
					           			 <li><a href="#"><%= i%></a></li>
					           			<%}
					           		}					           		
					           		%>
					           		<li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
					           	</ul>
					     </div>      
		        	
		        	</div >
             	</div>
         	 </div>
       	 </div>
      <hr>
  </div>
</div> --%>
    
