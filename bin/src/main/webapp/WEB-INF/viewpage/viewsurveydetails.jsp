
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	
	 
	
	
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Survey Details</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item active" aria-current="page">Manage Survey</li>
                           <li class="breadcrumb-item">Survey Details</li>
                        </ol>
                     </nav>
                  </div>
             
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="addSurveyDetails">Add</a>
                              <a class="nav-item nav-link active"  href="viewsurveydetails" >View</a>
                           </ul>
                    
                    <div class="indicatorslist">
                    <c:if test="${ShowBack eq true }">
							  <a
								title="" href="javascript:void(0)" id="backIcon"
								onclick="history.back()" data-toggle="tooltip"
								data-placement="top" data-original-title="Back"><i
								class="icon-arrow-left1"></i></a>
							</c:if>	
							
						</div>
						  <div class="indicatorslist">
						  
						   <form action="downloadSurveyPDF" target="_blank" id="pdfform" autocomplete="off"   method="post" class="noload" style="float:left;">
                          
<%-- <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/> --%>

                           <input type="text" style="display: none;"  name="regionIdPDF" id="regionIdPDF">
                           <input type="text" style="display: none;"  name="zoneIdPDF" id="zoneIdPDF">
                           <input type="text" style="display: none;" name="woredaIdPDF" id="woredaIdPDF">
                           <input type="text" style="display: none;" name="kebeleIdPDF" id="kebeleIdPDF">
                           <input type="text" style="display: none;" name="startDatePDF" id="startDatePDF">
                           <input type="text" style="display: none;" name="endDatePDF" id="endDatePDF">
                           <input type="text" style="display: none;" id="surveyNoPDF" name="surveyNoPDF">
                           <input type="text" style="display: none;" id="rustTypeIdPDF" name="rustTypeIdPDF">
						   <button type="button" id="pdfdownload" class="btn btn-outline-success btn-sm shadow-none" ><i class="icon-printer1"></i></button>
						  </form>
						  
						  <form action="downloadSurveyExcelFormat" autocomplete="off"   method="post" class="noload" style="float:left;">
                          
