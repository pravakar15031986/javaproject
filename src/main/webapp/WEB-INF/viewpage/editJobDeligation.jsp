<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Job Delegation</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Approval Process</li>
                           <li class="breadcrumb-item active" aria-current="page">Job Delegation</li>
                        </ol>
                     </nav>
                  </div>
           
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addJobDeligation">Edit</a>
                              <a class="nav-item nav-link "  href="viewJobDeligation" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" onclick="history.back()" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        
                        <form action="viewJobDeligation" id="viewForm"></form>
                        <form:form action="saveDelegation" autocomplete="off"  modelAttribute="delegationBean">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <%-- <form:hidden path="multiapprovalId"/> --%>
                        <form:hidden path="delegationId"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input2">Approval Process<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4" ><span class="colon">:</span>
                              	 <form:select class="form-control" id="approvalProcessId"  path="approvalProcessId">
									<form:option value="0">--Select--</form:option>
									<form:options items="${processList}" itemLabel="processName" itemValue="processId" />
									</form:select>
                              </div>
                           </div>
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input2">Level of Approval<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                              
                              
                              <select name="multiapprovalId" id="levelApproval" class="form-control">
                              	<option value="0">--Select--</option>
                              </select>
                              </div>
                           </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input2">Organisation<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                  <form:select class="form-control" id="organisationId"  path="organisationId">
												<form:option value="0">--Select--</form:option>
												<form:options items="${orgList}" itemLabel="levelName" itemValue="levelDetailId" />
								</form:select>
                              </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input2">Delegate Approval To<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                  <form:select class="form-control" id="approvalTo"  path="approvalTo">
												<form:option value="0">--Select--</form:option>
												<form:options items="${userList}" itemLabel="fullName" itemValue="userId" />
								</form:select>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Delegation Period<span class="text-danger">*</span></label>
                             <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                               <div class="row">
                                    <div class="col-12 col-md-5 col-xl-5">
                                       <div class="input-group">
                                      <form:input type="text" class="form-control datepicker" path="datefrom" id="datefrom" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                   </div>
                                   </div>
                                    <div class="col-12 col-md-2 col-xl-2 text-center"> to </div>
                                    <div class="col-12 col-md-5 col-xl-5">
                                       <div class="input-group">
                                       <form:input type="text" class="form-control datepicker" path="dateto" id="dateto" aria-label="Default" aria-describedby="inputGroup-sizing-default"/>
                                       <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                    </div>
                                    </div>
                                </div>   
                               </div>
                           </div>
                    
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea  path="description" id="descriptionId" rows="4" class="form-control" placeholder="Description" maxlength="200" onkeyup="countChar(this)"/><div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnSubmitId">Update</button>
                                 <button type="button" class="btn btn btn-danger" id="myButton">Cancel</button>
                                 
                                 
                              </div>
                           </div>
                        </div>
                        </form:form>
                        <!--===================================================-->
                        <!-- END BASIC FORM ELEMENTS -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
  
<script>
	$(function(){

		   $(".selectall").click(function(){
			$(".individual").prop("checked",$(this).prop("checked"));
			});
		
		
	});
</script>


<script>

var processId = $("#approvalProcessId").val();
levelOfApproval(processId);
function levelOfApproval(changeVal)
{

	var objRowsData ="";
	var dataString = 'processId='+ changeVal;
	 $.ajax({
		 type: "POST",
         url : 'getAuthorityStatusEdit',
         data: dataString,
			cache: false,
         success : function(data) {
        	
        	 if(data.length > 0){
        		 //levelApproval.empty();
     		    var option="";
	            for(var i=0; i<data.length; i++){
	                option = option + "<option value='"+data[i].multiapprovalId + "'>Level - "+data[i].stageNo + "</option>";
	            }
	            //levelApproval.append(option);
	            $("#levelApproval").html(option);

        	 }else{
        		 $("#levelApproval").html(option);
        		 //levelApproval.append(option);
	        	 }
        
         } 	             
	 });
	
	
	
	
}
$( "#organisationId" ).change(function() {
	 var approvalTo=$('#approvalTo');
	 var option="<option value='0'>--Select--</option>";
	 approvalTo.empty();
	 if($(this).val()=='0'){
		 approvalTo.empty();
		 approvalTo.append(option);
	    	return false;
	 }
	var changeVal = $(this).val();
	var objRowsData ="";
	var dataString = 'orgId='+ changeVal;
	 $.ajax({
		 type: "POST",
        url : 'getUsersByLevel',
        data: dataString,
			cache: false,
        success : function(data) {
       	
       	
       	 if(data.length > 0){
       		 approvalTo.empty();
    		
	            for(var i=0; i<data.length; i++){
	                option = option + "<option value='"+data[i].userId + "'>"+data[i].fullName + "</option>";
	            }
	            approvalTo.append(option);


       	 }else{
       		 approvalTo.append(option);
	         }
       	
	         
	     
        } 	             
	 });
	
	
	
	
	});
	
