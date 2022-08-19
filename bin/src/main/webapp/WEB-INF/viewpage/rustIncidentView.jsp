<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	
	<c:if test="${msg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	});
</script>
</c:if>
      <c:if test="${msg_1 ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${msg_1}"," ", "error"); 
	});
</script>
</c:if>    
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Rust Incident</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                          <li class="breadcrumb-item">Manage Survey</li>
                            <li class="breadcrumb-item active" aria-current="page">Rust Incident Data</li>
                           
                        </ol>
                     </nav>
                  </div>
       
<script>
$(document).ready(function(){
	var selectVal='${searchType}';
	
	if(selectVal==0)
		{
			$("#dateWiseId").hide();
			$("#seasonWiseId").show();
			$("#fSearchId").val(selectVal);
			$("#redioSeason").prop("checked", true);
			$("#startDate").val("");
			$("#endDate").val("");
			var selectYear='${yearId}';
			$("#yearId").val(selectYear);
			var selectSeason='${seasonId}';
			$("#seasonId").val(selectSeason);
		}
	if(selectVal==1)
		{
			$("#dateWiseId").show();
			$("#seasonWiseId").hide();
			$("#fSearchId").val(selectVal);
			$("#redioDate").prop("checked", true);
			$("#yearId").val("0");
			$("#seasonId").val("0");
		}
})
</script>
<script>
	function changeSearchBy(id){
		if(id==0)
			{
				$("#dateWiseId").hide();
				$("#seasonWiseId").show();
				$("#fSearchId").val(id);
				$("#startDate").val("");
				$("#endDate").val("");
			}
		if(id==1)
			{
				$("#dateWiseId").show();
				$("#seasonWiseId").hide();
				$("#fSearchId").val(id);
				$("#yearId").val("0");
				$("#seasonId").val("0");
			}
	}  	
