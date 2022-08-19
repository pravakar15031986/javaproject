<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
<div class="mainpanel">
	<form action="viewVariety" method="get" id="cancelForm"><input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/></form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Variety</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Variety</li>
                           <li class="breadcrumb-item active" aria-current="page">Variety Master</li>
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
                               <a class="nav-item nav-link " href="viewVariety">View</a>
                              
                           </ul>
                           <div class="indicatorslist">
                              
                              <a title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" onclick="cancel()" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                          <form:form  action="saveVariety" modelAttribute="variety" method="post" autocomplete="off" >
                          <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                          <form:hidden path="varietyTypeId"/>
                             <div class="width50">
                             
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Variety Name<span class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> 
											<form:input type="text" path="vchDesc" id="varietyNameId" class="form-control" placeholder="Enter Variety name" maxlength="50" tabindex="1"></form:input>
										</div>
									</div>
									
									<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
									<div class="col-12 col-md-8 col-xl-8">
									 <span class="colon">:</span>
										<div class="radio">
											  <form:radiobutton path="bitStatus" value="false" id="demo-form-radio" class="magic-radio sampleyes" name="form-radio-button" />
                                              <label for="demo-form-radio" tabindex="2">Active</label>
                             
                                               <form:radiobutton path="bitStatus" value="true" id="demo-form-radio-2" class="magic-radio sampleyes" name="form-radio-button" />
                                               <label for="demo-form-radio-2" tabindex="3">Inactive</label>
										</div>
									</div>
								</div>                                      
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
                                 <button class="btn btn-primary mb-1" id="btnUpdateId" tabindex="4" onclick="return checkValidate();">Update</button>
                                 <button type="button" class="btn btn btn-danger mb-1" tabindex="5" onclick="cancel()">Cancel</button>
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
			  var name_regex = /^[a-zA-Z0-9 ]{1,60}$/;
				var varietyVal = $("#varietyNameId").val();

				if (varietyVal == '') {
					swal("Error","Please enter the Variety Name ", "error").then(function() {
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
           		title: ' Do you want to update ? ',
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


        /*  function blockSpecialAlphabet(e){
 			var regex = new RegExp("^[A-Za-z0-9\\s]+$");
 		    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 		    if (regex.test(str)) {
 		       return true;
 		   }
 		    return false;
 		} */

 		  function countChar(val) {
 		        var len = val.value.length;
 		        if (len > 200) {
 		        	
 		        } else {
 		          var remaining_len=$('#charNum').text(200 - len+" characters left");
 		        }
 		      };
</script>
<script type="text/javascript">
function cancel(){
		$("#cancelForm").submit();
}
</script>
<script>
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
	   		swal("Error", "${errMsg}", "error");
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
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