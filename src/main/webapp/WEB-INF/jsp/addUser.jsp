 <%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.datepicker-dropdown{z-index: 9999!important}

.mandatory1 {
    position: absolute;
    top: 0px;
    left:6px;  
    color: red;
    font-weight: bold;
    font-size: 1.2em;
}
.pt20{padding-top: 20px;}
</style>
<script>
$(function() {		
	$('#assoType').hide();
	$( "#memberType" ).change(function() {
		var id =  $('#memberType').val();
		if(id == 1){
			$('#assoType').show();
		}
		if(id == 2){
			$('#assoType').hide();
		}
		if(id == 3){
			$('#assoType').hide();
		}
		if(id == 4){
			$('#assoType').hide();
		}
		if(id == 5){
			$('#assoType').hide();
		}
		if(id == 6){
			$('#assoType').hide();
		}
		if(id == 7){
			$('#assoType').hide();
		}
	});
});
</script>


<div id="mainTable">
 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#fa-icons" >Add</a></li>
              <li><a href="viewUser" >View</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="fa-icons">
                <section id="new">
                  
              
                  	<div class="col-md-12">
                  		<c:if test="${not empty errMsg}">
                  			<div class=" -custom-danger fade in -dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="" aria-label="close" title="close">x</a>
						    	<strong>Error!</strong>${errMsg}
							</div>
                  		</c:if>
                		<c:if test="${not empty msg}">
                			<div class=" -custom-success fade in -dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="" aria-label="close" title="close">x</a>
						    	<strong>Success!</strong>${msg}
							</div>
                		</c:if>
                	</div>
                	
                	
					       
							
		              <div class="content-body">
							<form class="form-horizontal" >
		           
		                     	  <div class="form-group">
									<label class="control-label col-sm-2">Country<span class="mandatory">*</span></label>
									<div class="col-sm-4">
										<span class="colon">:</span>
										<select name="" class="form-control" id="mselect1">
											             <option>01-Burundi</option> 
					                          	<option value="1">02-DR Congo</option>
					                            <option value="2">03-Ethiopia </option>
												<option value="3">04-Kenya</option>
												<option value="4">05-Madagascar</option>
												<option value="5">06-Malawi </option>
												<option value="6">07-Mozambique</option>
												<option value="7">08-Rwanda</option>
												<option value="8">09-Tanzania</option>
												<option value="9">10-Uganda</option>
										  </select>
									</div>
									<label class="control-label col-sm-2">County/City/State Provinance<span class="mandatory">*</span></label>
									<div class="col-sm-4"> 
										<span class="colon">:</span>
										<select class="form-control" id="mselect2" disabled>
											
											<option value="1" selected>01-Al Fashir</option>
											<option value="1">02-Al Qadarif</option>
											<option value="1">03-Babanusa</option>
											<option value="1">04-Dongola</option>
											<option value="1">05-Omdurman</option>
											
											<option value="2" selected>01-Beau Bassin</option>
											<option value="2">02-Goodlands</option>
											<option value="2">03-Port Louis</option>
											<option value="2">04-Saint Pierre</option>
											<option value="2">05-Triolet</option>
											
											<option value="3" selected>01-Entebbe</option>
											<option value="3">02-Lira</option>
											<option value="3">03-Mbarara</option>
											<option value="3">04-Mubende</option>
											<option value="3">05-Nansana</option>
											
											
											<option value="4" selected>01-Baragoi</option>
											<option value="4">02-Garissa</option>
											<option value="4">03-Makindu</option>
											<option value="4">04-Langata</option>
											<option value="4">05-Mombasa</option>
											
											<option value="5" selected>01-Arusha</option>
											<option value="5">02-Bukoba</option>
											<option value="5">03-Dodoma</option>
											<option value="5">04-Mahinga</option>
											<option value="5">05-Songea</option>
											
											
											<option value="6" selected>01-Chingola</option>
											<option value="6">02-Chipata</option>
											<option value="6">03-Kasama</option>
											<option value="6">04-Lusaka</option>
											<option value="6">05-Mufulira</option>
											
											<option value="7" selected>--Select County/City/State</option>
											<option value="7">01-Chegutu</option>
											<option value="7">02-Chitungwiza</option>
											<option value="7">03-Harare</option>
											<option value="7">04-Kadoma</option>
											<option value="7">05-Marondera</option>
											
											<option value="8" selected>01-Chegutu</option>
											<option value="8">02-Chitungwiza</option>
											<option value="8">03-Harare</option>
											<option value="8">04-Kadoma</option>
											<option value="8">05-Marondera</option>
											
											<option value="9" selected>01-Chegutu</option>
											<option value="9">02-Chitungwiza</option>
											<option value="9">03-Harare</option>
											<option value="9">04-Kadoma</option>
											<option value="9">05-Marondera</option>
									
										  </select>
									</div>
							   </div>
							   
							   <div class="form-group">
							   
							   <label class="control-label col-sm-2" for="email">Member Type<span class="mandatory">*</span></label>
								<div class="col-sm-4">
									<span class="colon">:</span>
								  <select class="form-control" id="memberType">
								   <option  value="0">--Select--</option>
		                            <option value="1">01-Associates</option>
									<option value="2">02-Broker</option>
									<option value="3" selected>03-Buyer</option>
									<option value="4">04-Packer</option>
									<option value="5">05-Producer</option>
									<option value="6">06-Transporter</option>
									<option value="7">07-Warehouse</option>
		                      </select>
		                   </div>
							   
			            <div  id="assoType">
								<label class="control-label col-sm-2" for="email">Associates Type<span class="mandatory">*</span></label>
								<div class="col-sm-4">
									<span class="colon">:</span>
								  <select class="form-control">
									<option > Banks </option>
									<option>Suppliers and service</option>
									<option >Regulators and Research Institutions </option>
									<option>Others </option>
									   
								  </select>
								</div>
								</div>
							  </div>
							 
			            <div class="form-group">
		                <label class="control-label col-sm-2">Business Code <span class="mandatory">*</span></label>
									<div class="col-sm-4"> 
										<span class="colon">:</span>
										<input type="text" class="form-control" id="businessCode" onkeypress="return checkBusinessCode(event);" >
									</div>
							   </div>
							    <div class="form-group">
								<label class="control-label col-sm-2">Company Name <span class="mandatory">*</span></label>
									<div class="col-sm-4"> 
										<span class="colon">:</span>
										<input type="text" class="form-control" id="companyName" onkeypress="return checkCompanyName(event);">
									</div>
							   <div>
								  <label class="col-sm-2 control-label">Entry Date</label>
							<span class="colon">:</span>
			               <div class="col-sm-4">
			             <div class="input-group date" data-provide="datepicker" >
						    <input type="text" class="form-control">
						    <div class="input-group-addon">
       					 <span class="glyphicon glyphicon-th"></span>
    					</div>
					</div>
			              </div>
			              </div></div>
		                
		                     <div class="form-group">
		                    <label class="control-label col-sm-2">Address <span class="mandatory">*</span></label>
								<div class="col-sm-4">
									<span class="colon">:</span>
									<input type="text" class="form-control" id="address" onkeypress="return checkAddess(event);">
								</div>		
								<label class="control-label col-sm-2">Building</label>
								<div class="col-sm-4"> 
									<span class="colon">:</span>
									<input type="text" class="form-control" onkeypress="return checkBuilding(event);">
								</div>		
							  </div>
							  <div class="form-group">
									<label class="control-label col-sm-2">Street</label>
								<div class="col-sm-4">
									<span class="colon">:</span>
									<input type="text" class="form-control" onkeypress="return checkStreet(event);">
								</div>	
								<label class="control-label col-sm-2">Town</label>
								<div class="col-sm-4"> 
									<span class="colon">:</span>
									<input type="text" class="form-control" onkeypress="return checkTown(event);">
								</div>
							  </div>
							   <div class="form-group">
								
									
								<label class="control-label col-sm-2">Pin Code <span class="mandatory">*</span></label>
								<div class="col-sm-4">
									<span class="colon">:</span>
									<input type="text" class="form-control" id="pincode" maxlength="5"  onkeypress="return checkPinCode(event);">
								</div>	
								<label class="control-label col-sm-2">Telephone No.</label>
								<div class="col-sm-4">
									<span class="colon">:</span>
									<input type="text" class="form-control" maxlength="11" onkeypress="return checkTelPhNo(event);">
								</div>		
							  </div>							  
							  <div class="form-group">
								
								<label class="control-label col-sm-2">Mobile No <span class="mandatory">*</span></label>
								<div class="col-sm-4">
									<span class="colon">:</span>
									<input type="text" class="form-control" id="mobileNo" maxlength="10" onkeypress="return checkMobileNo(event);">
								</div>
								<label class="control-label col-sm-2">Fax No.</label>
								<div class="col-sm-4"> 
									<span class="colon">:</span>
									<input type="text" class="form-control" maxlength="12" onkeypress="return checkFaxNo(event);">
								</div>
																
							  </div>
							  <div class="form-group">
								<label class="control-label col-sm-2">Email Id <span class="mandatory">*</span></label>
								<div class="col-sm-4"> 
									<span class="colon">:</span>
									<input type="email" class="form-control" id="email" onkeypress="return checkemail(event);">
								</div>
								<label class="control-label col-sm-2">Website</label>
								<div class="col-sm-4"> 
									<span class="colon">:</span>
									<input type="text" class="form-control" onkeypress="return checkWebSite(event);">
								</div>
							  </div>
							  
							  <div class="form-group">
								<label class="control-label col-sm-2">Contact Person Name <span class="mandatory">*</span></label>
								<div class="col-sm-4"> 
									<span class="colon">:</span>
									<input type="email" class="form-control" id="contPersonName" onkeypress="return checkContPersonName(event);">
								</div>
							
								<label class="control-label col-sm-2">Contact Person Email <span class="mandatory">*</span></label>
								<div class="col-sm-4"> 
									<span class="colon">:</span>
									<input type="email" class="form-control" id="contPersonEmail" onkeypress="return checkContPersonEmail(event);">
								</div></div>
								<div class="form-group">
								<label class="control-label col-sm-2">Contact Person Mobile No <span class="mandatory">*</span></label>
								<div class="col-sm-4"> 
									<span class="colon">:</span>
									<input type="email" class="form-control" id="contMobileNo" maxlength="10" onkeypress="return checkContPersonMobile(event);">
								</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<label class="mycheck">Are there any pending dues
										  <input id="complist" type="checkbox" value="1" class="flat-red">
										  <span class="checkmark"></span>
										</label>
									</div>
									
								  </div>
								
								</form>
							  </div>
							  
                        <div class="form-horizontal">
                        <div class="othercomp">
                       <div class="form-group">
								<label class="control-label col-sm-2">Enter Amount<span class="mandatory">*</span></label>
								<div class="col-sm-4"> 
									<span class="colon">:</span>
									<input type="text"  class="form-control control1" onkeypress="return checkAmount(event);">
								</div>
								 <label class="col-sm-2 control-label">Due Date<span class="mandatory">*</span></label>
								  <span class="colon">:</span>
			               <div class="col-sm-4">
			             <div class="input-group date" data-provide="datepicker">
						    <input type="text" class="form-control">
						    <div class="input-group-addon">
						     <span class="glyphicon glyphicon-th"></span>
						    </div>
						</div>
			                </div>
			                </div>
								</div>
								
 				  			 <div class="form-group">
							
											  
							  <a href="#"  class="btn btn-success" data-toggle="modal" data-target="#apprefno">Submit</a>
								  <button type="reset" class="btn btn-danger">Reset</button>
							
						
						</div>
							 
						</div>
		                </div>
              </div>
                  </div>
                  <hr>
              </div>
            </div>
          </div>
          <!-- Modal -->		
		<div class="modal fade" id="apprefno">
		  <div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
				<h1 class="h1style1" style="text-align: center;"><i class="fa fa-check"></i>&nbsp;&nbsp;User Created Successfully.</h1>
			</div>
			  <div class="modal-body">
					
				<div class="infopanel">
					<p>Membership Code<strong>040100011</strong></p>
					 <p>credentials are send to registered email/mobile. </p>
				</div>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
				
			  </div>
			</div>
			<!-- /.modal-content -->
		  </div>
		  <!-- /.modal-dialog -->
		</div>
		  <script language="javascript">
	pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";

