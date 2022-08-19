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
    <script>
	
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
		 	}swal({
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

	 /*  Check Validation for Function Name */
    

	  function checkfunctionName(e){
	     var regex = new RegExp("^[a-zA-Z\\s ]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
	 swal("Error", "Please enter a valid Function Name", "error");
		//alert("Please Enter a Valid Function Name.");
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
		//alert("Please Enter a Valid Description.");
	 return false;
	} 
 
	 /*  Check Validation for File name */
	  
	   function checkFileName(e){
	 var regex = new RegExp("^[a-zA-Z\\s ]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
	 swal("Error", "File Name accept only alphabets", "error");
		//alert("Please Enter a Valid File Name.");
	 return false;
	}   


	   function checkPortletFileName(e){
			 var regex = new RegExp("^[a-zA-Z\\s ]");
			 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
			 var code = (e.keyCode ? e.keyCode : e.which);
			 if (regex.test(str) || code==8) {
			    return true;
			}
			 swal("Error", "Portlet File Name accept only alphabets", "error");
			//	alert("Please Enter a Valid File Name.");
			 return false;
			}    
   /*To check Edit function master  function name except recent name other name exist or not*/
   
  function chkDuplicateEditFunctionName(fun_name,path)
{ 
	  
	if(fun_name==''){return false;}
	else if(path==fun_name){return false;}else{
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
                        // alert("Function with this name already exist.");  
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


	   
	   /*To check Edit function master  file name except recent name other name exist or not*/

	   function chkDuplicateEditFileName(name,path)
	   {   
	          if(name=='') {return false;}
	          else if(path==name){return false;}else{
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
	                           // alert("File name already exist.");
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
	    	    <form action="viewFunctionMaster" method="get" id="cancelForm">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

	    	    </form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Function</h4>
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
                              <a class="nav-item nav-link active" href="#">Edit</a>
                              <a class="nav-item nav-link " href="viewFunctionMaster">View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="cancel()"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form class="col-sm-12 form-horizontal customform" action="updateFunctionMaster" modelAttribute="functionVo" method="post" autocomplete="off">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        
                        <form:hidden path="functionId"/>
                        <form:hidden path="bitStatus"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input2">Function Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input type="text" class="form-control" path="functionName" id="functionName" placeholder="Enter Function Name" maxlength="50" onkeypress="return checkfunctionName(event);" ></form:input>  
                                 
                              </div><label ></label><%-- <form:errors path="functionName" cssClass="error"  element="div" /> --%>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input1">File Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input type="text" class="form-control" path="fileName" id="fileName" placeholder="Enter File Name" maxlength="50" onkeypress="return checkFileName(event);"></form:input>  
                                 
                              </div><label ></label><%-- <form:errors path="fileName" cssClass="error"  element="div" /> --%>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:textarea class="form-control" rows="3" name="description" path="description" id="txtDesc" maxlength="100" onkeyup="countChar(this)" ></form:textarea><div id="charNum"> </div> 
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
			        </div> 
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input2">Portlet File Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input type="text" path="vchPortletFile" class="form-control" id="portletFile" maxlength="50" placeholder="Enter Portlet File Name" onkeypress="return checkPortletFileName(event);"></form:input>
                                 
                              </div><label ></label><%-- <form:errors path="vchPortletFile" cssClass="error"  element="div" /> --%>
                           </div>
                           <hr>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 
                                 <button class="btn btn-primary mb-1" id="btnUpdateId" onclick="return checkValidate();">Update</button>
                                 <button type="button" class="btn btn btn-danger mb-1" onclick="cancel()">Cancel</button>
                                 
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
	function cancel(){
  		$("#cancelForm").submit();
  }
	</script>
	
	
	
	
	
	
	
<%-- 	 <div class="mainpanel">
 <form:form action="editGlobalLink" name="form" method="post">
<input type="hidden" name="globalLinkId" id="hdnGlobalLinkId"/>
</form:form>

<form:form action="deleteGlobalLink" name="form1" method="post">
<input type="hidden" name="globalLinkId" id="hiddenGlobalLinkId"/>
<input type="hidden" name="status" id="hiddenStatus"/>
</form:form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Function Master</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="#"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item"><a href="#">Manage Link</a></li>
                           <li class="breadcrumb-item active" aria-current="page">Function Master</li>
                        </ol>
                     </nav>
                  </div>
       <!--            <div class="buttons-list">
                     <ul>
                        <li><a class="active" href="#" >Button 1</a></li>
                        <li><a href="#" >Button 2</a></li>
                        <li><a href="#" >Button 3</a></li>
                     </ul>
                  </div> -->
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link " href="addFunction">Add</a>
                              <a class="nav-item nav-link active" href="viewFunctionMaster">View</a>
                           </ul>
                           <div class="indicatorslist">
                              <a title="" href="javascript:void(0)" id="refreshIcon" data-toggle="tooltip" data-placement="top" data-original-title="Refresh"><i class="icon-reuse"></i></a>
                              <a  id="printicon" href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Print"><i class="icon-printer1"></i></a>
                              <!-- <a  id="deleteIcon" href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"><i class="icon-trash-21"></i></a> -->
                              <a  title="" href="javascript:void(0)"  id="excelIcon" data-toggle="tooltip" data-placement="top" data-original-title="Excel"><i class="icon-excel-file"></i></a>
                              <!-- <a  title="" href="javascript:void(0)" id="publishIcon" data-toggle="tooltip" data-placement="top" data-original-title="Publish"><i class="icon-eye1"></i></a>
                              <a  title="" href="javascript:void(0)" id="unpublishIcon" data-toggle="tooltip" data-placement="top" data-original-title="Unpublish"><i class="icon-eye-off1"></i></a>
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a> -->
                              <a  title="" href="javascript:void(0)" id="downloadIcon" data-toggle="tooltip" data-placement="top" data-original-title="Download"><i class="icon-download1"></i></a>
                           </div>
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                            
                  	 <form:form class="col-sm-12 form-horizontal customform" action="viewGlobalLink"  method="post" modelAttribute="searchVo">
		              
		              <div class="form-group">
                                 <div class="row">
                                    
                                    <label class="col-sm-2 ">Status</label>
                                    <div class="col-sm-3">
                                       <form:select path="dataId" id="status" class="form-control" style="width: 100%;" >
								          <option value="0">Select Status</option>
				     			          <form:options items="${statusList}" itemValue="dataId" itemLabel="dataName" />
									   </form:select>
                                    </div>
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                 </div>
                       </div>
		               
		       </form:form>  
                  	
                           </div>
                           <div class="text-center"> <a class="searchopen" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Search"> <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                           <div class="col-md-12">
                  		<c:if test="${not empty errMsg}">
                  			<div class="alert alert-custom-danger fade-in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Error!</strong>${errMsg}
							</div>
                  		</c:if>
                		<c:if test="${not empty msg}">
                			<div class="alert alert-custom-success fade-in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Success!</strong>${msg}
							</div>
                		</c:if>
                	</div>
                
               <table data-toggle="table" class="table table-hover table-bordered">
                   
                   <thead>
                   <tr>
                   <th>#Sl No</th>
                    <th>Global Link</th>
                     <th>Show on Home Page</th>
                     <th>Status</th>
                      <th>Edit</th>
                       <th>Delete</th>
                       </tr>
                   </thead>
              <tbody>
    
    <c:forEach items="${globalList}" var="vo" varStatus="counter">
    
 <tr>
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.globalLinkName}</td>
    <td><c:choose>
          <c:when test="${vo.bitHomePage == 0}">Yes</c:when>
			<c:otherwise>No</c:otherwise>
		</c:choose></td>
    <td> <c:choose>
          <c:when test="${vo.bitStatus == 0}">Active</c:when>
			<c:otherwise>Inactive</c:otherwise>
		</c:choose></td>
    <td align="center" ><a data-placement="top" data-toggle="tooltip" title="Edit" id="edit${vo.globalLinkId}" onclick="editGlobalLink('${vo.globalLinkId}',1);"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><i class="icon-edit1"></i></button></a></td>
    <td><a data-placement="top" data-toggle="tooltip" title="Delete" onclick="deleteGlobalLink('${vo.globalLinkId}','${vo.bitStatus}');"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><i class="icon-trash-21"></i></button></a></td>
    </tr>
    </c:forEach>
    </tbody>
        
</table>
                           
                           </div>
                           <nav aria-label="Page navigation example">
                              <ul class="pagination justify-content-end">
                                 <li class="page-item "><a class="page-link" href="#">Previous</a></li>
                                 <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                 <li class="page-item"><a class="page-link" href="#">2</a></li>
                                 <li class="page-item"><a class="page-link" href="#">3</a></li>
                                 <li class="page-item"><a class="page-link" href="#">Next</a></li>
                              </ul>
                           </nav>
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div> --%>
	
	
	
	
	
	
	
	
	
	
    
<%-- <div id="mainTable">
 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#fa-icons" >Edit</a></li>
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
						
					<form:form class="col-sm-12 form-horizontal customform" action="updateFunctionMaster" modelAttribute="functionVo" method="post" autocomplete="off">
		             <form:hidden path="functionId"/>
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Function Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="functionName" id="functionName" maxlength="50" onblur="chkDuplicateEditFunctionName(this.value,'${functionVo.functionName}')" onkeypress="return checkfunctionName(event);"></form:input>
		                  </div>
		                  <label ></label><form:errors path="functionName" cssClass="error"  element="div" />
		                  </div>
		                
		            <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">File Name<span class="mandatory">*</span></label> 
		
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="fileName" id="fileName" maxlength="50" onblur="chkDuplicateEditFileName(this.value,'${functionVo.fileName}')" onkeypress="return checkFileName(event);" ></form:input><!-- onkeypress="return checkFileName(event);" -->
		                  </div>
		                   
		                  <label ></label><form:errors path="fileName" cssClass="error"  element="div" />
		                  </div>
		               <div class="form-group">
		                  <label for="exampleInputFile" class="col-sm-2 control-label">Description</label>
		                  <div class="col-sm-4">
		                  <form:textarea class="form-control" rows="3" name="description" path="description" id="txtDesc" onkeyup="return TextCounter('txtDesc','lblChar',100)" maxlength="100"  onkeypress="return checkDescription(event);" ></form:textarea>&nbsp; Maximum <span id="lblChar" style="color:red"></span> &nbsp;characters 
		                  </div>
		                  <label ></label><div></div>
		               </div>
		              
		            
		                <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label" >Permission<span class="mandatory">*</span></label>
		
		            <div class="col-sm-6 chckBoxList">
                      <label>
                        <form:checkbox path="addData" value="1" class="flat-red" id="action1"></form:checkbox>
                        Add </label>
                   
                    <label>
                      <form:checkbox path="viewData" value="1" class="flat-red" id="action2"></form:checkbox>
                     View  </label>
                
                <label>
                  <form:checkbox path="manageData" value="1" class="flat-red" id="action3"></form:checkbox>
                   Manage </label> 
              </div>
            </div>
		       
		 
		            <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Portlet File Name</label>
		
		                  <div class="col-sm-4">
		                    <form:input type="text" path="vchPortletFile" class="form-control" id="portletFile" maxlength="50"  onkeypress="return checkPortletFileName(event);"></form:input>
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
        </div>
       --%>