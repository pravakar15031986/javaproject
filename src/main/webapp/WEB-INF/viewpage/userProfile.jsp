<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
.file {
	visibility: hidden;
	position: absolute;
}

.fileupload {
	position: absolute;
	top: 70px;
	right: 7%;
	width: 12%;
}

.fileupload .btn.btn-primary, .btn.btn-primary:focus {
	width: 100%;
	margin-right: 0;
	margin-top: 10px;
}

.proimg {
	width: 100%;
	height: 162px;
	overflow: hidden;
}

.proimg img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

@media screen and (max-width:1366px) {
	.fileupload {
		width: 14%;
	}
}
</style>

<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Manage Profile</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Manage Profile</li>
						<li class="breadcrumb-item active" aria-current="page">Manage
							Profile</li>
					</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							
						</ul>
						<div class="indicatorslist">
							
							
							<p class="ml-2" style="color: red;">(*) Indicates mandatory</p>
						</div>
					</div>
					<!-- BASIC FORM ELEMENTS -->
					<!--===================================================-->
					<form:form action="updateProfile" modelAttribute="profileDetails"
						autocomplete="off" method="post" id="profileForm"
						enctype="multipart/form-data">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						
						<form:input type="hidden" path="userId" />
						
						<div class="card-body">
							<!--Static-->
							<!--Text Input-->
							<div class="width50">
								
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-text-input">Name<span class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										
										
										<form:input path="fullName" id="name" class="form-control"
											placeholder="Enter Name" maxlength="52"
											onkeypress="return blockSpecialAlphabet(event)" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-email-input">Gender </label>
									<div class="col-12 col-md-8 col-xl-8">
										<div class="radio">
											<form:radiobutton id="gender-1" class="magic-radio" value="1"
												path="gender" />
											<label for="gender-1"> Male</label>
											<form:radiobutton id="gender-2" class="magic-radio" value="2"
												path="gender" />
											<label for="gender-2">Female </label>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-text-input">Mobile No.<span
										class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										
										<form:input path="mobile" id="mobile" class="form-control"
											placeholder="Enter Mobile No" maxlength="15"
											onkeypress="return numbersonly(event)" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-text-input">Email<span class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										
										<form:input path="email" maxlength="50" id="email"
											class="form-control" placeholder="Enter your email id" />
									</div>
								</div>
								
								<hr>
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"></label>
									<div class="col-12 col-md-8 col-xl-8">
										<button class="btn btn-info mb-1" id="btnSubmit">Update</button>
										<a href="Home"><input type="button"
											class="btn btn-danger mb-1" value="Cancel"></a>
									</div>

								</div>

								<div class="fileupload">
									<div class="col-sm-12">

										<div class="proimg">
											<img src="viewProfilePhoto" alt="image" id="preview"
												class="img-thumbnail" width="100%">
										</div>

							


									</div>
									<div class="col-sm-12">
										<div id="msg"></div>
										
										<input type="file" name="profileImg" class="file form-control"
											accept="image/*" id="profilePhoto" />
				

										<div class="input-group-append">
											<button type="button" class="browse btn btn-primary">Browse...</button>
										</div>
										<small>Max size: 100KB<br> Allowed types:
											jpg,jpeg,png
										</small>
										<%-- </form> --%>
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
   $(document).on("click", ".browse", function() {
  var file = $(this).parents().find(".file");
  file.trigger("click");
});
$('input[type="file"]').change(function(e) {
  var fileName = e.target.files[0].name;
  $("#file").val(fileName);

  var reader = new FileReader();
  reader.onload = function(e) {
    // get loaded data and render thumbnail.
    document.getElementById("preview").src = e.target.result;
  };
  // read the image file as a data URL.
  reader.readAsDataURL(this.files[0]);
});
  </script>








