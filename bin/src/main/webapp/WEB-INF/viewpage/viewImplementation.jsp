<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<style>
.fa-file-pdf-o {
	color: red;
}
</style>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Recommendation Survey</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Monitor Implementation</li>
                           <li class="breadcrumb-item active" aria-current="page">Recommendation Survey</li>
                        </ol>
                     </nav>
                  </div>
      
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                               <a class="nav-item nav-link "  href="woredaExpertImplementation">Add</a>
                                <a class="nav-item nav-link active"  href="viewImplementation">View</a>
                           </ul>
                           <div class="indicatorslist">
                           </div>
                        </div>
                        <!-- Search Panel -->
                         <div class="search-container">
                           <div class="search-sec">
                           <form action="searchImplementation" autocomplete="off"   method="post" >
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                           
                                   <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Region</label>
                                    <div class="col-lg-3">
                                     <select class="form-control"  id="regionId" name="regionId">
                                     <option value="-1">--Select--</option>
                                     <c:forEach items="${DemographList}" var="demographList">
                                     <c:choose>
                                     	<c:when test="${demographList[0] eq regionId}">
                                     	<option value="${ demographList[0]}" selected="selected" >${ demographList[1]}</option>
                                     	</c:when>
                                     	<c:otherwise>
												<option value="${ demographList[0]}">${ demographList[1]}</option>
                                     	</c:otherwise>
                                     </c:choose>
                                     
                                    </c:forEach>
                                    </select>
                                    </div>
                                  <label class="col-lg-2 ">Zone</label>
                                    <div class="col-lg-3">
                                      <select class="form-control" id="zoneId" name="zoneId">
                                    <option value="-1">--Select--</option>
                                    
                                    </select>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                              <div class="row">
                               <label class="col-lg-2 ">Monitor Ref No.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" id="monitorNo" name="monitorNo" placeholder="" data-bv-field="fullName" value='${monitorNo}'>
                                    </div>
                                <label class="col-lg-2 ">Monitor Created Date</label>
                                <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="monitordate" name="monitordate" value='${monitordate}'>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                  </div>
                               
                                 
                                   <div class="col-lg-2">
                                       <button class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
                                    </div>
                              </div>
                              </div>
                           
                             
                      </form>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        <form action="viewMonitorDetailsById" autocomplete="off" id="myForm"   method="post">
                            
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                             <input type="text" value="" style="display:none;" name="monitorId" id="monitorId">
                          </form> 
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewImplementationId">
                                 <thead>
                                     <tr>
                                       <th rowspan="2">Sl#</th>
                                       <th rowspan="2">Monitor Ref No.</th>
                                       <th rowspan="2">Monitor<br> Created Date</th>
                                       <th rowspan="2">Recommendationa<br> No.</th>
                                       <th rowspan="2">Region</th>
                                       <th rowspan="2">Zone</th>
                                       <th rowspan="2">	Woreda</th>
                                       <th rowspan="2">No of PAs<br> Affected</th>
                                       <th rowspan="2">Total Area<br> Infected(ha)</th>
                                       <th rowspan="2">Total Area<br> Controlled(ha)</th>
                                       <th rowspan="2">Total Area Controlled(%)</th>
                                       <th rowspan="2">Total Fungicides<br> Used (kg(lit))</th>
                                       <th colspan="3">Numbers of <br>Farmers Participated<br> on Spraying</th>
                                       <th rowspan="2">Mode</th>
                                       <th rowspan="2">Action</th>
                                    </tr>
	                                 <tr>
								      <th>Male</th>
								      <th>Female</th>
								      <th>Total</th>
								    </tr>
                                 </thead>
                                 <tbody>
                                  
                                   <%-- <c:forEach items="${implementationdata}" var="list" varStatus="counter">
                                    <tr>
                                       <td>${counter.count}</td>
                                       <td><a href="javascript:void(0);"  onclick="viewImplementation('${list.monitorid}')">${list.monitorno}</td>
                                       <td>${list.monitordate}</td>
                                       <td>${list.recomno}</td>
                                       <td>${list.region}</td>
                                       <td>${list.zone}</td>
                                       <td>${list.woreda}</td>
                                       <td>${list.nopaeffected}</td>
                                       <td>${list.totalAreaInfested}</td>
                                       <td>${list.totalControlledha}</td>
                                       <td>${list.totalControlledpercent}</td>
                                       <td>${list.totalFungicidesUsed}</td>
                                       <td>${list.malefarmer}</td>
                                       <td>${list.femalefarmer}</td>
                                       <td>${list.totalfarmer}</td>
                                       <td>${list.collectMode}</td>
                                       <td><a class="btn btn-info btn-sm" href="#" title="" onclick="edit('${list.monitorid}')" data-original-title="View Details"><i class="icon-edit1"></i></a>
                                       </td>
                                    </tr>
                                    </c:forEach> --%>
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
         <form:form action="viewImplementationDetails" name="form" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

         
		<input type="hidden" name="monitorId" id="hddenimpleid"/>
        </form:form>
        <script>
        $(document).ready(function(){
        	
        	if($("#regionId").val()!= -1 )
        		{
        		var val_ = $("#regionId").val();
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
   		        	//$("#woredaId").val("-1");
   		        	//$("#woredaId").find('option').not(':first').remove();
   		        	//$("#kebeleId").val("-1");
   		        	
   		        	//$("#kebeleId").find('option').not(':first').remove();
   		            var html = '<option value="-1">--Select--</option>';
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
        		}
        	var regionId = '${regionId}' ;
        	if(regionId != '' && regionId != undefined && regionId != null && regionId !='0')
        	{
        		
        			$("#regionId").val('${regionId}');
        			$("#regionId").change();
        			 var zoneId='${zoneId}';
        			if(zoneId != null && zoneId != undefined && zoneId != '')
        			{
        				$("#zoneId").val(zoneId);
        				$("#zoneId").prop("checked", true);
        			} 
        	}
        });
        </script>
         <script>
         $(document).ready(function(){
        			
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
        		        	//$("#woredaId").val("-1");
        		        	//$("#woredaId").find('option').not(':first').remove();
        		        	//$("#kebeleId").val("-1");
        		        	
        		        	//$("#kebeleId").find('option').not(':first').remove();
        		            var html = '<option value="-1">--Select--</option>';
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
             
        		  
        		   

         function viewImplementation(impleId){
             
     		$("#hddenimpleid").val(impleId);
     		$("form[name='form']").submit();
     	}

         var msg = '${msg}';
         if(msg != undefined && msg != null && msg != '')
         	{
         	swal("Success", msg, "success"); 
         	}
      	
         var errmsg = '${errmsg}';
         if(errmsg != undefined && errmsg != null && errmsg != '')
         	{
         	swal("Error", errmsg, "error"); 
         	}
         });
    </script>
    <script>
