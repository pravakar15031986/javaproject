<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     
      <script type="text/javascript">
		$(document).ready(function() {
			//setTimeout(function() {$("#messageId").hide(); }, 8000);	

			$("#mapDivId").hide();
			$("#researchCenterDivId").hide();

			var mapStatus="${userBean.memUserTypeId}";
			if(mapStatus=='1'){
				$("#mapStatus-1").prop("checked", true);
				$("#mapDivId").show();
				$("#researchCenterDivId").show();
				
				
			}
		});
	  </script>
     <script type="text/javascript">

      function strDes(a, b) {
    	   if (a.value>b.value) return 1;
    	   else if (a.value<b.value) return -1;
    	   else return 0;
    	 }

    	console.clear();
    	$(document).ready(function()
    			{
    		


    		 $('#select_all').click(function() {
    		        $('#lstBox2 option').prop('selected', true);
    		    });

  		    
    	    $('#btnRight').click(function (e) {
    	    	
    	        var selectedOpts = $('.lstBox1 option:selected');
    	        if (selectedOpts.length == 0) {
    	        	swal("Error", "Nothing to move please select any one", "error");
    	            //alert("Nothing to move please select any one.");
    	            e.preventDefault();
    	        }

    	        $('#lstBox2').append($(selectedOpts).clone());
    	        $(selectedOpts).remove();
    	      
    	        /* -- Uncomment for optional sorting --
    	        var box2Options = $('#lstBox2 option');
    	        var box2OptionsSorted;
    	        box2OptionsSorted = box2Options.toArray().sort(strDes);
    	        $('#lstBox2').empty();
    	        box2OptionsSorted.forEach(function(opt){
    	          $('#lstBox2').append(opt);
    	        })
    	        */
    	      
    	        e.preventDefault();
    	    });

    	    $('#btnAllRight').click(function (e) {
    	        var selectedOpts = $('.lstBox1 option');
    	        if (selectedOpts.length == 0) {
    	            alert("Nothing to move please select any one.");
    	            e.preventDefault();
    	        }

    	        $('#lstBox2').append($(selectedOpts).clone());

    	        
    	        $(selectedOpts).remove();
    	        e.preventDefault();
    	    });

    	    $('#btnLeft').click(function (e) {
    	        var selectedOpts = $('#lstBox2 option:selected');
    	        if (selectedOpts.length == 0) {
    	        	swal("Error", "Nothing to move please select any one", "error");
    	            //alert("Nothing to move please select any one");
    	            e.preventDefault();
    	        }

    	        $('.lstBox1').append($(selectedOpts).clone());
    	        $(selectedOpts).remove();
    	        e.preventDefault();
    	    });

    	    $('#btnAllLeft').click(function (e) {
    	        var selectedOpts = $('#lstBox2 option');
    	        if (selectedOpts.length == 0) {
    	            alert("Nothing to move please select any one");
    	            e.preventDefault();
    	        }

    	        $('.lstBox1').append($(selectedOpts).clone());
    	        $(selectedOpts).remove();
    	        e.preventDefault();
    	    });
    		
    	    $('#modelSelectionBox').change(function() {
    	    	var userVal=$("#modelSelectionBox").val();
    	    	if(userVal == '0'){
    	    		$("#firstRoll").hide();
    	    		$("#secondRoll").hide();
    	    		$("#thirdRoll").hide();
    	    		$("#startRoll").show();
    	    	}else if(userVal == '1'){
    	    		$("#firstRoll").show();
    	    		$("#secondRoll").hide();
    	    		$("#thirdRoll").hide();
    	    		$("#startRoll").hide();
    	    	}else if(userVal == '2'){
    	    		$("#firstRoll").hide();
    	    		$("#secondRoll").show();
    	    		$("#thirdRoll").hide();
    	    		$("#startRoll").hide();
    	    	}else{
    	    		$("#firstRoll").hide();
    	    		$("#secondRoll").hide();
    	    		$("#thirdRoll").show();
    	    		$("#startRoll").hide();
    	    	}
    	    	//alert(zoneVal);
    	        
    	    });
    	    });


    	
      </script>
     <style type="text/css">
     .subject-info-box-1,
     .subject-info-box-2 {
    float: left;
    width: 100%;
    
    select {
        height: 200px;
        padding: 0;

        option {
            padding: 4px 10px 4px 10px;
        }

        option:hover {
            background: #EEEEEE;
        }
    }
    }