</script>
<script type="text/javascript">
$(document).ready(function(){
 
$("#select1").change(function() {
	$("#select2").attr('disabled',false);
  if ($(this).data('options') === undefined) {
    /*Taking an array of all options-2 and kind of embedding it on the select1*/
    $(this).data('options', $('#select2 option').clone());
  }
  var id = $(this).val();
  var options = $(this).data('options').filter('[value=' + id + ']');
  $('#select2').html(options);
});
});
</script>
<script>
  $(function () {
  
    
  //Date range picker
    $('#reservation').daterangepicker()
  
    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
      
    })
  });

  function checkValidate(){
		
	    var memberType=$("#memberType").val();
		var businessCode=$('#businessCode').val();
		var companyName=$('#companyName').val();
		var address=$('#address').val();
		var pincode=$('#pincode').val();
		var mobileNo=$('#mobileNo').val();
		var email=$('#email').val();
		var contPersonName=$('#contPersonName').val();
		var contPersonEmail=$('#contPersonEmail').val();
        var contMobileNo=$('#contMobileNo').val();
		
		if(memberType == 0){
		  //("Please Choose Member Type.");
		 
		  $("#memberType").focus();
		  return false;
		
	     }
	
		if(businessCode == ""){
			swal("Business Code should not be blank.");
			  $("#businessCode").focus();
			  return false;
		     }
	     
		if(companyName == ""){
			swal ("Company Name should not be blank.");
			  $("#companyName").focus();
			  return false;
		     }

		if(address == ""){
			swal ("Address should not be blank.");
			  $("#address").focus();
			  return false;
		     }
	     
		if(pincode == ""){
			swal("Pin Code should not be blank.");
			  $("#pincode").focus();
			  return false;
		     }

		if(mobileNo == ""){
			swal("Mobile Number should not be blank.");
			  $("#mobileNo").focus();
			  return false;
		     }

		if(email == ""){
			swal("Email should not be blank.");
			  $("#email").focus();
			  return false;
		     }  
	     
		if(contPersonName == ""){
			swal("Contact Person Name should not be blank.");
			  $("#contPersonName").focus();
			  return false;
		     }  
	     
		if(contPersonEmail == ""){
			swal("Contact Person Email should not be blank.");
			  $("#contPersonEmail").focus();
			  return false;
		     }

		if(contMobileNo == ""){
			swal("Contact Person Mobile Number should not be blank.");
			  $("#contMobileNo").focus();
			  return false;
		     }    

	}

  function checkBusinessCode(e){
 	 var regex = new RegExp("^[a-zA-Z0-9 /]+$");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Business Code.");
 	 return false;
 	} 
	
  function checkCompanyName(e){
 	 var regex = new RegExp("^[a-zA-Z]");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Company Name.");
 	 return false;
 	} 
	
  function checkAddess(e){
 	 var regex = new RegExp("^[a-zA-Z0-9 /,-]+$");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Address.");
 	 return false;
 	} 
	
  function checkBuilding(e){
 	 var regex = new RegExp("^[a-zA-Z0-9 /,-]+$");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Building Name.");
 	 return false;
 	} 
  function checkStreet(e){
 	 var regex = new RegExp("^[a-zA-Z0-9 /,-]+$");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Street Name.");
 	 return false;
 	} 
	
  function checkTown(e){
 	 var regex = new RegExp("^[a-zA-Z ]");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Town Name.");
 	 return false;
 	} 

  function checkPinCode(e){
 	 var regex = new RegExp("^[0-9]");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Pin Code.");
 	 return false;
 	} 

  function checkTelPhNo(e){
 	 var regex = new RegExp("^[0-9]");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Telephone Number.");
 	 return false;
 	} 

  function checkMobileNo(e){
 	 var regex = new RegExp("^[0-9]");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Mobile Number.");
 	 return false;
 	} 

  function checkFaxNo(e){
 	 var regex = new RegExp("^[0-9]");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Fax Number.");
 	 return false;
 	} 

  /* function checkemail(e){
 	 var regex = new RegExp("^[a-zA-Z0-9 /]+$.@");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 		("Please Enter a Valid email Adddress.");
 	 return false;
 	}  

  function checkWebSite(e){
 	 var regex = new RegExp("^[a-zA-Z0-9 /]+$");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 		("Please Enter a ValidWebsite.");
 	 return false;
 	} 
  */

  function checkContPersonName(e){
 	 var regex = new RegExp("^[a-zA-Z]");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Contact Person Name.");
 	 return false;
 	} 

 /*  function checkContPersonEmail(e){
 	 var regex = new RegExp("^[a-zA-Z0-9 /]+$");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 		("Please Enter a Valid email Of Contact Person.");
 	 return false;
 	}  */

  function checkContPersonMobile(e){
 	 var regex = new RegExp("^[0-9]");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Mobile Number Of Contact Person.");
 	 return false;
 	} 

  function checkAmount(e){
 	 var regex = new RegExp("^[0-9.]");
 	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 	 var code = (e.keyCode ? e.keyCode : e.which);
 	 if (regex.test(str) || code==8) {
 	    return true;
 	}
 	swal("Please Enter a Valid Amount.");
 	 return false;
 	} 

 
  
    </script>
    
  <script>
 $(document).ready(function(){
	 
	
	 $(".datecontrol").datepicker({
		
	        formatDate: 'yyyy-mm-dd',autoclose: true
	    });	 
 })
 $(function() {
    $('.othercomp').hide(); 
    $('#complist').change(function(){
        if($('#complist').val() == '1') {
            $('.othercomp').show(); 
        } else {
            $('.othercomp').hide(); 
        } 
    });
});
 
    </script>
	 
    <script type="text/javascript">
$(document).ready(function(){
 //Flat red color scheme for iCheck
    
	
	
$("#mselect1").change(function() {
	$("#mselect2").attr('disabled',false);
  if ($(this).data('options') === undefined) {
    /*Taking an array of all options-2 and kind of embedding it on the select1*/
    $(this).data('options', $('#mselect2 option').clone());
  }
  var id = $(this).val();
  var options = $(this).data('options').filter('[value=' + id + ']');
  $('#mselect2').html(options);
});
  
});


</script>
    