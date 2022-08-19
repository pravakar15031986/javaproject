<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<script>
var mkConfig = {
	positionY: 'bottom',
	positionX: 'right',
	max: 5,
	scrollable: true
};
</script>
<script>
$(function () {
    $('.select2').select2();
    });
 /*--------------------Set Permission --------------------------------------------*/
 
 function setPermission(){
	 debugger;
	 var data = new Object();
	 var user =[];
	 var plinks=[];
	 var i=0;
	 $("#selAllUser option").each(function()
			 {
		 user[i]= $(this).val();
			     i++;
			 });
	 data.userId = user;
	
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
	 data.uid = $("#groupList option:selected").val(); 
	 
	// alert(JSON.stringify(data));
	
	 
	 if ($('#userwise').css('display') == 'none') {
		 validation2(data);
	 $.ajax({ 
		   type: "POST",
		   contentType: "application/json",
		   url: "/updateGroupPermission",
		   data: JSON.stringify(data),
	 	   dataType: 'json',
	 	   timeout: 600000,
		   success: function(data){
			   console.log(data);
			   var d = data.status;
			   if(data.status=='SUCCESS'){
				   $("#msg span").html('Permission set successfully.');
				   $("#msg").show();
			   }
			   else{
				   $("#errmsg span").html('Fail to set permission.');
				   $("#errmsg").show();
			   }
		   }
		}); 
	 
	 }
	 else if($('#groupwiseid').css('display') == 'none'){
		 validate1(data);
		 $.ajax({ 
			   type: "POST",
			   contentType: "application/json",
			   url: "/setUserPermission",
			   data: JSON.stringify(data),
		 	   dataType: 'json',
		 	   timeout: 600000,
			   success: function(data){
				   var d = data.status;
				   if(data.status=='SUCCESS'){
					   $("#msg span").html('Permission set successfully.');
					   $("#msg").show();
				   }
				   else{
					   $("#errmsg span").html('Fail to set permission.');
					   $("#errmsg").show();
				   }
			   }
			}); 
	 }
 }
 
 /*------------Validation for user set permission ------------------------------*/
 function validate1(data){
	 if(data.userId.length == 0 )
	 {
		
			
						mkNotifications(mkConfig);
					
						mkNoti(
							'MK Web Notifications (Info)',
							'Please select user.',
							{
								status:'info'
							}
						);
		// $("#errmsg span").html('Please select user.');
		// $("#errmsg").show();
	 return false;
	 }
 else if(data.primaryLink.length == 0){
	
			
						mkNotifications(mkConfig);
					
						mkNoti(
							'MK Web Notifications (Info)',
							'Please select primary link.',
							{
								status:'danger'
							}
						);
	 //$("#errmsg span").html('Please select primary link.');
	 //$("#errmsg").show();
	 return false;
 }
 }
 /*-------------Validation for group set permission-------------------------------*/
 function validation2(data){
	 
	 if(data.primaryLink.length == 0){
		 $("#errmsg span").html('Please select primary link.');
		 $("#errmsg").show();
		 return false;
	 }
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

  
/* -------------Assign >> User----------------------- */
function assignUser()
{
	var userCount		= $( "#selUser option:selected" ).length;
	if(userCount=='0' || (userCount== 1 && ($("#selUser").val()==0)))
	{
		swal("Please select User");
		$('#selUser').focus();
		return false;
	}
	var selUser	= 'selUser';
	var selAll	= 'selAllUser';
	
	$("#"+selUser+" > option:selected").each(function(){
		var userVal	= this.value;
		if(userVal!=0){
			var flag	= 0;
			$("#"+selAll+" > option").each(function(){				
        		var selectUser	= this.value;
				if(selectUser==userVal)
					flag=1;
			});
			if(flag==0)
				$(this).remove().appendTo("#"+selAll);
			else
				swal('This user is already selected');
		}
    });
} 
/* -------------Remove << User----------------------- */
function removeUser()
{
	if($('#selAllUser').val()==0)
	{
		swal("Please select a user");
		$('#selAllUser').focus();
		return false;
	}
	var selUser	= 'selUser';
	var selAll	= 'selAllUser';
	
	$("#"+selAll+" > option:selected").each(function(){
		var userVal	= this.value;
		if(userVal!=0){
			var flag	= 0;
			$("#"+selUser+" > option").each(function(){				
        		var selectUser	= this.value;
				if(selectUser==userVal)
					flag=1;
			});
			
				$(this).remove().appendTo("#"+selUser);
			
		}
    });
}


</script>

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Set Permission</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Link</li>
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
			                              <a class="nav-item nav-link active" href="addUserPermission">Set Permission</a>
			                              <a class="nav-item nav-link " href="getPermissionAsignedUsers">View Permission</a>
			                           </ul>
			                           <div class="indicatorslist">
			                              
			                              
			                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
			                           </div>
                        		</div>
	                  			<div  id ="errmsg" class="alert alert-danger fade-in alert-dismissible" style="margin-top:18px;">
							    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
							    	<strong>Error! </strong><span></span>
								</div>
	                			<div id="msg" class="alert alert-success fade-in alert-dismissible" style="margin-top:18px;">
							    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
							    	<strong>Success! </strong><span></span>
								</div>
                        		<!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        			<div class="card-body">
                        			<div   class="content-body  tab-content ">
            
             						 <div class="tab-pane active" id="fa-icons">
               
               <div class="radio" style="display: none">
		                                    <input id="demo-form-radio-1" class="magic-radio myradio" type="radio" name="radio1" value="1" >
		                                    <label for="demo-form-radio-1">Name Wise</label>
		                             
		                                    <input id="demo-form-radio-2" class="magic-radio myradio" type="radio" name="radio1" value="2" checked>
		                                    <label for="demo-form-radio-2">Role Wise</label>
                                 		</div>
				<div id="userwise" style="display: none">
						<div class="form-group row" >
		                  		<label class="col-sm-2 control-label">User Name<span class="text-danger">*</span></label>
		             
		                  			<div class="col-sm-4">
		                  			<span class="colon">:</span>
		                      			<input type="text" id="gardenName" class="form-control" placeholder="Enter User Name" onkeyup="findUserPermissionbyName($(this).val());"></input>
		                 		    </div>
		        				</div>	
		        	 <div class="form-group row">
						       <label class="col-sm-2 control-label">Select Name<span class="text-danger">*</span></label>
					           <div class="col-sm-4">
					           <span class="colon">:</span>
					           <div class="row">
					           	<div class="col-sm-5">
					           	<c:choose>
					           	<c:when test="${not empty users}">
					           	 <form:select path="users"  id="selUser" size="7" name="selUser" class="form-control" multiple="multiple" >
					           	
					           	 <c:forEach items="${users}" var="user">
					           	   
					           	  <form:option value="${user.userId}">${user.fullName}</form:option>
					           	 </c:forEach>
					          
					           	</form:select >
					           	</c:when>
					            	<c:otherwise>
					           	
					             	<select id="selUser" size="7"  name="selUser"  class="form-control" multiple="multiple"></select>
					           	</c:otherwise>  
					           	</c:choose>
					           	
					           	
					           	 </div>
					           	
					           	<div class="col-sm-2">
					           		<div style="text-align:center; width:100%;">
									<a  class="btn btn-info" onclick="assignUser();"><i class="fa fa-chevron-right"></i></a>	  <br><br>
									<a href="javascript:void(0);" class="btn btn-info" onclick="removeUser();"><i class="fa fa-chevron-left"></i></a>         	
					           	</div>
					           	</div> 
					           	<div class="col-sm-5">
					           	
					           	<select id="selAllUser" size="7" name="selAllUser"  class="form-control" multiple="multiple"></select><input type="hidden" name="_selAllUser" value="1">
					           	</div>
					           </div>
					           
					           <input type="hidden" name="hdnFlag" id="hdnFlag" />
					        </div>
					     </div>
						</div>
						
						
				 <div id="groupwiseid" > 
			        <div class="form-group row">
							<label class=" col-sm-2 control-label" >Role Name</label>
							
							<form:select  id="groupList" path="groupList" class="form-control col-sm-3 select2"  >
							<form:option value="0">--Select--</form:option>
					           	 <c:forEach items="${groupList}" var="group">
					           	   
					           	  <form:option value="${group.roleId}">${group.aliasName}</form:option>
					           	 </c:forEach>
					           	
					           	</form:select >
					  </div>
				 </div>
				 
					           
			      <h3><span>  Global Link Details</span></h3>	<hr>
			      
			      <div id="accordion">
			      <c:forEach items="${globalinkList}" var="globalLink" varStatus="status">
			      
   <div id="globallinks">
   <div class="card">
    <div class="card-header" id="heading${status.index}">
      <h5 class="mb-0">
        <button class="btn collapsed" data-toggle="collapse" data-target="#collapse${status.index}" aria-expanded="false" aria-controls="collapse${status.index}">
         ${globalLink.globalLinkName}
        </button>
      </h5>
    </div>

    <div id="collapse${status.index}" class="collapse" aria-labelledby="heading${globalLink.globalLinkName}" > 
      <div class="card-body">
        
 <div class="table-responsive">
 
 
 <table class="table table-bordered">
  <thead>
    <tr>
      <th>Primary Link</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${globalLink.primarylinks}" var="plink">
									<tr>
									  <td><input type="checkbox" class="magic-checkbox" value="${plink.primaryLinkId }" name ="${plink.primaryLinkId}" id=${plink.primaryLinkId}plink  onclick= "uncheckPrimaryLink(event)"/><label for='${plink.primaryLinkId}plink'>${plink.primaryLinkName}</label></td>
									  <td><input class="magic-radio" type="radio" value="1"  name="${plink.primaryLinkName}" id =${plink.primaryLinkId}rd1 onclick="primaryLinkCheck( ${plink.primaryLinkId},1)"/><label for='${plink.primaryLinkId}rd1'>Add</label></td>
									  <td><input class="magic-radio" type="radio"  value="2" name="${plink.primaryLinkName}" id =${plink.primaryLinkId}rd2 onclick="primaryLinkCheck(${plink.primaryLinkId},2)" /><label for='${plink.primaryLinkId}rd2'>View</label></td>
									  <td><input class="magic-radio" type="radio"  value="3"  name="${plink.primaryLinkName}" id =${plink.primaryLinkId}rd3 onclick="primaryLinkCheck(${plink.primaryLinkId},3)" /><label for='${plink.primaryLinkId}rd3'>Manage</label></td>
									</tr>
								</c:forEach>
    
  </tbody>
</table>
</div>
      </div>
    </div>
  </div>
  </div>
</c:forEach> 
</div>
		</div >
		
		<c:if test="${not empty groupList}">
			<button class="btn btn-success">Set Permission</button>
		</c:if>
		
		
                        			</div>
                  			</div>
                  		</div>
                  </div>
            </div>
	</div>
</div>










<%-- <div id="mainTable">
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
              <li class="active"><a href="#fa-icons" >Set Permission</a></li>
              <li><a href="getPermissionAsignedUsers" >View Permission</a></li>
            </ul>
              <div   class="content-body  tab-content ">
            
              <div class="tab-pane active" id="fa-icons">
               
               <div  class="form-group row">
							<div class="col-sm-1">
								<label class="myradio">
								  <input  type="radio" name="radio1"  value="1" checked >  Name Wise <br>
								  	<span class="
								  	checkmark1"></span>
										</label></div>
							<div class="col-sm-1">
								<label class="myradio">
								   <input  type="radio"  name="radio1"  value="2" >Group Wise<br>
								     <span class="checkmark1"></span>
								</label>
							</div>
						</div>
				<div id="userwise">
						<div class="form-group row" >
		                  		<label class="col-sm-2 control-label">User Name<span class="mandatory">*</span></label>
		             
		                  			<div class="col-sm-4">
		                  			<span class="colon">:</span>
		                      			<input type="text" id="gardenName" class="form-control" placeholder="Enter User Name" onkeyup="findUserPermissionbyName($(this).val());"></input>
		                 		    </div>
		        				</div>	
		        	 <div class="form-group row">
						       <label class="col-sm-2 control-label">Select Name<span class="mandatory">*</span></label>
					           <div class="col-sm-4">
					           <span class="colon">:</span>
					           <div class="row">
					           	<div class="col-sm-5">
					           	<c:choose>
					           	<c:when test="${not empty users}">
					           	 <form:select path="users"  id="selUser" size="7" name="selUser" class="form-control" multiple="multiple" >
					           	
					           	 <c:forEach items="${users}" var="user">
					           	   
					           	  <form:option value="${user.userId}">${user.fullName}</form:option>
					           	 </c:forEach>
					          
					           	</form:select >
					           	</c:when>
					            	<c:otherwise>
					           	
					             	<select id="selUser" size="7"  name="selUser"  class="form-control" multiple="multiple"></select>
					           	</c:otherwise>  
					           	</c:choose>
					           	
					           	
					           	 </div>
					           	
					           	<div class="col-sm-2">
					           		<div style="text-align:center; width:100%;">
									<a  class="btn btn-info" onclick="assignUser();"><i class="glyphicon glyphicon-forward"></i></a>	  <br><br>
									<a href="javascript:void(0);" class="btn btn-info" onclick="removeUser();"><i class="glyphicon glyphicon-backward"></i></a>         	
					           	</div>
					           	</div>
					           	<div class="col-sm-5">
					           	
					           	<select id="selAllUser" size="7" name="selAllUser"  class="form-control" multiple="multiple"></select><input type="hidden" name="_selAllUser" value="1">
					           	</div>
					           </div>
					           
					           <input type="hidden" name="hdnFlag" id="hdnFlag" />
					        </div>
					     </div>
						</div>
						
						
				 <div id="groupwiseid" > 
			        <div class="form-group row">
							<label class=" col-sm-2 control-label" >Group Name</label>
							
							<form:select  id="groupList" path="groupList" class="col-sm-3 select2"  >
					           	 <c:forEach items="${groupList}" var="group">
					           	   
					           	  <form:option value="${group.roleId}">${group.aliasName}</form:option>
					           	 </c:forEach>
					           	
					           	</form:select >
					  </div>
				 </div>
				 
					           
			      <h3><span>  Global Link Details</span></h3>	<hr>	
					
					<div id="globallinks" >
					
					 <c:forEach items="${globalinkList}" var="globalLink"> 
					
					
					<div class="panel-group mycollapse">
					<div class="panel panel-default">
					<div class="panel-heading"><h4 class="panel-title">
					<a  data-toggle="collapse"  class="control-label" href="#${globalLink.globalLinkId}">${globalLink.globalLinkName}</a>
					</h4></div><div id="${globalLink.globalLinkId}" class="panel-collapse collapse">
					<div class="panel-body">
					<table class="table table-bordered"><thead><th>Primary Link</th><th></th><th></th><th></th></thead>
					
					<tbody>
					<c:forEach items="${globalLink.primarylinks}" var="plink">
					<tr><td style="width: 250px;" ><label class="mycheck">${plink.primaryLinkName}<input type="checkbox" value="${plink.primaryLinkId }" name ="${plink.primaryLinkId}" id=${plink.primaryLinkId}plink  onclick= "uncheckPrimaryLink(event)"/><span class="checkmark"></span></label></td>
					  <td ><label class="myradio"><input class="myradio" type="radio" value="1"  name="${plink.primaryLinkName}" id =${plink.primaryLinkId}rd1 onclick="primaryLinkCheck( ${plink.primaryLinkId},1)"/><span class="checkmark1"></span>Add</label></td>
					  <td><label class="myradio"><input class="myradio" type="radio"  value="2" name="${plink.primaryLinkName}" id =${plink.primaryLinkId}rd2 onclick="primaryLinkCheck(${plink.primaryLinkId},2)" /><span class="checkmark1"></span>View</label></td>
					  <td><label class="myradio"><input class="myradio" type="radio"  value="3"  name="${plink.primaryLinkName}" id =${plink.primaryLinkId}rd3 onclick="primaryLinkCheck(${plink.primaryLinkId},3)" /><span class="checkmark1"></span>Manage</label></td></tr>
					</c:forEach>
					</tbody>
					
					</table>
					</div>
					</div>
					</div>
					</div>
					
				 </c:forEach> 
						
					</div>
					
					<button class="btn btn-success">Set Permission</button>
					
		        	
		        	</div >
             	</div>
         	 </div>
       	 </div>
      <hr>
  </div>
</div>

 --%>