<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	
	
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                   <div class="title-details">
                     <h4>Uploaded Survey Data</h4>
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
                               <a class="nav-item nav-link 	"  href="uploadSurveyDataXcel">Add</a>
                              <a class="nav-item nav-link active"  href="uploadSurveyDataXcelView">View</a>
                           </ul>
                          
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <c:if test="${showSearch eq	false }"><div class="search-sec"></c:if>
                        <c:if test="${showSearch eq	true}"><div class="search-sec" style="display: block;"></c:if>
                           <form action="fetchAllActiveExcelFilesSearch" autocomplete="off" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                           
                           <div class="form-group">
                            <div class="row">
                              <label class="col-lg-2">Upload From Date</label> 
                                 <div class="input-group col-lg-3">
                                  <input type="text" class="form-control datepicker" name="startDate" data-date-end-date="0d" id="startDate" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                    <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                 </div>
                              <label class="col-lg-2">Upload To Date</label>
                                 
                                 <div class="input-group col-lg-3">
                                  <input type="text" class="form-control datepicker" name="endDate" data-date-end-date="0d"  id="endDate" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                    <div class="input-group-append">
                                       <span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
                                    </div>
                                 </div>
                              <div class="col-lg-2">
                                       <button type="submit" class="btn btn-primary" onclick="return checkSearch()"> <i class="fa fa-search"></i> Search</button>
                                    </div> 
                           </div>
                           </div>
                             </form>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div> 
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                           <table data-toggle="table" id="viewTable" class="table table-hover table-bordered">
                           	<thead>
                                 <tr>
                                 	<th>#Sl No.</th>
                                 	<th>Uploaded file Name</th>
                                 	<th>Uploaded On</th>
                                 	<th>No. of Survey Data</th>
                                 </tr>
                                 </thead>
                           <tbody>
                               <%-- <c:forEach items="${Files}" var="dtls" varStatus="theCount">
                               <tr>
                              		<td>${theCount.index+1 }</td>
                              		<c:if test="${ dtls.status eq false}">
                              		<td>  <a href="#" class="danger">${dtls.fileDecodeName}</a> 
                              		</td>
                              		</c:if>
                              		
                              		<c:if test="${ dtls.status eq true}">
									<td>  <a href="public/downloadExcel?path=${ dtls.fileName}" download="Survey_Uploaded_Success_Data">${dtls.fileDecodeName }</a>
                              		</td>
                              		</c:if>
                              		
                                    <td><fmt:formatDate type = "date" 
         value = "${dtls.createdOn }" /> </td>
                                    <td>
                                    <form action="showViewByExcelFileId" method="POST" id="post${theCount.index+1 }">
                                   
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                                    <input type="text" style="display:none;" value="${dtls.fileSurveyId }" name="path">
                                    </form>
                                  <a href="javascript:void(0)" onclick="document.getElementById('post${theCount.index+1}').submit();">${dtls.count }</a>	
                                   </td>
                                   </tr>
                              </c:forEach>  --%>
                                
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
  function downloadFile(id)
  {	
	swal(
			'',
			'File not found in server.',
			'warning'
		)
	}
 </script>
  <script>
  
$(function() {
	

	$('#viewTable').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "uploadSurveyDataXcelViewPageWise",
					"data" : function(d) {
						d.startDate =$("#startDate").val();
						d.endDate = $("#endDate").val();
					}
			},
			"dataSrc": "",
			"columns":[
				{"data":"slNo"},
				{"data":"fileDownloadLink"},
				{"data":"createdOn"},
				{"data":"countViewLink"}
			]
	
  
	});
	});	
	
</script>       
          <script>
          
         /*  $('#viewTable').DataTable( {
      		"pagingType": "full_numbers",
              dom: 'Bfrtip',		
              buttons: [
                  'print'
              ]
          } ); */
      	
         	 
          
    	$(document).ready(function(){
    		
    		
    		$(".danger").click(function()
    				{
    			alert("Hi");
    			swal(
    					'',
    					'File not found in server.',
    					'warning'
    				)
    				});
    		$("#viewTableId").hide();


    		
    	});
    	
    	function viewDataExcel(){
    		
    		$("#viewTableId").show();
    	}
   
	 function checkSearch()
        {
       
       	 var startDate = $("#startDate").val();
       	 var endDate =  $("#endDate").val();
       	 if(startDate.trim() != '' && endDate.trim() == '')
       		 {
       		 $("#endDate").focus();
       		 swal(
       					'Error!',
       					'Please select Upload To Date.',
       					'error'
       				)
       				return false;
       		 }
       	 
       	 if(startDate.trim() == '' && endDate.trim() != '')
   		 {
   		 $("#startDate").focus();
   		 swal(
   					'Error!',
   					'Please select Upload From Date.',
   					'error'
   				)
   				return false;
   		 }
       	 
       	 

	      if(Date.parse(startDate) > Date.parse(endDate)){
	    	  swal("Error", "Upload To Date  should not be less than Upload From Date.", "error");
	        	 $("#dateto").focus();
	            return false;
	    	}
	      
       	 
        }
   		
 
	 var StartDate = '${StartDate}';
	 var EndDate = '${EndDate}';
		if(StartDate != null && StartDate != '')
			{
			$("#startDate").val(StartDate);
			}
		
		if(EndDate != null && EndDate != '')
		{
		$("#endDate").val(EndDate);
		}
	 
    </script>