/* .subject-info-arrows {
    float: left;
    width: 10%;

    input {
        width: 70%;
        margin-bottom: 5px;
    }
    } */
    
    
     .subject-info-arrows {
	margin: 4px;
}
.subject-info-arrows .btn{
	font-size: 24px;
    line-height: 20px;
    margin-top: 3px;
    
	}
      </style>
     
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
                     <h4>Edit User</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Manage User</li>
                        </ol>
                     </nav>
                  </div>

               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist"> 
                              <a class="nav-item nav-link active"  href="addUserUserMaster">Edit</a>
                              <a class="nav-item nav-link "  href="addUserUserViewMaster" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" onclick="window.history.back()" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                      
                        <form:form action="add-user-master" method="post" modelAttribute="userBean" autocomplete="off">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <form:hidden path="userId"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                             <div class="width50">
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Organization Name<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											 <form:select class="form-control" id="organizationId" onchange="mapperResearchCenter(this.value);" path="intLevelDetailId">
												<form:option value="0">--select--</form:option>
												<form:options items="${orgList}" itemLabel="levelName" itemValue="levelDetailId" />
											</form:select>
										</div>
									</div>
									
									
									<div class="form-group row" id="mapDivId">
									<label class="col-12 col-md-4 col-xl-4 control-label"><span
											class="text-danger">Map Research Center ?</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<div class="radio">
											<input type="radio" id="mapStatus-1" class="checkmark1" value="true" name="mapStatus" onchange="radioBtnCenter(this.value);"/> 
											<label for="mapStatus-1"> Yes</label> 
											<input type="radio" id="mapStatus-2" class="checkmark1" value="false" name="mapStatus" checked="checked" onchange="radioBtnCenter(this.value);"/> 
											<label for="mapStatus-2"> No </label>
										</div>
									</div>
									
								</div>  
								<div class="form-group row" id="researchCenterDivId">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Research Center Name <span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
											 <form:select class="form-control" id="researchCenterId" path="researchCenterId">
												<form:option value="0">--select--</form:option>
												<form:options items="${rcList}" itemLabel="researchCenterName" itemValue="researchCenterId" />
										    </form:select>
										</div>
									</div>
									<div class="form-group row">
                                    <label class="col-12 col-md-4 col-xl-4 control-label">User Role<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                      <span class="colon">:</span>
                                      
                            
									  
									  <div class="subject-info-box-1" style="height: 108px;" id="firstRoll">
									  <select multiple="multiple" class="form-control lstBox1 selectbox-scrollable" id="roleId" name="roleList" >
									    	   
												<c:forEach items="${roles}" var="role">
														<option value="${role.roleId}">${role.aliasName}</option> 
												</c:forEach>
									  </select>
									  </div>					
									<div class="subject-info-arrows text-center">
									
									  <input type="button" id="btnRight" value="+" class="btn btn-primary">
									  <input type="button" id="btnLeft" value="-" class="btn btn-danger">
									
									</div>
									
									<div class="subject-info-box-2" style="height:108px;">
									 	<select multiple="multiple" id="lstBox2" class="form-control selectbox-scrollable" name="selectedRoleList" >
									    	    <c:forEach items="${selectedRoles}" var="role">
														<option value="${role.roleId}">${role.roleName}</option> 
												</c:forEach>
									  </select>
									  
									  <input type="button" id="select_all" name="select_all" value="Select All" style="display:none;">
									  
									</div>
                             
                            	</div>
                        	</div>
                        	
                        		<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-text-input">User Id<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> 
											<form:input	id="userName" class="form-control" placeholder="" path="userName" maxlength="100" disabled="true" onkeypress="return validateUserId(event)"/>
										</div>
									</div>
									
									
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-text-input">Name<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> 
											<form:input	id="name" class="form-control"  maxlength="52" placeholder="" path="fullName" onkeypress="return blockSpecialAlphabet(event)"/>
										</div>
									</div>
									
										 <div class="form-group row" id="">
									<label class="col-12 col-md-4 col-xl-4 control-label"><span
											class="">Gender<span
											class="text-danger">*</span></span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<div class="radio">
											<form:radiobutton id="gender-1" class="checkmark1" value="1" path="gender"  /> 
											<label for="gender-1"> Male</label> 
											<form:radiobutton id="gender-2" class="checkmark1" value="2" path="gender" /> 
											<label for="gender-2"> Female </label>
										</div>
									</div>
									
								</div>  
								
								 
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Designation </label>
										<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span> 
											 <form:select class="form-control" path="intdesigid">
											 <form:option value="0">--select--</form:option>
												<c:forEach items="${desingnationList}" var="desingnationObj">
														<form:option value="${desingnationObj.id}">${desingnationObj.designation}</form:option> 
												</c:forEach>
											</form:select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-text-input">Mobile No.<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> 
											<form:input id="mobile" class="form-control"  maxlength="15" placeholder="" path="mobile" onkeypress="return numbersonly(event)"/>
										</div>
									</div><div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-text-input">Email<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> 
											<form:input id="email" class="form-control"  maxlength="52" placeholder="" path="email"/>
										</div>
									</div>
									<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
									<div class="col-12 col-md-8 col-xl-8">
										<!-- Radio Buttons -->
										<div class="radio">
											<form:radiobutton id="demo-form-radio-1" class="magic-radio" value="false"  path="bitStatus"/> 
											<label for="demo-form-radio-1"> Active </label> 
											<form:radiobutton id="demo-form-radio-2" class="magic-radio" value="true" path="bitStatus"/> 
											<label for="demo-form-radio-2"> Inactive </label>
										</div>
									</div>
								</div>
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
                                 <button class="btn btn-primary mb-1" id="btnSubmit">Update</button>
                                 <a href="addUserUserViewMaster"><input type="button" class="btn btn-danger mb-1" value="Cancel"></a>
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
	 
	

	
		
        $("#btnSubmit").click(function (){ 
        	$("#select_all").click();
        	 event.preventDefault();
        	 var form = event.target.form;
        	 var organizationId=$("#organizationId").val();
         	if(organizationId=='0')
         	{
         		swal(
     					'Error',
     					'Please select an Organization Name',
     					'error'
     					)
     					$("#organizationId").focus();
     					return false;
         	}
             
             var isChecked = jQuery("input[name=mapStatus]:checked").val();
     	    	var researchVal = $("#researchCenterId").val();
     	    	if(isChecked == 'true' && researchVal =='0'){
     	  	       swal('Error',
     					'Please select a Research Center Name',
     					'error');
     	  	       $("#researchCenterId").focus();
     	  	       return false;
     	  	    }
     	   var selectedRoleId =$("#lstBox2").val();
     	   if(selectedRoleId == '')
  		  {
  	   		swal(
  					'Error',
  					'Please select at least one User Role',
  					'error'
  					)
  				$("#lstBox2").focus();
  		   		return false;
  		   	 }
       
         	//var name_regex = /^[a-zA-Z\.\- ]{3,60}$/;
         	var name=$("#name").val();
         	if(name.length == 0)
         	{
         		swal(
     					'Error',
     					'Please enter the Name',
     					'error'
     					)
     					$("#name").focus();
     					return false;
         	}
         	
        /*  	if(!name.match(name_regex))
         	{
         		swal(
     					'Error',
     					'Name Should be alphabets only!',
     					'error'
     					)
     					return false;
         	} */
         	var desigidVal=$("#intdesigid").val();
         	if(desigidVal=='0')
         	{
         		swal(
     					'Error',
     					'Please select a Designation',
     					'error'
     					)
     					$("#intdesigid").focus();
     					return false;
         	}
         	var mobile=$("#mobile").val();
         	if(mobile=='')
         	{
         		swal(
     					'Error',
     					'Please enter Mobile No.',
     					'error'
     					)
     					$("#mobile").focus();
     					return false;
         	}
         	if(mobile.length <6)
           	{
           		swal(
       					'Error',
       					'Mobile No. should not be less than 6 digits',
       					'error'
       					)
       					$("#mobile").focus();
       					return false;
           	}
        /*  	var mob_regx=/^[0][1-9]\d{9}$|^[1-9]\d{9}$/g;
         	if(!mobile.match(mob_regx))
         	{
         		swal(
     					'Error',
     					'invalid  Mobile Number!',
     					'error'
     					)
     					return false;
         	} */
         	var email=$("#email").val();
         	if(email=='')
         	{
         		swal(
     					'Error',
     					'Please enter the Email',
     					'error'
     					)
     					$("#email").focus();
     					return false;
         	}
         	var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
         	if(!email.match(email_regex))
         	{
         		swal(
     					'Error',
     					'Invalied Email',
     					'error'
     					)
     					$("#email").focus();
     					return false;
         	}
		        	swal({
		        		title: 'Do you want to update?',
		        		  type: 'warning',
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
			if(id=='4')
			{
				$("#mapDivId").show();
				 var radioValue = $("input[name='mapStatus']:checked").val();
				 radioBtnCenter(radioValue);
			
			}else{
				$("#mapDivId").hide();
				$("#researchCenterDivId").hide();
				$("#mapStatus-2").prop("checked", true);
			}
			
			
		}
		function radioBtnCenter(id){
			 if(id=='true')
		     {
				 $("#researchCenterDivId").show();
		     }else{
		    	 $("#researchCenterDivId").hide();
		    	 $("#mapStatus-2").prop("checked", true);
		     } 
			 
		}

		function blockSpecialAlphabet(e){
			var regex = new RegExp("^[A-Za-z-.\\s]+$");
		    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		    if (regex.test(str)) {
		       return true;
		   }
		    /* swal(   'Error',
		    	    'This field accepts alphabets Only!',
		    	    'error'
		    	    ); */
			return false;
		}
		
		function validateUserId(e){
			var regex = new RegExp("^[0-9A-Za-z\\s]+$");
		    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		    if (regex.test(str)) {
		       return true;
		   }
		    /* swal(   'Error',
		    	    'This field accepts alphabets numeric Only!',
		    	    'error'
		    	    ); */
			return false;
		}


		function numbersonly(e){
		    var unicode=e.charCode? e.charCode : e.keyCode;
		    if ( ( (unicode>47)&&(unicode<58) ) || unicode == 9 || unicode == 8 || unicode == 46)
		            return true;
		    else {
		    	/* swal(   'Error',
		    	    	'This field accept only numbers',
		    	    	'error'
		    	    	); */
		    	return false;
		    }
		}	
		
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