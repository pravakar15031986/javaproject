
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>editNotification</title>

<style type="text/css">
.subject-info-box-1, .subject-info-box-2 {
	float: left;
	width: 100%; select { height : 200px;
	padding: 0;
	option
	{
	padding
	:
	4px
	10px
	4px
	10px;
}

option:hover {
	background: #EEEEEE;
}

}
}
.subject-info-arrows {
   margin: 4px;
    }
	.subject-info-arrows .btn{
	font-size: 24px;
    line-height: 20px;
    margin-top: 3px;
}
}






/* .subject-info-arrows {
      margin: 4px;
    }
    .subject-info-arrows .btn{
	font-size: 24px;
    line-height: 20px;
    margin-top: 3px;
    
	} */
</style>


</head>

<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Edit Notification</h4>
				<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="Home"><span
							class="icon-home1"></span></a></li>
					<li class="breadcrumb-item">Manage Survey</li>
					<li class="breadcrumb-item active" aria-current="page">Survey Notification</li>
				</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="#">Edit</a>
							<a class="nav-item nav-link " href="viewNotification">View</a>
							<a class="nav-item nav-link " href="archiveNotification">Archive</a>
						</ul>
						<div class="indicatorslist">
							
							<a title="" href="viewNotification" id="backIcon"
								data-toggle="tooltip" data-placement="top"
								data-original-title="Back"><i class="icon-arrow-left1"></i></a>
							<p class="ml-2" style="color: red;">(*) Indicates mandatory</p>
						</div>
					</div>
					<!-- BASIC FORM ELEMENTS -->
					<!--===================================================-->
					<form:form action="updateNotification" method="post"
						id="notificationForm" name="ntfForm" modelAttribute="notificationDetails"
						autocomplete="off">
						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						<form:input path="notifyId" type="hidden" />
						<div class="card-body">
							<!--Static-->
							<!--Text Input-->
							<div class="width50">
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-email-input">Organization<span
										class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:select class="form-control" id="organizationId"
											path="organizationId" onchange="getUsers();">
											<form:option value="0">--Select--</form:option>
											<form:options items="${orgList}" itemLabel="levelName"
												itemValue="levelDetailId" />
										</form:select>
									</div>
								</div>
								<div class="form-group row researchcenter"
									id="researchCenterDivId">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-email-input">Research Center<span
										class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:select class="form-control" id="researchCenterId"
											path="rcId" onchange="getUsers();">
											<form:option value="0">--Select--</form:option>
											<form:options items="${rcList}"
												itemLabel="researchCenterName" itemValue="researchCenterId" />
										</form:select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label">Role<span
										class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:select class="form-control" id="userRoleId"
											path="roleId" onchange="getUsers();">
											<form:option value="0">--Select--</form:option>
											<form:options items="${roles}" itemLabel="roleName"
												itemValue="roleId" />
										</form:select>
									</div>
								</div>
								<div class="form-group row">
                                 	<label class="col-12 col-md-4 col-xl-4 control-label">Users<span class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
									
										<span class="colon">:</span>
										<div class="subject-info-box-1">
											<select multiple="multiple" name="usersId" id="usersId" class="form-control selectbox-scrollable lstBox1">
											
											
											</select>
										</div>
										<!-- div For Arrow Start -->
										<div class="subject-info-arrows text-center">
											
											
											
											 <input type="button" id="btnRight" value="+" class="btn btn-primary"><br>
									  <input type="button" id="btnLeft" value="-" class="btn btn-danger"><br>
										</div>
										<!-- div For Arrow End -->

										<div class="subject-info-box-2">

											<%-- <form:select multiple="multiple" id="usersSelectedId" path="selectedUsers" class="form-control selectbox-scrollable lstBox1">
											<form:option value="1"  >test</form:option>
											</form:select> --%>

											<form:select multiple="multiple" id="usersSelectedId"
												class="form-control selectbox-scrollable lstBox1"
												path="selectedUsers">
												<c:forEach items="${selectedmembers}" var="member">
													<option value="${member.userId}">${member.fullName}(${member.userName})</option>
												</c:forEach>
											</form:select>
											<input type="button" id="select_all" name="select_all"
												value="Select All" style="display: none;">
										</div>

									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-email-input">Notification Message<span
										class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:textarea path="notificationMsg" id="descriptionID"
											rows="4" class="form-control" placeholder="Message"
											maxlength="160" />
										<div id="charNum"></div>
										
									</div>
								</div>
								 <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Send Notification </label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <form:radiobutton id="sendNow" value="true" class="magic-radio" path="sendStatus" name="sendStatus"/>
                                    <label for="sendNow">Send Now</label>
                             
                                    <form:radiobutton  id="sendLater" value="false" class="magic-radio" path="sendStatus" name="sendStatus" />
                                    <label for="sendLater">Send Later</label>
                                 </div>
                              </div>
                           </div>
                           
                           <div class="form-group row scheduleNtf">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Schedule Notification<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <div class="input-group col-12 col-md-8 col-xl-12">
                                       <form:input type="text" id="ntfDate" path="ntfDate" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                              </div>
                           </div>
                           
                           
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"></label>
									<div class="col-12 col-md-8 col-xl-8">
										<%-- <c:if test="${notificationDetails.sendStatus eq false }">
											<button type="button" class="btn btn-primary mb-1"
												id="btnSendId">Send Now</button>
										</c:if> --%>

										<button type="button" class="btn btn-primary mb-1"
											id="btnUpdateId">Update</button>
										<a href="viewNotification" type="button"
											class="btn btn-danger mb-1" id="btnCancelId">Cancel</a>
									</div>
								</div>
							</div>
						</div>
					</form:form>
					<%-- <form:form action="updateAndSendNotification" id="sendForm" modelAttribute="notificationDetails">
                  <form:hidden path="organizationId1" id="orgId1" />
                  <form:hidden path="rcId1" id="rcId1" />
                  <form:hidden path="selectedUsers1" multiple="multiple" id="selectedUsersId1" />
                  <form:hidden path="notificationMsg1" id="ntfMsgId" />
				  </form:form> --%>
					<!--===================================================-->
					<!-- END BASIC FORM ELEMENTS -->
				</div>
			</div>
		</div>
	</div>
