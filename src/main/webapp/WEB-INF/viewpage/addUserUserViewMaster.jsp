<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script>



$(document).ready(function(){

	});
</script>

<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>View User</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Manage User</li>
						<li class="breadcrumb-item active" aria-current="page">User
							Master</li>
					</ol>
				</nav>
			</div>
		
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link " href="addUserUserMaster">Add</a>
							<a class="nav-item nav-link active" href="addUserUserViewMaster">View</a>
						</ul>
					</div>				<div class="search-container">
						<div class="search-sec" <c:if test="${showSearch eq true}"> style="display:block" </c:if> >
						<form action="searchViewUsers" method="post" autocomplete="off"> 
							<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
							<div class="form-group">
								<div class="row">
									<label class="col-lg-2 ">Organization Name</label>
									<div class="col-lg-3">
										<select class="form-control" id="organizationId" name="oname">
											<option value=0>--Select--</option>
											<c:forEach items="${orgList}" var="org">

												<option value="${org.levelDetailId}">${org.levelName}</option>
											</c:forEach>
										</select>
									</div>

									<label class="col-lg-2 ">User Role</label>
									<div class="col-lg-3">
										<select class="form-control" id="roleId" name="role">
											<option value="0">--Select--</option>
											<c:forEach items="${roles}" var="rle">

												<option value="${rle.roleId}">${rle.aliasName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">

									<label class="col-lg-2 ">Research Center</label>
									<div class="col-lg-3">
										<select class="form-control" id="researchCenterId" name="center">
											<option value="0">--Select--</option>
											<c:forEach items="${rcList}" var="rcl">

												<option value="${rcl.researchCenterId}">${rcl.researchCenterName}</option>
											</c:forEach>
										</select>
									</div>
									<label class="col-lg-2 ">Designation</label>
									<div class="col-lg-3">
										<select class="form-control" id="intdesigid" name="desig">
											<option value="0">--Select--</option>
											<c:forEach items="${desingnationList}" var="des">

												<option value="${des.id}">${des.designation}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						

							<div class="form-group">
								<div class="row">
									
									<label class="col-lg-2 ">Mobile no.</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="mobileNo"
											placeholder="" data-bv-field="fullName" id="mobile" autocomplete="off" maxlength="15">
									</div>
									<label class="col-lg-2 ">Email</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="email"
											placeholder="" data-bv-field="fullName" id="email" autocomplete="off" maxlength="50">
									</div>
								</div>
							</div>
							
							
							<div class="form-group">
								<div class="row">
								
								<label class="col-lg-2 ">Name</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="name"
											placeholder="" data-bv-field="fullName" id="fullName" autocomplete="off" maxlength="50">
									</div>
								
									
									<label class="col-sm-2 ">Status</label>
									<div class="col-sm-3">
										<select class="form-control" id="status" name="status">
											<option value="0">--Select--</option>
											<option value="false">Active</option>
											<option value="true">Inactive</option>
										</select>
									</div>
									<div class="col-lg-2">
										<button class="btn btn-primary" type="submit" onclick="validate()">
											<i class="fa fa-search"></i> Search
										</button>
									</div>
								</div>
							</div>
							</form> 
						</div>
						<div class="text-center">
							<a class="searchopen" title="Search" data-toggle="tooltip"
								data-placement="bottom"> <i class="icon-angle-arrow-down"></i>
							</a>
						</div>
					</div>
					<!-- Search Panel -->
					<!--===================================================-->
					<div class="card-body">
						<div class="table-responsive">
					
						
							<table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
								<thead>
									<tr>
										<th width="40px">Sl#</th>
										<th>Organization Name</th>
										<th>User ID</th>
										<th>User Name</th>
										<th>Gender</th>
										<th>Designation</th>
										<th>Role</th>
										<th>Research Center Name</th>
										<th>Mobile</th>
										<th>Email</th>
										<th>Status</th>
										<th>Action</th>
										<th>User Unlock</th>
										<th>Reset Password</th>
									</tr>
								</thead>
								     <tbody ><!-- userdetails -->
								     
								       <%-- <c:forEach items="${userdetails}" var="dtls" varStatus="theCount">
                                    <tr >
                                  
                                       <td>${theCount.index + 1 }</td>
                                       <td>${dtls.organizationName }</td>
                                       <td>${dtls.userName }</td>
                                       <td>${dtls.fullName }</td>
                                       <c:if test="${dtls.gender eq 1 }">
                                       <td>Male</td>
                                       </c:if>
                                       <c:if test="${dtls.gender eq 2 }">
                                       <td>Female</td>
                                       </c:if>
                                       
                                       <c:if test="${dtls.gender eq 0 }">
                                       <td>NA</td>
                                       </c:if>
                                       
                                       <td>${dtls.designation }</td>
                                       <td>${dtls.roleName }</td>
                                       <td>${dtls.rcName }</td>
                                       <td>${dtls.mobile }</td>
                                       <td>${dtls.email }</td>
                                       <td>${dtls.bitStatus }</td>
                                       <td>${dtls.edit }</td>
                                       <td>${dtls.passwordUnlock }</td>
                                         
                                    </tr>
                                    </c:forEach> --%>
                                 </tbody>	
							</table>
	
						</div>
						<div id="showPageNId">
						</div>
						<div style="float: right;">
							<ul class="pagination">
  							</ul>
						</div>						
					</div>
					<div>
					
						<span id="p4"></span> 
					</div>
					<form action="addUserUserMasterEdit" method="post" id="editForm">
					<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						<input type="hidden" name="userId" id="userId">
					</form>
					<form:form action="unlockUserMaster" name="unlockUser" method="post">
					<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
		            <input type="hidden" name="unlockUserId" id="hiddenUnlockId"/>
                    </form:form>
                    
                    <form:form action="userResetPassword" name="userResetPassword" method="post">
					<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
		            <input type="hidden" name="unlockUserId" id="hdnResetUserId"/>
                    </form:form>
                    
                    
					<!--===================================================-->
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
var msg = '${msg}';
console.log('Message='+msg);
if(msg != undefined && msg != null && msg != '')
	{
	swal("Success", msg, "success"); 
	}
	
var msg1 = '${msg1}';
if(msg1 != undefined && msg1 != null && msg1 != '')
{
swal("Success", msg1, "success"); 
}

var msg2 = '${errMsg}';
if(msg2 != undefined && msg2 != null && msg2 != '')
{
swal("Error", msg2, "error"); 
}

var RecordFound = '${RecordFound}';
if(RecordFound != '' && RecordFound != undefined && RecordFound != null && (RecordFound == false || RecordFound == 'false') )
{
	$(".table-responsive").hide();
swal("No record found."); 
}
else{
	$(".table-responsive").show();
}

});	
	function edit(id) {
		
		swal({
	   		 title: 'Are you sure to edit the user ?',
	   		  type: 'warning',
	   		  showCancelButton: true,
	   		  confirmButtonText: 'Yes',
	   		  cancelButtonText: 'No',
	   		  /* reverseButtons: true */
		    }).then((result) => {
		    	  if (result.value) {

		    			$('#userId').val(id);
		    			$('#editForm').submit();
		    		  }
		    		})
	   	return false;
		
	}

	function unlock(unlockId) {
		
		swal({
			 title: 'Are you sure to unlock the user ?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonText: 'Yes',
			  cancelButtonText: 'No',
			  /* reverseButtons: true */
	    }).then((result) => {
	    	  if (result.value) {
	    		  $("#hiddenUnlockId").val(unlockId);
	  			$("form[name='unlockUser']").submit();
	    		  }
	    		})
		return false;

	}

	//Reset password
	 function resetPassword(id) {
		 
		swal({
   		 title: 'Are you sure to reset password for this user ?',
   		  type: 'warning',
   		  showCancelButton: true,
   		  confirmButtonText: 'Yes',
   		  cancelButtonText: 'No',
   		  /* reverseButtons: true */
	    }).then((result) => {
	    	  if (result.value) {
	    		   $("#hdnResetUserId").val(id);
	  			$("form[name='userResetPassword']").submit();
	    		  } 
	    		})
   	return false;
		
	} 
	
	


