<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     
     
     
     <style>
     .fa-times{color:red}
     </style>
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
<c:if test="${qustion ne Empty }">

	 <script>
		
			
	 $(document).ready(function()
		{
		 var x=${qustion.qustionBeanId};
			$("#idMyqustionId").val(x);
			optionValue(${qustion.qustionBeanId});
			 
	 });
	 
	</script> 
</c:if>
<form action="questionnaireMasterView" method="get" id="cancelForm"><input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/></form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Questionnaire</h4>
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
                              <a class="nav-item nav-link active"  href="#">Edit</a>
                              <a class="nav-item nav-link "  href="questionnaireMasterView" >View</a>
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
                           <input type="hidden" id="idMyqustionId">
                           
                           <form:form action="save-Qustion" method="post" id="centerMasterformId" modelAttribute="qustion" onsubmit="return false">
                           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                          	<form:hidden path="qustionBeanId" id="qustionMaterId"/>
                          	<form:hidden path="optionBeanListString" id="valueArrayListId"/>
                           
                          <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Applicable for</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                 	<form:radiobutton id="ivrRedioId" class="magic-radio sampleyes" path="qustionTypeBean" value="1" name="form-radio-button" />
                                    <label for="ivrRedioId"  tabindex="1">IVR</label>
                             
                                    <form:radiobutton path="qustionTypeBean" id="mobileRedioId" class="magic-radio sampleno"  value="2" name="form-radio-button" />
                                   <label for="mobileRedioId" tabindex="2">Mobile</label>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Question<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <form:textarea type="text" id="qustion" class="form-control" path="qustionBean"  rows="4" maxlength="200" tabindex="3"/><div id="charNum">Maximum 200 characters</div>
                             </div>
                           </div>
                          <div class="form-group row">
                                	<input type="hidden" value="${qustion.qustionOrderBean}" id="edit_orderId">
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Order No.<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                       <form:select class="form-control" id="orderNumber" path="qustionOrderBean" onchange="validateOrderNumber(this.value)" tabindex="4">
                                       <form:option value="${qustion.qustionOrderBean}">${qustion.qustionOrderBean}</form:option>
                                  
                                    </form:select>
                                    </div>
                            	
                            </div>	
                            
                            <div class="form-group row">
                                 
                                    <label class="col-12 col-md-4 col-xl-4 control-label">No. of Options<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <form:hidden path="qustionOptionCountBean" id="numberOptionHidden"/> 
                                       <form:select class="form-control" id="numberOption" path="qustionOptionCountBean" onchange="optionNumber(this.value);optionValue($('#idMyqustionId').val())" tabindex="5">
                                  		<form:option value="${qustion.qustionOptionCountBean}">${qustion.qustionOptionCountBean}</form:option>
                                  
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
                                 	<form:radiobutton id="demo-form-radio-3" class="magic-radio sampleyes" path="statusBean" value="false" name="form-radio-button" />
                                    <label for="demo-form-radio-3" tabindex="14">Active</label>
                             
                                    <form:radiobutton path="statusBean" id="demo-form-radio-4" class="magic-radio sampleno"  value="true" name="form-radio-button" />
                                  <label for="demo-form-radio-4" tabindex="15">Inactive</label>
                                 </div>
                              </div>
                           </div>    
                          
						  <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnUpdateId" onclick="return save();" tabindex="16">Update</button>
								 <button class="btn btn-danger mb-1" id="btnCancelId" onclick="cancel()" tabindex="17">Cancel</button>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="wrsis/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="wrsis/js/bootstrap.min.js"></script> 
