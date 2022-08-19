
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
                         <c:if test="${researchCenterTagged ne 'no' }">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="addSurveyDetails">Add</a>
                              <a class="nav-item nav-link active"  href="viewsurveydetails" >View</a>
                           </ul>
                    </c:if>
                    <div class="indicatorslist">
                    <c:if test="${ShowBack eq true }">
							  <a
								title="" href="javascript:void(0)" id="backIcon"
								onclick="history.back()" data-toggle="tooltip"
								data-placement="top" data-original-title="Back"><i
								class="icon-arrow-left1"></i></a>
							</c:if>	
							
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
                        
                        
                          <%-- <form action="viewSurveyDetailsById" autocomplete="off" id="myForm"   method="post"> --%>
                           <form action="" autocomplete="off" id="myForm"   method="post"> 
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                             <input type="text" value="" style="display:none;" name="surveyId" id="surveyId">
                           </form>
                           
                           <c:set value="viewsurvey" var="viewSurveyAction"></c:set>
                           <c:if test="${researchCenterTagged eq 'no' }">
                           <c:set value="viewSurveyDetailsOnPublished" var="viewSurveyAction"></c:set>
                           </c:if>
                           
                           
                           <form action="${viewSurveyAction}" autocomplete="off" id="myForm1"   method="post">
                             
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                             <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
                              <input type="hidden" value="uploadSurveyDataXcelView"  name="r_url" >
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
                                     <c:forEach items="${details}" var="dtls" varStatus="theCount">
                                    <tr >
                                      
                                       <td>${theCount.index + 1 }</td>
                                       <td><a href="javascript:void(0);" class="viewsurvey" survey-id="${dtls.surveyId }">${dtls.surveyNo }</a></td>
                                       <td> ${dtls.surveyDate }</td>
                                       <td>${dtls.wheatType}</td>
                                       <td>${dtls.region }</td>
                                       <td>${dtls.location  }</td>
                                       <td>${dtls.rust  }</td>
                                       <td>${dtls.mode  }</td>
                                       <td>
                                       <c:if test="${dtls.status eq 0 }">
                                       <a class="btn btn-info btn-sm editClass" data-toggle="tooltip editClass" title="" id=" " data-original-title="Edit" survey-id="${dtls.surveyId }"><i class="icon-edit1"></i></a>
                                          <a class="btn btn-danger btn-sm deleteClass" data-toggle="tooltip" title="" id="btnDeleteId" data-original-title="Delete" survey-id="${dtls.surveyId }"><i class="icon-trash-21"></i></a>
                                          
                                          </c:if>
                                       </td>
                                    </tr>
                                    </c:forEach>
                                    
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
        	 var rcTagged = '${researchCenterTagged}';
   		  //window.location.href="modifySurveyData";
   		   var surveyId = $(this).attr('survey-id');
   		   $("#surveyId").val(surveyId);
   		if(rcTagged == "yes"){
   			   $('#myForm').attr('action', 'viewSurveyDetailsById');
   		}else{
   		 $('#myForm').attr('action', 'viewSurveyDetailsByIdEiar');
   		}
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
	
	
	
	
	$('#viewTable').DataTable( {
		"pagingType": "full_numbers",
        dom: 'Bfrtip',		
        buttons: [
            'print'
        ]
    } );
	
	 
	 
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
</script>