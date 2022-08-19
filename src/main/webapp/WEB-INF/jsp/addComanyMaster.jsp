<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script language="javascript">
	pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";

</script>


<script> 
 function checkValidate(){
   var companyName=$("#companyName").val();
   var code=$("#code").val();
   if(companyName==""){
	   swal("Company Name should not be blank.");
		  $("#documentName").focus();
		  return false;
	   }

   if(code==""){
	   swal("Code should not be blank.");
		  $("#documentName").focus();
		  return false;
	   }
   else{
		
		 swal("Data Submitted Successfully.", "", "success")
	}
	}
 function checkCompanyName(e){
 var regex = new RegExp("^[a-zA-Z\\s ]");
 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 var code = (e.keyCode ? e.keyCode : e.which);
 if (regex.test(str) || code==8) {
    return true;
}
	swal("Please Enter a Valid Company Name.");
 return false;
}

 function checkDescription(e){
	 var regex = new RegExp("^[a-zA-Z\\s ]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
		swal("Please Enter a Valid Description.");
	 return false;
	}
	
 /* For Dynamic TextArea */
 
 $(document).ready(function(){
		defaultfocus("txtFunName");
		txtBoxEffect();
		TextCounter('txtDesc','lblChar',200);
		setupLabel();
		$('.label_check').click(function(){
			setupLabel();
		});
  
	});
 </script>
    
<div id="mainTable">

 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="addComanyMaster" >Add</a></li>
              <li><a href="viewComanyMaster">View</a></li>
            </ul>
            <div class="tab-content">
             
              <div class="tab-pane active" id="fa-icons">
                <section id="new">
                   
                  <div class="row">
                  
                  	<div class="col-sm-12 form-horizontal customform" >
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Company Name<span class="mandatory">*</span></label>
		                <div class="col-sm-3">
		                    <input type="text" class="form-control"  maxlength="50" id="companyName" placeholder="Enter Company Name" onkeypress="return checkCompanyName(event);"></input>
		                  </div><span class="mandatory">*</span>
		                  <label ></label>
		                  </div>
		                
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Company Code<span class="mandatory">*</span></label>
		                <div class="col-sm-3">
		                    <input type="text" class="form-control"  maxlength="4" id="code" placeholder="Enter Code"></input>
		                  </div>
		                  <label ></label>
		                  </div>
		                    
		              <div class="form-group">
		                  <label for="exampleInputFile" class="col-sm-2 control-label">Description</label>
		                  <div class="col-sm-3">
		                 <textarea rows="4" cols="50" class="form-control"  name="description"  id="txtDesc"  maxlength="200" onkeyup="return TextCounter('txtDesc','lblChar',200)" placeholder="Enter Description..." onkeypress="return checkDescription(event);"></textarea>&nbsp; Maximum <span id="lblChar"></span> &nbsp;characters 
		                  </div>
		                  <label ></label><div></div>
		               </div>
		                  
		                  <div class="form-group">
			              <label class="col-sm-2 control-label">Status</label>
			              
			              	<div class="col-sm-1">
			              		<label class="myradio">Active
								  <input id="complist" type="radio" value="1" name="radio1" >
								  <span class="checkmark1"></span>
								</label>
			              	
			              	</div>
			              	
			              	<div class="col-sm-1">
			              		<label class="myradio">Inactive
								  <input id="complist" type="radio" value="1" name="radio1" >
								  <span class="checkmark1"></span>
								</label>
			              	
			              	</div>
			              </div>
		            <div class="form-group">
		                  <div class="col-sm-offset-2 col-sm-10">
		                   <button type="submit" class="btn btn-default">Reset</button>
		                	<button type="submit" class="btn btn-info" onclick="return checkValidate();">Submit</button>
		                  </div>
		                </div>
		               
            </div></div></section></div>
                  </div>
                  <hr>
				
              </div>
             
             

            </div>
          </div>
        </div>
      