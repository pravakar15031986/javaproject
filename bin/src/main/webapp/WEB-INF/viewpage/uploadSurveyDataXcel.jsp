<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	
<script type="text/javascript" src="./js/html5lightbox.js"></script>

<style> 
.thumbimg{border: 1px solid #d5d5d5;display: block;border-radius: 3px;}
.thumbimg img{width:100%;border-radius: 3px;}
</style>
	
	
	
	
	
	
	
	<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Upload Survey Data</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Survey</li>
                           <li class="breadcrumb-item active" aria-current="page">Import Survey Details</li>
                        </ol>
                     </nav>
                  </div>
      
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                            <a class="nav-item nav-link 	active"  href="uploadSurveyDataXcel">Add</a>
                              <a class="nav-item nav-link"  href="uploadSurveyDataXcelView">View</a>
                           </ul>
                           
                        </div>
                        
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <form action="#" autocomplete="off" name="myForm" id="fileUploadForm" onsubmit="return false">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        
                        <div class="card-body">
                            <div class="form-group row">
                            
                                     </div>
                              
                          <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">
                             Upload Survey Data <span class="text-danger">*</span>
                              </label>
                               <div class="col-sm-3" >
                                  <input type="file" id="demo-text-input1" name="file" class="form-control" placeholder="" >
                                </div>
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">
                             Download sample survey excel
                              </label>
                              <label class="col-12 col-md-1 col-xl-1">
                                <a  title="" href="downloadSurveyorSampleExcel" id="downloadIcon"  class="download" data-toggle="tooltip" data-placement="top" data-original-title="Download"><i class="icon-download1"></i></a>
                              </label>
                              
	                         <div class="col-12 col-md-4 col-xl-4">              	
	                          <div class="rightlist" for="demo-text-input">
	                         	 <ul>
	                         	   <li>Before upload, try to download the latest survey excel.</li>
	                         	   <li>File type accepts only XLS and XLSX</li>
	                         	   <li>Max file Size accept 5MB</li>
	                         	   <li>Record limit 200</li>
	                            </ul>
	                          </div>
	                         </div> 
	                           
                           
                         </div>
                                     
                                     
                   
                           
							<hr>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                  <button class="btn btn-primary mb-1" id="btnSubmitId" type="submit">Upload</button> 
                                 <button class="btn btn-danger mb-1" id="resetId" type="reset" >Reset</button>
                              </div>
                              
                           </div> 
                           
                           
                           
                           
                           
                             <div id="sucerror" style="display:none;">
                           
                             <div class="card-body" id="successdiv">
                              <h3>Valid Data</h3>
                           <div class="table-scrool">  
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="success">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Survey Date</th>
                                       <th>Type of Wheat</th>
                                       <th>Region</th>
                                       <th>Location Details</th>
                                       <th style="display:none;"></th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                     
                                 </tbody>
                              </table>
                           </div>
                           </div>
                          
                          
                          
                        <input type="button" value="Submit" id="sSubmit" class="btn btn-success">
                        </div>
                        
                        <hr>
                         
                        <div class="card-body" id="errordiv">
                         <h3>Invalid Data</h3>
                        
                        
                         <div class="table-scrool">  
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="error">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Survey Date</th>
                                       <th>Type of Wheat</th>
                                       <th>Region</th>
                                       <th>Location Details</th>
                                       <th>Reason</th>
                                       <th>Row No</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                     
                                 </tbody>
                              </table>
                              
                           </div>
                          </div>
                          <input type="button" value="Download Excel" id="eSubmit" class="btn btn-success" >
                          
                        </div>
                       
                        
                            </div>
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           </div>
                            </form>
                           <form action="public/downloadExcel" id="form1" method="get" style="display:none;">
                        
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        <input type="text" id="fileName" name="path" value="" style="display:none;">
                        </form> 
                            
                        
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
            </div>
            
            
            <script type="text/javascript">
            
            var myVar;
            var cou = 0;
            function myTimer() {
            	
            	if(cou == 0)
            		{
            		 $.blockUI({ message: ' <span style="height:40px;"> Loading, Please wait...</span>' });
            		}
            	if(cou == 1)
            		{
            		
            		
            		 var rowCount = $('#success tr').length;
            		 var arr = new Array();
            		 if(rowCount > 1)
            			 {
            			
            				for(i=1;i<rowCount;i++)
         			 		{
         			 			var cellV = document.getElementById("id_"+i).innerHTML;
         			 			arr.push(cellV);
         			 		}
            				
            				
            				// ajax 
            				
            			 
            				
            				var dataString = 'surveyData='+ btoa(JSON.stringify(arr));
            				 $.ajax({
            				 	type: "POST",
            		            url : 'saveSurveyDetailsSingle',
            		            data: dataString,
            					cache: false,
            					async:false,
            		            success : function(data) { 
            		            	$("#successdiv").hide();
            		            	swal(data);
            		            	 $("#success").find("tr:gt(0)").remove();
            		            	 $("#demo-text-input1").val('');
            		            	 $.unblockUI();
            		            },
            					  error : function(e) {
            						console.log("ERROR: ", e);
            						
            						 $.unblockUI();
            					},
            					done : function(e) {
            						console.log("DONE");
            						 $.unblockUI();
            					}
            		        });
            				 
            				 
         			  
            			 }
            		 else
            			 {
            			 swal("No data found in Sucess table.");
            			 }
            			  
            		 
            		
            		cou++;
            		}
            	cou++;
            	
            	}
     $(document).ready(function(){
    	 
    	 $("#eSubmit").click(function()
    			 {
    		 		
    		 		$("#form1").submit();
    			 });
    	 
    	 
    	 
    	 $("#sSubmit").click(function()
    			 {
    		 cou=0;
    		 myVar = setInterval(myTimer, 1000)
    		 
    		 
    		
    		 
    			 });
    	 
     });
     </script>
     <script>
     $("#sSubmit").prop("disabled", true);
 		$("#eSubmit").prop("disabled", true);
      	$(document).ready(function()
      			{
      			$("#btnSubmitId").click(function()
      					{
      				
      					if($("#demo-text-input1").val().trim() == '')
      						{
      						swal('Please provide the excel.');
      						return false;
      						}
      				fire_ajax_submit();
      					});
      			
      			$("#resetId").click(function()
      					{
      				$("#btnSubmitId").prop("disabled", false);
      				$("#sSubmit").prop("disabled", true);
      		  		$("#eSubmit").prop("disabled", true);
      		  		
      		  	   $("#success").find("tr:gt(0)").remove();
      		  	   $("#error").find("tr:gt(0)").remove();
      		  	 $("#sucerror").hide();
      				
      					});
      			});
      	

 	function fire_ajax_submit() {

      	    // Get form
      	    $("#btnSubmitId").prop("disabled", false);
      				$("#sSubmit").prop("disabled", true);
      		  		$("#eSubmit").prop("disabled", true);
      		  		
      		  	   $("#success").find("tr:gt(0)").remove();
      		  	   $("#error").find("tr:gt(0)").remove();
      		  	 $("#sucerror").hide();
      		  	 
      	    
      	    var form = $('#fileUploadForm')[0];
			var chld = $('#demo-text-input1')[0];
      	  FileUploadPath = chld.value;
	 		var Extension = FileUploadPath.substring(
                  FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

			//The file uploaded is an image
			
			if ( !(Extension == "xls"  
			                  || Extension == "xlsx" )) {
				$('#demo-text-input1').val('');
				$('#demo-text-input1').focus();
				swal(
						'Error!',
						'File type should be  XLS or XLSX. ',
						'error'
					) 
					return false;
				
				}
			 
			
			
			var filesize = ((chld.files[0].size/1024)/1024).toFixed(4); 
			if(filesize > 5.0)
				 {
				$('#demo-text-input1').val('');
				$('#demo-text-input1').focus();
				 swal(
						'Error!',
						'File size should not exceed 5MB. ',
						'error'
					) 
					return false;
				 }
			
			
			
				 		
				 		
			$("#errordiv").hide();
          	$("#successdiv").hide();
      	    var data = new FormData(form);

      	    //data.append("CustomField", "This is some extra data, testing");

      	    

      	    $.ajax({
      	        type: "POST",
      	        enctype: 'multipart/form-data',
      	        url: "surveyExcelUpload",
      	        data: data,
      	        //http://api.jquery.com/jQuery.ajax/
      	        //https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects
      	        processData: false, //prevent jQuery from automatically transforming the data into a query string
      	        contentType: false,
      	        cache: false,
      	        timeout: 600000,
      	        success: function (data) {
      	        	$("#btnSubmit").prop("disabled", false);
      	            var jsa = JSON.parse(data);
      	            var success = "";
      	            var error = "";
      	           var is = 0;
      	           var ie = 0;
      	           
      	      
   		  		
      	            for(i=0;i<jsa.length;i++)
      	            	{
      	            	var json = jsa[i];
      	            	if(json.IsEmpty == true)
      	            		{
      	            		$('#demo-text-input1').val('');
      	  				$('#demo-text-input1').focus();
      	  			 $("#sucerror").hide();
      	            		swal(
      	      					'',
      	      					'No record found in excel.',
      	      					'warning'
      	      				)
      	            		return false;
      	            		}
      	            	if(json.IsFileExtValid == false)
  	            		{
      	            		$("#sucerror").hide();
      	            		$('#demo-text-input1').val('');
      	  				$('#demo-text-input1').focus();
  	            		swal(
  	      					'',
  	      					'File type should be  XLS or XLSX.',
  	      					'warning'
  	      				)
  	            		return false;
  	            		}
      	            	
      	            	if(json.IsFileSizeExceed == true)
  	            		{
      	            		$("#sucerror").hide();
      	            		$('#demo-text-input1').val('');
      	  				$('#demo-text-input1').focus();
  	            		swal(
  	      					'',
  	      					'File size should not exceed 5MB.',
  	      					'warning'
  	      				)
  	            		return false;
  	            		}
      	            	
      	            	
      	            	 $("#sucerror").show();
      	            	if ('Error' in json){
      	            	  $("#errordiv").show();
      	            	  
      	            	$("#fileName").val((json.FileName).trim());
      	     		  		$("#eSubmit").prop("disabled", false);
      	            		var surveyDate = ('surveyDateId' in json)?json.surveyDateId:'';
      	            		var wheatName = ('siteInformation' in json)?json.siteInformation.WheatTypeName:'';
      	            		var region = ('RegionName' in json)?json.RegionName:'';
      	            		var woreda = ('WoredaName' in json)?json.WoredaName:'';
      	            		var kebele = ('KebeleName' in json)?json.KebeleName:'';
      	            		
      	            		surveyDate = (surveyDate == '' || surveyDate == undefined || surveyDate == null)?'NA':surveyDate;
      	            		wheatName = (wheatName == '' || wheatName == undefined || wheatName == null)?'NA':wheatName;
      	            		region = (region == '' || region == undefined || region == null)?'NA':region;
      	            		woreda = (woreda == '' || woreda == undefined || woreda == null)?'NA':woreda;
      	            		kebele = (kebele == '' || kebele == undefined || kebele == null)?'NA':kebele;
      	            		var slno = ('SlNo' in json)?json.SlNo:'NA';
      	            		var reason = json.Message;
      	            		
      	            		var tbl_ = "<tr><td>"+slno+"</td><td>"+surveyDate+"</td><td>"+wheatName+"</td><td>"+region+"</td><td>"+ woreda+" , "+ kebele +"</td><td style='color:#e67e22'>"+reason+"</td><td>"+json.RowNo+"</td></tr>";
      	            	ie++;
      	            		$("#error").append(tbl_);
      	            		
      	            	}
      	            	else
      	            		{
      	            		$("#successdiv").show();
      	            		 $("#sSubmit").prop("disabled", false);
      	            		var surveyDate = json.surveyDateId;
      	            		var wheatName = json.siteInformation.WheatTypeName;
      	            		var region = json.RegionName;
      	            		var woreda = json.WoredaName;
      	            		var kebele = json.KebeleName;
      	            		
      	            		surveyDate = (surveyDate == '' || surveyDate == undefined || surveyDate == null)?'NA':surveyDate;
      	            		wheatName = (wheatName == '' || wheatName == undefined || wheatName == null)?'NA':wheatName;
      	            		region = (region == '' || region == undefined || region == null)?'NA':region;
      	            		woreda = (woreda == '' || woreda == undefined || woreda == null)?'NA':woreda;
      	            		kebele = (kebele == '' || kebele == undefined || kebele == null)?'NA':kebele;
      	            		
      	            		
      	            		var tbl_ = "<tr><td>"+json.SlNo+"</td><td>"+surveyDate+"</td><td>"+wheatName+"</td><td>"+region+"</td><td>"+ woreda+" , "+ kebele +"</td><td style='display:none;'><span id='id_"+(is+1)+"'>"+btoa(JSON.stringify(json))+"</span></td></tr>";
      	            		is++;
      	            		$("#success").append(tbl_);
      	            		}
      	            	}
      	            
   		  	$("#demo-text-input1").val('');
					
      	            
      	        },
      	        error: function (e) {

      	            $("#result").text(e.responseText);
      	            console.log("ERROR : ", e);
      	            $("#btnSubmit").prop("disabled", false);
      	          //$("#fileUploadForm").reset();
      	          $("#demo-text-input1").val('');

      	        }
      	    });

      	}
      	
      </script>