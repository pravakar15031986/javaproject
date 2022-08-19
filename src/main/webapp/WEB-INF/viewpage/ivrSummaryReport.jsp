<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="wrsis/pagejs/demography.js"></script>

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>IVR Survey Data</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                          <li class="breadcrumb-item">Manage Survey</li>
                           <li class="breadcrumb-item active" aria-current="page">Import IVR Data</li>
                        </ol>
                     </nav>
                    
                  </div>
                 
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="javascript:void(0)"  onclick="history.back()">View</a>
                           </ul>
                           <div class="indicatorslist">
                           <a  title="Click to Back" href="viewIvrData" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="history.back()"><i class="icon-arrow-left1"></i></a>
                             
                              
                           </div> 
                        </div>
                        <!-- Search Panel -->
                          <div class="search-container">
                           <div class="search-sec">
                            <form action="searchIvrQustionPageTest" method="post">
                          <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           <div class="form-group">
                          
                                 <div class="row">
                                     <input type="hidden"  id="fileId" name="fileId" value="${fileId}">
                                     <label class="col-lg-2 ">Region</label>
                                    <div class="col-lg-3">
                                    
                                     <select class="form-control" id="regionId" onchange="findZoneByRegionId(3,this.value);" name="regionId">
                                        <option value="0">--Select--</option>
                                       <c:forEach items="${regionList}" var="region">
                                         <option value="${region.demographyId}">${region.demographyName}</option>
                                       </c:forEach>
                                       </select>
                                   </div>
                                   <label class="col-lg-2 ">Zone</label>
                                    <div class="col-lg-3">
                                       <select class="form-control" id="zoneId" onchange="findWoredaByZoneId(4,this.value)" name="zoneId">
                                   		<option value="0">--Select--</option>
                                    </select>
                                    </div>
                          
                                 </div>
                              </div>
                             
                                   <div class="form-group">
                                 <div class="row">
                                    
                                    
                                
                                 <label class="col-lg-2 ">Woreda </label>
                                    <div class="col-lg-3">
                                       <select class="form-control" id="woredaId" name="woredaId">
                                         <option value="0">--Select--</option>
                                       </select>
                                    </div>
                                    
                                    <label class="col-lg-2 ">Phone Number</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" id="textPhone" name="textPhone" placeholder="" data-bv-field="fullName">
                                    </div>
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary" > <i class="fa fa-search"></i> Search</button>
                                    </div>
                                   
                              </div>
                              
                              </div>
                              </form>
                            
                      
                           </div>
                           <div class="text-center"> <a class="searchopen" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Search"> <i class="icon-up-arrow"></i> </a></div>
                        </div>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                        <div>
                        </div>
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                              <thead>
									<tr>
									   <th width="40px">Sl#</th>
                                       <th>Phone No.</th>
                                       <th>Survey Date</th>
                                       <th>	Region</th>
                                       <th>Zone</th>
                                       <th>Woreda</th>
                                       <c:forEach items="${Questions}" var="list" varStatus="count">
                                     	 <th> Question ${count.index+1 }
                                       		<img src="wrsis/images/information.jpg" title="${list }" alt="info" width="15px" class="ml-2" /></th>
                                       </c:forEach>
                                       
  									</tr>
 								</thead>
								<tbody> 
 								       <c:forEach items="${ivrList}" var="ivr" varStatus="count">
                                      <tr>
                                      		<td>${count.index + 1 }</td>
                                        	<td>${ivr.mobile}</td>
                                        	<td>${ivr.callDate}</td>
                                        	<td>${ivr.regionName}</td>
                                      		<td>${ivr.zoneName}</td>
                                         	<td>${ivr.woredaName}</td>
                                       		
                                       		<c:if test="${not empty ivr.ivrQuestionsData }">
                                      			<c:forEach items="${ivr.ivrQuestionsData}" var="data" varStatus="count">
                                       				<td>${data }</td>
                                      			 </c:forEach>
                                      		 </c:if>
                                      		
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
$(document).ready(function(){
	
	$('#viewTable').DataTable({
     /* "paging":   true,
     "ordering": true,
     "info":     true,
 */
     	'paging':true,
		'lengthChange':true,
		'searching':false,
		'ordering':true,
		'info':true,
		'autoWidth':false,
     
  //initialization params as usual
    fnInitComplete : function() {
       if ($(this).find('td').length<=1) {
          $('.dataTables_wrapper').hide();
          swal("No record found")
          }
       }
 })
 
 
});


function generateExcel(id){
	$("#fileNameId").val(id);
	$("#excelReportForm").submit();
}
function edit(id){
	//alert(id);
	$("#fileId").val(id);
	$("#dataCountForm").submit();
}

</script>
<script>
$(document).ready(function(){
	
	var fileId='${fileId}';
	$("#fileId").val(fileId);
	var textPhone='${textPhone}';
	$("#textPhone").val(textPhone);
	var regionId = '${regionId}';
	
	$("#regionId").val(regionId);
	findZoneByRegionId(3,regionId);
	var zoneId = '${zoneId}';
	$("#zoneId").val(zoneId);
	findWoredaByZoneId(4,zoneId);
	var woredaId = '${woredaId}';
	$("#woredaId").val(woredaId);
})
</script>

 <script>       
function findZoneByRegionId(levelId,parentId)
{
	//alert("Search Zone"+parentId);
	$.ajax({
		type : "GET",
		url : "find-zone-by-region-id", 
		 async:false,
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			//alert(response);
			var html = "<option value='0'>--Select--</option>";
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				$.each(val,function(index, value) {						
					html=html+"<option value="+value.zoneId+" >"+value.zoneName+"</option>";
				});
			}
			$('#zoneId').empty().append(html);
			$('#woredaId').empty().append("<option value='0'>--Select--</option>");
		},error : function(error) {
			 
		}
	});
}
function findWoredaByZoneId(levelId,parentId)
{
			
	$.ajax({
		type : "GET",
		url : "find-woreda-by-zone-id", 
		 async:false,
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			//alert(response);
			var html = "<option value='0'>--Select--</option>";
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				$.each(val,function(index, value) {						
					html=html+"<option value="+value.woridaId+" >"+value.woridaName+"</option>";
				});
			}
			$('#woredaId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});
}
</script>  


    
       