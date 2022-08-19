<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<script language="javascript">
	pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";

</script>
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2();
    
  //Date range picker
    $('#reservation').daterangepicker()
    
  

    //Date picker
    $('#datepicker').datepicker({
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

  $(document).ready(function(){
		defaultfocus("txtFunName");
		txtBoxEffect();
		TextCounter('txtDesc','lblChar',100);
		setupLabel();
		$('.label_check').click(function(){
			setupLabel();
		});
     
	});
    </script>
   <script type="text/javascript">
	
	/*Validation For Function Master Click On Submit Button   */
	
	  function checkValidate(){
		  event.preventDefault();
			var form = event.target.form;
		var functionName=$("#functionName").val();
		var fileName=$("#fileName").val();
		var txtDesc =$("#txtDesc").val();
		var descLen=txtDesc.length;
		var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
		var portletFile=$('#portletFile').val();

		//if (!WhiteSpaceValidation1st("functionName", 'Function Name should not space.')) { return false;}
		
		if(functionName == ""){
			  $("#functionName").focus();
			swal("Error", "Please enter the Function Name", "error");
		  return false;
	     }
		if(functionName.charAt(0)== ' ' || functionName.charAt(functionName.length -1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Function Name", "error").then(function() {
				   $("#functionName").focus();
			   });
	   return false;
		   }
		if(functionName!=null)
	 	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<functionName.length && i+1 < functionName.length;i++)
		   		{
		   			if ((functionName.charAt(i) == ' ') && (functionName.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Function Name should not contain consecutive blank spaces", "error").then(function() {
						   $("#functionName").focus();
					   });
					return false;
				}
	 	}
		if(fileName == ""){
			  $("#fileName").focus();
			swal("Error", "Please enter the File Name", "error");
			  return false;
		     }
		if(fileName.charAt(0)== ' ' || fileName.charAt(fileName.length -1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in File Name", "error").then(function() {
				   $("#fileName").focus();
			   });
	   return false;
		   }
		if(fileName!=null)
	 	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<fileName.length && i+1 < fileName.length;i++)
		   		{
		   			if ((fileName.charAt(i) == ' ') && (fileName.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "File Name should not contain consecutive blank spaces", "error").then(function() {
						   $("#fileName").focus();
					   });
					return false;
				}
	 	}
		if(txtDesc.charAt(0)== ' ' || txtDesc.charAt(descLen-1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() {
				   $("#txtDesc").focus();
			});
	         return false;
		   }
 	if(!txtDesc.match(desc_regex))
	    	{
	    		swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
				   $("#txtDesc").focus();
			});
				return false;
	    	}
		   	if(txtDesc!=null)
	    	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<txtDesc.length && i+1 < txtDesc.length;i++)
		   		{
		   			if ((txtDesc.charAt(i) == ' ') && (txtDesc.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Description should not contain consecutive blank spaces", "error").then(function() {
					   $("#txtDesc").focus();
					});
					return false;
				}
	    	}
		   	if (txtDesc.charAt(0) == '!' || txtDesc.charAt(0) == '@' 
				|| txtDesc.charAt(0) == '#' || txtDesc.charAt(0) == '$' 
				|| txtDesc.charAt(0) == '&' || txtDesc.charAt(0) == '*' 
				|| txtDesc.charAt(0) == '(' || txtDesc.charAt(0) == ')' 
				|| txtDesc.charAt(descLen - 1) == '!' || txtDesc.charAt(descLen - 1) == '@' 
				|| txtDesc.charAt(descLen - 1) == '#' || txtDesc.charAt(descLen - 1) == '$' 
				|| txtDesc.charAt(descLen - 1) == '&' || txtDesc.charAt(descLen - 1) == '*' 
				|| txtDesc.charAt(descLen - 1) == '(' || txtDesc.charAt(descLen - 1) == ')') 
		   	{
				swal("Error", "!@#$&*() characters are not allowed at initial and last place in Description", "error").then(function() {
				   $("#txtDesc").focus();
			});
				return false;
			}
		
		if($('#action1').is(':checked')==false && $('#action2').is(':checked')==false && $('#action3').is(':checked')==false)
		{
			$('#action1').focus();
			swal("Error", "Please choose atleast one Permission", "error");
			return false;
		} 
		
	
		if(portletFile == ""){
			  $("#portletFile").focus();
			swal("Error", "Please enter the Portlet File Name", "error");
			  return false;
		     }
		if(portletFile.charAt(0)== ' ' || portletFile.charAt(portletFile.length -1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Portlet File Name", "error").then(function() {
				   $("#portletFile").focus();
			   });
	   return false;
		   }
		if(portletFile!=null)
	 	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<portletFile.length && i+1 < portletFile.length;i++)
		   		{
		   			if ((portletFile.charAt(i) == ' ') && (portletFile.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Portlet File Name should not contain consecutive blank spaces", "error").then(function() {
						   $("#portletFile").focus();
					   });
					return false;
				}
	 	}
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

	 /*  Check Validation for Function Name */
    

	  function checkfunctionName(e){
	     var regex = new RegExp("^[a-zA-Z\\s ]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
	 return false;
	}  

	 /*  Check Validation for Description */

	  function checkDescription(e){
	     var regex = new RegExp("^[a-zA-Z\\s ]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
	 swal("Error", "Description accept only alphabets", "error");
	 return false;
	}  

	 /*  Check Validation for File name */
	 
	   function checkFileName(e){
	 var regex = new RegExp("^[a-zA-Z. ]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
	 swal("Error", "File Name accept alphabets and .", "error");
	 return false;
	}     



		 /*  Check Validation for Portlet File name */
		 
		  function checkPortletFileName(e){
		 var regex = new RegExp("^[a-zA-Z\\s ]");
		 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		 var code = (e.keyCode ? e.keyCode : e.which);
		 if (regex.test(str) || code==8) {
		    return true;
		}
		 swal("Error", "Portlet File Name accept only alphabets", "error");
		 return false;
		}    
			
	
	   /*To check function name already exist or not*/

	   function chkDuplicateFunctionName(fun_name)
	   {   
		   //alert(fun_name);   

	        
	   	 if(fun_name==''){return false;}else{
	                var xmlhttp;
	               
	       if(window.XMLHttpRequest)
	            {
	            xmlhttp=new   XMLHttpRequest();
	            }
	           
	          else
	            {
	            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	            }
	       xmlhttp.onreadystatechange=function()
	       {
	       	console.log("status " + xmlhttp.status);
	            if(xmlhttp.readyState ==4 && xmlhttp.status ==200)
	            {
	                 var res_text=xmlhttp.responseText;
	                if(res_text!="NotExist")
	                             {  
	                	swal("Error", "Function Name already exists", "error");
	                            //alert("Function with this name already exist.");  
	                            $("#functionName").val("");
	                            $("#functionName").focus();
	                            return false;
	                             }
	          
	            }
	       }; 
	       xmlhttp.open("GET","checkFunctionName?fun_name="+fun_name,true);
	       xmlhttp.send(); 
	   	}
	        
	   }

	   /*To check function master file name already exist or not*/
	   function chkDuplicateFileName(name)
	   {     
		   //alert(name);   
	          if(name=='') {return false;}else{
	               var xmlhttp;
	       if(window.XMLHttpRequest)
	            {
	            xmlhttp=new   XMLHttpRequest();
	            }
	         else
	            {
	            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	           
	            }
	       xmlhttp.onreadystatechange=function()
	       {
	            if (xmlhttp.readyState==4 && xmlhttp.status==200)
	            {
	                 var res_text=xmlhttp.responseText; 
	                if(res_text!="NotExist")
	                             {
	                	swal("Error", "File name already exists", "error");
	                            //alert("File name already exist.");
	                            $("#fileName").val(""); 
	                            $("#fileName").focus();                 
	                             }
	            }
	       }; 
	       xmlhttp.open("GET","chkFileName?name="+name,true );
	       xmlhttp.send(); 
	          } 
	   } 
	</script>
<script>
$(document).ready(function(){
	 var text_max = 200;
	 $('#btnResetId').click(function() {
		 $('#charNum').html('Maximum characters :' + '200');
	 });
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#txtDesc').keyup(function() {
	     var text_length = $('#txtDesc').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
	
});
</script>
    <script>
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
	   		swal("Error", "${errMsg}", "error");
			document.getElementById('${FieldId}').value="";
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>

    <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Function</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Link</li>
                           <li class="breadcrumb-item active" aria-current="page">Function Master</li>
                        </ol>
                     </nav>
                  </div>
           
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active" href="addFunctionMaster">Add</a>
                              <a class="nav-item nav-link " href="viewFunctionMaster">View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form class="col-sm-12 form-horizontal customform" action="registerFunctionMaster" modelAttribute="functionVo" method="post" autocomplete="off">
                       
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        <div class="card-body">
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
                           <!--Static-->
                           <!--Text Input-->
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input2">Function Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input type="text" class="form-control" path="functionName" id="functionName" placeholder="Enter Function Name" maxlength="50" onkeypress="return checkfunctionName(event);" ></form:input>  
                                 
                              </div><label ></label><form:errors path="functionName" cssClass="error"  element="div" />
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input1">File Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input type="text" class="form-control" path="fileName" id="fileName" placeholder="Enter File Name" maxlength="50" onkeypress="return checkFileName(event);"></form:input>  
                                 
                              </div><label ></label><form:errors path="fileName" cssClass="error"  element="div" />
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea class="form-control" rows="3" name="description" path="description" id="txtDesc"  maxlength="100" placeholder="Enter Description..." onkeypress="return checkDescription(event);"></form:textarea><div id="charNum"></div> 
                              </div><label ></label><div></div>
                           </div>
                           <div class="form-group row">
		                  <label class="col-12 col-md-2 col-xl-2 control-label" >Permission<span class="text-danger">*</span></label>
		
		            <div class="col-12 col-md-6 col-xl-4">
			            
			            <div class="custom-control custom-checkbox custom-control-inline">
                        <form:checkbox path="addData" value="1" id="action1" class="custom-control-input"></form:checkbox>
                        <label class="custom-control-label" for="action1">Add </label>
                   </div>
                    <div class="custom-control custom-checkbox custom-control-inline">
                      <form:checkbox path="viewData" value="2" id="action2" class="custom-control-input"></form:checkbox>
                     <label class="custom-control-label" for="action2">View  </label>
                </div>
                <div class="custom-control custom-checkbox custom-control-inline">
                  <form:checkbox path="manageData" value="3" id="action3" class="custom-control-input"></form:checkbox>
                  <label class="custom-control-label" for="action3"> Manage </label> 
                  </div>
                  
			        </div> 
	                                 
		            <%-- <div class="custom-control custom-checkbox custom-control-inline">
                        <form:checkbox path="addData" value="1" id="action1" class="custom-control-input"></form:checkbox>
                        <label class="custom-control-label" for="action1">Add </label>
                   </div>
                    <div class="custom-control custom-checkbox custom-control-inline">
                      <form:checkbox path="viewData" value="2" id="action2" class="custom-control-input"></form:checkbox>
                     <label class="custom-control-label" for="action2">View  </label>
                </div>
                <div class="custom-control custom-checkbox custom-control-inline">
                  <form:checkbox path="manageData" value="3" id="action3" class="custom-control-input"></form:checkbox>
                  <label class="custom-control-label" for="action3"> Manage </label> </div> --%>
            </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input2">Portlet File Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input type="text" path="vchPortletFile" class="form-control" id="portletFile" maxlength="50" placeholder="Enter Portlet File Name" onkeypress="return checkPortletFileName(event);"></form:input>
                                 
                              </div><label ></label><form:errors path="vchPortletFile" cssClass="error"  element="div" />
                           </div>
                           <hr>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 
                                 <button class="btn btn-primary mb-1" id="btnSubmitId" onclick="return checkValidate();">Submit</button>
                                 <button type="reset" class="btn btn btn-danger mb-1" id="btnResetId">Reset</button>
                                 
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
    
    
    
    
<%-- <div id="mainTable">
 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#fa-icons" >Add</a></li>
              <li><a href="viewFunctionMaster" >View</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="fa-icons">
                <section id="new">
                  
                  <div class="row">
                  	<div class="col-md-12">
                  		<c:if test="${not empty errMsg}">
                  			<div class="alert alert-custom-danger fade in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Error!</strong>${errMsg}
							</div>
                  		</c:if>
                		<c:if test="${not empty msg}">
                			<div class="alert alert-custom-success fade in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Success!</strong>${msg}
							</div>
                		</c:if>
                	</div>
						
					<form:form class="col-sm-12 form-horizontal customform" action="registerFunctionMaster" modelAttribute="functionVo" method="post" autocomplete="off">
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Function Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="functionName" id="functionName" placeholder="Enter Function Name" maxlength="50" onblur="chkDuplicateFunctionName(this.value)" onkeypress="return checkfunctionName(event);" ></form:input>
		                  </div>
		                  <label ></label><form:errors path="functionName" cssClass="error"  element="div" />
		                  </div>
		                
		            <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">File Name<span class="mandatory">*</span></label>
		
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="fileName" id="fileName" placeholder="Enter File Name" maxlength="50" onblur="chkDuplicateFileName(this.value)" onkeypress="return checkFileName(event);"></form:input><!-- onkeypress="return checkFileName(event);" -->
		                  </div>
		                    
		                  <label ></label><form:errors path="fileName" cssClass="error"  element="div" />
		                  </div>
		               <div class="form-group">
		                  <label for="exampleInputFile" class="col-sm-2 control-label">Description</label>
		                  <div class="col-sm-4">
		                  <form:textarea class="form-control" rows="3" name="description" path="description" id="txtDesc" onkeyup="return TextCounter('txtDesc','lblChar',100)" maxlength="100" placeholder="Enter Description..." onkeypress="return checkDescription(event);" ></form:textarea>&nbsp; Maximum <span id="lblChar" style="color:red"></span> &nbsp;characters 
		                  </div>
		                  <label ></label><div></div>
		               </div>
		              
		            
		                <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label" >Permission<span class="mandatory">*</span></label>
		
		            <div class="col-sm-6 chckBoxList">
                      <label>
                        <form:checkbox path="addData" value="1" class="flat-red" id="action1" ></form:checkbox>
                        Add </label>
                   
                    <label>
                      <form:checkbox path="viewData" value="2" class="flat-red" id="action2"></form:checkbox>
                     View  </label>
                
                <label>
                  <form:checkbox path="manageData" value="3" class="flat-red" id="action3"></form:checkbox>
                   Manage </label> &nbsp&nbsp
              </div>
            </div>
		       
		 
		            <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Portlet File Name</label>
		
		                  <div class="col-sm-4">
		                    <form:input type="text" path="vchPortletFile" class="form-control" id="portletFile" maxlength="50" placeholder="Enter Portlet File Name" onkeypress="return checkPortletFileName(event);"></form:input>
		                  </div>
		                  <label ></label><form:errors path="vchPortletFile" cssClass="error"  element="div" />
		                  </div>
		                  <div class="form-group">
		                  <div class="col-sm-offset-2 col-sm-10">
		                  <button type="submit" class="btn btn-success" onclick="return checkValidate();">Submit</button> 
		                  <button type="reset" class="btn btn-danger">Reset</button>
		                	</div>
		                </div>
              </form:form></div></section></div>
                  </div>
                  <hr>
				
              </div>
             
             

            </div>
          </div>
        </div> --%>
      