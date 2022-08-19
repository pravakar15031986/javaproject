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
  </script>
  <script>
  
  /*Validation For Primary link Click On Submit Button   */
  
   function checkValidate(){
	    event.preventDefault();
		var form = event.target.form;
	    var primaryLinkName=$("#primaryLinkName").val();
	    var slNo=$("#slNo").val();
	    if ($("#globalId").val() == 0)
	    {
	    	swal("Error", "Please select a Global Link", "error").then(function(){
	    		$("#globalId").focus();
	    	});
	    	return false;
	    	}   
		 if(primaryLinkName == ""){
			 swal("Error", "Please enter the Primary Link", "error").then(function(){
		    		$("#primaryLinkName").focus();
		    	});
		  return false;
		
	     } 
		 if(primaryLinkName.charAt(0)== ' ' || primaryLinkName.charAt(primaryLinkName.length -1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Primary Link ", "error").then(function() {
				   $("#primaryLinkName").focus();
			   });
	   return false;
		   }
		if(primaryLinkName!=null)
	 	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<primaryLinkName.length && i+1 < primaryLinkName.length;i++)
		   		{
		   			if ((primaryLinkName.charAt(i) == ' ') && (primaryLinkName.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Primary Should should not contain consecutive blank spaces", "error").then(function() {
						   $("#primaryLinkName").focus();
					   });
					return false;
				}
	 	}
		if(slNo == 0){
			swal("Error", "Please enter the Serial Number", "error").then(function() {
				$("#slNo").focus();
			});
			  return false;
		     }

		if (document.getElementById("functionId").value == 0)
		{
			swal("Error", "Please select a Function Name", "error").then(function() {
				$("#functionId").focus();
			});
			return false;
		}swal({
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
    </script>
    
    <script>

   /*  Check Validation for Primary link */
 
 function checkprimaryLinkName(e){
var regex = new RegExp("^[a-zA-Z ]");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
var code = (e.keyCode ? e.keyCode : e.which);
if (regex.test(str) || code==8) {
   return true;
}
$("#primaryLinkName").focus();
swal("Error", "Primary Link accept only alphabets", "error");
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
	 $("#slNo").focus();
	 swal("Error", "Please enter a valid Serial Number", "error");
	 return false;
} 

 /*################To check input primary link already exist or not#####################*/
 function chkDuplicatePrimaryLinkName(PLname)
 {
	 
 	if(PLname=='') {return false;}else{
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
                        	  swal("Error", "Primary Link already exist", "error");
                                      //alert("Primary Link  name already exist .");
                                      $("#primaryLinkName").val("");
                                      $("#primaryLinkName").focus();
                                      return false;
                                      }
                    
                          
                      }
                 }; }
                 xmlhttp.open("GET","chkPrimaryLinkName?PLname="+PLname,true );
                 xmlhttp.send();        
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

    <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Primary Link</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Link</li>
                           <li class="breadcrumb-item active" aria-current="page">Primary Link</li>
                        </ol>
                     </nav>
                  </div>
           
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active" href="addPrimaryLink">Add</a>
                              <a class="nav-item nav-link " href="viewPrimaryLink">View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        
                           
                           
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
						<form:form class="col-sm-12 form-horizontal customform" action="registerPrimarylink" modelAttribute="primarylinkVo" method="post" autocomplete="off">                       
						
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
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Global Link<span class="text-danger">*</span></label>
                                 
                                 <div class="col-12 col-md-6 col-xl-4">
                                  <form:select path="globalLinkId" id="globalId" class="form-control select2" autofocus="autofocus">
                                   <option value="0">Select Global Link</option>
     			          <form:options items="${globalList}" itemValue="globalLinkId" itemLabel="globalLinkName" />
                                    </form:select>
                              </div><label ></label><%-- <form:errors path="globalLinkId" cssClass="error"  element="div" /> --%>
                            </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Primary Link<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
							<form:input type="text" class="form-control" path="primaryLinkName" id="primaryLinkName" maxlength="50" placeholder="Enter Primary Key" onkeypress="return checkprimaryLinkName(event);"></form:input> 
                              </div><label ></label><%-- <form:errors path="primaryLinkName" cssClass="error"  element="div" /> --%>
                           </div>
							<div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Sl No<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                              <form:input readonly="true" class="form-control" path="slNo" value="${maxSlNumber}" id="slNo" maxlength="4" placeholder="Enter Serial No"  ></form:input> 
                              </div><label ></label><%-- <form:errors path="slNo" cssClass="error"  element="div" /> --%>
                           </div>
                           
                           <form:input type="hidden" path="bitLinkType" value="0"/>
                            
                             <%-- <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Link Type<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <div class="radio">
                                 <form:radiobutton  name="r1" path="bitLinkType"  value="0" id="demo-form-radio1" ></form:radiobutton>
                                    <label for="demo-form-radio1">Internal</label>
                                    <form:radiobutton  name="r1" path="bitLinkType"  value="1" id="demo-form-radio-2" ></form:radiobutton>
                                    <label for="demo-form-radio-2">External</label>
                                 </div>
                              </div>
                           </div> --%>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">Function Name<span class="text-danger">*</span></label>
                                 
                                 <div class="col-12 col-md-6 col-xl-4">
                                  <form:select path="functionId" id="functionId" class="form-control select2" style="width: 100%;" tabindex="1">
				          <option value="0">Select Function Name</option>
     			          <form:options items="${functionList}" itemValue="functionId" itemLabel="functionName" />
					      </form:select>
                              </div><label ></label><%-- <form:errors path="functionId" cssClass="error"  element="div" /> --%>
                            </div>
                            
                            <form:input type="hidden" path="bitShowOnHomePage" value="0"/>
                            
							<%-- <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Show on Homepage<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <div class="radio">
                                 <form:radiobutton id="demo-form-radio3" name="r2" value="0" path="bitShowOnHomePage"></form:radiobutton>
                                    <label for="demo-form-radio3">Yes</label>
                                    <form:radiobutton id="demo-form-radio-4" name="r2" value="1" path="bitShowOnHomePage"></form:radiobutton>
                                    <label for="demo-form-radio-4">No</label>
                                    
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
    
    
    
    
    
    
    