$(function() {

	$('#viewTable').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	         "ordering": false, 
			 "ajax" : {
					"url" : "viewUserDataPagination",
					"data" : function(d) {
						d.organizationId= $("#organizationId").val();
						d.roleId = $("#roleId").val();
						d.researchCenterId =$("#researchCenterId").val();
						d.intdesigid= $("#intdesigid").val();
						d.mobile = $("#mobile").val();
						d.email =$("#email").val();
						d.fullName =$("#fullName").val();
						d.status =$("#status").val();
					}
			},
			"dataSrc": "",
			"columns":[
				{"data":"sNo"},
				{"data":"organizationName"},
				{"data":"userName"},
				{"data":"fullName"},
				{"data":"genderName"},
				{"data":"designation"},
				{"data":"roleName"},
				{"data":"rcName"},
				{"data":"mobile"},
				{"data":"email"},
				{"data":"bitStatus"},
				{"data":"edit"},
				{"data":"passwordUnlock"},
				{"data":"resetPassword"}        // for password reset
				
			]
	
  
	});
	});

</script>

<script>

var mobileNo = '${mobileNo}';
if(mobileNo != null && mobileNo != undefined && mobileNo != '')
	{
	$("#mobile").val(mobileNo);
	}
var email = '${email}';
if(email != null && email != undefined  && email != '')
{
$("#email").val(email);
}
var name = '${name}';
if(name != null && name != undefined  && name != '')
{
$("#fullName").val(name);
}
var oname = '${oname}';
if(oname != null && oname != undefined  && oname != 0)
{
$("#organizationId").val(oname);
}
var role = '${role}';
if(role != null && role != undefined  && role != 0)
{
$("#roleId").val(role);
}
var center = '${center}';
if(center != null && center != undefined  && center != 0)
{
$("#researchCenterId").val(center);
}
var desig = '${desig}';
if(desig != null && desig != undefined && desig != 0)
{
$("#intdesigid").val(desig);
}
var status = '${status}';
if(status != null && status != undefined  && status != 0)
{
$("#status").val(status);
}


