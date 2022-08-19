<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script language="javascript">
	/* pageHeader="";
	strFirstLink="Welcome";
	strLastLink=""; */

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
 <script type="text/javascript" language="JavaScript">
 $(document).ready(function() {
	
	   $('#countryName').change(function() { //Spring Ajax call for line Department	  
			 var countryId=$(this).val();
			 var hierarchyMasterID=$('#hierarchyMasterID').val();
			 
			 var dataString = 'levDetailId='+ countryId+'&hierarchyMasterID='+hierarchyMasterID;
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
	           	    $('#countyName').html(html); 
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
              <li class="active"><a href="#" >Modify</a></li>
              <li><a href="viewComany?hierarchyID=${companyvo.hierarchyId}&subnodeid=${companyvo.subHierarchyId}">View</a></li> 
            </ul>
            <div class="tab-content">
             
              <div class="tab-pane active" id="fa-icons">
                <section id="new">
                   
                  <div class="row">
                  <form:form  action="modifyCompany" modelAttribute="companyvo" method="post">
                  	
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                  	<form:hidden path="levelDetailId"/>
                  	<form:hidden path="hierarchyId" id="hierarchyMasterID"/>
		            <form:hidden path="subHierarchyId"/>
                  	<div class="col-sm-12 form-horizontal customform" >
                  	
                  	 <c:if test="${levelId eq 2}">
		                      	<div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Country Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-3"><span class="colon">:</span>
		                <form:select class="form-control select2" id="countryName" path="countryId">
		                       <option value="0">-Select Country Name-</option>
		                       <form:options items="${countryList}" itemLabel="levelName" itemValue="levelDetailId"/>
			                       
		                      </form:select >
	                  </div>
		                  <label ></label>
		                  </div>
		              <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[1] } Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="levelName" maxlength="20" id="countryName" placeholder="Enter Country Name"  onkeypress="return checkCountryName(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		                
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">${subnodeName[1]} Code<span class="mandatory">*</span></label>
		                  <div class="col-sm-4">
		                    <form:input class="form-control" path="alias" maxlength="10" id="countryCode" placeholder="Enter Country Code"  onkeypress="return checkCountryCode(event);"></form:input>
		                  </div>
		                  <label ></label>
		                  </div>
		            </c:if>
                  	
                  	<c:if test="${levelId eq 3}">
                  	<div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Country Name<span class="mandatory">*</span></label>
		                  <div class="col-sm-3"><span class="colon">:</span>
		                <form:select class="form-control select2" id="countryName" path="countryId">
		                       <option value="0">-Select Country Name-</option>
		                       <form:options items="${countryList}" itemLabel="levelName" itemValue="levelDetailId"/>
			                       
		                      </form:select >
	                  </div>
		                  <label ></label>
		                  </div>
                  	
                  	
                  	<div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">County/province/City<span class="mandatory">*</span></label>
		
		                  <div class="col-sm-3">
							  <span class="colon">:</span>
		                   <form:select class="form-control select2" id="countyName" path="parentId">
		                       <option value="0">-Select County/province/City Name-</option>
		                       <form:options items="${countyList}" itemLabel="levelName" itemValue="levelDetailId"/>
		                      </form:select > </div>
		                  <label ></label>
		                  </div>
                  	
                  	
                  	
		             <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Company Name<span class="mandatory">*</span></label>
		                <div class="col-sm-3"><span class="colon">:</span>
		                      <form:input path="levelName" class="form-control"  maxlength="50" id="companyName" placeholder="Enter Company Name"  onkeypress="return checkCompanyName(event);"/>
		                
		                   </div>
		                   
		                  <label ></label>
		                  </div>
		                
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Company Code<span class="mandatory">*</span></label>
		                <div class="col-sm-3"><span class="colon">:</span>
		                 <form:input path="alias" class="form-control"  maxlength="4" id="companyName" placeholder="Enter Company Code"  onkeypress="return checkCompanyName(event);"/>
		             
		                    
		                  </div>
		                  <label ></label>
		                  </div>
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
		                  <div class="col-sm-offset-2 col-sm-10">
		                   <button type="submit" class="btn btn-default">Reset</button>
		                	<button type="submit" class="btn btn-info" onclick="return checkValidate();">Submit</button>
		                  </div>
		                </div>
		               
            </div>
            
            
            </form:form>
            
            
            </div></section></div>
                  </div>
                  <hr>
				
              </div>
             
             

            </div>
          </div>
        </div>
      