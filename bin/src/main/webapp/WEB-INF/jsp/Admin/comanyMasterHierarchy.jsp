<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script language="javascript">
	pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";
</script>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script type="text/javascript">
  $(document).ready(function() {
   $('#countryId').change(function() { //Spring Ajax call for County master
		 var CountyMaster=$(this).val();
		 var dataString = 'levelId='+ CountyMaster;
		// alert(dataString);
		 $.ajax({
		 	type: "POST",
            url : 'getCountyList',
            data: dataString,
			cache: false,
            success : function(data) {  	             
                var html = '<option value="0">Select County Name</option>';
				var len = data.length;
				//alert("len="+len);
				for ( var i = 0; i < len; i++) {
				
					html += '<option value="' + data[i].levelId + '">'
							+ data[i].levelName + '</option>';
				}
				html += '</option>';
           	    $('#countyId').html(html);   
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
              <li class="active"><a href="#" >Add</a></li>
              <li><a href="#" >View</a></li>
             
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="fa-icons">
               <form:form class="col-sm-12 form-horizontal customform" action="registerCompanyMaster"  modelAttribute="subNodeVo" method="post"> 
               
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

               
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
   
                    <div class="form-group" >
		                  <label for="inputEmail3" class="col-sm-2 control-label">Country Name</label>
		                  <div class="col-sm-4">
		                 <form:select path="levelId" id="countryId" name="countryName" class="form-control select2" style="width: 100%;" >
				         <option value="0">Select Country Name</option>
     			        <form:options items="${CountryList}" itemValue="levelId" itemLabel="levelName" />
					    </form:select>  
	                  </div>
		                <%--   <label ></label><form:errors path="countryId" cssClass="error"  element="div" /> --%>
		                  </div>
                    <div class="form-group" >
		                  <label for="inputEmail3" class="col-sm-2 control-label">County Name</label>
		                  <div class="col-sm-4">
		                 <form:select path="levelId" id="countyId" name="countyName" class="form-control select2" style="width: 100%;" >
				         <option value="0">Select County Name</option>
     			        <form:options items="${CountyList}" itemValue="levelId" itemLabel="levelName" />
					    </form:select>  
	                  </div>
		                 <%--  <label ></label><form:errors path="countyId" cssClass="error"  element="div" /> --%>
		                  </div>
		                  <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Hierarchy Code</label>
		                  <div class="col-sm-4">
		                    <form:input type="text" class="form-control" path="hierarchyId" id="txtHierarchyCode" maxlength="20"  ></form:input>
		                  </div>
		                  
		               <%--    <label ></label><form:errors path="tabName" cssClass="error"  element="div" /> --%>
		                  </div>
				   <div class="form-group">
                   <label class="col-sm-2 control-label" >Company Name</label>
                   <div class="col-sm-4">
                    <form:input  path="levelName" class="form-control select2" id="txtDept" />
                  </div></div>
           <div class="form-group">
                 <label class="col-sm-2 control-label">Mobile no</label>
                  <div class="col-sm-4">
                    <form:input  path="telNo" id="txtTelNo" class="form-control" />
                 </div></div>
                  <div class="form-group">
                  <label class="col-sm-2 control-label">Fax no</label>
                  <div class="col-sm-4">
                    <form:input  path="faxNo" id="txtFaxNo" class="form-control"  />
                 </div>
                   </div>
                   
                   <div class="form-group">
		    <label for="exampleInputFile" class="col-sm-2 control-label">Address</label>
		     <div class="col-sm-4">
		      <form:textarea class="form-control" rows="3" name="address" path="address" id="txtAddress" onkeypress="return checkDescription(event);" onkeyup="return TextCounter('txtDesc','lblChar',500)" maxlength="500" placeholder="Enter Description..."></form:textarea>&nbsp; Maximum <span id="lblChar"></span> &nbsp;characters 300 
		     </div>
		    <label ></label><div></div>
		  </div>
        

 <div class="form-horizontal">
<div class="form-group">
  <div class="col-sm-offset-2 col-sm-10">
		                   <button type="reset" class="btn btn-default">Reset</button>
		                	<button type="submit" class="btn btn-info" onclick="return checkValidate();">Submit</button>
		                  </div>
</div>
</div></div></form:form>


              </div>
              </div>
                 </div>
                  
              </div>
            </div>
          </div>
        
       