</script>
<script>
function validate() {
	var name=$("#fullName").val();
	var email=$("#email").val();
	var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{0,4}$/;
	var mobile=$("#mobile").val();
	var mob_regex=
	event.preventDefault();
	var form = event.target.form;
	
	if(name.charAt(0)== ' ' || name.charAt(name.length - 1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in Name", "error").then(function() {
			   $("#fullName").focus();
		   });
      return false;
	   }
	if(name!=null)
	{
			var count= 0;
			var i;
			for(i=0;i<name.length && i+1 < name.length;i++)
			{
				if ((name.charAt(i) == ' ') && (name.charAt(i + 1) == ' ')) 
				{
					count++;
				}
			}
			if (count > 0) {
				swal("Error", "Name should not contain consecutive blank spaces", "error").then(function() {
				   $("#fullName").focus();
				});
				return false;
			}
	}
	if(/^[a-zA-Z ]{0,50}$/.test(name) == false) {
	  	swal("Error","Name accept only alphabets", "error").then(function() {
					   $("#fullName").focus();
				   });
	  	return false;
	  }
	if(mobile.charAt(0)== ' ' || mobile.charAt(mobile.length - 1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in Mobile No.", "error").then(function() {
			   $("#mobile").focus();
		   });
         return false;
	   }
	if(mobile!=null)
	{
			var count= 0;
			var i;
			for(i=0;i<mobile.length && i+1 < mobile.length;i++)
			{
				if ((mobile.charAt(i) == ' ') && (mobile.charAt(i + 1) == ' ')) 
				{
					count++;
				}
			}
			if (count > 0) {
				swal("Error", "Mobile No. should not contain consecutive blank spaces", "error").then(function() {
				   $("#mobile").focus();
				});
				return false;
			}
	}
	if(/^[0-9]*$/.test(mobile) == false) {
	  	swal("Error","Mobile No. accept only alphabets", "error").then(function() {
					   $("#mobile").focus();
				   });
	  	return false;
	  }
	if(mobile.length>0 && mobile.length <6)
   	{
   		swal(
					'Error',
					'Mobile No. should not be less than 6 digits',
					'error'
					)
					$("#mobile").focus();
					return false;
   	}
	if(email.charAt(0)== ' ' || email.charAt(email.length - 1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in Email", "error").then(function() {
			   $("#email").focus();
		   });
      return false;
	   }
	if(email!=null)
	{
			var count= 0;
			var i;
			for(i=0;i<email.length && i+1 < email.length;i++)
			{
				if ((email.charAt(i) == ' ') && (email.charAt(i + 1) == ' ')) 
				{
					count++;
				}
			}
			if (count > 0) {
				swal("Error", "Email should not contain consecutive blank spaces", "error").then(function() {
				   $("#email").focus();
				});
				return false;
			}
	}
	if(email.length>0 && !email.match(email_regex))
	{
		swal(
				'Error',
				'Invalid Email',
				'error'
				)
				$("#email").focus();
				return false;
	}
	form.submit();
}

</script>