<%-- <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/> --%>

                           <input type="text" style="display: none;"  name="regionIdExcel" id="regionIdExcel">
                           <input type="text" style="display: none;"  name="zoneIdExcel" id="zoneIdExcel">
                           <input type="text" style="display: none;" name="woredaIdExcel" id="woredaIdExcel">
                           <input type="text" style="display: none;" name="kebeleIdExcel" id="kebeleIdExcel">
                           <input type="text" style="display: none;" name="startDateExcel" id="startDateExcel">
                           <input type="text" style="display: none;" name="endDateExcel" id="endDateExcel">
                           <input type="text" style="display: none;" id="surveyNoExcel" name="surveyNoExcel">
                           <input type="text" style="display: none;" id="rustTypeIdExcel" name="rustTypeIdExcel">
						   <button type="submit" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-excel-file"></i></button>
						  </form>
						  
						  
						 
                         </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                        <form action="searchSurveyDetails" autocomplete="off"   method="post">
                          <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                           <div class="search-sec"> 
                                   <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Region Name</label>
                                    <div class="col-lg-3">
                                        <select class="form-control"  name="regionId" id="regionId">
                                     <option value="-1">--Select--</option>
                                    
                                    <c:forEach items="${DemographList}" var="demographList">
                                   <option value="${ demographList[0]}">${ demographList[1]}</option>
                                    </c:forEach>
                                 </select>
                                    </div>
                                    <label class="col-lg-2 ">Zone Name</label>
                                    <div class="col-lg-3">
                                       <select class="form-control" name="zoneId" id="zoneId">
                                   <option value="-1">--Select--</option>
                                    </select>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                              <div class="row">
                               <label class="col-lg-2 ">Woreda Name</label>
                                    <div class="col-lg-3">
                                    <select class="form-control" name="woredaId" id="woredaId">
                                      <option value="-1">--Select--</option>
                                      </select>
                                    </div>
                               <label class="col-lg-2 ">Kebele Name</label>
                                    <div class="col-lg-3">
                                       <select class="form-control" name="kebeleId" id="kebeleId">
                                         <option value="-1">--Select--</option>
                                       </select>
                                    </div>
                              </div>
                              </div>
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Survey Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" data-date-end-date="0d"  aria-label="Default" aria-describedby="inputGroup-sizing-default"  name="startDate" id="startDate">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Survey Date To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default"  name="endDate" id="endDate">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                              	</div>
                              </div>
                              <div class="form-group">
                                 <div class="row">
                               <label class="col-lg-2 ">Survey No.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control"  placeholder="" data-bv-field="fullName" id="surveyNo" name="surveyNo">
                                    </div>
                                    <label class="col-sm-2 ">Type of Rust</label>
                                    <div class="col-sm-3">
										<select class="form-control" id="rustTypeId" name="rustTypeId">
											<option value="-1">--select--</option>
											<c:forEach items="${RustTypeList}" var="rustTypeList">
												<option value="${ rustTypeList.intRustTypeId}">${ rustTypeList.vchRustType}</option>
											</c:forEach>
										</select>
									</div>
                                     <div class="col-lg-2">
                                       <button type="submit" onclick="return checkSearch()" class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                                 </div>
                              </div>
                      
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                           </form>
                        </div>
                        
                        
                          <form action="viewSurveyDetailsById" autocomplete="off" id="myForm"   method="post">
                             
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                             <input type="text" value="" style="display:none;" name="surveyId" id="surveyId">
                           </form>
                           
                           <form action="viewsurvey" autocomplete="off" id="myForm1"   method="post">
                          
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                             <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
                           </form>
                           
                           
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                                 <thead>
                                    <tr>
                                    
                                       <th width="40px">Sl#</th>
                                       <th>Survey No.</th>
                                       <th>Survey Date</th>
                                       <th>Type of Wheat</th>
                                       <th>Region</th>
                                       <th>Location Details</th>
                                       <th>Type of Rust</th>
                                       <th>Mode</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    
                                    
                                 </tbody>
                              </table>
                           </div>
                          
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
         
     
     	
     	 
         
         
         
         
         function checkSearch()
         {
        	
        	 var startDate = $("#startDate").val();
        	 var endDate =  $("#endDate").val();
        	 if(startDate.trim() != '' && endDate.trim() == '')
        		 {
        		 $("#endDate").focus();
        		 swal(
        					'Error!',
        					'Please select Survey Date To.',
        					'error'
        				)
        				return false;
        		 }
        	 
        	 if(startDate.trim() == '' && endDate.trim() != '')
    		 {
    		 $("#startDate").focus();
    		 swal(
    					'Error!',
    					'Please select Survey Date From.',
    					'error'
    				)
    				return false;
    		 }
        	 
        	 

		      if(Date.parse(startDate) > Date.parse(endDate)){
		    	  swal("Error", "Survey date to  should not be less than Survey date from", "error");
		        	 $("#dateto").focus();
		            return false;
		    	}
		      
        	 
         }
         
         $(document).on('click', '.viewsurvey', function()
        			{
        		 
        			
        			  //window.location.href="modifySurveyData";
        			   var surveyId = $(this).attr('survey-id');
        			   $("#surveyId1").val(surveyId);
        			   $("#myForm1").submit();

        	 
        			});
         
         $(document).on('click', '.editClass', function()
     			{
        		
   		  //window.location.href="modifySurveyData";
   		   var surveyId = $(this).attr('survey-id');
   		   $("#surveyId").val(surveyId);
   		   $("#myForm").submit();
	
	});
         
         $(document).on('click', '.deleteClass', function()
      			{
    		 var surveyId = $(this).attr('survey-id');
    		swal({
        		title: ' Do you want to delete?',
        		  type: 'warning',
        		  showCancelButton: true,
        		  confirmButtonText: 'Yes',
        		  cancelButtonText: 'No',
        		  confirmButtonColor: '#d33',
        		  /* reverseButtons: true */
    	    }).then((result) => {
    	    	  if (result.value) { 
    	    		  
    	    		  var dataString = 'surveyId='+ surveyId;
    	 			 $.ajax({
    	 			 	type: "POST",
    	 	            url : 'deleteSurveyDetails',
    	 	            data: dataString,
    	 				cache: false,
    	 	            success : function(data) {
    	 	            	swal({
    	 	            	    title: "Deleted successfully.",
    	 	            	    text: "",
    	 	            	    type: "success"
    	 	            	}).then(function() {
    	 	            		location.reload();
    	 	            	});
    	 	            	 
    	 	            },
    	 				  error : function(e) {
    	 					console.log("ERROR: ", e);
    	 				},
    	 				done : function(e) {
    	 					console.log("DONE");
    	 				}
    	 	        });
    	    		  
    	    		  
    	    		 
    	    		  }
    	    		})  
    	    		return false;
    	});
         
         