<script src="wrsis/js/jquery.dataTables.min.js"></script>         
<script type="text/javascript">
      $(document).ready(function(){
    	 
    	 
    	  var t=$("#orderNumber").val();
    	  var html="";
    	  for(i=1;i<="${questionCounts}";i++ )
        	  {
        	  	if(t!=i)
            	{  	
					html+="<option value='"+i+"'>"+i+"</option>";
            	}
        	 }
    	  $("#orderNumber").append(html);
    	  var html1="";
    	  for(i=1;i<="${optionCounts}";i++ )
        	  {
    		  	if($("#numberOption").val()!=i)
        		 { 	
					html1+="<option value='"+i+"'>"+i+"</option>";
        		 }
        	 }
    	  $("#numberOption").append(html1);
      });
      function cancel()
      {
      	$("#cancelForm").submit();	
      }
      function save()
      {
    	  
    	 event.preventDefault();
   		 var form = event.target.form;
		   var name_regex = /^[a-zA-Z0-9 ]{1,200}$/;
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
    		   		swal("Error", "Question accept only alphabets and numbers", "error").then(function() 
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
    	// alert(numberOption);
    	 for(i = 1 ;i<= numberOption;i++)
    	 {
    		 var infoValueId = $("#infoValueId_"+i).val();
    		 
    		 var infoId = $("#infoId_"+i).val();
    		 var optinId=$("#editAjaxId_"+i).val();
    		 
   			valArray.push({
   				"qValue" : infoValueId ,
   				"qInfo":infoId,
   				"optinId":optinId
   				});
   			
    	 }
    
 	 $("#valueArrayListId").val(JSON.stringify(valArray));
	   	 
	   	 
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
 function optionNumber(op_value)
{
	
	$("#numberOption").val(op_value);
	 $("#checkDhitiId").empty();
	 var html="";
	 for(i=1;i<=op_value;i++)
	 {
		 html=html+"<div class='form-group row' id='optionId_"+i+"'>";
		 html=html+"<label class='col-12 col-md-4 col-xl-4 control-label' for='demo-text-input'>Option-"+i+"<span class='text-danger'>*</span></label>";
		 html=html+"<div class='col-lg-4'><span class='colon'>:</span>";
		 html=html+"<input type='text' id='infoValueId_"+i+"' class='form-control' placeholder='Value'  tabindex='6' maxlength='50' />";
		 html=html+"</div>";
       
		 html=html+"<div class='col-lg-3'>";
		 html=html+"<input type='text' id='infoId_"+i+"' class='form-control' placeholder='Info' tabindex='7' maxlength='100' />";
		 html=html+"<input type='hidden' id='editAjaxId_"+i+"' class='form-control' placeholder='Info'  />"; 
		 html=html+"</div>";
		 html=html+"<a href='javascript:void(0)' onclick='deleteOption("+i+")' id='removeId_"+i+"'><i class='fa fa-times fa-2x' aria-hidden='true'></i></a>";
		
		 html=html+"</div>";
	 } 
	
	 $("#numberOption").val(op_value);
	 $("#checkDhitiId").append(html);	
 		
 		 
 		 var numberOptionHidden=$("#numberOptionHidden").val();
 		
 		 
 		if(op_value<numberOptionHidden)
 	 	{
 	 	 	
 			optionNumber(numberOptionHidden);
 			$("#numberOption").val(numberOptionHidden);
 			swal("Warning", "Please click ( <i class='fa fa-times' aria-hidden='true'></i> ) button which option you want to remove", "warning");
 			
 			var x=$("#idMyqustionId").val();
 			
 			optionValue(x);
 	 	}else{ 
 	 		
 	 	}
 }

 </script> 
    
  <script>
	   $(document).ready(function(){
		 if('${errMsg}' != '')
	   	{
			//alert('${ErrorMessage}');
			swal("Error", "${errMsg}", "error");
			document.getElementById('${FieldId}').value="";
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>     
<script>
function optionValue(qustionId)
{
	
	var opNum=$("#numberOption").val();
	optionNumber(opNum);
	$.ajax({
			type:"GET",
			url:"viewQustionOptionByQustionId",
			data:{
					"qustionId":qustionId
				},
			success:function(response)
			{
				
				var val=JSON.parse(response);
				var v=val.valueL;
				var valArr = v.toString().split(",");
				var info=val.infoL;
				var infoArr = info.toString().split(",");
				var optionId=val.optionId;

				var idOptionArr = optionId.toString().split(",");

				for(var i=0;i<val.optionNumber;i++)
				{
					var y = i;
					
					$("#infoValueId_"+(i+1)).val(valArr[i]);
					
					$("#infoId_"+(i+1)).val(infoArr[i]);
					
					$("#editAjaxId_"+(i+1)).val(idOptionArr[i]);
				}
				
					
				//$("#numberOptionHidden").val(opNum);	


					
			}
		});
}
</script>

      
 <script>
function deleteOption(optionId)
{
	
	swal({
			
			text: "Are you sure! Remove  this option?", 
			type: "warning",
 		  cancelButtonText: 'No',
			confirmButtonText: "Yes",
			showCancelButton: true
	    }).then((result) => {
				if (result.value) 
	  			{ 
					var optionID=$("#editAjaxId_"+optionId).val();
					/* alert("optionID=="+optionID); */
	$.ajax({
		type:"GET",
		url:"deleteOptionByOptionId",
		data:{
				"optionId":optionID
				
			},
		success:function(response)
		{	
			var val=JSON.parse(response);
			
			window.location.reload();
		}
		
	});
	  			 }
		});
//}
}
 </script>     
<script>
$(document).ready(function(){
	 var text_max = 200;
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#qustion').keyup(function() {
	     var text_length = $('#qustion').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
});


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
					//alert(val);
			 if (val.isExistOrder == 'exist') {
				 
				 var qType='';
				  if(questionType==1)
					{
					  qType="IVR";
					}else{
						qType="Mobile";
						}  
					
				 swal('Error!','Order number '+orderId+' already exists for '+qType,'error');
				
				 $("#orderNumber").val($("#edit_orderId").val());
				
			}
				},
		error:function(error){
					
		}			
		  });
	
  }
  </script>