</div>




<script>
$(document).ready(function(){
	 var text_max = 160;
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#descriptionID').keyup(function() {
	     var text_length = $('#descriptionID').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
	
});
</script>

<script>
$("#btnUpdateId").click(function () 
		{
	$("#select_all").click();
		});
$("#btnSendId").click(function () 
		{
	$("#select_all").click();
		});
function getUsers()
{
	var assignedUserIds = new Array();
	$('#usersSelectedId').find('option').each(function() {
	   assignedUserIds.push(this.value);
	});

		
	var rcId=$('#researchCenterId').val()
	var roleId = $('#userRoleId').val();
	var levelDetailId=$('#organizationId').val();
	
	$.ajax({
		type : "POST",
		url : "getNotificationUserByRoleAndOrgId", 
	 
		data : {
			"roleId":roleId,
			"levelDetailId" : levelDetailId,
			"rcId" : rcId
		},
		success : function(response) {
			 
		
			var html ='';
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				var exist=true;
				$.each(val,function(index, value) {		
					exist=false;
					if(assignedUserIds.size !=0){
						assignedUserIds.forEach(function(item) {
							if(item==value.userId){
								exist=true;
							}
						});
					}
					
					if(!exist)	
						html=html+"<option value="+value.userId+" >"+value.name+"("+value.username+")</option>";
				});
			}
			$('#usersId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});
}

$(function(){
	$("#btnRight").click(function(){
	
		$("#usersId option:selected").each(function()
		{
			$(this).remove().appendTo("#usersSelectedId");
			
		});
	});
	$("#btnLeft").click(function(){
		$("#usersSelectedId option:selected").each(function()
		{
			$(this).remove().appendTo("#usersId");
			
		});
	});
});


$('#select_all').click(function() {
    $('#usersSelectedId option').prop('selected', true);
});

</script>

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

<script>
         $(document).ready(function()
        		 {
        	 if($("#organizationId").val()=='4')
  			{
  				$(".researchcenter").show();
  			}else{
  				$(".researchcenter").hide();
  				$("#researchCenterId").val(0);
  			}
        	 $("#organizationId").change(function(){
        		 if($("#organizationId").val()=='4')
       			{
       				$(".researchcenter").show();
       			}else{
       				$(".researchcenter").hide();
       				$("#researchCenterId").val(0);
       			}
        	 });
        		 });
         </script>



<script>
        var form = $('form[name="ntfForm"]'),
        radio = $('input[name="sendStatus"]'),
        choice = '';

    radio.change(function(e) {
        choice = this.value;

        if (choice === 'false') {
            /* form.attr('action', 'updateNotification'); */
            $('.scheduleNtf').show();
        } else {
           /*  form.attr('action', 'updateAndSendNotification'); */
            $('.scheduleNtf').hide();
            $('#ntfDate').val("");
        }
    });
    </script>
<script>
        $(document).ready(function(){
        	   $('#btnUpdateId').click(function(){
        		    event.preventDefault();
          	//$('#notificationForm').prop('action', 'updateNotification');
        	var membersId = $("#usersSelectedId").val();
         	var form = event.target.form;
     		var desc=$("#descriptionID").val();
  			var descLen=desc.length;
      	   	 if(membersId == '')
      		  {
      	   		swal(
      					'Error!',
      					'Please select at least one User',
      					'error'
      					).then(function() {
      					   $("#usersSelectedId").focus();
      					});
      		   		return false;
      		  }
      	   if(descLen==0)
 		  {
 	   		swal(
 					'Error!',
 					'Please enter Notificaton Message',
 					'error'
 					).then(function() {
 					   $("#descriptionID").focus();
 					});
 		   		return false;
 		  }
         	if(desc.charAt(0)== ' ' || desc.charAt(descLen-1)== ' '){
  			   swal("Error", "White space is not allowed at initial and last place in Notification Message", "error").then(function() {
 					   $("#descriptionID").focus();
 				});
  	         return false;
  		   }
         	if(desc!=null)
 	    	{
 		   		var count= 0;
 		   		var i;
 		   		for(i=0;i<desc.length && i+1 < desc.length;i++)
 		   		{
 		   			if ((desc.charAt(i) == ' ') && (desc.charAt(i + 1) == ' ')) 
 		   			{
 						count++;
 					}
 		   		}
 		   		if (count > 0) {
 		   			swal("Error", "Notification Message should not contain consecutive blank spaces", "error").then(function() {
 					   $("#descriptionID").focus();
 					});
 					return false;
 				}
 	    	}
	        	swal({
	           		title: ' Do you want to update?',
	           		  type: 'warning',
	           		  showCancelButton: true,
	           		  confirmButtonText: 'Yes',
	           		  cancelButtonText: 'No',
	       	    }).then((result) => {
	       	    	  if (result.value) {
	       	    		 $("#notificationForm").submit(); 
	       	    		  }
	       	    		})
          return false;  
	   });
	   });
         </script>