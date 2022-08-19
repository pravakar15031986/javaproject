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

/*Validation For  Click On Submit Button   */

 function checkValidate(){
    var countryName=$("#countryName").val();
	var countryCode=$("#countryCode").val();
	
	if(countryName == ""){
		  swal("Country Name should not be blank.");
		  $("#countryName").focus();
		  return false;
	     }
	if(countryCode == ""){
		  swal("Country Code should not be blank.");
		  $("#countryCode").focus();
		  return false;
		
	     }
	/* else{
		
		 swal("Data Submitted Successfully.", "", "success")
	} */
	}

 
</script>
<script> 
/*   Check Validation for Field Data */  
 
 
 function checkCountryName(e){
    var regex = new RegExp("^[a-zA-Z ]");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
var code = (e.keyCode ? e.keyCode : e.which);
if (regex.test(str) || code==8) {
   return true;
}
	swal("Please Enter a Valid Country Name.");
return false;
}


function checkCountryCode(e){
/*  var regex = new RegExp("^[0-9]");
	 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 var code = (e.keyCode ? e.keyCode : e.which);
	 if (regex.test(str) || code==8) {
	    return true;
	}
		swal("Please Enter a Valid Country Code.");
	 return false; */
}
    </script> 
    <script type="text/javascript" language="JavaScript">
 $(document).ready(function() {
	
	   $('#parentId1').change(function() { //Spring Ajax call for line Department	  
			 var countryId=$(this).val();
			 var hierarchyMasterID=$('#hierarchyMasterID').val();
			 var levelid=2;
			 var dataString = 'levDetailId='+ countryId+'&hierarchyMasterID='+hierarchyMasterID+'&levelId='+levelid;
			 $.ajax({
			 	type: "POST",
	            url : 'getCountyList',
	            data: dataString,
				cache: false,
	            success : function(data) {  	             
                    var html = '<option value="0">-Select County/province/City Name-</option>';
					var len = data.length;
				if (data.length != 0 ){
					for ( var i = 0; i < len; i++) {
					
						html += '<option value="' + data[i].levelDetailId + '">'
								+ data[i].levelName + '</option>';
					}
					html += '</option>';
	           	    $('#parentId2').html(html); 
				}else{
				alert("Data Empty");
					//$('#linedeptName').hide();
				}
					  
	            },
				  error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
	        });
	   });
	   $('#parentId2').change(function() { //Spring Ajax call for line Department	  
			 var countryId=$(this).val();
			 var hierarchyMasterID=$('#hierarchyMasterID').val();
			 var levelid=3;
			 var dataString = 'levDetailId='+ countryId+'&hierarchyMasterID='+hierarchyMasterID+'&levelId='+levelid;
			 $.ajax({
			 	type: "POST",
	            url : 'getCountyList',
	            data: dataString,
				cache: false,
	            success : function(data) {  	             
                  var html = '<option value="0">-Select County/province/City Name-</option>';
					var len = data.length;
				if (data.length != 0 ){
					for ( var i = 0; i < len; i++) {
					
						html += '<option value="' + data[i].levelDetailId + '">'
								+ data[i].levelName + '</option>';
					}
					html += '</option>';
	           	    $('#parentId3').html(html); 
				}else{
				alert("Data Empty");
					//$('#linedeptName').hide();
				}
					  
	            },
				  error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
	        });
	   });
	   $('#parentId3').change(function() { //Spring Ajax call for line Department	  
			 var countryId=$(this).val();
			 var hierarchyMasterID=$('#hierarchyMasterID').val();
			 var levelid=4;
			 var dataString = 'levDetailId='+ countryId+'&hierarchyMasterID='+hierarchyMasterID+'&levelId='+levelid;
			 $.ajax({
			 	type: "POST",
	            url : 'getCountyList',
	            data: dataString,
				cache: false,
	            success : function(data) {  	             
                var html = '<option value="0">-Select County/province/City Name-</option>';
					var len = data.length;
				if (data.length != 0 ){
					for ( var i = 0; i < len; i++) {
					
						html += '<option value="' + data[i].levelDetailId + '">'
								+ data[i].levelName + '</option>';
					}
					html += '</option>';
	           	    $('#parentId4').html(html); 
				}else{
				alert("Data Empty");
					//$('#linedeptName').hide();
				}
					  
	            },
				  error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
	        });
	   });
	   $('#parentId4').change(function() { //Spring Ajax call for line Department	  
			 var countryId=$(this).val();
			 var hierarchyMasterID=$('#hierarchyMasterID').val();
			 var levelid=5;
			 var dataString = 'levDetailId='+ countryId+'&hierarchyMasterID='+hierarchyMasterID+'&levelId='+levelid;
			 $.ajax({
			 	type: "POST",
	            url : 'getCountyList',
	            data: dataString,
				cache: false,
	            success : function(data) {  	             
              var html = '<option value="0">-Select County/province/City Name-</option>';
					var len = data.length;
				if (data.length != 0 ){
					for ( var i = 0; i < len; i++) {
					
						html += '<option value="' + data[i].levelDetailId + '">'
								+ data[i].levelName + '</option>';
					}
					html += '</option>';
	           	    $('#parentId5').html(html); 
				}else{
				alert("Data Empty");
					//$('#linedeptName').hide();
				}
					  
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
    
<div id="mainTable">


 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="addCountry?hierarchyID=${countryVo.hierarchyId}&subnodeid=${countryVo.subHierarchyId}" >Add</a></li>
              <li><a href="viewCountry?hierarchyID=${countryVo.hierarchyId}&subnodeid=${countryVo.subHierarchyId}&levelId=${levelId}" >View</a></li>
            </ul>
            <div class="tab-content">
            
              <div class="tab-pane active" id="fa-icons">
                <section id="new">
                
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
                		
                  
                  <div class="row">
                   	
                  
                  	<form:form class="col-sm-12 form-horizontal customform" action="registerCountry" modelAttribute="countryVo" method="post">
		           
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

		            <form:hidden path="hierarchyId" id="hierarchyMasterID"/>
		            <form:hidden path="subHierarchyId"/>
		            <%-- <form:hidden path="1"/> --%>
		            	<c:if test="${levelId eq 1}">
		             <div class="form-group">
		             
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[0]} Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="levelName" maxlength="20" id="countryName" placeholder="Enter Country Name"  onkeypress="return checkCountryName(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[0]} Code<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input class="form-control" path="alias" maxlength="10" id="countryCode" placeholder="Enter Country Code"  onkeypress="return checkCountryCode(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                  <form:hidden path="levelId" value="1"/>
		                  </c:if>
		                  
		                  <c:if test="${levelId eq 2}">
		                  <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[0]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="parentId" id="parentId1" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[0]} Name</option>
     			          <form:options items="${countryList}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                  <div class="form-group">
		             
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[1]} Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="levelName" maxlength="20" id="countryName" placeholder="Enter Country Name"  onkeypress="return checkCountryName(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[2]} Code<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input class="form-control" path="alias" maxlength="10" id="countryCode" placeholder="Enter Country Code"  onkeypress="return checkCountryCode(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                  
		                  <form:hidden path="levelId" value="2"/>
		                  </c:if>
		                  <c:if test="${levelId eq 3}">
		                <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[0]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="faxNo" id="parentId1" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[0]} Name</option>
     			          <form:options items="${countryList}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                    <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[1]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="parentId" id="parentId2" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[0]} Name</option>
     			          <form:options items="${countryList1}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                  <div class="form-group">
		             
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[2]} Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="levelName" maxlength="20" id="countryName" placeholder="Enter Country Name"  onkeypress="return checkCountryName(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[2]} Code<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input class="form-control" path="alias" maxlength="10" id="countryCode" placeholder="Enter Country Code"  onkeypress="return checkCountryCode(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                  <form:hidden path="levelId" value="3"/>
		                  </c:if>
		                  <c:if test="${levelId eq 4}">
		                    <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[0]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="faxNo" id="parentId1" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[0]} Name</option>
     			          <form:options items="${countryList}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[1]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="faxNo" id="parentId2" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[2]} Name</option>
     			          <form:options items="${countryList1}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                     <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[2]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="parentId" id="parentId3" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[2]} Name</option>
     			          <form:options items="${countryList1}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                  <div class="form-group">
		             
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[3]} Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="levelName" maxlength="20" id="countryName" placeholder="Enter Country Name"  onkeypress="return checkCountryName(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[3]} Code<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input class="form-control" path="alias" maxlength="10" id="countryCode" placeholder="Enter Country Code"  onkeypress="return checkCountryCode(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                   <form:hidden path="levelId" value="4"/>
		                  </c:if>
		                  <c:if test="${levelId eq 5}">
		                  <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[0]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="faxNo" id="parentId1" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[0]} Name</option>
     			          <form:options items="${countryList}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[1]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="faxNo" id="parentId2" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[1]} Name</option>
     			          <form:options items="${countryList1}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                     <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[2]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="faxNo" id="parentId3" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[2]} Name</option>
     			          <form:options items="${countryList1}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                  <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[3]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="parentId" id="parentId4" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[3]} Name</option>
     			          <form:options items="${countryList1}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                  <div class="form-group">
		             
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[4]} Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="levelName" maxlength="20" id="countryName" placeholder="Enter Country Name"  onkeypress="return checkCountryName(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[4]} Code<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input class="form-control" path="alias" maxlength="10" id="countryCode" placeholder="Enter Country Code"  onkeypress="return checkCountryCode(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                   <form:hidden path="levelId" value="5"/>
		                  </c:if>
		              
		                  <c:if test="${levelId eq 6}">
		                  <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[0]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="faxNo" id="parentId1" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[0]} Name</option>
     			          <form:options items="${countryList}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[1]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="faxNo" id="parentId2" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[1]} Name</option>
     			          <form:options items="${countryList1}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                     <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[2]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="faxNo" id="parentId3" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[2]} Name</option>
     			          <form:options items="${countryList1}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                  <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[3]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="faxNo" id="parentId4" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[3]} Name</option>
     			          <form:options items="${countryList1}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                   <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[4]} Name<span class="mandatory">*</span></label>
		                   <div class="col-sm-4">
		                <form:select path="parentId" id="parentId5" class="form-control select2" style="width: 100%;" >
				          <option value="0">Select ${subnodeName[4]} Name</option>
     			          <form:options items="${countryList1}" itemValue="levelDetailId" itemLabel="levelName" />
					      </form:select> 
	                  </div>
		                  <label ></label>
		                  </div>
		                  <div class="form-group">
		             
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[5]} Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="levelName" maxlength="20" id="countryName" placeholder="Enter Country Name"  onkeypress="return checkCountryName(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[5]} Code<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input class="form-control" path="alias" maxlength="10" id="countryCode" placeholder="Enter Country Code"  onkeypress="return checkCountryCode(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                   <form:hidden path="levelId" value="6"/>
		                  </c:if>
		               <div class="form-group">
			              <label class="col-sm-2 control-label">Status</label>
			              
			              	<div class="col-sm-1">
			              		<label class="myradio">Active
								<form:radiobutton path="bitStatus" value="0"/> 
								<span class="checkmark1"></span>
								</label>
			              	
			              	</div>
			              	
			              	<div class="col-sm-1">
			              		<label class="myradio">Inactive
								<form:radiobutton path="bitStatus" value="1"/> 
								<span class="checkmark1"></span>
								</label>
			              	
			              	</div>
			              </div>
              <div class="form-group">
		                
		                <div class="form-group">
		                  <div class="col-sm-offset-2 col-sm-10">
		                    <button type="reset" class="btn btn-default">Reset</button>
		                	<button type="submit" class="btn btn-info" onclick="return checkValidate();">Submit</button>
		                  </div>
		                </div>
		              </div></form:form></div></section></div>
                  </div>
                  <hr>
				
              </div>
             
             

            </div>
          </div>
        </div>
      