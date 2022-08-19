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
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Questionnaire</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                            <li class="breadcrumb-item">Manage Master</li>
                            <li class="breadcrumb-item active" aria-current="page">Questionnaire Master</li>
                          
                          
                        </ol>
                     </nav>
                  </div>
               
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="questionnaireMaster">Add</a>
                              <a class="nav-item nav-link "  href="questionnaireMasterView" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                           <!--Static-->
                           
                            <div class="width50">
                           
                           <form:form action="save-Qustion" method="post" id="centerMasterformId" modelAttribute="qustion" onsubmit="return false">
                           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           	<form:hidden path="optionBeanListString" id="valueArrayListId"/>
                           
                           <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Applicable for</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                 	<form:radiobutton id="ivrRedioId" class="magic-radio sampleyes" path="qustionTypeBean" value="1" name="qustionRedioType" checked="checked" onclick="changeQuestionType(this.value)"/>
                                    <label for="ivrRedioId" tabindex="1">IVR</label>
                             
                                    <form:radiobutton path="qustionTypeBean" id="mobileRedioId" class="magic-radio sampleno"  value="2" name="qustionRedioType" onclick="changeQuestionType(this.value)"/>
                                   <label for="mobileRedioId" tabindex="2">Mobile</label>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Question<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <form:textarea  id="qustion" class="form-control" path="qustionBean" rows="4" maxlength="200" tabindex="3" autofocus="autofocus"/><div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div>
                          
                          <div class="form-group row">
                                 
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Order No.<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                       <form:select class="form-control" id="orderNumber" path="qustionOrderBean" onchange="validateOrderNumber(this.value)" tabindex="4">
                                   <form:option value="0" >--Select--</form:option>
                                    </form:select>
                                    </div>
                            	
                            </div>	
                            
                            <div class="form-group row">
                                 
                                    <label class="col-12 col-md-4 col-xl-4 control-label">No. of Options<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                       <form:select class="form-control" id="numberOption" path="qustionOptionCountBean" onchange="optionNumber(this.value)" tabindex="5">
                                   <form:option value="0">--Select--</form:option>
                                   
                                    </form:select>
                                    </div>
                                 
                                 </div>
                                 
                                 <div id="checkDhitiId" >
                                 	
                                </div> 
                            
                           
                           
                          
                           
                           
                           
                           
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                              
                              <div class="radio">
                                 	<form:radiobutton id="demo-form-radio-3" class="magic-radio sampleyes" path="statusBean" value="false" name="form-radio-button" checked="checked"/>
                                    <label for="demo-form-radio-3" tabindex="14">Active</label>
                             
                                    <form:radiobutton path="statusBean" id="demo-form-radio-4" class="magic-radio sampleno"  value="true" name="form-radio-button" />
                                  <label for="demo-form-radio-4" tabindex="15">Inactive</label>
                                 </div>
                                
                              </div>
                           </div>    
                          
						  <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnSubmitId" onclick="return save();" tabindex="16">Submit</button>
								 <button class="btn btn-danger mb-1" type="reset" id="btnResetId" tabindex="17" onclick="resetOptionNumber()">Reset</button>
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
 
 <link href="wrsis/css/jquery.dataTables.min.css" rel="stylesheet">
 <script src="wrsis/js/jquery-3.3.1.min.js"></script>