<%-- <div id="mainTable">

 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">

              <li class="active"><a href="addPrimaryLink">Add</a></li>
              <li><a href="viewPrimaryLink">View</a></li>
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
                		
                  	<form:form class="col-sm-12 form-horizontal customform" action="registerPrimarylink" modelAttribute="primarylinkVo" method="post" autocomplete="off">
		             <div class="form-group">
		                  <label  class="col-sm-2 control-label">Global Link</label>
		                  <div class="col-sm-4">
		                <form:select path="globalLinkId" id="globalId" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select Global Link</option>
     			          <form:options items="${globalList}" itemValue="globalLinkId" itemLabel="globalLinkName" />
					      </form:select> 
	                  </div>
		                  <label ></label><form:errors path="globalLinkId" cssClass="error"  element="div" />
		                  </div>
		                <div class="form-group">
		                  <label  class="col-sm-2 control-label">Primary Link<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="primaryLinkName" id="primaryLinkName" maxlength="20" placeholder="Enter Primary Key" onblur="chkDuplicatePrimaryLinkName(this.value)" onkeypress="return checkprimaryLinkName(event);"></form:input>
		                  </div>
		                  <label ></label><form:errors path="primaryLinkName" cssClass="error"  element="div" />
		                  </div>
		                <div class="form-group">
		                 <label  class="col-sm-2 control-label">Sl No</label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="slNo" value="${maxSlNumber}" id="slNo" maxlength="4" placeholder="Enter Serial No" onkeypress="return checkSerialNo(event);" ></form:input>
		                  </div>
		                  <label ></label><form:errors path="slNo" cssClass="error"  element="div" />
		                </div>
		               
		            
		                <div class="form-group">
		                  <label  class="col-sm-2 control-label">Link Type</label>
		                 <div class="col-sm-4">
						 <div class="form-group m-b-0 col-xs-4">
                        <label>
                         <form:radiobutton  name="r1" path="bitLinkType"  value="0" class="flat-red" ></form:radiobutton>
                          </label>
                        <label>
                     Internal
                     </label>
                  </div>
                  
                    <div class="form-group m-b-0 col-xs-4">
                 <label>
                  <form:radiobutton  name="r1" path="bitLinkType" value="1" class="flat-red" ></form:radiobutton>
                </label>
                <label>
                  External
                </label>
                
              </div>
			  </div>
              </div>
                   <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Function Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                 <form:select path="functionId" id="functionId" class="form-control select2" style="width: 100%;" tabindex="1">
				          <option value="0">Select Function Name</option>
     			          <form:options items="${functionList}" itemValue="functionId" itemLabel="functionName" />
					      </form:select> 
		                  </div>
		                  <label ></label><form:errors path="functionId" cssClass="error"  element="div" />
		                  </div>
		           
		         
		            
             
             
              <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Show on home page</label>
		<div class="col-xs-4">
		                 <div class="form-group m-b-0 col-xs-4">
                        <label>
                         <form:radiobutton  name="r2" path="bitShowOnHomePage" value="0" class="flat-red"></form:radiobutton>
                          </label>
                        <label>Yes </label>
                        </div>
                  <div class="form-group m-b-0 col-xs-4">
                 <label>
                  <form:radiobutton  name="r2" path="bitShowOnHomePage" value="1" class="flat-red" ></form:radiobutton>
                </label>
                <label>
                  No
                </label>
                
              </div></div>

		                </div>
						<div class="form-group">
		                  <div class="col-sm-offset-2 col-sm-10">
		                	<button type="submit" class="btn btn btn-success" onclick="return checkValidate();">Submit</button>
		                	<button type="submit" class="btn btn btn-danger">Reset</button>
		                  </div>
		                </div>
		              </form:form></div>
                  </section></div>
                  
              </div>
             </div>
             

            </div>
          </div>
        </div> --%>