</script>
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                             
                              <a class="nav-item nav-link active"  href="rustIncidentView" >View</a>
                           </ul>
                    <div class="indicatorslist">
                           
                           <form action="downloadRustIncidentExcel" method="post" id="exceldownload">
                       <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
 						<input type="text" style="display:none;" name="regionIdExcel" id="regionIdExcel">
                        <input type="text" style="display:none;" name="zoneIdExcel" id="zoneIdExcel"> 
                        <input type="text" style="display:none;" name="woredaIdExcel" id="woredaIdExcel">
                        <input type="text" style="display:none;" name="kebeleIdExcel" id="kebeleIdExcel">
                        <input type="text" style="display:none;" name="startrDIdExcel" id="startrDIdExcel">
                        <input type="text" style="display:none;" name="endDIdExcel" id="endDIdExcel"> 
                        <input type="text" style="display:none;" name="yearIdExcel" id="yearIdExcel">
                        <input type="text" style="display:none;" name="seasonIdExcel" id="seasonIdExcel">
                        <button title="Excel" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-excel-file" ></i></button>
                        </form> 
                           
                           </div> 
                           
                            <div class="indicatorslist">
                            <form action="downloadViewRustIncidentPdf" method="post" id="pdfform" target="_blank">
                              <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
 						<input type="text" style="display:none;" name="regionIdExcel" id="regionIdPDF">
                        <input type="text" style="display:none;" name="zoneIdExcel" id="zoneIdPDF"> 
                        <input type="text" style="display:none;" name="woredaIdExcel" id="woredaIdPDF">
                        <input type="text" style="display:none;" name="kebeleIdExcel" id="kebeleIdPDF">
                        <input type="text" style="display:none;" name="startrDIdExcel" id="startrDIdPDF">
                        <input type="text" style="display:none;" name="endDIdExcel" id="endDIdPDF"> 
                        <input type="text" style="display:none;" name="yearIdExcel" id="yearIdPDF">
                        <input type="text" style="display:none;" name="seasonIdExcel" id="seasonIdPDF">
                         <button title="Print" id="pdfdownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1" ></i></button>
                        </form>
                           </div>
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                        
                        <c:if test="${showSearch eq false}">
                        <div class="search-sec">
                        </c:if>
                        <c:if test="${showSearch eq true}">
                        <div class="search-sec" style="display:block;">
                        </c:if> 
                        
                        <div class="form-group row pad-ver">
								<label class="col-sm-2 control-label">Search By</label>
								<div class="col-sm-10">
								<span class="colon">:</span>
								   <div class="radio">
									  <input type="radio" name="status"  value="0" class="magic-radio sampleyes"  name="form-radio-button"  id="redioSeason" onclick="changeSearchBy(this.value)"/>
									  <label for="redioSeason" tabindex="4">Season</label>  
							   
									  <input type="radio" name="status"  value="1" class="magic-radio sampleno"  name="form-radio-button" id="redioDate" onclick="changeSearchBy(this.value)"/>
									  <label for="redioDate" tabindex="5">Date Range</label>
								   </div>
								</div>
							 </div>
                        
                        <form action="rustIncidentViewSearch" autocomplete="off"   method="post" id="searchForm">
                         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           <input type="hidden" name="searchType" id="fSearchId" value="x">
                                   <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Region Name</label>
                                    <div class="col-lg-3">
                                       <select  class="form-control" id="regionId" name="regionId"  onchange="findZoneByRegionId(3,this.value);" required="required" tabindex="2">
                                   <option value="-1">-Select-</option>
                                   <c:forEach items="${regionList}" var="region"> 
                                   	<c:choose>
														<c:when test="${region.demographyId eq regionId}">
															<option value="${region.demographyId}"
																selected="selected">${region.demographyName}</option>
														</c:when>
														<c:otherwise>
															<option value="${region.demographyId}">${region.demographyName}</option>
														</c:otherwise>
													</c:choose>
                                   </c:forEach>
                                    </select>
                                    </div>
                                    <label class="col-lg-2 ">Zone Name</label>
                                    <div class="col-lg-3">
                                       <select class="form-control" name="zoneId" id="zoneId" onchange=" findWoredaByZoneId(4,this.value);">
                                   <option value="-1">-Select-</option>
                                    </select>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                              <div class="row">
                               <label class="col-lg-2 ">Woreda Name</label>
                                    <div class="col-lg-3">
                                         <select class="form-control" name="woredaId" id="woredaId" onchange="searchKebele(5,this.value);">
                                      <option value="-1">--Select--</option>
                                      </select>
                                    </div>
                               <label class="col-lg-2 ">Kebele Name</label>
                                    <div class="col-lg-3">
                                      <select class="form-control" name="kebeleId" id="kebeleId">
                                         	<option value="-1">-Select-</option>
                                       </select>
                                    </div>
                              </div>
                              </div>
                              <div class="form-group" id="dateWiseId"> 
                              	<div class="row">
                              	<label class="col-lg-2 ">Incident Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" data-date-end-date="0d" aria-describedby="inputGroup-sizing-default"  name="startDate" id="startDate" >
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Incident Date To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" data-date-end-date="0d"  aria-describedby="inputGroup-sizing-default"  name="endDate" id="endDate" >
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                              	</div>
                              </div>
                              <div class="form-group" id="seasonWiseId"> 
                                 <div class="row">
                               <label class="col-lg-2 ">Year</label>
                                    <div class="col-lg-3">
                                   <select  class="form-control" id="yearId" name="yearId">
											<option value="0">--Select--</option>
											 <c:forEach items="${year}" var="vo">
											<option value="${vo}">${vo}</option>
											</c:forEach> 
								</select>
                                       
                                    </div>
                                    <label class="col-sm-2 ">seasons</label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="seasonId" name="seasonId"> 
											<option value="0">-select-</option>
											 <c:forEach items="${seasonList}" var="seasonList">
												<c:choose>
												 	
													<c:when test="${ seasonList.seasonId eq seasonId}">
													<option value="${ seasonList.seasonId}">${ seasonList.seasonName}</option>
													</c:when>
													<c:otherwise>
														<option value="${ seasonList.seasonId}">${ seasonList.seasonName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
                                    </div>
                                    
                                 </div>
                              </div>
                              
                              <div class="form-group" > 
                                 <div class="row">
                               <label class="col-lg-2 "></label>
                                    <div class="col-lg-3">
                                    <button class="btn btn-primary" id="searchID" onclick="return searchData()"> <i class="fa fa-search"></i> Search</button>
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
                              <table data-toggle="table" class="table table-hover table-bordered"  id="viewTable">
                                 <thead>
                                    <tr>
                                   
                                       <th width="40px">Sl#</th>
                                       <th>Incident Date</th>
                                        <th>Region</th>
                                         <th>Zone</th>
                                       <th>Woreda</th>
                                       <th>Kebele</th>
                                       <th>Season</th>
                                       <th>Longitude</th>
                                       <th>Latitude</th>
                                       <th>Incident Submitted By</th>
                                      <th width="100px">View Details</th> 
                                    </tr>
                                 </thead>
                                 <tbody>
									<%-- <c:forEach items="${incidentList}" var="dtls" varStatus="count">
										<tr>
											<td>${count.index + 1 }</td>
											<td>${dtls.incidendDate}</td>
											<td>${dtls.regionName}</td>
											<td>${dtls.zoneName}</td>
											<td>${dtls.woredaName}</td>
											<td>${dtls.kebeleName}</td>
											<td>${dtls.seasonName}</td>
											<td>${dtls.longitude}</td>
											<td>${dtls.latitude}</td>
											<td>${dtls.userFullName}</td>
											<td><a href data-toggle='modal' data-target='#myModal' class="fa fa-fw fa-eye-slash pass-i-tooltip"
												onclick="optionValue(${dtls.incidentId})"></a></td>
										</tr>
									</c:forEach> --%>
								</tbody>
                              </table>
                           </div>
                          
                        </div>
                        <!--===================================================-->
                       <%--  <form action="rustIncidentViewSearch" autocomplete="off" id="searchFormId"  method="post">    
                      		<input type="hidden" name="startDate" id="startDateId">
                      		<input type="hidden" name="endDate" id="endDateId">
                      		<!-- <input type="text" name="seasonFormId" id="seasonFormId"> -->
                      </form> --%>
                         
                     </div>
                  </div>
               </div>
            </div>
                   <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         
          <h4 class="modal-title">Incident Details</h4>
        </div>
        <table id="checkId">
        		
        	</table>
        <div class="modal-body">
        		
        		<div id="molIdL">
        		 <div class="leftdiv" style=" float: left; width: 50%;font-weight: bold;"> Question
        		 	<div id="qModalId"></div>
        		</div>
        		<div class="rightdiv" style=" float: left; width: 50%; font-weight: bold;"> Question Option
        			<div id="opModalId"></div>
        		</div>
        			
        		</div>
        		
         		
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
         </div>

 <script>
$(function() {
	

	$('#viewTable').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "rustIncidentViewPageWise",
					"data" : function(d) {
						d.regionId= $("#regionId").val();
						d.zoneId = $("#zoneId").val();
						d.woredaId =$("#woredaId").val();
						d.kebeleId = $("#kebeleId").val();
						d.startDate =$("#startDate").val();
						d.endDate = $("#endDate").val();
						d.yearId = $("#yearId").val();
						d.seasonId = $("#seasonId").val();
					}
			},
			"dataSrc": "",
			"columns":[
				{"data":"sNo"},
				{"data":"incidendDate"},
				{"data":"regionName"},
				{"data":"zoneName"},
				{"data":"woredaName"},
				{"data":"kebeleName"},
				{"data":"seasonName"},
				{"data":"longitude"},
				{"data":"latitude"},
				{"data":"userFullName"},
				{"data":"modalView"}
			]
	
  
	});
	});	
	