$(function() {

	$('#viewImplementationId').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "viewImplementationDetailsData",
					"data" : function(d) {
						d.regionId= $("#regionId").val();
						d.zoneId = $("#zoneId").val();
						d.monitorNo =$("#monitorNo").val();
						d.monitordate = $("#monitordate").val();
					}
			},
			"dataSrc": "",
			"columns":[
				{"data":"sNo"},
				{"data":"monitorno"},
				{"data":"monitordate"},
				{"data":"recomno"},
				{"data":"region"},
				{"data":"zone"},
				{"data":"woreda"},
				{"data":"nopaeffected"},
				{"data":"totalAreaInfested"},
				{"data":"totalControlledha"},
				{"data":"totalControlledpercent"},
				{"data":"totalFungicidesUsed"},
				{"data":"malefarmer"},
				{"data":"femalefarmer"},
				{"data":"totalfarmer"},
				{"data":"collectMode"},
				{"data":"action"}
				
			]
	
  
	});
	});


$(document).on('click', '.deleteClass', function()
			{
	 var monitorId = $(this).attr('monitor-id');
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
    		  
    		  var dataString = 'monitorId='+ monitorId;
 			 $.ajax({
 			 	type: "POST",
 	            url : 'deleteMonitorDetails',
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

$(document).on('click', '.editClass', function()
			{
		
	  //window.location.href="modifyMonitorData";
	   var monitorId = $(this).attr('monitor-id');
	   $("#monitorId").val(monitorId);
	   $("#myForm").submit();

});
</script>