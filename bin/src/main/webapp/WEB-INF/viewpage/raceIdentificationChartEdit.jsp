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
      <c:if test="${errMsg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>  
<div class="mainpanel">
  <form action="raceIdentificationChartView" method="get" id="cancelForm"><input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
  </form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Race Identification Chart</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Race Identification Chart</li>
                          
                        </ol>
                     </nav>
                  </div>
             
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="#">Edit</a>
                              <a class="nav-item nav-link "  href="raceIdentificationChartView" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="cancel()"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                           <!--Static-->
                           
                            <div class="width50">
                           
                           <form:form action="insert-race-chart" modelAttribute="race" id="raceIdentificationformId" method="post"  onsubmit="return false">
                           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                         
                           <form:hidden path="raceChartId"/>
                          <div class="form-group row">
                                 
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Sequence -1<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                       <form:select class="form-control" path="fisrtSeq" id="seqId_1" tabindex="1">
                                   <form:option value="0">--H vs L--</form:option>
                                    <form:option value="h">High</form:option>
                                    <form:option value="l">Low</form:option>
                                   
                                    </form:select>
                                    </div>
                            	
                            </div>
                            <div class="form-group row">
                                 
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Sequence -2<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                       <form:select class="form-control" path="secondSeq" id="seqId_2" tabindex="2">
                                    <form:option value="0">--H vs L--</form:option>
                                    <form:option value="h">High</form:option>
                                    <form:option value="l">Low</form:option>
                                   
                                    </form:select>
                                    </div>
                            	
                            </div>
                            <div class="form-group row">
                                 
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Sequence -3<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                       <form:select class="form-control" path="thirdSeq" id="seqId_3" tabindex="3">
                                   <form:option value="0">--H vs L--</form:option>
                                    <form:option value="h">High</form:option>
                                    <form:option value="l">Low</form:option>
                                   
                                    </form:select>
                                    </div>
                            	
                            </div>
                            <div class="form-group row">
                                 
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Sequence -4<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                       <form:select class="form-control" path="fourthSeq" id="seqId_4" tabindex="4">
                                   <form:option value="0">--H vs L--</form:option>
                                    <form:option value="h">High</form:option>
                                    <form:option value="l">Low</form:option>
                                   
                                    </form:select>
                                    </div>
                            	
                            </div>	
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Name<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <form:input id="nameId" path="nameResult" class="form-control" placeholder="" value="" tabindex="5" maxlength="9"/>
                              </div>
                           </div>
                         
                          <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Description</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <form:textarea rows="5" cols="100" path="description" class="form-control" id="descriptionID" tabindex="6" maxlength="100" /><div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div>  
                       <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <span class="colon">:</span>
                                  <div class="radio">
                                    <%-- <form:radiobutton id="demo-form-radio" class="magic-radio sampleyes" value="0" path="status" name="form-radio-button" checked/> --%>
                                    <form:radiobutton id="demo-form-radio" path="status" class="magic-radio sampleyes" value="0" name="form-radio-button"/>
                                    <label for="demo-form-radio" tabindex="7">Active</label>
                             
                                    <form:radiobutton path="status" id="demo-form-radio-2" class="magic-radio sampleyes" value="1" name="form-radio-button"/>
                                    <label for="demo-form-radio-2" tabindex="8">Inactive</label>
                                 </div> 
                              </div>
                           </div>
                           
                           
						  <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnUpdateId" onclick="return save();" tabindex="9">Update</button>
								 <button class="btn btn-danger mb-1"  id="btnCancelId" onclick="return cancel();" tabindex="10">Cancel</button>
							  </div>
					      </div>
                         </form:form>
                        </div>  
             
                          <div class="clearfix"></div>
                           
                           <br> <br> <br> <br> <br> <br>
                          
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script type="text/javascript">
      $(document).ready(function(){
    	  $("#mandeteId").chosen({ allow_single_deselect: true });
          $(".chzn-select-deselect").chosen({ allow_single_deselect: true });  
    	  /* 	$('#monthId').multiselect({
  	      columns: 1,
  	      placeholder: 'Select Month ',
  	      search: true
  	      }); */
      });
	  function cancel(){
	  		$("#cancelForm").submit();
	  }
      function save()
      {
    	  
    	  event.preventDefault(); 
    	  var form = event.target.form; 
    	  var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
   		  var desc=$("#descriptionID").val();
    	  var seqId_1=$("#seqId_1").val();
	   	 if(seqId_1=='0')
    	{
	   		 swal(
	 	   				'Error', 
	 	   				'Please select sequence one',
	 	   				'error'
	 	   			).then(function() 
			   		   		{
						$("#seqId_1").focus();
					});
    		
    		return false;
    	}
	   
	   	 var seqId_2=$("#seqId_2").val();
	   	 if(seqId_2=='0')
	   	{
	   		swal(
 	   				'Error', 
 	   				'Please select sequence two',
 	   				'error'
 	   			).then(function() 
		   		   		{
					$("#seqId_2").focus();
				});
	   	 
	   		return false;
	   	 }
	   	var seqId_3=$("#seqId_3").val();
	   	 if(seqId_3=='0')
	   	{
	   		 
	   		swal(
 	   				'Error', 
 	   				'Please select sequence three',
 	   				'error'
 	   			).then(function() 
		   		   		{
					$("#seqId_3").focus();
				});
	   		return false;
	   	 }
	   	var seqId_4=$("#seqId_4").val();
	   	 if(seqId_4=='0')
		   	{
	   		
	   		swal(
 	   				'Error', 
 	   				'Please select sequence four',
 	   				'error'
 	   			).then(function() 
		   		   		{
					$("#seqId_4").focus();
				});
		   		return false;
		   	 }
	   	var nameId=$("#nameId").val();
	   	var name_regex = /^[a-zA-Z ]{1,60}$/;
	   	 if(nameId=='')
	   	{
	   		 swal(
	 	   				'Error', 
	 	   				'Please enter the Name',
	 	   				'error'
	 	   			).then(function() 
			   		   		{
	 	   			$('#nameId').focus();
					});
	   	
	   		return false;
	   	 }
	   	 if(!nameId.match(name_regex))
	   	 {
	   		swal("Error", "Name accept only alphabets ", "error").then(function() 
	   		   		{
 	   			$('#nameId').focus();
				});
   			return false; 
	   	 }
	   	if(nameId.charAt(0)== ' ' || nameId.charAt(nameId.length -1)== ' '){
	   		swal("Error", "White space is not allowed at initial and last place in Name", "error").then(function() 
	   		   		{
	   			$('#nameId').focus();
				});
	          return false;
	 	   }
	 	   if(nameId!=null)
	     	{
	 	   		var count= 0;
	 	   		var i;
	 	   		for(i=0;i<nameId.length && i+1 < nameId.length;i++)
	 	   		{
	 	   			if ((nameId.charAt(i) == ' ') && (nameId.charAt(i + 1) == ' ')) 
	 	   			{
	 					count++;
	 				}
	 	   		}
	 	   		if (count > 0) {
	 	   		swal("Error", "Name should not contain consecutive blank spaces", "error").then(function() 
		   		   		{
 	   			$('#nameId').focus();
				});
	 				return false;
	 			}
	     	}
		   	if(desc.charAt(0)== ' ' || desc.charAt(desc.length-1)== ' '){
		   	 swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() 
		   		   		{
	 	   			$('#descriptionID').focus();
					});
		         return false;
			   }
	     	if(!desc.match(desc_regex))
		    	{
	     		swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() 
		   		   		{
 	   			$('#descriptionID').focus();
				});
					return false;
		    	}
			   	if(desc!=null)
		    	{
			   		var count= 0;
			   		var i;
			   		for(i=0;i<desc.length && i+1 < desc.length;i++)
			   		{
			   			if ((desc.charAt(i) == ' ') && (desc.charAt(i + 1) == ' ')) 
			   			{
							count++;
						}
			   		}
			   		if (count > 0) {
			   			swal("Error", "Description should not contain consecutive blank spaces", "error").then(function() 
				   		   		{
			 	   			$('#descriptionID').focus();
							});
						return false;
					}
		    	}
			   	var descLen=desc.length;
			   	if (desc.charAt(0) == '!' || desc.charAt(0) == '@' 
					|| desc.charAt(0) == '#' || desc.charAt(0) == '$' 
					|| desc.charAt(0) == '&' || desc.charAt(0) == '*' 
					|| desc.charAt(0) == '(' || desc.charAt(0) == ')' 
					|| desc.charAt(descLen - 1) == '!' || desc.charAt(descLen - 1) == '@' 
					|| desc.charAt(descLen - 1) == '#' || desc.charAt(descLen - 1) == '$' 
					|| desc.charAt(descLen - 1) == '&' || desc.charAt(descLen - 1) == '*' 
					|| desc.charAt(descLen - 1) == '(' || desc.charAt(descLen - 1) == ')') 
			   	{
			   		swal("Error", "!@#$&*() characters are not allowed at initial and last place in Description", "error").then(function() 
			   		   		{
	 	   			$('#descriptionID').focus();
					});
					return false;
				}
	 	swal({
	   		title: 'Do you want to update?',
   		  type: 'info',
   		  showCancelButton: true,
   		  confirmButtonText: 'Yes',
   		  cancelButtonText: 'No',
		    }).then((result) => {
					if (result.value) {
						
						 form.submit();
					}
				})
				return false;
	   
      }
      </script>
    <script>
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
	   		swal("${errMsg}"," ", "error"); 
			//alert('${ErrorMessage}');
			document.getElementById('${FieldId}').value="";
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>
<script>
$(document).ready(function(){
	 //$('#alertId').hide();
	 var text_max = 200;
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#descriptionID').keyup(function() {
	     var text_length = $('#descriptionID').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
	   
	/* $('[data-toggle="tooltip"]').tooltip(); 
	setTimeout(function() {$("#messageId").hide(); }, 3000); */
	
});
</script>