</script>
 <script>
 function optionValue(id)
{
	 $("#qModalId").empty();
	 $("#opModalId").empty();
		$.ajax({
			type:"GET",
			url:"viewRustIncidentDetailsById",
			data:{
					"incidentId":id
				},
			success:function(response){
				var val=JSON.parse(response);
				
				var htmlQust="";
				var htmlOptionQust="";
				$.each(val.dtlArr,function(index,value){
						htmlQust=htmlQust+"<div style='font-weight: normal;'>"+value.quust_val+"</div>";
					htmlOptionQust=htmlOptionQust+"<div style='font-weight: normal;'>"+value.option_val+"</div>";

					});
				$("#qModalId").append(htmlQust);
				$("#opModalId").append(htmlOptionQust);
			}
		});
}
	
</script>
<script>
	function searchData(){
		var searchBy=$("input[name='status']:checked"). val();
		
			var fromDate=$("#startDate").val();
				
			var toDate=$("#endDate").val();
			
			if(searchBy==1)
		{		
			if(fromDate!= '')
			{
				if(toDate =='')
				{
					 swal(
			 	   				'Error', 
			 	   				'Please enter the Incident To Date',
			 	   				'error'
			 	   			).then(function() {
								   $("#toDate").focus();
							   });
			    		return false; 
					
				}
					var eDate = new Date(toDate);
				 	 var sDate = new Date(fromDate);
				  if(fromDate!= '' && fromDate!= '' && sDate> eDate)
				    {
				 	 swal(
			 	   				'Error', 
			 	   				'Please ensure that the Incident  To Date is greater than or equal to the Incident From Date',
			 	   				'error'
			 	   			).then(function() {
								   $("#toDate").focus();
							   });
			    		return false;
				    }
				    
			}

		}else{	
		if($("#yearIdv").val()!=0  && $("#seasonId").val()==0)
		{
			swal(
				'Error', 
				'Please Enter Season',
				'error'
			).then(function() {
			   $("#seasonId").focus();
		   });
		return false;
	}
	if($("#seasonId").val()!=0 && $("#yearId").val()==0 )
	{
		swal(
				'Error', 
				'Please Enter Year',
				'error'
			).then(function() {
			   $("#seasonId").focus();
		   });
		return false;
	}

		}		
				$("#startDateId").val(fromDate);
				$("#endDateId").val(toDate);
				$("#searchForm").submit();		
	}
 </script> 
 <script>
