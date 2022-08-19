<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>User Type</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Library</li>
                           <li class="breadcrumb-item active" aria-current="page">Data</li>
                        </ol>
                     </nav>
                  </div>
         
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addusertype">Add</a>
                              <a class="nav-item nav-link "  href="viewusertype" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                          
                           
                   		<form:form autocomplete="off" modelAttribute="userT" action="add-userType" >
                   		
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                   		<form:hidden path="id"/>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input1">User Type <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <%-- <input type="text" id="userType" class="form-control" name="userType" placeholder="User Type" value="${userTypeEdit.userType }"> --%>
                                 <form:input path="userType" id="userType" class="form-control" placeholder="User Type"/>
                                 
                              </div>
                           </div>
                         
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                
                                 <form:textarea path="userTypePrefix" id="description" rows="4" class="form-control" placeholder="Description" maxlength="200" onkeyup="countChar(this)" /><div id="charNum">Maximum 200 characters</div>
                              
                              </div>
                           </div>
                               <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <form:radiobutton path="isDelete" value="true" id="demo-form-radio" class="magic-radio sampleyes" name="form-radio-button"/>
                                    
                                    <label for="demo-form-radio">Active</label>
                             
                                    <form:radiobutton path="isDelete" value="false" id="demo-form-radio-2" class="magic-radio sampleyes" name="form-radio-button" />
                                    <label for="demo-form-radio-2">Inactive</label>
                                 </div>
                              </div>
                           </div>
                           <hr>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button id="btnSubmitId" class="btn btn-primary mb-1" type="button" >Update</button>
                                 <button type="reset" class="btn btn-danger">Reset</button>
                                 
                              </div>
                           </div>
                           </form:form>
                           
                        </div>
                        <!--===================================================-->
                        <!-- END BASIC FORM ELEMENTS -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
<script>
	$(function(){

		   $(".selectall").click(function(){
			$(".individual").prop("checked",$(this).prop("checked"));
			});
		
		
	});
</script>


<script>
$(document).ready(function(){
	
	   $('#btnSubmitId').click(function()
		{
		   event.preventDefault(); 
			  var form = event.target.form; 
		   
		   if ($('#userType').val() == ""){
	        	swal("Error", "User Type shouldn't blank", "error");
	            return false;
	        }
       
           	swal({
           		title: ' Do you want to Update?',
           		  type: 'warning',
           		  showCancelButton: true,
           		  confirmButtonText: 'Yes',
           		  cancelButtonText: 'No',
           		  /* reverseButtons: true */
       	    }).then((result) => {
       	    	  if (result.value) {
       	    		form.submit();
       	    		 /*  swal("Success", "Submitted Successfully ", "success"); 
       	    		  window.location.href="viewusertype";
       	    		  return true; */
       	    		  }
       	    		})
       	   // return false;
           //}
	   });
	});
</script>
<script>
      function countChar(val) {
        var len = val.value.length;
        if (len > 200) {
        	
        } else {
          var remaining_len=$('#charNum').text(200 - len+" characters left");
        }
      };
    </script>