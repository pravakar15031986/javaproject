<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/viewpage/common/footer.jsp" />  
<link rel="stylesheet" type="text/css" href="wrsis/css/dataTables.bootstrap4.min.css"/>
<script src="wrsis/js/jquery.dataTables.min.js"></script>
<script src="wrsis/js/dataTables.bootstrap4.min.js"></script>


<style>
.breadcrumb>li+li:before
{
display:none;
}
</style>



 
 
 <div class="mainpanel">

            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Registered Field Surveyor List</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Field Surveyor</li>
                           <li class="breadcrumb-item active" aria-current="page">View Registered Field Surveyor List</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                             
                              <a class="nav-item nav-link active" href="viewRegisterPacsInspector">New</a>
                                <a class="nav-item nav-link " href="viewRegisterPacsInspectorApprove">Approved</a>
                                  <a class="nav-item nav-link " href="viewRegisterPacsInspectorReject">Rejected</a>
                           </ul>
                           
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                            
                  	 <form:form class="col-sm-12 form-horizontal customform" action="viewRegisterPacsInspector" modelAttribute="viewRegisterPacsInspectorNew" autocomplete="off"  method="post">




								<div class="form-group">
									<div class="row">
										<!--  <label class="col-sm-2 ">District</label> -->
										<div class="col-sm-3">
											<form:select id="distId" class="form-control" path="districtId">
												<form:option value="0">Select District</form:option>
													<c:if test="${not empty districtList}">
												<form:options items="${districtList}" itemValue="districtId" itemLabel="districtName"/>
												</c:if>
												<c:if test="${not empty distCode}">
													<form:option value='${distCode}'>${distname}</form:option>
												</c:if>
											</form:select>
										</div>

										<!-- <label class="col-sm-2 ">Block</label> -->
										<div class="col-sm-3">
											<form:select id="blockId" path="blockId" class="form-control">
												<form:option value="0">Select Block</form:option>
												<form:options items="${blockList}" itemValue="blockId" itemLabel="blockName"/>
											</form:select>
										</div>

										<div class="col-sm-3">
											<form:select path="pacsId" id="pacsId" class="form-control">
												<form:option value="0">Select Society</form:option>
												<form:options items="${pacsList}" itemValue="pacsId" itemLabel="pacsName"/>
											</form:select>
										</div>
										<div class="col-lg-2">
											<button class="btn btn-primary">
												<i class="fa fa-search"></i> Search
											</button>
										</div>


									</div>




								</div>







							</form:form>  
                  	
                           </div>
                           <div class="text-center"> <a class="searchopen" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Search"> <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                           <div class="col-md-12">
                  		<c:if test="${not empty errMsg}">
                  			<div class="alert alert-danger fade-in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Error!</strong>${errMsg}
							</div>
                  		</c:if>
                		<c:if test="${not empty msg}">
                			<div class="alert alert-success fade-in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Success!</strong>${msg}
							</div>
                		</c:if>
                	</div>
                
               <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">

								<thead>
									<tr>
										<th>#Sl No</th>
										<th>District Name</th>
										<th>Block Name</th>
										<th>Society Name</th>
										<th>Name of the Field Surveyor</th>
										<th>Mobile Number</th>
										<th>Applied On</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${pacsInspectorRegisterdList}" var="listValue" varStatus="counter">

										<tr>
											<td><c:out value="${counter.count}" /></td>
											<td>${listValue.districtName}</td>
											<td>${listValue.blockName}</td>

											<td>${listValue.pacsName}</td>
											<td>${listValue.name}</td>
											<td>${listValue.mobileNumber}</td>
											<td>${listValue.createdOn}</td>
											<td> 
											<c:if test="${ roleId eq 5 }">
												 <c:if test="${ listValue.status eq 2 }">
						   					 		<span class="text-warning">Pending</span>
						   						</c:if>
											</c:if>
											<c:if test="${ roleId != 5 }">
											 <c:if test="${ listValue.status eq 2 }">
						   					 <a   href="#"  onclick="approvePacsInspector('${listValue.pacsInsId}')" title="Approve"><button class="btn  btn-info btn-sm" data-title="Approve"  ><i class="fa fa-check" aria-hidden="true"></i></button></a>
						   					  <a   href="#"  onclick="rejectPacsInspector('${listValue.pacsInsId}')" title="Reject"><button class="btn btn-danger btn-sm" data-title="Reject"  ><i class="fa fa-times" aria-hidden="true"></i></button></a>
						   					</c:if>
						   					</c:if>
						   					
						 
						<%--   <c:if test="${ listValue.bitStatus eq false }">
						 	  <a   href="deactiveGLink/${vo.globalLinkId}/1"  title="Deactive"><button class="btn btn-danger btn-sm" data-title="Deactive"  ><i class="fa fa-times" aria-hidden="true"></i></button></a>
						  </c:if> --%>
											</td>
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
         <input  type="hidden" value="${message}" id="messageId"/>
         <form method="post" id="approveFormId" action="actionOnPacsInspector">
         <input type="hidden" id="pacsInsHdnId" name="pacsInsId"/>
         <input type="hidden"  name="status" value="3"/>
         <input type="hidden"  name="rejRemark"/>
         </form>
         <form method="post" action="actionOnPacsInspector">
         <div id="registrationRequest" class="modal fade" role="dialog">

   		 <div class="modal-dialog modal-lg">



        <!-- Modal content-->
		
        <div class="modal-content">

            <div class="modal-header bg-maroon-700">

                <h4 class="modal-title text-white">Registration Request</h4>

            </div>

            <div class="modal-body">

                <div class="row form-group">

                    <label class="col-sm-4 col-form-label label-left">Remark<span class="text-danger">*</span></label>

                    <div class="col-sm-6">

                        <textarea  rows="3" class="form-control" name="rejRemark" id="remarkId"></textarea>
                        <input type="hidden" id="pacsInsId" name="pacsInsId"/>
                        <input type="hidden"  name="status" value="4"/>

                    </div>

                </div>

            </div>

            <div class="modal-footer">

                <button type="submit" class="btn btn-success btn-md" onclick="return valiadtereject();" >Save</button>
                <button type="submit" class="btn btn-danger btn-md"  data-dismiss="modal">Close</button>

            </div>

        </div>
        </form>
  <link rel="stylesheet" type="text/css" href="/css/sweetalert2.all.min.css"/>      
 <script src="/js/sweetalert2.all.min.js.js"></script>        