function findZoneByRegionId(levelId,parentId)
{
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
			var html = "<option value='-1'>-Select-</option>";
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				$.each(val,function(index, value) {						
					html=html+"<option value="+value.zoneId+" >"+value.zoneName+"</option>";
				});
			}
			$('#zoneId').empty().append(html);
			$('#woredaId').empty().append("<option value='-1'>-Select-</option>");
			$('#kebeleId').empty().append("<option value='-1'>-Select-</option>");
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
			var html ="";
			var val=JSON.parse(response);
			html=html+"<option value='-1' >-Select-</option>";
			if (val != "" || val != null) {
				$.each(val,function(index, value) {			
					
							html=html+"<option value="+value.woridaId+" >"+value.woridaName+"</option>";
				});
			}
			$('#woredaId').empty().append(html);
			$('#kebeleId').empty().append("<option value='-1'>-Select-</option>");
			
		},error : function(error) {
			 
		}
	});
}
function searchKebele(levelId,woredaId)
{
	
	$('#kebeleId').change();
   
     $.ajax({
		type : "GET",
		 url : "find-multiple-kebele-by-woreda-id", 
		 async:false,
	   data : {
			"levelId":levelId,
			"woredaId":woredaId
			
		},
		success : function(response) {
			var html = " ";
			var val=JSON.parse(response);
			html=html+"<option value='-1' >-Select-</option>";
			if (val != "" || val != null) {
				$.each(val,function(index, value) {			
					
					html=html+"<option value="+value.kebeleId+" >"+value.kebeleName+"</option>";
				});
			}
			$('#kebeleId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});

	
} 


</script>

<script>

var regionId = '${regionId}' ;

if(regionId != '' && regionId != undefined && regionId != null)
{
		$("#regionId").val(regionId);
		$("#regionId").change();
		 var zoneId='${zoneId}';
		if(zoneId != null && zoneId != undefined && zoneId != '' && zoneId != -1)
		{
			$("#zoneId").val(zoneId);
			$("#zoneId").change();
			var woredaId='${woredaId}';
			if(woredaId != null && woredaId != undefined && woredaId != '' && woredaId != -1)
			{
				$("#woredaId").val(woredaId);
				$("#woredaId").change();
				var kebeleId='${kebeleId}';
				if(kebeleId != null && kebeleId != undefined && kebeleId != '' && kebeleId != -1)
				{
					$("#kebeleId").val(kebeleId);
					$("#kebeleId").change();
				}
			}
		} 
		
		
}

$("#startDate").val('${startDate}');
$("#endDate").val('${endDate}');
$("#yearId").val('${yearId}');
$("#seasonId").val('${seasonId}');
</script>

<script>
$(document).ready(function(){
	
		 $("#regionIdExcel").val($("#regionId").val());
		$("#zoneIdExcel").val($("#zoneId").val());
		$("#woredaIdExcel").val($("#woredaId").val());
		$("#kebeleIdExcel").val($("#kebeleId").val());
		$("#startrDIdExcel").val($("#startDate").val());
		$("#endDIdExcel").val($("#endDate").val());
		$("#yearIdExcel").val($("#yearId").val());
		$("#seasonIdExcel").val($("#seasonId").val()); 

	$("#pdfdownload").click(function(){
		
		
		$("#regionIdPDF").val($("#regionId").val());
		$("#zoneIdPDF").val($("#zoneId").val());
		$("#woredaIdPDF").val($("#woredaId").val());
		$("#kebeleIdPDF").val($("#kebeleId").val());
		$("#startrDIdPDF").val($("#startDate").val());
		$("#endDIdPDF").val($("#endDate").val());
		$("#yearIdPDF").val($("#yearId").val());
		$("#seasonIdPDF").val($("#seasonId").val());
		$("#pdfform").submit();
		 }); 
	});

</script> 