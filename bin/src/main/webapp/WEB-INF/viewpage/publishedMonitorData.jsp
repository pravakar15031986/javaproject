<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="wrsis/pagejs/demography.js"></script>

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Published Recommendations Survey</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                            <li class="breadcrumb-item">Monitor Implementation</li>
                           <li class="breadcrumb-item" aria-current="page">Publish Implementation Details</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                               
                               <a class="nav-item nav-link " href="viewMonitorImplementation">New</a>
                                <a class="nav-item nav-link active" href="publishedMonitorData">Published</a>
                                <a class="nav-item nav-link" href="discardedMonitorData">Discarded</a>
                           </ul>
                           <div class="indicatorslist">
                           <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="history.back()"><i class="icon-arrow-left1"></i></a>
                              
                           </div> 
                        </div>
                        <!-- Search Panel -->
                         <div class="search-container">
                           <div class="search-sec">
                            <form action="monitorPublishedSearch" autocomplete="off"   method="post"  id="searchForm">
                         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Region</label>
                                    <div class="col-lg-3">
                                      <select  class="form-control" id="regionId" name="regionId" onchange="getDemographyData(this.value,'zoneId')">   
                                   			<option value="-1">--Select--</option>
											 <c:forEach items="${regionList}" var="region"> 
												<c:choose>
													<c:when
														test="${region.demographyId eq regionId}">
														<option value="${region.demographyId}" selected="selected">${region.demographyName}</option>
													</c:when>
													<c:otherwise>
														<option value="${region.demographyId}">${region.demographyName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
                                    </select>
                                    </div>
                                    
                                    <label class="col-lg-2 ">Zone</label>
                                    <div class="col-lg-3">
                                        <select class="form-control" name="zoneId" id="zoneId" onchange="getDemographyData(this.value,'woredaId')" > 
                                   			<option value="0">--Select--</option>
                                   			<c:forEach items="${zonelist}" var="zone">
                                   			<option value="${zone.demographyId}">${zone.demographyName}</option>
                                   			</c:forEach>
                                    </select>
                                    </div>
                                 </div>
                              </div>
                                   <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Woreda</label>
                                    <div class="col-lg-3">
                                    <select class="form-control" name="woredaId" id="woredaId" onchange="searchKebele(5,this.value);">
                                      <option value="0">--Select--</option>
                                      <c:forEach items="${woredalist}" var="woreda">
                                   			<option value="${woreda.demographyId}">${woreda.demographyName}</option>
                                   			</c:forEach>
                                      </select>
                                    </div>
                                   <label class="col-lg-2 ">Monitor Ref No./Recommend No.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="monitorRefNumber" id="monitorrefNo" value="${monitorRefNumber}" value="" data-bv-field="fullName"/>
                                    </div>
                                 </div>
                                 
                              </div>
                             <div class="form-group">
                              <div class="row">
                              
                              <label class="col-lg-2 ">Monitor Survey From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" id="fromDate" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default"  name="recDtFrom" value="${recDtFrom }" autocomplete="off">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Monitor Survey To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker"  id="toDate" data-date-end-date="0d" aria-label="Default" aria-describedby="inputGroup-sizing-default"  name="recDtTo" value="${recDtTo}" autocomplete="off"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <div class="col-lg-2">
                                       <button class="btn btn-primary" onclick="searchData()"> <i class="fa fa-search"></i> Search</button>
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
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                                 <thead>
                                     <tr>
                                      
                                       <th rowspan="2">Sl#</th>
                                       <th rowspan="2">Monitor Ref No.</th>
                                       <th rowspan="2">Monitor Date</th>
                                       <th rowspan="2">Recommendation no.</th>
                                       <th rowspan="2">Region</th>
                                       <th rowspan="2">Zone</th>
                                       <th rowspan="2">Woreda</th>
                                       <th rowspan="2">No of PAs<br> Affected</th>
                                       <th rowspan="2">Total Area<br> Infected(ha)</th>
                                       <th rowspan="2">Total Area<br> Controlled(ha)</th>
                                       <th rowspan="2">Total Area Controlled(%)</th>
                                       <th rowspan="2">Total Fungicides<br> Used (kg(lit))</th>
                                       <th colspan="3">Numbers of <br>Farmers Participated<br> on Spraying</th>
                                       
                                    </tr>
	                                 <tr> 
								      <th>Male</th>
								      <th>Female</th>
								      <th>Total</th>
								    </tr>
                                 </thead>
                                 <tbody>
                                	<%-- <c:forEach items="${moniterList}" var="moniter" varStatus="count">
                                	<tr>
                                		<td>${count.count}</td>
                                		<td><a href="javascript:void(0);" class="viewsurvey"  title="View Details" data-original-title="View Details" onclick="edit(${moniter.monitorid})">${moniter.monitorno}</a></td>
                                		<td>${moniter.monitordate }</td>
                                       <td>${moniter.recomno}</td>
                                       <td>${moniter.region}</td>
                                       <td>${moniter.zone}</td>
                                       <td>${moniter.woreda}</td>
                                       <td>${moniter.nopaeffected}</td>
                                       <td>${moniter.totalAreaInfested}</td>
                                       <td>${moniter.totalControlledha}</td>
                                       <td>${moniter.totalControlledpercent}</td>
                                       <td>${moniter.totalFungicidesUsed}</td>
                                       <td>${moniter.malefarmer}</td>
                                       <td>${moniter.femalefarmer}</td>
                                       <td>${moniter.totalfarmer}</td>
                                       <td><a class="btn btn-info btn-sm"  title="" data-original-title="View Details" onclick="edit(${moniter.monitorid})"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                       </td>
                                	</tr> 
                                 </c:forEach> --%>
                                  
                                 </tbody>
                              </table>
                              
                             
                              
                             
                           </div>
                          
                        </div>
                         <form:form action="viewRecommendationsDetailsOnMonitor" name="form" method="post">
							<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
							<input type="hidden" name="monitorId" id="hddenimpleid"/>
       					 </form:form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
<script>
	$("#demo-form-inline-checkboxall").click(function() {
		$("input[type=checkbox]").prop('checked', $(this).prop('checked'));

	});
</script>
<script>
/* $(function() {
	$('#viewTable').dataTable({
		'paging':true,
		'lengthChange':true,
		'searching':true,
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
	});
	}); */	
</script>


<script>
$(document).ready(function(){
	$("#searchRCNumber").val($("#tabRecId").val());
});
</script>
<script>
function searchData(){
	event.preventDefault();
	var form = event.target.form;
	var startDate=$("#fromDate").val();
	var endDate=$("#toDate").val();
	 if(startDate.trim() != '' && endDate.trim() == '')
		 {
		 $("#toDate").focus();
		 swal(
					'Error!',
					'Please select  Monitor Survey To.',
					'error'
				)
				return false;
		 }
	 
	 if(startDate.trim() == '' && endDate.trim() != '')
	 {
	 $("#fromDate").focus();
	 swal(
				'Error!',
				'Please select Monitor Survey From.',
				'error'
			)
			return false;
	 }
	 
	 

    if(Date.parse(startDate) > Date.parse(endDate)){
  	  swal("Error", "Monitor Survey To  should not be less than Monitor Survey From", "error");
      	 $("#toDate").focus();
          return false;
  	}
	form.submit();	
	//$("#searchForm").submit();
}

</script>

<script>
function edit(impleId){
    //alert(impleId);
	$("#hddenimpleid").val(impleId);
	$("form[name='form']").submit();
}
</script>
<script>
$(document).ready(function(){
	var regionId = '${regionId}' ;
	if(regionId != '' && regionId != undefined && regionId != null && regionId !='0')
	{
		
			$("#regionId").val('${regionId}');
			 var zoneId='${zoneId}';
			if(zoneId != null && zoneId != undefined && zoneId != '')
			{
				$("#zoneId").val(zoneId);
				$("#zoneId").prop("checked", true);
				var woredaId='${woredaId}';
				if(woredaId != null && woredaId != undefined && woredaId != '')
				{
					$("#woredaId").val(woredaId);
					$("#woredaId").prop("checked", true);
				}
			}	
	}
});

$(function() {

		$('#viewTable').dataTable({
			
				'processing' : true,
				'serverSide' : true,
				 "searching": false,
		      "ordering": false, 
				 "ajax" : {
						"url" : "viewMonitorPublishedData",
						"data" : function(d) {
							d.regionId= $("#regionId").val();
							d.zoneId = $("#zoneId").val();
							d.woredaId =$("#woredaId").val();
							d.monitorrefNo = $("#monitorrefNo").val();
							d.fromDate = $("#fromDate").val();
							d.toDate = $("#toDate").val();
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
					{"data":"totalfarmer"}
					
				]
		
	  
		});
		});	
</script>
