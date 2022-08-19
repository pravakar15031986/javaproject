     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

 <div class="mainpanel">
 
<%--  <form:form action="editNotification" name="myform" method="post">
<input type="hidden" name="notifyId" id="hdnNotifyId"/>
</form:form> --%>
 
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Archive Notification</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
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
                              <a class="nav-item nav-link "  href="addNotification">Add</a>
                              <a class="nav-item nav-link "  href="viewNotification" >View</a>
                              <a class="nav-item nav-link active"  href="archiveNotification" >Archive</a>
                           </ul>
                    
                        </div> 
                        
                        <form:form class="col-sm-12 form-horizontal customform" action="searchArchiveNotification"  method="post" modelAttribute="searchVo" autocomplete="off">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="search-container">
                       <c:if test="${showSearch eq true }">
                        	 <div class="search-sec">
                        	</c:if>
                           <c:if test="${showSearch eq false }">
                        	 <div class="search-sec" style="display:block;"> 
                        	</c:if>
                           <div class="form-group">
                                 <div class="row">
                                 <label class="col-lg-2 ">Notification Date From</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" id="ntfDtFrom" path="ntfDateFrom" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <label class="col-lg-2 ">Notification Date To</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" id="ntfDtTo" path="ntfDateTo" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 </div>
                         </div>
                              <div class="form-group">
                                 <div class="row">
                                 <label class="col-lg-2 ">Notification Created On From</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" id="ntfCreatedFrom" path="createdDateFrom" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <label class="col-lg-2 ">Notification Created On To</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" id="ntfCreatedTo" path="createdDateTo" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary" onclick="validate()"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        </form:form>
                        
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="myTable">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Notification Message</th>
                                       
                                       <th>Notification Date</th>
                                       <th>Notification Created On</th>
                                       <th>Users</th>
                                       
                                       
                                    </tr>
                                 </thead>
                                 <tbody>
                                    
                                   <%--  <c:forEach items="${notificationList}" var="nList" varStatus="counter">
                                    <tr>
                                    	<td><c:out value="${counter.count}"></c:out></td>
                                    	<td>${nList.notificationMsg}</td>
	                                 	<td>${nList.sendDate}</td>
                                    	<td>${nList.createdOn}</td>
                                    	<td><a data-placement="top" data-toggle="modal" title="User Info" data-target="#userModal" onclick="userInfo(${nList.notifyId})">
	                                 	<button class="btn btn-primary btn-xs" data-title="Users">
	                                 	<i class="fa fa-info-circle"></i>
	                                 	</button>
	                                 	</a></td>
                                    </tr>
                                    </c:forEach> --%>
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
  
<!-- Modal -->
  <div class="modal fade" id="userModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         
          <h4 class="modal-title">User Details</h4>
        </div>
        
        <div class="modal-body">
        		
         		<table data-toggle="table" class="table table-hover table-bordered">
                                 <thead id="userTblHd">
                                    
                                 </thead>
                                 <tbody id="userTblBdy">
                                   
                                 </tbody>
                              </table>
                              <p id="userModalMsg"></p>
                          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
      
<c:if test="${msg ne Empty}">

	<script>
	$(document).ready(function(){
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	});
</script>
</c:if>
      <c:if test="${errMsg ne Empty}">
	<script>
	$(document).ready(function(){	
	swal("${errMsg}"," ", "error");
	});
</script>
</c:if>

<script>
function userInfo(notifyId)
{
	$('#userTblHd').empty();
	$('#userTblBdy').empty();
	$('#userModalMsg').empty();
	$.ajax({
		type : "POST",
		url : "getNotificationMemberDetails", 
	 
		data : {
			"notifyId":notifyId
		},
		success : function(response) {
			
			var val=JSON.parse(response);
		    if(val.length == 0 ){
				$('#userModalMsg').html('No data available');
			}else{
			    var htmlBody ="";
			    var htmlHead ='<tr><th width="40px">Sl#</th><th>Organization</th><th>Role</th><th>Users</th></tr>';
				$.each(val,function(i, item) {
					htmlBody += '<tr><td>' + parseInt(i+1) + '</td><td>' + item.organization + '</td><td>' + item.role + '</td><td>' + item.fullName + '</td></tr>';
				});
				$('#userTblHd').append(htmlHead);
				$('#userTblBdy').append(htmlBody);
			}
			
		},error : function(error) {
			 
		}
	}); 
}
</script>


<script>
 
$(function() {
	 
	 $('#myTable').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "viewArchiveNotificationPageWise",
					"data" : function(d) {
						d.sendFromDate=$("#ntfCreatedFrom").val();
						d.sendToDate=$("#ntfCreatedTo").val();
						d.fromDate= $('#ntfDtFrom').val();
						d.toDate = $('#ntfDtTo').val();
						}
			},
			"dataSrc": "",
			"columns":[
				{"data":"sNo"},
				{"data":"notificationMsg"},
				{"data":"sendDate"},
				{"data":"createdOn"},
				{"data":"userInfo"}
			]
	});
	});	


</script> 


<script>
function validate(){
	event.preventDefault();
	var form = event.target.form;
	var fromDate=$("#ntfDtFrom").val();
	var toDate=$("#ntfDtTo").val();
	var createdDtFrom=$("#ntfCreatedFrom").val();
	var createdDtTo=$("#ntfCreatedTo").val(); 
	if(Date.parse(fromDate)>Date.parse(toDate))
	{
		swal(
				'Error',
				'Notification Date To should not be less than Notification Date From',
				'error'
				).then(function() {
					   $("ntfDtTo").focus();
				});
   		 	   		return false; 
	}
	if(fromDate != "" && toDate == "")
    {
		swal("Error", "Notification Date To should not be blank  ", "error").then(function() {
			   $("ntfDtTo").focus();
		});
		return false;
    }
	if(fromDate == "" && toDate != "")
    {
		swal("Error", "Notification Date From should not be blank  ", "error").then(function() {
			   $("ntfDtFrom").focus();
		});
		return false;
    }
	
	if(Date.parse(createdDtFrom)>Date.parse(createdDtTo))
	{
		swal(
				'Error',
				'Notification Created Date To should not be less than Notification Created Date From',
				'error'
				).then(function() {
					   $("ntfCreatedFrom").focus();
				});
   		 	   		return false; 
	}
	if(createdDtFrom != "" && createdDtTo == "")
    {
		swal("Error", "Notification Created Date To should not be blank  ", "error").then(function() {
			   $("ntfCreatedTo").focus();
		});
		return false;
    }
	if(createdDtFrom == "" && createdDtTo != "")
    {
		swal("Error", "Notification Date From should not be blank  ", "error").then(function() {
			   $("ntfCreatedFrom").focus();
		});
		return false;
    }
	  form.submit();
}
</script>