$(document).ready(function(){
	
	

	$(".search-sec").hide();
	
	var regionId = '${regionId}';
	var zoneId = '${zoneId}';
	var woredaId = '${woredaId}';
	var kebeleId = '${kebeleId}';
	var rustTypeId = '${rustTypeId}';

	if(regionId != -1 && regionId != '')
	{
	$("#regionId").val(regionId);
	
	

		
		var val_ = regionId;
		
	   	 var dataString = 'parentId='+ val_;
		 $.ajax({
		 	type: "POST",
           url : 'getDemographicListZone',
           data: dataString,
           async:false,
			cache: false,
           success : function(data) {  
           	$("#zoneId").val("-1");
           	$("#zoneId").find('option').not(':first').remove();
           	$("#woredaId").val("-1");
        	$("#woredaId").find('option').not(':first').remove();
           	$("#kebeleId").val("-1"); 
        	$("#kebeleId").find('option').not(':first').remove();
               var html = '<option value="-1">-Select -</option>';
				var len = data.length;
			if (data.length != 0 ){
				for ( var i = 0; i < len; i++) {
				
					html += '<option value="' + data[i][0] + '">'
							+ data[i][1] + '</option>';
				}
          	    $('#zoneId').html(html); 
			}else{
			 var html = '<option value="-1">-Select -</option>';
			 $('#zoneId').html(html); 
			}
				  
           },
			  error : function(e) {
				console.log("ERROR: ", e);
			},
			done : function(e) {
				console.log("DONE");
			}
       });
	   		
 
	
	$(".search-sec").show();
	}


	if(zoneId != -1  && zoneId != '')
	{
	$("#zoneId").val(zoneId);
	

		
		var val_ = zoneId;
		 

   		
   		
   	 var dataString = {"regionId": $('#regionId').val(),"zoneId": val_};
	 $.ajax({
	 	type: "POST",
        url : 'getDemographicListWoreda',
        data: btoa(JSON.stringify(dataString)),
        contentType: "text/xml", 
		cache: false,
		async:false,
        success : function(data) {  	
        	$("#woredaId").val("-1");
        	$("#woredaId").find('option').not(':first').remove();
        	$("#kebeleId").val("-1");
        	$("#kebeleId").find('option').not(':first').remove();
            var html = '<option value="-1">-Select -</option>';
			var len = data.length;
		if (data.length != 0 ){
			for ( var i = 0; i < len; i++) {
			
				html += '<option value="' + data[i][0] + '">'
						+ data[i][1] + '</option>';
			}
       	    $('#woredaId').html(html); 
		}else{
		 var html = '<option value="-1">-Select -</option>';
		 $('#woredaId').html(html); 
		}
			  
        },
		  error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
    });
	 
	
	$(".search-sec").show();
	}

	if(woredaId != -1 && woredaId != '')
	{
		
	$("#woredaId").val(woredaId);

		
		var val_ = woredaId;
		 
		
		
	   	 var dataString = {"regionId": $('#regionId').val(),"woredaId": val_,"zoneId":$("#zoneId").val()};
		 $.ajax({
		 	type: "POST",
           url : 'getDemographicListKebele',
           data: btoa(JSON.stringify(dataString)),
           contentType: "text/xml", 
			cache: false,
			async:false,
           success : function(data) {
           	$("#kebeleId").val("-1");
           	$("#kebeleId").find('option').not(':first').remove();
               var html = '<option value="-1">-Select -</option>';
				var len = data.length;
			if (data.length != 0 ){
				for ( var i = 0; i < len; i++) {
				
					html += '<option value="' + data[i].demographyId + '">'
							+ data[i].demographyName + '</option>';
				}
          	    $('#kebeleId').html(html); 
			}else{
			 var html = '<option value="-1">-Select -</option>';
			 $('#kebeleId').html(html); 
			}
				  
           },
			  error : function(e) {
				console.log("ERROR: ", e);
			},
			done : function(e) {
				console.log("DONE");
			}
       });
	$(".search-sec").show();
	}


	if(kebeleId != -1 && kebeleId != '')
	{
	$("#kebeleId").val(kebeleId);
	$(".search-sec").show();
	}



	if(rustTypeId != -1 && rustTypeId != '')
	{
	$("#rustTypeId").val(rustTypeId);
	$(".search-sec").show();
	}





	var startDate = '${startDate}';
	var endDate = '${endDate}';
	var surveyNo = '${surveyNo}';
	 if(surveyNo != '')
		 {
		 $("#surveyNo").val(surveyNo);
		 $(".search-sec").show();
		 }
	 if(startDate != '')
		 {
		 $("#startDate").val(startDate);
		 $(".search-sec").show();
		 }
	 if(endDate != '')
		 {
		 $("#endDate").val(endDate);
		 $(".search-sec").show();
		 }

	 


	 
	
	
	$("#regionId").change(function()
   			{
   		
   		var val_ = $(this).val();
   		
   	 var dataString = 'parentId='+ val_;
	 $.ajax({
	 	type: "POST",
        url : 'getDemographicListZone',
        data: dataString,
        async:false,
		cache: false,
        success : function(data) {  
        	$("#zoneId").val("-1");
        	$("#zoneId").find('option').not(':first').remove();
        	$("#woredaId").val("-1");
        	$("#woredaId").find('option').not(':first').remove();
        	$("#kebeleId").val("-1");
        	$("#kebeleId").find('option').not(':first').remove();
            var html = '<option value="-1">-Select -</option>';
			var len = data.length;
		if (data.length != 0 ){
			for ( var i = 0; i < len; i++) {
			
				html += '<option value="' + data[i][0] + '">'
						+ data[i][1] + '</option>';
			}
       	    $('#zoneId').html(html); 
		}else{
		 var html = '<option value="-1">-Select -</option>';
		 $('#zoneId').html(html); 
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
	
	
	
	
	$("#zoneId").change(function()
   			{
   		
   		var val_ = $(this).val();
   		 
   		
   	 var dataString = {"regionId": $('#regionId').val(),"zoneId": val_};
	 $.ajax({
	 	type: "POST",
        url : 'getDemographicListWoreda',
        data: btoa(JSON.stringify(dataString)),
        contentType: "text/xml", 
		cache: false,
		async:false,
        success : function(data) {  	
        	$("#woredaId").val("-1");
        	$("#woredaId").find('option').not(':first').remove();
        	$("#kebeleId").val("-1");
        	$("#kebeleId").find('option').not(':first').remove();
            var html = '<option value="-1">-Select -</option>';
			var len = data.length;
		if (data.length != 0 ){
			for ( var i = 0; i < len; i++) {
			
				html += '<option value="' + data[i][0] + '">'
						+ data[i][1] + '</option>';
			}
       	    $('#woredaId').html(html); 
		}else{
		 var html = '<option value="-1">-Select -</option>';
		 $('#woredaId').html(html); 
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
	
	
	
	
	
	
	$("#woredaId").change(function()
   			{
   		
   		var val_ = $(this).val();
   		 
   		
   	 var dataString = {"regionId": $('#regionId').val(),"woredaId": val_,"zoneId":$("#zoneId").val()};
	 $.ajax({
	 	type: "POST",
        url : 'getDemographicListKebele',
        data: btoa(JSON.stringify(dataString)),
        contentType: "text/xml", 
		cache: false,
		async:false,
        success : function(data) {
        	$("#kebeleId").val("-1");
        	$("#kebeleId").find('option').not(':first').remove();
            var html = '<option value="-1">-Select -</option>';
			var len = data.length;
		if (data.length != 0 ){
			for ( var i = 0; i < len; i++) {
			
				html += '<option value="' + data[i].demographyId + '">'
						+ data[i].demographyName + '</option>';
			}
       	    $('#kebeleId').html(html); 
		}else{
		 var html = '<option value="-1">-Select -</option>';
		 $('#kebeleId').html(html); 
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
	
	
	
	
	
	 
	 $("#btnSubmitId").click(function(){
		 
		 if(confirm("Do you want to Submit?")){
			 window.location.href="viewpage";
		 }else{
		   return false;
		}
			  
	});
	 

	
	var sNo = '${sNo}';
	if(sNo != null && sNo != '')
		{
		
		swal("Success", sNo, "success");
		}
  
});

$(function() {

	
		$("#viewTable").DataTable({
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
          "ordering": false, 
			 "ajax" : {
					"url" : "filterSurveyViewDatatable",
					"data" : function(d) {
						d.zoneId = $("#zoneId").val();
						d.regionId = $("#regionId").val();
						d.woredaId =$("#woredaId").val();
						d.kebeleId = $("#kebeleId").val();
						d.startDate =$("#startDate").val();
						d.endDate = $("#endDate").val();
						d.surveyNo = $("#surveyNo").val();
						d.rustTypeId = $("#rustTypeId").val();
					}
			},
			"dataSrc": "",
			"columns":[
				{"data":"sNo"},
				{"data":"surveyNo"},
				{"data":"surveyDate"},
				{"data":"wheatType"},
				{"data":"region"},
				{"data":"location"},
				{"data":"rust"},
				{"data":"mode"},
				{"data":"action"}
				
				
			]
		})
	
});	



</script>
<script>
$(document).ready(function()
{
	$("#regionIdExcel").val($("#regionId").val());
	$("#zoneIdExcel").val($("#zoneId").val());
	$("#woredaIdExcel").val($("#woredaId").val());
	$("#kebeleIdExcel").val($("#kebeleId").val());
	$("#startDateExcel").val($("#startDate").val());
	$("#endDateExcel").val($("#endDate").val());
	$("#surveyNoExcel").val($("#surveyNo").val());
	$("#rustTypeIdExcel").val($("#rustTypeId").val());
	
	$("#pdfdownload").click(function()
			{
		$("#regionIdPDF").val($("#regionId").val());
		$("#zoneIdPDF").val($("#zoneId").val());
		$("#woredaIdPDF").val($("#woredaId").val());
		$("#kebeleIdPDF").val($("#kebeleId").val());
		$("#startDatePDF").val($("#startDate").val());
		$("#endDatePDF").val($("#endDate").val());
		$("#surveyNoPDF").val($("#surveyNo").val());
		$("#rustTypeIdPDF").val($("#rustTypeId").val());
		$("#pdfform").submit();
			});
		
});


</script>