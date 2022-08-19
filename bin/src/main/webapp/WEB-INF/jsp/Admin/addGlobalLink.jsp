<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Global Link</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Link</li>
                           <li class="breadcrumb-item active" aria-current="page">Global Link</li>
                        </ol>
                     </nav>
                  </div>
           
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active" href="addGlobalLink">Add</a>
                              <a class="nav-item nav-link " href="viewGlobalLink">View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                           
	                	
                           <%-- <div style="text-align: center;color: green;font-weight: bold;">${msg}</div>
             <div style="text-align: center;color: red;font-weight: bold;">${errMsg}</div> --%>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form class="col-sm-12 form-horizontal customform" action="registerGlobalLink" modelAttribute="globalVo" method="post" autocomplete="off" >
                       
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        <div class="card-body">
                        
                        
                         <div class="col-md-12">
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
                        </div> 
                        
                        
                       <%--  <c:if test="${not empty errMsg}">
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
	                	</c:if> --%>
                           <!--Static-->
                           <!--Text Input-->
                             
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Global Link<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <form:input type="text" class="form-control" path="globalLinkName" maxlength="50" id="globalLinkName" autofocus="autofocus" placeholder="Enter Global Link" onkeypress="return checkGlobalLivk(event);"></form:input> 
                                 
                              </div>
                           </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Sl No <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                              <form:input readonly="true" type="text" class="form-control" path="intSortNum" value="${maxSlNumber}" maxlength="4" id="intSortNum"></form:input> 
                              
                              
                              
                                 
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Link Icon <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                              <form:input type="text" class="form-control" path="vchicon" maxlength="50" id="iconId" placeholder="Enter Icon Class" onkeypress="checkLinkIcon(event)"></form:input>
                              <form:errors path="vchicon" ></form:errors>
                              
                                 
                              </div>
                           </div>
                            
                            <form:input type="hidden" path="bitHomePage" value="0"/>
                            
                             <%-- <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Show on Homepage<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <div class="radio">
                                 <form:radiobutton  name="r2" path="bitHomePage"  value="0" class="magic-radio sampleyes" id="demo-form-radio" ></form:radiobutton>
                                    <!-- <input id="demo-form-radio" class="magic-radio sampleyes" type="radio" name="form-radio-button" checked="checked"> -->
                                    <label for="demo-form-radio">Yes</label>
                             <form:radiobutton  name="r2" path="bitHomePage"  value="1" class="magic-radio sampleno" id="demo-form-radio-2" ></form:radiobutton>
                                    <!-- <input id="demo-form-radio-2" class="magic-radio sampleno" type="radio" name="form-radio-button"> -->
                                    <label for="demo-form-radio-2">No</label>
                                    
                                 </div>
                              </div>
                           </div> --%>
                           <hr>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnSubmitId" onclick="return checkValidate();">Submit</button>
                                 <button type="reset" class="btn btn-danger mb-1">Reset</button>
                                 
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

/*Validation For Global link Click On Submit Button   */

 function checkValidate(){
	 event.preventDefault();
	var form = event.target.form;
    var globalLinkName=$("#globalLinkName").val();
	var sortNum=$("#intSortNum").val();
	var icon=$("#iconId").val();
	
	if(globalLinkName == ""){
		$("#globalLinkName").focus();
		swal("Error","Please enter the Global Link", "error");
		  return false;
	     }
	if(globalLinkName.charAt(0)== ' ' || globalLinkName.charAt(globalLinkName.length -1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in Global Link", "error").then(function() {
			   $("#globalLinkName").focus();
		   });
      return false;
	   }
	   if(globalLinkName!=null)
 	{
	   		var count= 0;
	   		var i;
	   		for(i=0;i<globalLinkName.length && i+1 < globalLinkName.length;i++)
	   		{
	   			if ((globalLinkName.charAt(i) == ' ') && (globalLinkName.charAt(i + 1) == ' ')) 
	   			{
					count++;
				}
	   		}
	   		if (count > 0) {
	   			swal("Error", "Global Link should not contain consecutive blank spaces", "error").then(function() {
					   $("#globalLinkName").focus();
				   });
				return false;
			}
 	}
	if(icon == ""){
		$("#iconId").focus();
		swal("Error", "Please enter the Link Icon", "error");
		  return false;
	     }
	if(icon.charAt(0)== ' ' || icon.charAt(icon.length -1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in Link Icon", "error").then(function() {
			   $("#iconId").focus();
		   });
   return false;
	   }
	if(icon!=null)
 	{
	   		var count= 0;
	   		var i;
	   		for(i=0;i<icon.length && i+1 < icon.length;i++)
	   		{
	   			if ((icon.charAt(i) == ' ') && (icon.charAt(i + 1) == ' ')) 
	   			{
					count++;
				}
	   		}
	   		if (count > 0) {
	   			swal("Error", "Link Icon should not contain consecutive blank spaces", "error").then(function() {
					   $("#iconId").focus();
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
 /*To check Global Link name already exist or not*/

 function chkDuplicateGlobalLinkName(name)
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
            	  swal("Error", "Global Link already exists", "error");
                          //alert("Global Link this name already exist.");
                          $("#globalLinkName").val(""); 
                          $("#globalLinkName").focus();  
                          return false;               
                           }
          }
     }; 
     xmlhttp.open("GET","chkGlobalLinkName?name="+name,true );
     xmlhttp.send(); 
        } 
 }
