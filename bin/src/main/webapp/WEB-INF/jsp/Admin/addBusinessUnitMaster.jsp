<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.datepicker-dropdown{z-index: 9999!important}
</style>


<script language="javascript">
	pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";

</script>
<script>
function checkValidate(){
	var companyName=$("#companyName").val();
	var businessName=$("#businessName").val(); 
	var code=$("#code").val(); 
	if(companyName == 0){
		  swal("Company Choose Company Name.");
		  $("#companyName").focus();
		  return false;
		
	     }
	
	if(businessName == ""){
	  swal("Business Name should not be blank.");
	  $("#businessName").focus();
	  return false;
	
     }
	if(code == ""){
		  swal("Code should not be blank.");
		  $("#code").focus();
		  return false;
		
	     }else{
         swal("Data Submited Successfully");
		     }
	
	}   

function checkBusinessName(e){
    var regex = new RegExp("^[a-zA-Z\\s ]");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
var code = (e.keyCode ? e.keyCode : e.which);
if (regex.test(str) || code==8) {
   return true;
}
	swal("Please Enter a Valid Business Name.");
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
</script>
    
<div id="mainTable">
 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="addBusinessUnitMaster" >Add</a></li>
              <li><a href="viewBusinessUnitMaster" >View</a></li>
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
						
					<div class="col-sm-12 form-horizontal customform" >
		             
		                <div class="form-group">
		                  <label class="col-sm-2 control-label">Company Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-3" >
		                    <select class="form-control select2" id="companyName">
		                       <option value="0">-Select-</option>
									<option>Venus Tea Ltd</option> 
		                          	<option>Mitchell Cotts Freight (K) Ltd</option>
		                            <option>RISALA LIMITED </option>
									<option>AFRO TEAS LIMITED</option>
		                      </select>
		                   </div>
		              </div>
		              <div class="form-group">
		                 <label class="col-sm-2 control-label">Business Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-3">
		                    <input type="text" id="businessName" class="form-control" placeholder="Enter Business Name" onkeypress="return checkBusinessName(event);"></input>
		                  </div>
		                  <label ></label><div></div>
		           </div>	
		           
		       <div class="form-group">
		                 <label class="col-sm-2 control-label">Business Code<span class="mandatory">*</span></label>
		                  <div class="col-sm-3">
		                    <input type="text" id="code" class="form-control" placeholder="Enter Business Code"></input>
		                  </div>
		                  <label ></label><div></div>
		           </div>
		            
		            <div class="form-group">
		                  <label for="exampleInputFile" class="col-sm-2 control-label">Description</label>
		                  <div class="col-sm-3">
		                 <textarea rows="4" cols="50" class="form-control"  name="description"  id="txtDesc"  maxlength="500" placeholder="Enter Description..." onkeypress="return checkDescription(event);"></textarea>&nbsp; Maximum <span id="lblChar"></span> &nbsp;characters 
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
		                  <div class="col-sm-10">
		                  <button type="submit" class="btn btn-info"   onclick="return checkValidate();">Submit</button> <button type="reset" class="btn btn-danger">Reset</button>
		                	</div>
		                </div>
              </div></div></section></div>
                  </div>
                  <hr>
              </div>
            </div>
          </div>
        </div>
 <script>
 $(document).ready(function(){
	 
	
	 $(".datecontrol").datepicker({ format: 'dd-M-yyyy' ,autoclose: true});	 
 })

    </script>