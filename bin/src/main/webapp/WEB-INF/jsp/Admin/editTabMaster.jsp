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

  $(document).ready(function(){
		defaultfocus("txtFunName");
		txtBoxEffect();
		TextCounter('txtDesc','lblChar',500);
		setupLabel();
		$('.label_check').click(function(){
			setupLabel();
		});
 
	});
  </script>
  
  <script type="text/javascript">
  $(document).ready(function() {
   $('#funId').change(function() { //Spring Ajax call for Button master
		 var ButtonMaster=$(this).val();
		 var dataString = 'funId='+ ButtonMaster;
		 //alert(dataString);
		 $.ajax({
		 	type: "POST",
            url : 'getButtonId',
            data: dataString,
			cache: false,
            success : function(data) {  	             
                var html = '<option value="0">--Select--</option>';
				var len = data.length;
				//alert("len="+len);
				for ( var i = 0; i < len; i++) {
				
					html += '<option value="' + data[i].buttonId + '">'
							+ data[i].buttonName + '</option>';
				}
				html += '</option>';
           	    $('#buttonId').html(html);   
            },
			  error : function(e) {
				console.log("ERROR: ", e);
			},
			done : function(e) {
				console.log("DONE");
			}
        });
   });
   	 });   
	 
    </script>
    <script type="text/javascript">
/*Validation For Tab Master Click On Submit Button   */
	
	 function checkValidate(){
		
		var tabName=$('#tabName').val();
		var fileName=$('#fileName').val();
		var txtDesc =$("#txtDesc").val();
		var sortNum=$("#sortNum").val();

		if (document.getElementById("funId").value == 0){alert("Please Select Function Name.");return false;} 
	    if (document.getElementById("buttonId").value == 0){alert("Please Select Button Name.");return false;} 

		
		if(tabName == ""){
		  alert("Tab Name should not be blank.");
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

 
		if($('#action1').is(':checked')==false && $('#action2').is(':checked')==false && $('#action3').is(':checked')==false)
		{
			alert('Chose Atleast one Available Tab.');
			$('#action1').focus();
			return false;
		} 
		
		}
		</script>
	 <script type="text/javascript">
/*  Check Validation for Tab Name */
	
	 function checkTabName(e){
	 var regex = new RegExp("^[a-zA-Z\\s]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
		alert("Please Enter a Valid Tab Name.");
	 return false;
	}

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

	function checkFileName(e){
		 var regex = new RegExp("^[a-zA-Z\\s]");
		 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		 var code = (e.keyCode ? e.keyCode : e.which);
		 if (regex.test(str) || code==8) {
		    return true;
		}
			alert("Please Enter a Valid Serial Number.");
		 return false;
		}

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

	</script>
    <script type="text/javascript">
	/*###########to check tab name already exist or not In edit page##########*/
	function chkUpdTabName(tab_name,path)
	{ 
		//alert(tab_name);
		 if(tab_name=='') {return false;}
	      else if(tab_name==path){return false;}else{
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
	                         alert("Tab name in this Button is already exist.");
	                         $("#tabName").val("");
	                         $("#tabName").focus(); 
	                         }
	         }
	    }; }
	      xmlhttp.open("GET","chkTabMasterName?tab_name="+tab_name,true );
	      xmlhttp.send(); 
	      
	}

	/*###########to check tab file name in edit page already exist or not##########*/

	function chkUpdFileName(tab_file_name,path)
	{ 
	      if(tab_file_name=='') {return false;}
	      else if(tab_file_name==path){return false;}else{
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
	                         alert("Tab File name in this Name is already exist.");
	                         $("#url").val("");
	                         $("#url").focus(); 
	                         }
	         }
	    }; }
	      xmlhttp.open("GET","chkTabFileName?tab_file_name="+tab_file_name,true );
	      xmlhttp.send(); 
	}

    </script>
    
<div id="mainTable">

 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="editTabMaster" >Edit</a></li>
              <li><a href="viewTabMaster" >View</a></li>
            </ul>
            <div class="tab-content">
             
              <div class="tab-pane active" id="fa-icons">
                <section id="new">
                  <%--  <div class="row">
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
                  
                  	<form:form class="col-sm-12 form-horizontal customform" action="updateTabMaster" modelAttribute="tabMasterVo" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                  	
		             <form:hidden path="tabId"/>
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Function Name</label>
		                  <div class="col-sm-4">
		                <form:select path="functionId" id="funId" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select Function Name</option>
     			          <form:options items="${functionList}" itemValue="functionId" itemLabel="functionName" />
					      </form:select> 
	                  </div>
		                  <label ></label><form:errors path="functionId" cssClass="error"  element="div" />
		                  </div>
		                  
		                  <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Button Name</label>
		                  <div class="col-sm-4">
		                 <form:select path="buttonId" id="buttonId"  name="buttonName" class="form-control select2" style="width: 100%;" >
				         <option value="0">--Select Button Name--</option>
     			        <form:options items="${buttonList}" itemValue="buttonId" itemLabel="buttonName" />
					    </form:select>  
	                  </div>
		                  <label ></label><form:errors path="buttonId" cssClass="error"  element="div" />
		                  </div>
		                 
		                <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Tab Name<span class="mandatory">*</span></label>
		
		                  <div class="col-sm-4">                                                                                                   
		                    <form:input type="text" class="form-control" path="tabName" id="tabName" maxlength="20" placeholder="Enter Tab Name" onblur="chkUpdTabName(this.value,'${tabMasterVo.tabName}')"  onkeypress="return checkTabName(event);"></form:input>
		                  </div>
		                  <label ></label><form:errors path="tabName" cssClass="error"  element="div" />
		                  </div>
		                <div class="form-group">
		                 <label for="inputEmail3" class="col-sm-2 control-label">Sl No</label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="intSortNum" id="sortNum" ></form:input>
		                  </div>
		                  <label ></label><form:errors path="intSortNum" cssClass="error"  element="div" />
		                </div>
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">File Name<span class="mandatory">*</span></label>
		
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="fileName" id="fileName" placeholder="Enter File Name" onblur="chkUpdFileName(this.value,'${tabMasterVo.fileName}')" onkeypress="return checkFileName(event);"></form:input>
		                  </div>
		                  <label ></label><form:errors path="fileName" cssClass="error"  element="div" />
		                  </div>
		                
		               <div class="row">
		            <div class="col-md-12">
		            
		                <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Tab Available For<span class="mandatory">*</span></label>
		
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
                <label>  Manage </label>
              </div>
            </div>
		       <div class="col-md-6">
		 </div>
		 </div>
		 <div class="form-group">
		    <label for="exampleInputFile" class="col-sm-2 control-label">Description</label>
		     <div class="col-sm-4">
		      <form:textarea class="form-control" rows="3" name="description" path="description" id="txtDesc" onkeypress="return checkDescription(event);" onkeyup="return TextCounter('txtDesc','lblChar',500)" maxlength="500" placeholder="Enter Description..."></form:textarea>&nbsp; Maximum <span id="lblChar"></span> &nbsp;characters 
		     </div>
		    <label ></label><div></div>
		  </div>
		  
		  <div class="form-group">
		                  <div class="col-sm-offset-2 col-sm-10">
		                	<button type="submit" class="btn btn-success" onclick="return checkValidate();">Submit</button>
		                	<button type="reset" class="btn btn-danger">Reset</button>
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