<script src="wrsis/js/bootstrap.min.js"></script> 
<script src="wrsis/js/jquery.dataTables.min.js"></script>        
<script type="text/javascript">
      $(document).ready(function(){
    	 
    	
		  var html="";
    	  for(i=1;i<="${questionCounts}";i++ )
        	  {
				html+="<option>"+i+"</option>";
        	 }
    	  $("#orderNumber").append(html);


    	  var html1="";
    	  for(i=1;i<="${optionCounts}";i++ )
        	  {
				html1+="<option>"+i+"</option>";
        	 }
    	  $("#numberOption").append(html1);
    	  
      });
      
     
      function save()
      {
    	  var valArray=[];
          var infoArray=[];
    	  event.preventDefault();
   		 var form = event.target.form;
		   var name_regex = /^[a-zA-Z ]{1,60}$/;
		   var ques_regex=/^[a-zA-Z0-9 ]{1,200}$/;
    	 		var qustion=$("#qustion").val();
    		   	 if(qustion=='')
    	    	{
				swal(
					'Error',
					'Please enter question',
					'error'
					).then(function() 
			   		   		{
						$("#qustion").focus();
					});
					
	    		return false;
	    	}
    		   	if(qustion.charAt(0)== ' ' || qustion.charAt(qustion.length - 1)== ' '){
    				   swal("Error", "White space is not allowed at initial and last place in question", "error").then(function() 
   			   		   		{
   						$("#qustion").focus();
   					});
    		            return false;
    			   }
    		   	if(qustion!=null)
     	    	{
     		   		var count= 0;
     		   		var i;
     		   		for(i=0;i<qustion.length && i+1 < qustion.length;i++)
     		   		{
     		   			if ((qustion.charAt(i) == ' ') && (qustion.charAt(i + 1) == ' ')) 
     		   			{
     						count++;
     					}
     		   		}
     		   		if (count > 0) {
     		   			swal("Error", "Question should not contain consecutive blank spaces", "error").then(function() {
     					   $("#qustion").focus();
     					});
     					return false;
     				}
     	    	}
    		   	if(!qustion.match(ques_regex))
    	    	{
    	    		swal("Error", "Question accept only alphabets and numbers ", "error").then(function() 
			   		   		{
						$("#qustion").focus();
					});
    				return false;
    	    	} 
    		
    		
	   
	   	 var orderNumber=$("#orderNumber").val();
	   
	   	 if(orderNumber=='0')
	   	{
	   		swal(
					'Error',
					'Please select Order Number',
					'error'
					).then(function() 
			   		   		{
						$("#orderNumber").focus();
					});
	   		
	   		
	   		return false;
	   	 }else{
	   			validateOrderNumber(orderNumber);
		   	 }
	   	 
	   	var numberOption=$("#numberOption").val();

		 if(numberOption=='0')
	   	{
	   		
	   		swal(
					'Error',
					'Please select Number Of Option',
					'error'
					).then(function() 
			   		   		{
						$("#numberOption").focus();
					});
	   		
	   		return false;
	   	 }

	  // 	alert("HI Option No=="+numberOption);
    	 for(i = 1 ;i<= numberOption;i++)
    	 {
    		 var infoValueId = $("#infoValueId_"+i).val();
				
			if(infoValueId  =='')
			{
				swal(
						'Error',
						'Please enter option value',
						'error'
						).then(function() 
				   		   		{
							$("#infoValueId_"+i).focus();
						});
		   		   		return false;
			}	
    		 var infoId = $("#infoId_"+i).val();
    		 //alert("infoId=="+infoId);
    		 if(infoId  == '')
 	   		{
 	   			swal(
 						'Error',
 						'Please enter info',
 						'error'
 						).then(function() 
 				   		   		{
 							$("#infoId_"+i).focus();
 						});
 		   		   		return false;
 	   		}
    		 
   			
   			
    	 }
	 var valArray=[]; 
	    	 var numberOption = $("#numberOption").val();
	    	 for(i = 1 ;i<= numberOption;i++)
	    	 {
	    		 var infoValueId = $("#infoValueId_"+i).val();
	    		 var infoId = $("#infoId_"+i).val();
	   			valArray.push({
	   				"qValue" : infoValueId ,
	   				"qInfo":infoId
	   				});
	   			
	    	 }
	 	 $("#valueArrayListId").val(JSON.stringify(valArray));
	 	swal({
	 		title: 'Do you want to submit?',
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
   
 function optionNumber(op_value)
{		

	 $("#checkDhitiId").empty();
	 var html="";
	 for(i=1;i<=op_value;i++)
	 {
	 	html=html+"<div class='form-group row' id='optionId_"+i+"'>";
	 	html=html+"<label class='col-12 col-md-4 col-xl-4 control-label' for='demo-text-input'>Option-"+i+"<span class='text-danger'>*</span></label>";
	 	html=html+"<div class='col-lg-4'><span class='colon'>:</span>";
	 	html=html+"<input type='text' id='infoValueId_"+i+"' class='form-control' placeholder='Value'  tabindex='6' maxlength='50'/>";
	 	html=html+"</div >";
	 	html=html+"<div class='col-lg-4'><span class='colon'>:</span>";
	 	html=html+"<input type='text' id='infoId_"+i+"' class='form-control' placeholder='Info'  tabindex='7' maxlength='100'/>";
	 	html=html+"</div >";
	 	html=html+"</div >";
	 	/* html=html+"</div >"; */
	 	 	
	 } 
	 $("#checkDhitiId").append(html);

 }
 </script> 
    
  <script>


  function validateOrderNumber(orderId)
  {
	
	  var questionType=$("input[name='qustionTypeBean']:checked").val();
	
	  $.ajax({

			type:"GET",
			 url:"duplicateOrderNumberByQuestionType",
			data:{
					"orderId":orderId,
					"questionType":questionType
				},
		success:function(response){
			var val = JSON.parse(response); 
					
			 if (val.isExistOrder == 'exist') {
				 
				  var qType='';
				  if(questionType==1)
					{
					  qType="IVR";
					}else{
						qType="Mobile";
						}  
					
				 swal('Error!','Order number '+orderId+' already exists for '+qType,'error');
				 $("#orderNumber").val("0");
				
			}
				},
		error:function(error){
					
		}			
		  });
	
  }
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
			swal("Error", "${errMsg}", "error");
			document.getElementById('${FieldId}').value="";
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>     

<script>
$(document).ready(function(){
	 var text_max = 200;
	 $('#btnResetId').click(function() {
		 $('#charNum').html('Maximum characters :' + '200');
	 });
	 
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#qustion').keyup(function() {
	     var text_length = $('#qustion').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
});
</script>
<script>
function changeQuestionType(qType){
	
	if(qType==1)
	{
		swal("warning", "Change over to IVR ", "warning");
	   document.getElementById("btnResetId").click();
	}
	else
	{
		swal("warning", "Change over to Mobile ", "warning");
		$("#qustion").val("");
		$("#orderNumber").val(0);
		$("#numberOption").val(0);
		
	}
}
</script>
<script>
function resetOptionNumber(){
	optionNumber(0);
}
</script>