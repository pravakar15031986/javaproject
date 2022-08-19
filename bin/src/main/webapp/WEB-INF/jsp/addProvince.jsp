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
		TextCounter('txtDesc','lblChar',500);
		setupLabel();
		$('.label_check').click(function(){
			setupLabel();
		});
   
	});
    </script>
    
    <script>
    
/*Validation For Function Master Click On Submit Button   */
	
	 function checkValidate(){
		
		 var countyName=$("#countyName").val();
			var province=$('#province').val();
			var countyCode=$('#countyCode').val();

			
			if(countyName == 0){
			  swal("Please Choose Country Name.");
			  $("#countyName").focus();
			  return false;
			
		     }
		
			if(province == ""){
				  swal("County/Province should not be blank.");
				  $("#province").focus();
				  return false;
			     }
		     
			if(countyCode == ""){
				  swal("County Code should not be blank.");
				  $("#countyCode").focus();
				  return false;
			     }
			 else{
					
				 swal("Data Submitted Successfully.", "", "success")
			}
		}
 
/*  Check Validation for Button Name */
    

	 function checkCountyName(e){
	     var regex = new RegExp("^[a-zA-Z\\s ]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
		swal("Please Enter a Valid County/Province Name.");
	 return false;
	} 

	/*  Check Validation for Serial Number Name */
	
	 function checkCountyCode(e){
	 var regex = new RegExp("^[0-9]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
		swal("Please Enter a Valid County/Province Code.");
	 return false;
	} 

	
</script>
	
    
<div id="mainTable">

 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">

              <li class="active"><a href="addProvince">Add</a></li>
              <li><a href="viewProvince">View</a></li>

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
		                  <label for="inputEmail3" class="col-sm-2 control-label">Country Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                <select class="form-control select2" id="countyName">
		                       <option value="0">-Select Country Name-</option>
			                       	<option>002-Burundi</option> 
		                          	<option>003-DR Congo</option>
		                            <option>004Ethiopia </option>
									<option >001-Kenya</option>
									<option>005-Madagascar</option>
									<option>006-Malawi </option>
									<option>007-Mozambique</option>
									<option>008-Rwanda</option>
									<option>009-Tanzania</option>
									<option>010-Uganda</option>
		                      </select>
	                  </div>
		                  <label ></label>
		                  </div>
		               
		                <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">County/province/City<span class="mandatory">*</span></label>
		
		                  <div class="col-sm-4">
		                    <input type="text" class="form-control"  maxlength="20" id="province" placeholder="Enter County Name"  onkeypress="return checkCountyName(event);"></input>
		                  </div>
		                  <label ></label>
		                  </div>
		                <div class="form-group">
		                 <label for="inputEmail3" class="col-sm-2 control-label">Province/County  Code<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <input type="text" class="form-control"  maxlength="4" id="countyCode" placeholder="Enter County Code" onkeypress="return checkCountyCode(event);"></input>
		                  </div>
		                  <label ></label>
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
		                   <button type="reset" class="btn btn-default" >Reset</button>
		                	<button type="submit" class="btn btn-info" onclick="return checkValidate();">Submit</button>
		                  </div>
		                </div>
		 
      
      </div></div>
     </section></div>
                  <hr>
				
              </div>
             
             

            </div>
          </div>
        </div>
      </div>