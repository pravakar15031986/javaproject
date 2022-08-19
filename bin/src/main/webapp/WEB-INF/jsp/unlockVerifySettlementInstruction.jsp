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
	swal("Unlocked Successfully.");

	}


  
  function checkAccNumber(e){
		 var regex = new RegExp("^[a-zA-Z0-9 /]+$");
			 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
			 var code = (e.keyCode ? e.keyCode : e.which);
			 if (regex.test(str) || code==8) {
				    return true;
			}
			 swal("Please enter valid Account Number only Neumeric.");
			 return false;
		}


  function checkBankName(e){
		 var regex = new RegExp("^[a-zA-Z\\s ]");
			 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
			 var code = (e.keyCode ? e.keyCode : e.which);
			 if (regex.test(str) || code==8) {
				    return true;
			}
				swal("Please enter validBank name Alphabets and Neumeric .");
			 return false;
		}

  function checkBankAccNumber(e){
		 var regex = new RegExp("^[0-9]");
			 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
			 var code = (e.keyCode ? e.keyCode : e.which);
			 if (regex.test(str) || code==8) {
				    return true;
			}
				swal("Please enter valid Bank Account Number only Neumeric.");
			 return false;
		}

  function checkBranchname(e){
		 var regex = new RegExp("^[a-zA-Z\\s ]");
			 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
			 var code = (e.keyCode ? e.keyCode : e.which);
			 if (regex.test(str) || code==8) {
				    return true;
			}
				swal("Please enter valid Bank name Alphabets .");
			 return false;
		}

	
  function checkBrachCode(e){
		 var regex = new RegExp("^[a-zA-Z0-9 /]+$");
			 var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
			 var code = (e.keyCode ? e.keyCode : e.which);
			 if (regex.test(str) || code==8) {
				    return true;
			}
				swal("Please enter valid Branch Code Alphabets and Neumeric .");
			 return false;
		}

  
	</script>
	<script >
/* $(function() {
		
	    $('.addmanually').hide(); 
	    $('.accountno').click(function(){
	    	
	    });
	    
	}); */
</script>
	
<div id="mainTable">
 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
           
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
      
      
      
      
      

             <div class="col-sm-12 form-horizontal customform"  >
             
             <div class="form-group">
		                  <label class="col-sm-2 control-label"><b>Country Name</b><font color="#FF0000">*</font></label>
		                   <div class="col-sm-3" >
		                    <select class="form-control select2" id="countryName" disabled>
		                       	<option value="0">-Select Country-</option>
			                       	<option>002-Burundi</option> 
		                          	<option>003-DR Congo</option>
		                            <option>004Ethiopia </option>
									<option selected>001-Kenya</option>
									<option>005-Madagascar</option>
									<option>006-Malawi </option>
									<option>007-Mozambique</option>
									<option>008-Rwanda</option>
									<option>009-Tanzania</option>
									<option>010-Uganda</option>
		                      </select>
		                   </div>
		              </div>  
           
           <div class="form-group">
                 <label class="col-sm-2 control-label"><b>Bank Name</b></label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control"  value="Bank of Africa" disabled></input>
                  </div>
                  <label ></label><div></div>
           </div>
           
            <div class="form-group">
                 <label class="col-sm-2 control-label"><b>Bank Account Number</b></label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" value="755950983156" disabled></input>
                  </div>
                  <label ></label><div></div>
           </div>
           
           <div class="form-group">
                 <label class="col-sm-2 control-label"><b>Branch Name</b></label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control"  value="Bank of Africa,Nairobi" disabled></input>
                  </div>
                  <label ></label><div></div>
           </div>
           
           <div class="form-group">
                 <label class="col-sm-2 control-label"><b>Branch Code</b></label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control"   value="957" disabled></input>
                  </div>
                  <label ></label><div></div>
           </div>
  
           
				 <div class="form-group">
								<label class="col-sm-2 control-label"><b>Effective From</b></label>
		                  <div class="col-sm-3">
		                     <div class="input-group date" data-provide="datepicker" >
						    <input type="text" class="form-control"  value="20/06/2018" disabled>
						    <div class="input-group-addon">
       					 <span class="glyphicon glyphicon-th"></span>
    					</div>
					</div>
		           </div>
                </div>  
                
               
           
                
             <div class="form-group">  
              <div class="col-sm-5">
              <div class="well">
				   <label class="mycheck">
					<small>I Chebango EPZ Tea Company Ltd hereby declare that I am changing bank account details from: </small> 
					
					 <input type="checkbox" value="1"  id="action1" class="flat-red" checked disabled>
					  <span class="checkmark"></span>
					  <div class="clearfix"></div>
					</label>
					<br>
					<div class="col-sm-3"><p><h5>BANK:-</h5>Bank Of America<br>AM Plaza, Along The Main highway<br>Kericho<br>Phone:254-41678433344<br>Email:yoursay@boakenya.com</div>
              <div class="col-sm-3"><h5>To:-</h5>African Banking Corporation Ltd.<br> P.O Box 46452-00100, Nairobi<br>Email:yoursay@boakenya.com</div>
             <div class="clearfix"></div><br><br>
             <div class="col-sm-12">
					<p class="row">&nbsp&nbsp&nbsp&nbsp with effect from 20-JUN-2018</p>
				 </div>
				 <div class="clearfix"></div>
				 
				 </div>
				 </div>

             
             <p> </div>
           
            
           <div class="form-group">
						<label class="col-sm-2 control-label"></label>
		                  <div class="col-sm-3">
		                    <a href="verifySettlementInstruction" class="btn btn-info"  >Back</a>
						    <a  class="btn btn-success"    onclick="return checkValidate();">Unlock</a>
		                  </div>
					     <div class="col-sm-4">
					     <label></label>
					  </div>
			   </div>
               
          
           </div>
              </div></div>
                  </div>
                  <hr>
              </div>
            </div>
          </div>
        </div>
   