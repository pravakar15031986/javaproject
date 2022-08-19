<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">  
                  <div class="title-details">
                     <h4>View Pending Samples</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Race Analysis</li>
                           <li class="breadcrumb-item active" aria-current="page">Race Analysis</li>
                          
                        </ol>
                     </nav>
                  </div>
      
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="stem-rust-race-analysis">Pending Samples</a>
                              <a class="nav-item nav-link"  href="inoculatedsample">Inoculated Samples</a>
                              <a class="nav-item nav-link"  href="raceanalysisresult">Race Analysis Result</a>
                           </ul>
                            <div class="indicatorslist">
                             
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                           <form action="stemRustRaceAnalysisSearch" method="POST" id="form_">
                          <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                          <input type="hidden"   name="r_url" value="stem-rust-race-analysis"> 

                           <div class="form-group">
                              <div class="row">
                              <label class="col-lg-2 ">Survey No.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="surveyNo" id="surveyNo" placeholder="" data-bv-field="fullName" autocomplete="off">
                                    </div>
                               <label class="col-lg-2 ">Sample ID</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="sampleId" id="sampleId" placeholder="" data-bv-field="fullName" autocomplete="off">
                                    </div>
                              </div>
                              </div>
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Allocation Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" name="allocationStartDate" data-date-end-date="0d"  id="allocationStartDate" aria-describedby="inputGroup-sizing-default" autocomplete="off">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Allocation Date To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" name="allocationEndDate" data-date-end-date="0d" id="allocationEndDate" aria-describedby="inputGroup-sizing-default" autocomplete="off">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                              	</div>
                              </div>
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Region Name</label>
                                    <div class="col-lg-3">
                                       <select class="form-control" name="regionId" id="regionId">
                                       
                                  	 <option value="0">--Select--</option>
                                   
                                      <c:forEach items="${DemographList}" var="demographList">
                                   <option value="${ demographList.demographyId}">${ demographList.demographyName}</option>
                                    </c:forEach>
                                    
                                    </select>
                                    </div>
                                     
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary" type="button" onclick="return checkSearch()"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                              	</div>
                              </div>
                                </form>
                                 </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                           <form action="viewsurveyForRaceanalysis" autocomplete="off" id="myForm1"   method="post"><input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                           
         <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
          <input type="hidden"   name="r_url" value="stem-rust-race-analysis">
       </form>
       
       
                        <!-- Search Panel -->
                        <!--===================================================-->
                        
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                                 <thead>
                                    <tr>
                                   
                                       <th width="40px"  >Sl#</th>
                                       <th  >Survey No.</th>
                                       <th  >Sample ID</th>
                                       <th  > Allocation Date </th>
                                       <th  >Rust Type</th>
                                       <th  >Sample Collected On</th>
                                       <th>Region</th>
                                    	<th>Zone</th>
                                    	<th>Woreda</th>
                                    	<th>Kebele</th>
                                       <th   width="100px">Action</th>
                                    </tr>
                                    
                                 </thead>
                                 <tbody>
                                  
                                 </tbody>
                              </table>
                              
                               <script>

	$(function() {


	$("#viewTable").DataTable({
		'processing' : true,
		'serverSide' : true,
		 "searching": false,
      	"ordering": false, 
		 "ajax" : {
				"url" : "stemRustRaceAnalysisSearchDatatablePagination",
				"data" : function(d) {
					d.surveyNo = $("#surveyNo").val();
					d.sampleId = $("#sampleId").val();
					d.allocationStartDate =$("#allocationStartDate").val();
					d.allocationEndDate = $("#allocationEndDate").val();
					d.regionId =$("#regionId").val();
					 
				}
		},
		"dataSrc": "",
		"columns":[
			{"data":"sNo"},
			{"data":"surveyNo"},
			{"data":"sampleId"},
			{"data":"allocationDate"},
			{"data":"rustType"},
			{"data":"sampleCollectedOn"},
			{"data":"region"},
			{"data":"zone"},
			{"data":"woreda"},
			{"data":"kebel"},
			{"data":"action"}
			
		]
	})
	});
