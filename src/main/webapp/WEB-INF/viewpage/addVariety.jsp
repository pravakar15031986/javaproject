<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <script type="text/javascript">
$(document).ready(function() {
	setTimeout(function() {$("#messageId").hide(); }, 8000);	
});
</script>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Variety</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Variety Master</li>
                        </ol>
                     </nav>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs">
                           <li class="active"><a class="nav-item nav-link active" href="addVariety" >Add</a></li>
                           <li><a class="nav-item nav-link " href="viewVariety" >View</a></li>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                         <%-- <c:if test="${not empty errMsg}">
                  			<div class="alert alert-custom-danger" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong id="messageId" style="color: red">Error! ${errMsg}</strong>
							</div>
                  		</c:if>
                		<c:if test="${not empty msg}">
                			<div class="alert alert-custom-success" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong id="messageId" >Success!</strong>${msg}
							</div>
                		</c:if> --%>
                        <div class="card-body">
                          <form:form  action="saveVariety" modelAttribute="variety" method="post" autocomplete="off" >
                            <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                             <div class="width50">
                             
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Variety Name<span class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> 
											<form:input type="text" path="vchDesc" id="varietyNameId" maxlength="50" class="form-control" placeholder="Enter Variety Name" autofocus="autofocus" tabindex="1"></form:input>
										</div>
									</div>
									<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
									<div class="col-12 col-md-8 col-xl-8">
									 <span class="colon">:</span>
										<div class="radio">
											  <form:radiobutton path="bitStatus" value="false" id="demo-form-radio" class="magic-radio sampleyes" name="form-radio-button" checked="checked"/>
                                              <label for="demo-form-radio" tabindex="2">Active</label>
                             
                                               <form:radiobutton path="bitStatus" value="true" id="demo-form-radio-2" class="magic-radio sampleyes" name="form-radio-button" />
                                               <label for="demo-form-radio-2" tabindex="3">Inactive</label>
										</div>
									</div>
								</div>                                      
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
                                 <button class="btn btn-primary mb-1" id="btnSubmit" tabindex="4" onclick="return checkValidate();">Submit</button>
                                 <button type="reset" class="btn btn btn-danger mb-1" tabindex="5" >Reset</button>
                              </div>
                           </div>
                           </div>
                           </form:form>
                           </div>
                        <!--===================================================-->
                        <!-- END BASIC FORM ELEMENTS -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>

		function checkValidate() {

			 event.preventDefault(); 
			  var form = event.target.form;
			  var name_regex = /^[a-zA-Z0-9 ]{1,50}$/;
				var varietyVal = $("#varietyNameId").val();

				if (varietyVal == '') {
					swal("Error","Please enter the Variety Name", "error").then(function() {
						   $("#varietyNameId").focus();
					});
					return false;
				}
				if(!varietyVal.match(name_regex))
		       	{
		       		swal("Error", "Variety Name accept only alphabets and numbers", "error").then(function() {
						   $("#varietyNameId").focus();
		       		});
		   			return false;
		       	}
			   	if(varietyVal!=null)
		       	{
			   		var count= 0;
			   		var i;
			   		for(i=0;i<varietyVal.length && i+1 < varietyVal.length;i++)
			   		{
			   			if ((varietyVal.charAt(i) == ' ') && (varietyVal.charAt(i + 1) == ' ')) 
			   			{
							count++;
						}
			   		}
			   		if (count > 0) {
			   			swal("Error", "Variety Name should not contain consecutive blank spaces", "error").then(function() {
							   $("#varietyNameId").focus();
			   			});
						return false;
					}
		       	}
			   	if(varietyVal.charAt(0)== ' ' || varietyVal.charAt(varietyVal.length - 1)== ' '){
					   swal("Error", "White space is not allowed at initial and last place in Variety Name", "error").then(function() {
						   $("#varietyNameId").focus();
					   });
			            return false;
				   }

			swal({
           		title: ' Do you want to submit? ',
           		  type: 'warning',
           		  showCancelButton: true,
           		  confirmButtonText: 'Yes',
           		  cancelButtonText: 'No',
       	    }).then((result) => {
       	    	  if (result.value) {
       	    		form.submit();
       	    		  }
       	    		})

    		}


		/* function blockSpecialAlphabet(e){
			var regex = new RegExp("^[A-Za-z0-9\\s]+$");
		    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		    if (regex.test(str)) {
		       return true;
		   }
		    return false;
		} */
</script>
<script>
      function countChar(val) {
        var len = val.value.length;
        if (len > 200) {
        	
        } else {
          var remaining_len=$('#charNum').text(200 - len+" characters left");
        }
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
<script>
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
	   		swal("Error", "${errMsg}", "error");
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>