$(document).ready(function(){
	
	$( "#approvalProcessId" ).change(function() {

		//var changeVal = $(this).val();

		 var levelApproval=$('#levelApproval');
		 var option="<option value='0'>--Select--</option>";
		 levelApproval.empty();
		 if($(this).val()=='0'){
			 levelApproval.empty();
			 levelApproval.append(option);
		    	return false;
		 }
		var changeVal = $(this).val();
    	var objRowsData ="";
		var dataString = 'processId='+ changeVal;
		 $.ajax({
			 type: "POST",
	         url : 'getAuthorityStatus',
	         data: dataString,
				cache: false,
	         success : function(data) {
	        	
	        	
	        	 if(data.length > 0){
	        		 levelApproval.empty();
	     		
		            for(var i=0; i<data.length; i++){
		                option = option + "<option value='"+data[i].multiapprovalId + "'>Level - "+data[i].stageNo + "</option>";
		            }
		            levelApproval.append(option);


	        	 }else{
	        		 levelApproval.append(option);
		        	 }
	        	 } 	             
		 });
		
		
		
		
		levelOfApproval(changeVal);
		
		});

	   $('#btnSubmitId').click(function(){
		   event.preventDefault();
      	   var form = event.target.form;
		   if ($('#approvalProcessId').val() == "0"){
	        	swal("Error", "Approval Process should not blank", "error");
	        	 $("#approvalProcess").focus();
	            return false;
	        }
		    if ($('#organisationId').val() == "0"){
	        	swal("Error", "Organisation should not blank", "error");
	        	 $("#organisation").focus();
	            return false;
	        }
		    if ($('#approvalTo').val() == "0"){
	        	swal("Error", "Delegation Approval To should not blank", "error");
	        	 $("#approvalTo").focus();
	            return false;
	        }
		    if ($('#datefrom').val() == ""){
	        	swal("Error", "Delegation Period from date should not blank", "error");
	        	 $("#from").focus();
	            return false;
	        }
		    if(validateFutureDate($('#datefrom').val())){
		        swal("Error","Delegation Period from date should be greater than today", "error");
		        $("#datefrom").focus();
		        return false;
		      }
		    if ($('#dateto').val() == ""){
	        	swal("Error", "Delegation Period to date should not blank", "error");
	        	 $("#dateto").focus();
	            return false;
	        }
		    
		      var fromdate = $('#datefrom').val();
		      var todate = $('#dateto').val();
		      
		      if(Date.parse(fromdate) > Date.parse(todate)){
		    	  swal("Error", "Delegation Period to date should not be less than from date", "error");
		        	 $("#dateto").focus();
		            return false;
		    	}
           /* if($("input[name='form-radio-button']:checked").length==0){
           	swal("Error", "Please select Status", "error");
	            return false;
           }  */
           else{
           	swal({
           		title: ' Do you want to Submit?',
           		  type: 'warning',
           		  showCancelButton: true,
           		  confirmButtonText: 'Yes',
           		  cancelButtonText: 'No',
           		  /* reverseButtons: true */
       	    }).then((result) => {
       	    	  if (result.value) {
       	    		 // swal("Success", "Submitted Successfully ", "success"); 
       	    		  //window.location.href="viewJobDeligation";
       	    		  form.submit();
       	    		  return true;
       	    		  }
       	    		})
       	    return false;
           }
	   });
	   });
function countChar(val) {
    var len = val.value.length;
    if (len > 200) {
    	
    } else {
      var remaining_len=$('#charNum').text(200 - len+" characters left");
    }
  };

  function validateFutureDate(date) {
	    var a=new Date(date);
	    var b=new Date();
	    var date=new Date();
	    var a1=a.getDate()+"";
	    var b1=b.getDate()+"";
	    

	    if(a.getMonth()==b.getMonth()) {

	       if(a.getDate()==b.getDate() || a.getDate()<b.getDate()) {
	        return true;
	        }else{
	          return false;
	        }
	    }else if(a.getMonth()<b.getMonth()){
	       return true;
	    }else{
	    	return false;
	    }
	} 
</script>
<script type="text/javascript">
    document.getElementById("myButton").onclick = function () {
        $('#viewForm').submit();
    };
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
