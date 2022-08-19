<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

 <div class="mainpanel">
 
 <form:form action="editCommittee" name="myform" method="post">
 
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

 
<input type="hidden" name="committeeId" id="hdnCommitteeId"/>
</form:form>
 
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Committee</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Committee Configuration</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="addCommittee">Add</a>
                              <a class="nav-item nav-link active"  href="viewCommittee" >View</a>
                           </ul>
                   
                        </div>
                       
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="myTable">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Committee Name</th>
                                       <th>Committee Role</th>
                                       <th>Members</th>
                                       <th>Description</th>
                                       <th>Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    
                                    <c:forEach items="${committeeList}" var="cList" varStatus="counter">
                                    <tr>
                                    	<td><c:out value="${counter.count}"></c:out></td>
                                    	<td>${cList.committeeName}</td>
                                    	<td>${cList.committeeRole }
                                    	<td><a data-placement="top" data-toggle="modal" title="User Info" data-target="#myModal" onclick="userInfo(${cList.committeeId})">
	                                 	<button class="btn btn-primary btn-xs" data-title="Users">
	                                 	<i class="fa fa-info-circle"></i>
	                                 	</button>
	                                 	</a></td>
                                    	<td>${cList.committeeDesc}</td>
                                    	<td><a data-placement="top" data-toggle="tooltip" title="Edit" id="edit${cList.committeeId}" onclick="editCommittee('${cList.committeeId}');">
	                                 	<button class="btn btn-primary btn-xs" data-title="Edit">
	                                 	<i class="icon-edit1"></i>
	                                 	</button>
	                                 	</a></td>
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
  
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Member Details</h4>
        </div>
        
        <div class="modal-body">
        		
         		<table data-toggle="table" class="table table-hover table-bordered">
                                 <thead id="tblHd">
                                    
                                 </thead>
                                 <tbody id="tblBdy">
                                   
                                 </tbody>
                              </table>
                              <p id="modalMsg"></p>
                          
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
function userInfo(committeeId)
{
	$('#tblHd').empty();
	$('#tblBdy').empty();
	$('#modalMsg').empty();
	$.ajax({
		type : "POST",
		url : "getMemberDetails", 
	 
		data : {
			"committeeId":committeeId
		},
		success : function(response) {
			
			var val=JSON.parse(response);
		    if(val.length == 0 ){
				$('#modalMsg').html('No data available');
			}else{
			    var htmlBody ="";
			    var htmlHead ='<tr><th width="40px">Sl#</th><th>Organization</th><th>Member</th><th>Role</th></tr>';
				$.each(val,function(i, item) {
					htmlBody += '<tr><td>' + parseInt(i+1) + '</td><td>' + item.organization + '</td><td>' + item.fullName + '</td><td>' + item.role + '</td></tr>';
				});
				$('#tblHd').append(htmlHead);
				$('#tblBdy').append(htmlBody);
			}
			
		},error : function(error) {
			 
		}
	}); 
}
</script>

<script>
function editCommittee(committeeId){
	 //alert(committeeId); 
	 $("#hdnCommitteeId").val(committeeId);
    $("form[name='myform']").submit();
		}
</script>
<script>
$(document).ready( function () {
    $('#myTable').DataTable({
            "paging":   true,
            "ordering": true,
            "info":     true
        });
    });
</script>
<style>
.modal-dialog{
    position: relative;
    display: table; 
    overflow-y: auto;    
    overflow-x: auto;
    width: auto;
    min-width: 300px;   
}
</style>