<script>
         var myVar ;
       	 var count = 0;
	   	 function myTimer() {
	    	count++;
	    	if(count == 2)
		    	{
	    		myStopFunction();
		    	}
	    	
	   }
	   	function myStopFunction() {
	   	  clearInterval(myVar);
	   	  $(".swal2-confirm").click();
	   	  saveData();
	   	}

	   	function saveData()
	   	{
	   		
	   		var email=$("#email").val();
         	if(email=='')
         	{
         		$("#email").focus();
         		swal(
     					'Error',
     					'Email Should not blank',
     					'error'
     					)
     					
     					return false;
         	}
         	var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
         	if(!email.match(email_regex))
         	{
         		swal(
     					'Error',
     					'Invalied Email Id',
     					'error'
     					)
     					$("#email").focus();
     					return false;
         	}
        	 var fileInput = $('#profilePhoto').val();
        	 if(fileInput!=''){
        		 
        		 var filePath = fileInput;
             	 var allowedExtensions = /.*\.(jpg||jpeg||png)$/i;
                 
                 if(!allowedExtensions.exec(filePath)){
                	 $("#profilePhoto").focus();
                 	swal("Error", "Upload .jpg, .jpeg or .png file only.", "error");
                     fileInput.value = '';
                     return false; 
                 }
            	 var file_size = $('#profilePhoto')[0].files[0].size;
                  if (file_size > 102400) 
                  { 
                	  $("#profilePhoto").focus();
                     swal("Error", "Please upload image with size less than 100KB", "error");
                     return false;
                 } 
        		 
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
		    	    		  $("#profileForm").submit();
		    	    		   /* swal("Success", "User created Successfully ", "success"); */
		    	    		   /* window.location.href="viewuser.html"; */
		    	    		  }
		    	    		})
		 }
$(document).ready(function (){
	  var exitMobileNo = $('#mobile').val();
	  // alert(exitMobileNo);
	
		
		$("#mapDivId").hide();
		$("#researchCenterDivId").hide();
        $("#btnSubmit").click(function (){ 
        	
        	
        	 if($("#name").val()=='')
        	{
        		 $("#name").focus();
        		swal(
    					'Error',
    					'Please enter the Name',
    					'error'
    					)
    					return false;
        	}
        	if($("#mobile").val()=='')
        	{
        		$("#mobile").focus();
        		swal(
    					'Error',
    					'Please enter Mobile Number ',
    					'error'
    					)
    					return false;
        	}
        	if($("#mobile").val().length < 6)
        	{
        		$("#mobile").focus();
        		swal(
    					'Error',
    					'Mobile Number should not be less than 6 digits',
    					'error'
    					)
    					return false;
        	}
          	 /* var newNo = $("#mobile").val(); */
        	/* if(exitMobileNo != $("#mobile").val()){
        		 swal(
     					'Warning',
     					'Your exiting mobile no '+exitMobileNo+' and you changed mobile no '+newNo,
     					'warning'
     					
     					);
        		 count=0;
        		 myVar = setInterval(myTimer, 1000);
        		 return false;		 
        	} */ 
   
        	var email=$("#email").val();
         	if(email=='')
         	{
         		$("#email").focus();
         		swal(
     					'Error',
     					'Please enter Email',
     					'error'
     					)
     					
     					return false;
         	}
         	var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
         	if(!email.match(email_regex))
         	{
         		$("#email").focus();
         		swal(
     					'Error',
     					'Invalied Email Id',
     					'error'
     					)
     					return false;
         	}
        	 var fileInput = $('#profilePhoto').val();
        	 if(fileInput!=''){
        		 
        		 var filePath = fileInput;
             	 var allowedExtensions = /.*\.(jpg||jpeg||png)$/i;
                 
                 if(!allowedExtensions.exec(filePath)){
                	 $("#profilePhoto").focus();
                 	swal("Error", "Upload .jpg, .jpeg or .png file only", "error");
                     fileInput.value = '';
                     return false; 
                 }
            	 var file_size = $('#profilePhoto')[0].files[0].size;
                  if (file_size > 102400) 
                  { 
                	  $("#profilePhoto").focus();
                     swal("Error", "Please upload image with size less than 100KB", "error");
                     return false;
                 } 
        		 
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
		    	    		  $("#profileForm").submit();
		    	    		   /* swal("Success", "User created Successfully ", "success"); */
		    	    		   /* window.location.href="viewuser.html"; */
		    	    		  }
		    	    		})
		        	return false;
        		});
		})
	

</script>
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
function blockSpecialAlphabet(e){
	var regex = new RegExp("^[A-Za-z\.\-\\s]+$");                              // Name should be contain alphabets with . and -
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (regex.test(str)) {
       return true;
   }
    /* swal(   'Error',
    	    'This field accept only alphabets ',
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
    	    	'This field accept only numbers ',
    	    	'error'
    	    	); */
    	return false;
    }
}	
	/* function validateMoblie(mobile)
	{
		alert(mobile);
		$.ajax({

			type:"GET",
			 url:"validateMoblieByUser",
			data:{
					"mobile":mobile
				},
		success:function(response){
			alert(response.mob);
			if(response == null){
				swal("Error", "This mobile no already exit", "error");
				 return false;
				}
			           
						//alert('Alredy exity');
				},
		error:function(error){
					
		}			
		  });
	} */
</script>