<script type="text/javascript">
    $(document).ready(function(){
    	
    	
    	$("#distId").on("change",function(){
    	var distId=$(this).val();
    	
    	
    	
    	
       $.ajax({
    	type : "POST",
    	url : "fetchBlockDetailsByDistId",
    	data : 'distId='+distId,
    	cache : false,
    	timeout : 600000,
    	success : function(response) {
    		//console.log(response);
    		var len=response.length;
    		var html='';
    		html+='<option value="0">Select Block</option>';
    		for(var i=0;i<len;i++){
    			
    			html+='<option value="'+response[i].blockId+'">'+response[i].blockName+'</option>';
    			
    		}
    		$("#blockId").empty();
    		$('#pacsId option:first').attr('selected',true);
    		$("#blockId").append(html);

    	},
    	error:function(err){
    		console.log(err);
    	}
    	
    });

    });
    	
    	$("#blockId").on("change",function(){
    		var blockId=$(this).val();
    		
    		
    	   $.ajax({
    		type : "POST",
    		url : "fetchPacsDetailsByBlockId",
    		data : 'blockId='+blockId,
    		cache : false,
    		timeout : 600000,
    		success : function(response) {
    			//console.log(response);
    			var len=response.length;
    			var html='';
    			html+='<option value="0">Select Society</option>';
    			for(var i=0;i<len;i++){
    			
    				html+='<option value="'+response[i].societyId+'">'+response[i].societyName+'('+response[i].societyId+')</option>';
    				
    			}
    			$("#pacsId").empty();
    			$("#pacsId").append(html);

    		},
    		error:function(err){
    			console.log(err);
    		}
    		
    	});
    	
    	});
    	
    });
    </script>
<script>
$(document).ready(function(){
$('#viewTable').DataTable( {
    "pagingType": "full_numbers"
    });
    
    if($("#messageId").val()!=''){
    	swal({
			
			  text: $("#messageId").val(),  
			  icon: "success",
			  button: "Close",
			})
    }
    
    
});
</script>

         
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
    <script>
    function approvePacsInspector(pacsInsHdnId){
    	 swal({
		 		title: 'Do you want to Approve?',
		 		  type: '',
		 		  showCancelButton: true,
		 		  confirmButtonText: 'Yes',
		 		  cancelButtonText: 'No',
			    }).then((result) => {
			    	     if (result.value) {
			    	    	 	$("#pacsInsHdnId").val(pacsInsHdnId);
			    	        	$("#approveFormId").submit();
			    		  }
			    	  
			    		})
			    	
   
    }
    function rejectPacsInspector(pacsInsHdnId){
    	$("#pacsInsId").val(pacsInsHdnId);
    	$("#remarkId").val("");
    	$("#registrationRequest").modal('show');
    	
    	
    }
    
    function valiadtereject(){
    	var remark=$("#remarkId").val();
    	if(remark.trim()==''){
    		alert("Please enter a remark");
    		return false;
    	}else{
    		return true;
    	}
    }
    
    
    
    </script>