</script>
                              <br>
                              
                              <c:if test="${ShowDiv eq true}" >
                                <div  style="display:none;" class="form-group row pad-ver" id="researchId">
                              <label class="col-12 col-md-1 col-xl-1 control-label">Remark<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-4 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                 
                                 </div>
                              </div>
                           </div>
                           
                           
                           <div style="display:none;" class="form-group">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnSubmitId">Submit</button>
                                 <button class="btn btn-danger mb-1" type="button" onclick="location.reload()" >Reset</button>
                              </div>
                           </div>
                              </c:if>
                             
       
                           
                           
                          
                        </div>
                       
                        <div class="container">
  <h2></h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1" style="display:none;" id="modelclick"></button>

  <!-- Modal -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Dump Sample</h4>
        </div>
        <div class="modal-body">
        <b>Survey No : <span id="surveyNo1"></span></b><br>
        <b>Sample Id : <span id="sampleId1"></span></b><br>
        <b>Remark</b>
           <textarea class="form-control" rows="1" cols="4" maxlength="100" id="remark"></textarea><div id="charNum">Maximum 200 characters</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-success"  id="submitbtn">Submit</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal" id="submitbtn">Cancel</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
         
         var spanId;
         var survey;
         var sampleid;
         $(document).ready(function()
        		 {
         
        	 
        	 
        	 var text_max1 = 200;
        	 $('#charNum').html('Maximum characters :' + text_max1);

        	 $('#remark').keyup(function() {
        	     var text_length = $('#remark').val().length;
        	     var text_remaining = text_max1 - text_length;

        	     $('#charNum').html('Maximum characters :' + text_remaining);
        	 });
        	   
        	 
        	 //$(this).closest('td').find('span').html();
        	 
        	 
        	 $("#submitbtn").click(function(){
					 
					 
						
					 
						var surveyDetaArr = [];
						var check = true;
	              
	                
	                
					 
					
					if($("#remark").val().trim() == '')
						{
						$("#remark").focus();
						 swal(
		        					'Error!',
		        					'Please provide the remark.',
		        					'error'
		        				)
		        				return false;
						}
	               
			                var json = {};
			                json.SampleId = spanId;
			                 json.Remarks = $("#remark").val();
		                	surveyDetaArr.push(json);
		              
					  
				    swal({
			         		title: 'Do you want to Submit?',
			         		  type: 'warning',
			         		  showCancelButton: true,
			         		  confirmButtonText: 'Yes',
			         		  cancelButtonText: 'No',
			        	    }).then((result) => {
		    					if (result.value) {
		    						$.ajax({ 
		    						    url:"dumpSampleTagDetails",    
		    						    type:"POST", 
		    						    contentType: "application/json; charset=utf-8",
		    						    data: JSON.stringify(surveyDetaArr),
		    						    async: false,   
		    						    success: function(resposeJsonObject){
		    						    	 
		    						    	swal({
		    	    	 	            	    title: "Samples dumped successfully.",
		    	    	 	            	    text: "",
		    	    	 	            	    type: "success"
		    	    	 	            	}).then(function() {
		    	    	 	            		location.reload();
		    	    	 	            	});
		    						    	 
		    						    	
		    						    }
		    						});
		    			
		    						
		    					} 
		    				})
			        	    		return false; 
				    
				  } );
        	 
        	 
        		 });
         
         
         function dupmRace(obj)
         {
        	 

    		 
    		 var id_ = $(obj).attr('id').split('_')[1];
    		 spanId = $("#spanid"+id_).html();
    		 survey = $("#survey"+id_).html();
    		 sampleid = $("#sampleid"+id_).html();
    		 
    		 swal({
	         		title: 'Do you want to Dump the sample?',
	         		  type: 'warning',
	         		  showCancelButton: true,
	         		  confirmButtonText: 'Yes',
	         		  cancelButtonText: 'No',
	        	    }).then((result) => {
    					if (result.value) {
    					 
    						$("#surveyNo1").html(survey);
    		        		 $("#sampleId1").html(sampleid);
    			$("#remark").val('');
    		 $("#modelclick").click();
    					} 
    				})
    				
    		 return false;
    		 
         }
         function checkSearch()
         {
        
        	 var startDate = $("#allocationStartDate").val();
        	 var endDate =  $("#allocationEndDate").val();
        	 if(startDate.trim() != '' && endDate.trim() == '')
        		 {
        		 $("#allocationEndDate").focus();
        		 swal(
        					'Error!',
        					'Please select Allocation Date To.',
        					'error'
        				)
        				return false;
        		 }
        	 
        	 if(startDate.trim() == '' && endDate.trim() != '')
    		 {
    		 $("#allocationStartDate").focus();
    		 swal(
    					'Error!',
    					'Please select Allocation Date From.',
    					'error'
    				)
    				return false;
    		 }
        	 
        	 

		      if(Date.parse(startDate) > Date.parse(endDate)){
		    	  swal("Error", "Allocation date to  should not be less than Allocation date from", "error");
		        	 $("#dateto").focus();
		            return false;
		    	}
		      
        	 $("#form_").submit();
         }
         
         $(document).on('click', '.viewsurvey', function()
     			{
     		 
     			
     			  //window.location.href="modifySurveyData";
     			   var surveyId = $(this).attr('survey-id');
     			   $("#surveyId1").val(surveyId);
     			   $("#myForm1").submit();

     	 
     			});
      
         
       
       
 							$(document).ready(function(){
 								
 		
 								
 								 
 								
 								
 							    $('#action').on('change', function() {
 							      if ( this.value == '2')
 							      //.....................^.......
 							      {
 							        $("#remark").show();
 							      }
 							      else
 							      {
 							        $("#remark").hide();
 							      }
 							    });

 							   function loadNavigation(pgName, pgId, plinkId, titelBar, strFirstLink, strLastLink) {
 									
 									var pathName = window.location.pathname;
 									var path = pathName.split("/");
 									//var fPath = path[1];
 									//var sPath = path[2];
 									var tlen = path.length;
 									var sPath = path[tlen - 1];
 									var getPath = sPath.split(".");
 									var absPath = getPath[0];
 								   // alert(absPath);
 									if (pgName == absPath) {
 										//alert('0');
 										$('.' + pgId).addClass('active');
 										$('.' + plinkId).addClass('active');
 										//$('#' + lftnavId).addClass('actives');
 										//$('.navigator').addClass(pgId + '-inerBanr');
 										$('#titleHeader').text(titelBar);
 										$('#sFL').text(strFirstLink);
 										if (strLastLink != '') {
 											$('#sSL').html(strLastLink);
 										}
 									}

 								}
 							    
 							});
 							
							</script>
							
							
							 <script language="JavaScript">
							var card = document.getElementById("action")[0].value;
								function validateForm(f) {
								  if (action.value==0) {
								     alert("Please select Action");
								     return false;
								  }
								  else
								     return true;
								}
								function checkData(field) {
			                        	   if(action.value==2 && field.value==="")
			                        		   {
			                        		   alert("Please enter the remark.");
			                        		   }
			                        	 } 
								
								
							</script>
							
							 
							  <script>
							 $(document).ready(function () {
							        loadNavigation('newRegdRequest', 'onboarding', 'cnreq', 'New Request', 'Customer Onboarding', 'Customer Onboarding');


							        var showStatus = '${ShowAlert}';
									if(showStatus == true || showStatus == 'true')
										{
										swal("No records found.");
										}
									var ShowMessage = '${ShowMessage}';
									if(ShowMessage != null && ShowMessage !== '')
										{
										swal({
							         	    title: "Data saved successfully.",
							         	    text: "",
							         	    type: "success"
							         	}).then(function() {
							         		
							         	});
										}
									  });	
							 
							 

							 // set search value
							 
		
		var surveyNo = '${surveyNo}';
		if(surveyNo != undefined && surveyNo != '' && surveyNo != null)
			{
			$("#surveyNo").val(surveyNo);
			}
		
		var sampleId = '${sampleId}';
		if(sampleId != undefined && sampleId != '' && sampleId != null)
			{
			$("#sampleId").val(sampleId);
			}
		
		
		var allocationStartDate = '${allocationStartDate}';
		if(allocationStartDate != undefined && allocationStartDate != '' && allocationStartDate != null)
			{
			$("#allocationStartDate").val(allocationStartDate);
			}
		
		
		var allocationEndDate = '${allocationEndDate}';
		if(allocationEndDate != undefined && allocationEndDate != '' && allocationEndDate != null)
			{
			$("#allocationEndDate").val(allocationEndDate);
			}
		
		
		var regionId = '${regionId}';
		if(regionId != undefined && regionId != '0' && regionId != null)
			{
			$("#regionId").val(regionId);
			}
		
		/* var showStatus = '${ShowAlert}';
		if(showStatus == true || showStatus == 'true')
			{
			swal("No records found.");
			}
		var ShowMessage = '${ShowMessage}';
		if(ShowMessage != null && ShowMessage !== '')
			{
			swal({
         	    title: "Data saved successfully.",
         	    text: "",
         	    type: "success"
         	}).then(function() {
         		
         	});
			} */
							 
							 </script>