<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Manage User</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Manage User</li>
                        </ol>
                     </nav>
                  </div>
           
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active" href="edituser">Edit</a>
                              
                           </ul>
                           <div class="indicatorslist">
                              
                              <a title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="history.back()"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form action="" autocomplete="off">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                               <div class="width50">
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Organization Name<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											 <select class="form-control" id="organizationId" onchange="mapperResearchCenter(this.value);">
												<option value="0">--select--</option>
												<option value="1" selected="selected">EIAR</option>
												<option value="2">ATA</option>
												<option value="3">CIMMYT</option>
												<option value="4">UK Metrology</option>
												<option value="5">Global Rust Monitoring</option>
											</select>
										</div>
									</div>
									<div class="form-group row" id="mapDivId">
									<label class="col-12 col-md-4 col-xl-4 control-label"><span
											class="text-danger">Map to Research Center ?</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<!-- Radio Buttons -->
										<div class="radio">
											<input id="mapStatus-1" class="magic-radio" type="radio" value="Y" name="mapStatus" onchange="radioBtnCenter(this.value);" checked="checked"> 
											<label for="mapStatus-1"> Yes</label> 
											<input id="mapStatus-2" class="magic-radio" type="radio" value="N" name="mapStatus"  onchange="radioBtnCenter(this.value);"> 
											<label for="mapStatus-2"> No </label>
										</div>
									</div>
									
								</div>  
								<div class="form-group row" id="researchCenterDivId">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Research Center Name <span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											 <select class="form-control" id="researchCenterId">
												<option selected="selected">Ambo Agriculture Research Center</option>
												<option>Sinana Research Center</option>
												<option>Kulumsa Research Center</option>
										    </select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">User Role <span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											 <select class="form-control" id="roleId">
												<option value="0">--select--</option>
												<option value="1" selected="selected">CMMYT NODAL OFFICER</option>
												<option value="2">ATA NODAL OFFICER</option>
												<option value="3">MOA NODAL OFFICER</option>
												<option value="4">EIAR NODAL OFFICER</option>
												<option value="5">PATHOLOGIST</option>
												<option value="6">Surveryor</option>
												<option value="7">Researcher</option>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-text-input">Name<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> <input type="text"
												id="name" class="form-control" placeholder="" value="Name 1">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Designation </label>
										<div class="col-12 col-md-8 col-xl-8">
											 <select class="form-control">
												<option>--select--</option>
												<option selected="selected">Designation 1</option>
												<option>Designation 2</option>
												<option>Designation 3</option>
												<option>Designation 4</option>
												<option>Designation 5</option>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-text-input">Mobile No.<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> <input type="text"
												id="mobile" class="form-control" placeholder="" value="8625245655">
										</div>
									</div><div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-text-input">Email<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span> <input type="text"
												id="email" class="form-control" placeholder="" value="example123@demo.com">
										</div>
									</div>
									<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
									<div class="col-12 col-md-8 col-xl-8">
										<!-- Radio Buttons -->
										<div class="radio">
											<input id="demo-form-radio-1" class="magic-radio" type="radio" name="status" checked="checked"> 
											<label for="demo-form-radio-1"> Active </label> 
											<input id="demo-form-radio-2" class="magic-radio" type="radio" name="status"> 
											<label for="demo-form-radio-2"> Inactive </label>
										</div>
									</div>
								</div>                                      
                        <hr>
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
                                
                                 <button class="btn btn-primary mb-1" id="btnSubmit">Update</button>
                                 <button type="reset" class="btn btn btn-danger mb-1">Reset</button>
                                
                              </div>
                           </div>
                           </div>
                           </div>
                        <!--===================================================-->
                        <!-- END BASIC FORM ELEMENTS -->
                     </form></div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
$(document).ready(function ()
		{
	//$("#mapDivId").hide();
//	$("#researchCenterDivId").hide();
    $("#btnSubmit").click(function (){ 
    	
    var organizationId=$("#organizationId").val();
    	if(organizationId=='0')
    	{
    		swal(
					'Warning!',
					'Select Organization Name!',
					'warning'
					)
					return false;
    	}
    	
    	
    	if($("#roleId").val()=='0')
    	{
    		swal(
					'Warning!',
					'Select Role!',
					'warning'
					)
					return false;
    	}
    	if($("#name").val()=='')
    	{
    		swal(
					'Warning!',
					'Name Shouldnot be blank!',
					'warning'
					)
					return false;
    	}
    	if($("#mobile").val()=='')
    	{
    		swal(
					'Warning!',
					'Mobile Number Shouldnot be blank!',
					'warning'
					)
					return false;
    	}
    	if($("#email").val()=='')
    	{
    		swal(
					'Warning!',
					'Email Shouldnot be blank!',
					'warning'
					)
					return false;
    	}
        
		        	swal({
		        		title: 'Modify user details?',
		        		  type: 'info',
		        		  showCancelButton: true,
		        		  confirmButtonText: 'Yes',
		        		  cancelButtonText: 'No',
		        		  /* reverseButtons: true */
		    	    }).then((result) => {
		    	    	  if (result.value) {
		    	    		   swal("Success", "User details modified Successfully ", "success");
		    	    		   window.location.href="viewuser";
		    	    		  }
		    	    		})
		        	return false;
        		});
		});
    function mapperResearchCenter(id){
		if(id=='1')
		{
			$("#mapDivId").show();
			 var radioValue = $("input[name='mapStatus']:checked").val();
			 radioBtnCenter(id);
		
		}else{
			$("#mapDivId").hide();
			$("#researchCenterDivId").hide();
		}
		
		
	}
	function radioBtnCenter(id){
		 if(id=='Y')
	     {
			 $("#researchCenterDivId").show();
	     }else{
	    	 $("#researchCenterDivId").hide();
	     } 
		 
	}
</script>