</script>

<script> 
/*   Check Validation for Global link */  
 
 
 function checkGlobalLivk(e){
    var regex = new RegExp("^[a-zA-Z ]");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
var code = (e.keyCode ? e.keyCode : e.which);
if (regex.test(str) || code==8) {
   return true;
}
$("#globalLinkName").focus();
swal("Error", "Global Link accept only alphabets", "error");
	//alert("Please Enter a Valid Global Link Name.");
return false;
}

 /*  Check Validation for Serial Number */
function checkSerialNo(e){
 var regex = new RegExp("^[0-9]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
	 
	 swal("Error", "Please enter a valid Serial Number", "error");
		//alert("Please Enter a Valid Serial Number.");
	 return false;
} 
 
 /*  Check Validation for Link Icon*/
function checkLinkIcon(e){
    var regex = new RegExp("^[a-zA-Z0-9- ]");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
var code = (e.keyCode ? e.keyCode : e.which);
if (regex.test(str) || code==8) {
   return true;
}
$("#iconId").focus();
swal("Error", "Link Icon accept only alphabets,numbers and - ", "error");
	//alert("Please Enter a Valid Global Link Name.");
return false;
}
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







<%-- <%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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

/*Validation For Global link Click On Submit Button   */

 function checkValidate(){
    var globalLinkName=$("#globalLinkName").val();
	var sortNum=$("#intSortNum").val();
	
	
	if(globalLinkName == ""){
		  alert("Global Link Name should not be blank.");
		  $("#globalLinkName").focus();
		  return false;
	     }
	if(sortNum == ""){
		  alert("Serial Name should not be blank.");
		  $("#sortNum").focus();
		  return false;
		
	     }
	}

 /*To check Global Link name already exist or not*/

 function chkDuplicateGlobalLinkName(name)
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
                          alert("Global Link this name already exist.");
                          $("#txtGlobalLinkName").val(""); 
                          $("#txtGlobalLinkName").focus();  
                          return false;               
                           }
          }
     }; 
     xmlhttp.open("GET","chkGlobalLinkName?name="+name,true );
     xmlhttp.send(); 
        } 
 }
</script>
<script> 
/*   Check Validation for Global link */  
 
 
 function checkGlobalLivk(e){
    var regex = new RegExp("^[a-zA-Z ]");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
var code = (e.keyCode ? e.keyCode : e.which);
if (regex.test(str) || code==8) {
   return true;
}
	alert("Please Enter a Valid Global Link Name.");
return false;
}

 /*  Check Validation for Serial Number */
function checkSerialNo(e){
 var regex = new RegExp("^[0-9]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
		alert("Please Enter a Valid Serial Number.");
	 return false;
} 
    </script>  --%>
    
<%-- <div id="mainTable">

 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="addGlobalLink" >Add</a></li>
              <li><a href="viewGlobalLink" >View</a></li>
            </ul>
            <div class="tab-content">
             <div style="text-align: center;color: green;font-weight: bold;">${msg}</div>
             <div style="text-align: center;color: red;font-weight: bold;">${errMsg}</div>
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
                  
                  	<form:form class="col-sm-12 form-horizontal customform" action="registerGlobalLink" modelAttribute="globalVo" method="post" autocomplete="off">
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Global Link<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="globalLinkName" maxlength="50" id="globalLinkName" placeholder="Enter Global Link" onblur="chkDuplicateGlobalLinkName(this.value)" onkeypress="return checkGlobalLivk(event);"></form:input>
		                  </div>
		                  <label ></label><form:errors path="globalLinkName" cssClass="error"  element="div" />
		                  </div>
		                
		            <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Sl No<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                  <form:input type="text" class="form-control" path="intSortNum" value="${maxSlNumber}" maxlength="4" id="intSortNum" onkeypress="return checkSerialNo(event);"></form:input>
		                  </div>
		                  <label ></label><form:errors path="intSortNum" cssClass="error"  element="div" />
		                  </div>
		               
              <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Show on home page</label>
							<div class="col-sm-4">
		                 <div class="form-group col-xs-3">
                        <label>
                        <form:radiobutton  name="r2" path="bitHomePage"  value="0" class="flat-red" ></form:radiobutton>
                          </label>
                        <label>Yes </label>
                        </div>
                  <div class="form-group col-xs-3">
                 <label>
                  <form:radiobutton  name="r2" path="bitHomePage"  value="1" class="flat-red" ></form:radiobutton>
                </label>
                <label>
                  No
                </label>
                
              </div>
				</div>
		                <div class="form-group">
		                  <div class="col-sm-offset-2 col-sm-10">
		                	<button type="submit" class="btn btn-success" onclick="return checkValidate();">Submit</button>
		                	<button type="Reset" class="btn btn-danger">Reset</button>
		                  </div>
		                </div>
		              </div></form:form></div></section></div>
                  </div>
                  <hr>
				
              </div>
             
             

            </div>
          </div>
        </div> --%>
      