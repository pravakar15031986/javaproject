<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script type="text/javascript" src="scripts/validator.js"></script>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/scriptbreaker-multiple-accordion-1.js"></script>



<script type="text/javascript" language="JavaScript">
    function validate() {
         
   		var deptName=$("#txtDept").val();
		/* var hierarchyCode=$("#txtHierarchyCode").val();
		var telNo=$("#txtTelNo").val();
		var faxNo=$("#txtFaxNo").val();
		var address=$("#txtAddress").val(); */
	
        if (deptName == "") { 
        alert("Deparment Name Should Not Be Left Blank");
        $("#txtDept").focus();
        return false; 
        }
    
        if (hierarchyCode == 0) { 
        alert("Hierarchy Code Should Not Be Left Blank");
        $("#txtHierarchyCode").focus();
        return false; 
        }
        
        if (telNo == "") { 
        alert("Tel No Should Not Be Left Blank");
        $("#txtTelNo").focus();
        return false; 
        }
        
        if (faxNo == "") { 
        alert("Fax No Should Not Be Left Blank");
        $("#txtFaxNo").focus();
        return false; 
        }
        
        if (address == "") { 
        alert("Address Name Should Not Be Left Blank");
        $("#txtAddress").focus();
        return false; 
        } 
        
       if (document.getElementById('telNo').value != '') {
            if (($("#telNo").val().length < 10) && ($("#telNo").val().length > 0)) { alert('Mobile No. can not be less then 10 Number'); document.getElementById('telNo').focus(); return false; }
        }
 }

  </script>   
  <body>
    <div id="MidTab">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td valign="top"><div id="ContArea" style="min-height:450px;">
                  <!----------Page Title----------->
                  <div class="title" id="title">&nbsp;</div>
                  <!--------------Tab Button------------->
                  <div class="MyTab">
                    <ul class="nav nav-tabs">
                      <li class="active"><a href="addSubnode1.html">Add</a></li>
                       <li><a href="viewDepartment.html">View</a></li>
                     
                    </ul>
                   </div>
						<div id="myTab">
							<ul>
			                   <a href="addDepartment"></a> </ul>
						</div>		
							
							
							<div style="text-align: center;color: green;font-weight: bold;">${msg}</div>
                           <div style="text-align: center;color: red;font-weight: bold;">${errMsg}</div>
                           
					    <form:form method="post" action="addDepartment.html" modelAttribute="viewDepartmentVo"  autocomplete="off">
					        
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

					        
					         <div id="addTable">
                           <table border="0" cellspacing="0" cellpadding="0">  
                                               
		                   <tr>
			              <td><span id="spnNode">Department</span> Name</td> 
			               <td align="center" valign="middle">:</td>
                         <td>
			             <form:input path="levelName" id="txtDept" style="width:200px;"  value="" maxlength="50"/><!-- //for Department Name -->
			            <span class="mandatory">*</span>
			            </td> 
		                </tr>
		              
                        <tr>
                        <td>Hierarchy Code</td>
                        <td align="center" valign="middle">:</td>
                        <td>
                        <form:input path="hierarchyId" id="txtHierarchyCode" style="width:200px;" maxlength="50"  value=""/></td>
                        </tr>
                        
                        <tr>
                          <td>Telephone No.</td>
                          <td align="center" valign="middle">:</td>
                          <td>
                          <form:input  path="telNo" id="txtTelNo" style="width:200px;" onkeypress="return isNumberKey(event);" maxlength="10" value=""/></td>
                        </tr>
                        
                        <tr>
                          <td>Fax No.</td>
                          <td align="center" valign="middle">:</td>
                          <td>
                          <form:input path="faxNo" id="txtFaxNo" style="width:200px;"  onkeypress="return isNumberKey(event);" maxlength="15" value=""/></td>
                        </tr>
                        
                        <tr>
                          <td>Address</td>
                          <td align="center" valign="middle">:</td>
                          <td>
                          <form:textarea path="address" id="txtAddress" rows="3" cols="20" style="width:200px;" onkeyup="blockspecialchar_first(this);return TextCounter('txtAddress','lblChar1',500)" maxlength="500"></form:textarea>
                            &nbsp; Maximum <span id="lblChar1"></span> &nbsp;characters </td>
                        </tr>
                         <tr>
                  <td>
                         &nbsp;
                  </td>
                  <td>
                         &nbsp;
                  </td>
                  <td>
                       <input type="submit" name="btnSubmit" value="Submit" id="btnSubmit" onclick="return validate();" tabindex="3" class="btn btn-primary btn-sm" /> 
            		   <input type="reset" name="btnReset" value="Reset" id="btnReset" tabindex="4" class="btn btn-danger btn-sm" />
                  </td>
              </tr>   </table>
                    </div>
                    </form:form>
                </div></td>
            </tr>
       
      </tr>
    </table>
     </div>              
   
  </body>
