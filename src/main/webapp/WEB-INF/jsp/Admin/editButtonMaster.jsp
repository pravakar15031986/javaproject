<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>

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


	 
/* For Dynamic TextArea */
  
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
		
		var buttonName=$("#buttonName").val();
		var sortNum=$('#sortNum').val();
		var fileName=$('#fileName').val();
		var txtDesc =$("#txtDesc").val();

		if (document.getElementById("funId").value == 0){alert("Please Select Function Name.");return false;} 

		
		if(buttonName == ""){
		  alert("Button Name should not be blank.");
		  $("#buttonName").focus();
		  return false;
		
	     }
	
		if(sortNum == 0 ){
			  alert("Serial Number should not be blank.");
			  $("#sortNum").focus();
			  return false;
		     }
	     
		if(fileName == ""){
			  alert("File Name should not be blank.");
			  $("#fileName").focus();
			  return false;
		     }

		/* if(!$('input[type="checkbox"]').prop('checked')){
			alert("Chose Atleast one Available Tab");
            return false;
		} */

		if($('#action1').is(':checked')==false && $('#action2').is(':checked')==false && $('#action3').is(':checked')==false)
		{
			alert('Chose Atleast one Available Tab.');
			$('#action1').focus();
			return false;
		} 
        
		}
 
/*  Check Validation for Button Name */
    

	 function checkButtonName(e){
	     var regex = new RegExp("^[a-zA-Z\\s]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
		alert("Please Enter a Valid Button Name.");
	 return false;
	} 

	/*  Check Validation for Button Name */
	
	 function checkSerial(e){
	 var regex = new RegExp("^[0-9]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
		alert("Please Enter a Valid Serial Number.");
	 return false;
	} 

	/*  Check Validation for File Name */
	
	 function checkFileName(e){
	     var regex = new RegExp("^[a-zA-Z\\s]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
		alert("Please Enter a Valid Button Name.");
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
		alert("Please Enter a Valid Description.");
	 return false;
	} 
	 /*#############TO check if button Master Edit page name is exist or not#########################*/

	 function chkDuplicateEditButtonName(but_name,path)
	 {     //alert(but_name);
	       //alert(path);
	       if(but_name=='') {return false;}
	       else if(but_name==path){return false;}else{
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
	                          alert("Button name in this function is already exist.");
	                          $("#buttonName").val("");
	                          $("#buttonName").focus(); 
	                          }
	          }
	     }; }
	     xmlhttp.open("GET","chkButtonName?but_name="+but_name,true );
	     xmlhttp.send(); 
	 }


	 /*#############TO check if button Master File name  in Edit Button Master data exist or not#########################*/

	 function chkDuplicateButtonMasterFileName(file_name,path)
	 {
		 //alert(file_name);
		 //alert(path);
	       if(file_name=='') {return false;}
	       else if(file_name==path){return false;}else{
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
	                          alert("File name in this function is already exist.");
	                          $("#url").val("");
	                          $("#url").focus(); 
	                          }
	          }
	     }; }
	     xmlhttp.open("GET","chkButtonMasterFileName?file_name="+file_name,true );
	     xmlhttp.send(); 
	 }

    </script>
    
    
<div id="mainTable">

 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#" >Edit</a></li>
              <li><a href="viewButtonMaster" >View</a></li>
            </ul>
            <div class="tab-content">
             
              <div class="tab-pane active" id="fa-icons">
                <section id="new">
                   <%-- <div class="row">
					<div class="col-md-12">
						<div class="alert alert-custom fade in alert-dismissible" style="margin-top:18px;">
						    <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						     <div style="text-align: center;color: green;font-weight: bold;"><strong>${msg}</strong> </div>
    			            <div style="text-align: center;color: red;font-weight: bold;"><strong>${errMsg}</strong></div>
						</div>
					</div>
   				  </div> --%>
                  
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
                  
                  	<form:form class="col-sm-12 form-horizontal customform" action="updateButtonMaster" modelAttribute="buttonVo" method="post">
		             
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

		             <form:hidden path="buttonId"/>
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Function Name</label>
		                  <div class="col-sm-4">
		                <form:select path="functionId" id="funId" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select Function Name</option>
     			          <form:options items="${FunctionList}" itemValue="functionId" itemLabel="functionName" />
					      </form:select> 
	                  </div>
		                  <label ></label><form:errors path="functionId" cssClass="error"  element="div" />
		                  </div>
		               
		                <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Button Name<span class="mandatory">*</span></label>
		
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="buttonName" maxlength="20" id="buttonName" placeholder="Enter Tab Name" onblur="chkDuplicateEditButtonName(this.value,'${buttonVo.buttonName}')" onkeypress="return checkButtonName(event);"></form:input>
		                  </div>
		                  <label ></label><form:errors path="buttonName" cssClass="error"  element="div" />
		                  </div>
		                <div class="form-group">
		                 <label for="inputEmail3" class="col-sm-2 control-label">Sl No</label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="sortNum" maxlength="4" id="sortNum" onkeypress="return checkSerial(event);"></form:input>
		                  </div>
		                  <label ></label><form:errors path="sortNum" cssClass="error"  element="div" />
		                </div>
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">File Name<span class="mandatory">*</span></label>
		
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="fileName" id="fileName" maxlength="20" placeholder="Enter File Name" onblur="chkDuplicateButtonMasterFileName(this.value,'${buttonMasterVo.url}')" onkeypress="return checkFileName(event);"></form:input>
		                  </div>
		                  <label ></label><form:errors path="fileName" cssClass="error"  element="div" />
		                  </div>
		                
		               <div class="row">
		            <div class="col-md-12">
		            
		                <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Button Available For<span class="mandatory">*</span></label>
		
		            <div class="form-group col-xs-2">
                      <label>
                        <form:checkbox path="addData" value="1" class="flat-red" id="action1"></form:checkbox>
                      </label>
                      <label> Add </label>
                   </div>

              
                  <div class="form-group col-xs-2">
                    <label>
                      <form:checkbox path="viewData" value="1" class="flat-red" id="action2"></form:checkbox>
                    </label>
                    <label> View  </label>
                 </div>

              
              <div class="form-group col-xs-2">
                <label>
                  <form:checkbox  path="manageData" value="1" class="flat-red" id="action3"></form:checkbox>
                </label>
                <label>  Manage </label>&nbsp&nbsp
              </div>
            </div>
		       <div class="col-md-6">
		 </div>
		 </div>
		 <div class="form-group">
		    <label for="exampleInputFile" class="col-sm-2 control-label">Description</label>
		     <div class="col-sm-4">
		      <form:textarea class="form-control" rows="3" name="description" path="description" id="txtDesc" onkeypress="return checkDescription(event);" onkeyup="return TextCounter('txtDesc','lblChar',100)" maxlength="100" placeholder="Enter Description..."></form:textarea>&nbsp; Maximum <span id="lblChar" style="color:red"></span> &nbsp;characters 
		     </div>
		    <label ></label><div></div>
		  </div>
		  
		  <div class="form-group">
		                  <div class="col-sm-offset-2 col-sm-10">
		                	<button type="submit" class="btn btn-success" onclick="return checkValidate();">Submit</button>
		                	<button type="reset" class="btn btn-danger" >Reset</button>
		                  </div>
		                </div>
		 
      </div>
      </form:form></div>
     </section></div>
                  <hr>
				
              </div>
             
             

            </div>
          </div>
        </div>
      </div>