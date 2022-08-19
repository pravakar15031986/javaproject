<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Configure Approval Period</h4>
                 
                  </div>
                  
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="editTimeLimit">Edit</a>
                              <a class="nav-item nav-link "  href="viewTimeLimit" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a  title="" href="javascript:void(0)" id="backIcon" onclick="history.back()" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                       
                        
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        
                        <div class="card-body">
                        
                        
                        <div class="width50">
                         <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Survey Publish Time Limit(<a data-toggle="tooltip" style="color: red;font-weight:bold" data-original-title="View">i</a>)<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <input type="text" id="surveyTime" class="form-control" name="userType" onkeypress="return numbersonly(event)" placeholder="" value="30">
                              </div>
                           </div>
                           
                              <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Race Analysis Publish Time Limit(<a data-toggle="tooltip" style="color: red;font-weight:bold" data-original-title="View">i</a>)<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <input type="text" id="raceTime" class="form-control" name="userType" onkeypress="return numbersonly(event)" placeholder="" value="25">
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Recommendation Publish Time Limit(<a data-toggle="tooltip" style="color: red;font-weight:bold" data-original-title="View">i</a>)<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <input type="text" id="recommendationTime" class="form-control" name="userType" onkeypress="return numbersonly(event)" placeholder="" value="30">
                              </div>
                           </div>
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Monitor Implementation Publish Time Limit(<a data-toggle="tooltip" style="color: red;font-weight:bold" data-original-title="View">i</a>)<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <input type="text" id="monitorTime" class="form-control" name="userType" onkeypress="return numbersonly(event)" placeholder="" value="22">
                              </div>
                           </div>
                           
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Advisory Publish Time Limit(<a data-toggle="tooltip" style="color: red;font-weight:bold" data-original-title="View">i</a>)<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <input type="text" id="advisoryTime" class="form-control" name="userType" onkeypress="return numbersonly(event)" placeholder="" value="15">
                              </div>
                           </div>
                           
                        
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnSubmitId">Update</button>
                                 <button onclick="history.back()" class="btn btn-danger mb-1">Back</button>
                              </div>
                           </div>
                        </div>
                       
                        <script>
                        $(document).ready(function(){
                        	$('#btnSubmitId').click(function(){
                        		if ($('#surveyTime').val() == ""){
                     	        	swal("Error", "Survey Publish Time Limit should not blank", "error");
                     	        	$("#surveyTime").focus();
                     	            return false;
                     	        } 
                     		   if ($('#raceTime').val() == ""){
                     	        	swal("Error", "Race Analysis Publish Time Limit should not blank", "error");
                     	        	$("#raceTime").focus();
                     	            return false;
                     	        }
	                     		  if ($('#recommendationTime').val() == ""){
	                   	        	swal("Error", "Recommendation Publish Time Limit should not blank", "error");
	                   	        	$("#recommendationTime").focus();
	                   	            return false;
	                   	        } 
	                   		   if ($('#monitorTime').val() == ""){
	                   	        	swal("Error", "Monitor Implementation Publish Time Limit should not blank", "error");
	                   	        	$("#monitorTime").focus();
	                   	            return false;
	                   	        }
		                   		if ($('#advisoryTime').val() == ""){
	                   	        	swal("Error", "Advisory Publish Time Limit should not blank", "error");
	                   	        	$("#advisoryTime").focus();
	                   	            return false;
	                   	        }
                                /* if($("input[name='form-radio-button']:checked").length==0){
                                	swal("Error", "Please select Status", "error");
                     	            return false;
                                }  */
                               
                                	swal({
                                		title: ' Do you want to Submit?',
                                		  type: 'warning',
                                		  showCancelButton: true,
                                		  confirmButtonText: 'Yes',
                                		  cancelButtonText: 'No',
                                		  /* reverseButtons: true */
                            	    }).then((result) => {
                            	    	  if (result.value) {
                            	    		  swal("Success", "Submitted Successfully ", "success"); 
                            	    		  window.location.href="viewTimeLimit";
                            	    		  return true;
                            	    		  }
                            	    		})
                            	    return false;
                                
                     	   }); 
                        });

                    	function numbersonly(e){
                    	    var unicode=e.charCode? e.charCode : e.keyCode;
                    	    if ( ( (unicode>47)&&(unicode<58) ) || unicode == 9 || unicode == 8 || unicode == 46)
                    	            return true;
                    	    else {
                    	    	swal('This field accepts numbers Only!');
                    	    	return false;
                    	    }
                    	}
                        </script>