<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     
     
      <c:if test="${msg ne Empty}">
	<script>
	 $(document).ready(function(){   

	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	 });
</script>
</c:if>
      <c:if test="${msg_1 ne Empty}">
	<script>
	 $(document).ready(function(){  
	swal("${msg_1}"," ", "error"); 
	 });
</script>
</c:if>  
      
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Manage User 2</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Manage User</li>
                        </ol>
                     </nav>
                  </div>
           
                  ${ErrorMessage} Check
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addUserUserMaster">Add</a>
                              <a class="nav-item nav-link "  href="addUserUserViewMaster" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                      
                        <form:form action="add-user-master" method="post" modelAttribute="user" autocomplete="off">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                             <div class="width50">
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Organization Name<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											 <form:select class="form-control" id="organizationId" onchange="mapperResearchCenter(this.value);" path="memUserTypeId">
												<form:option value="0">--select--</form:option>
												<form:option value="1">EIAR</form:option>
												<form:option value="2">ATA</form:option>
												<form:option value="3">CIMMYT</form:option>
												<form:option value="4">UK Metrology</form:option>
												<form:option value="5">Global Rust Monitoring</form:option>
											</form:select>
										</div>
									</div>
									<%-- <div class="form-group row" id="mapDivId">
									<label class="col-12 col-md-4 col-xl-4 control-label"><span
											class="text-danger">Map to Research Center ?</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<!-- Radio Buttons -->
										<div class="radio">
											<form:radiobutton  path="" id="mapStatus-1" class="magic-radio" type="radio" value="Y" name="mapStatus" onchange="radioBtnCenter(this.value);"/> 
											<label for="mapStatus-1"> Yes</label> 
											<form:radiobutton path="" id="mapStatus-2" class="magic-radio" type="radio" value="N" name="mapStatus" checked="checked" onchange="radioBtnCenter(this.value);"/> 
											<label for="mapStatus-2"> No </label>
										</div>
									</div>
									
								</div>   --%>
								<%-- <div class="form-group row" id="researchCenterDivId">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Research Center Name <span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											 <form:select class="form-control" id="researchCenterId" path=""> 
												<form:option value="1">Ambo Agriculture Research Center</form:option>
												<form:option value="2">Sinana Research Center</form:option>
												<form:option value="3">Kulumsa Research Center</form:option>
										  <%--   </form:select>
										</div>
									</div> --%>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">User Role <span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
										 <form:select class="form-control" id="roleId" path="groupId">
												<form:option value="0">--select--</form:option>
												<c:forEach items="${adminRole}" var="admin">
														<form:option value="${admin.roleId}">${admin.aliasName}</form:option> 
												</c:forEach>
												
											</form:select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-text-input">Name<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> 
											<form:input	id="name" class="form-control" placeholder="" path="fullName"/>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Designation </label>
										<div class="col-12 col-md-8 col-xl-8">
											 <form:select class="form-control" path="intdesigid">
												<form:option value="0">--select--</form:option>
												<form:option value="1">Designation 1</form:option>
												<form:option value="1">Designation 2</form:option>
												<form:option value="1">Designation 3</form:option>
												<form:option value="1">Designation 4</form:option>
												<form:option value="1"> Designation 5</form:option>
											</form:select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-text-input">Mobile No.<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> 
											<form:input id="mobile" class="form-control" placeholder="" path="mobile"/>
										</div>
									</div><div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-text-input">Email<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> 
											<form:input id="email" class="form-control" placeholder="" path="email"/>
										</div>
									</div>
									<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
									<div class="col-12 col-md-8 col-xl-8">
										<!-- Radio Buttons -->
										<div class="radio">
											<form:radiobutton id="demo-form-radio-1" class="magic-radio" value="false"  checked="checked" path="bitStatus"/> 
											<label for="demo-form-radio-1"> Active </label> 
											<form:radiobutton id="demo-form-radio-2" class="magic-radio" value="true" path="bitStatus"/> 
											<label for="demo-form-radio-2"> Inactive </label>
										</div>
									</div>
								</div>                                      
                        <hr>
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
                                
                                 <button class="btn btn-primary mb-1" id="btnSubmit">Submit</button>
                                 <button type="reset" class="btn btn btn-danger mb-1">Reset</button>
                                
                              </div>
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
$(document).ready(function (){
	 
	

	
		$("#mapDivId").hide();
		$("#researchCenterDivId").hide();
        $("#btnSubmit").click(function (){ 
        	 event.preventDefault();
        	 var form = event.target.form;
        var organizationId=$("#organizationId").val();
        	if(organizationId=='0')
        	{
        		swal(
    					'Warning!',
    					'Select Organization Name!',
    					'warning'
    					)
    					return false;
        	}
        	
        	
        	if($("#roleId").val()=='0')
        	{
        		swal(
    					'Warning!',
    					'Select Role!',
    					'warning'
    					)
    					return false;
        	}
        	var name_regex = /^[a-zA-Z ]{3,60}$/;
        	var name=$("#name").val();
        	if(name.length == 0)
        	{
        		swal(
    					'Warning!',
    					'Name Shouldnot be blank!',
    					'warning'
    					)
    					return false;
        	}
        	
        	if(!name.match(name_regex))
        	{
        		swal(
    					'Warning!',
    					'Name Should be alphabets only!',
    					'warning'
    					)
    					return false;
        	}
        	var mobile=$("#mobile").val();
        	if(mobile=='')
        	{
        		swal(
    					'Warning!',
    					'Mobile Number Shouldnot be blank!',
    					'warning'
    					)
    					return false;
        	}
        	var mob_regx=/^[0][1-9]\d{9}$|^[1-9]\d{9}$/g;
        	if(!mobile.match(mob_regx))
        	{
        		swal(
    					'Warning!',
    					'invalid  Mobile Number!',
    					'warning'
    					)
    					return false;
        	}
        	var email=$("#email").val();
        	if(email=='')
        	{
        		swal(
    					'Warning!',
    					'Email Shouldnot be blank!',
    					'warning'
    					)
    					return false;
        	}
        	var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        	if(!email.match(email_regex))
        	{
        		swal(
    					'Warning!',
    					'Invalied Email Id!',
    					'warning'
    					)
    					return false;
        	}
		        	swal({
		        		title: 'Create user?',
		        		  type: 'info',
		        		  showCancelButton: true,
		        		  confirmButtonText: 'Yes',
		        		  cancelButtonText: 'No',
		        		  /* reverseButtons: true */
		    	    }).then((result) => {
		    	    	  if (result.value) {
		    	    		   //swal("Success", "User created Successfully ", "success");
		    	    		   form.submit();
		    	    		  }
		    	    		})
		        	return false;
        		});
		})
		function mapperResearchCenter(id){
			if(id=='1')
			{
				$("#mapDivId").show();
				 var radioValue = $("input[name='mapStatus']:checked").val();
				 radioBtnCenter(id);
			
			}else{
				$("#mapDivId").hide();
				$("#researchCenterDivId").hide();
			}
			
			
		}
		function radioBtnCenter(id){
			 if(id=='Y')
		     {
				 $("#researchCenterDivId").show();
		     }else{
		    	 $("#researchCenterDivId").hide();
		     } 
			 
		}
		
		
</script>
<script>
$(document).ready(function(){
	if('${ErrorMessage}' != '')
	{
					alert('${ErrorMessage}');
					document.getElementById('${FieldId}').value="";
					document.getElementById('${FieldId}').focus();
	}	
});

</script>