<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Publish/Discard Recommendation Survey</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Monitor Implementation</li>
						<li class="breadcrumb-item" aria-current="page">Publish
							Implementation Details</li>
					</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							
							<a class="nav-item nav-link active" href="#">View</a>
						</ul>
						<div class="indicatorslist">
							<a title="" href="javascript:void(0)" id="backIcon"
								data-toggle="tooltip" data-placement="top"
								data-original-title="Back" onclick="history.back()"><i
								class="icon-arrow-left1"></i></a>
							
						</div>
					</div>
					
					<!-- Search Panel -->
					<div class="search-container">
							<c:if test="${showSearch eq true }">
					<div class="search-sec" style="display: block;">
					</c:if>
					<c:if test="${showSearch eq false }">
					<div class="search-sec">
					</c:if>
							<form action="monitorRecommendationPublishedSearch"
								autocomplete="off" method="post" id="searchForm">
								<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
								<input type="hidden" name="rcNumber" id="rcNumber" value="${rcNumber}">
								<div class="form-group">
									<div class="row">
										<label class="col-lg-2 ">Region</label>
										<div class="col-lg-3">
											<select class="form-control" id="regionId" name="regionId"
												onchange="findZoneByRegionId(3,this.value);">
												<option value="-1">--Select--</option>
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
										<label class="col-lg-2 ">Zone</label>
										<div class="col-lg-3">
											<select class="form-control" name="zoneId" id="zoneId"
												onchange=" findWoredaByZoneId(4,this.value);">
												<option value="-1">--Select--</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<label class="col-lg-2 ">Woreda</label>
										<div class="col-lg-3">
											<select class="form-control" name="woredaId" id="woredaId" onchange="searchKebele(5,this.value);">
												<option value="-1">--Select--</option>
											</select>
										</div>
										<label class="col-lg-2 ">Monitor Ref No.</label>
										<div class="col-lg-3">
											<input type="text" class="form-control"
												id="monitorRefNumber" name="monitorRefNumber" placeholder=""
												value="${monitorRefNumber}" data-bv-field="fullName" />
										</div>
									</div>

								</div>
								<div class="form-group">
									<div class="row">

										<label class="col-lg-2 ">Monitor Date From</label>
										<div class="input-group col-lg-3">
											<input type="text" class="form-control datepicker"
												id="fromDate" data-date-end-date="0d" aria-label="Default"
												aria-describedby="inputGroup-sizing-default"
												id="recDtFrom" name="recDtFrom" value="${recDtFrom }" autocomplete="off">
											<div class="input-group-append">
												<span class="input-group-text"
													id="inputGroup-sizing-default"><i
													class="icon-calendar1"></i></span>
											</div>
										</div>
										<label class="col-lg-2 ">Monitor Date To</label>
										<div class="input-group col-lg-3">
											<input type="text" class="form-control datepicker"
												id="toDate" data-date-end-date="0d" aria-label="Default"
												aria-describedby="inputGroup-sizing-default" name="recDtTo"
												id="recDtTo" value="${recDtTo}" autocomplete="off" />
											<div class="input-group-append">
												<span class="input-group-text"
													id="inputGroup-sizing-default"><i
													class="icon-calendar1"></i></span>
											</div>
										</div>
										<input type="hidden" name="recommendNumber"
											id="searchRCNumber" />
										<div class="col-lg-2">
											<button class="btn btn-primary" onclick="return searchData()">
												<i class="fa fa-search"></i> Search
											</button>
										</div>
									</div>
								</div>

							</form>

						</div>
						<div class="text-center">
							<a class="searchopen" title="Search" data-toggle="tooltip"
								data-placement="bottom"> <i class="icon-angle-arrow-down"></i>
							</a>
						</div>
					</div>
					<!-- Search Panel -->
					<!--===================================================-->
					<div class="card-body">
						<div class="table-responsive">
							<table data-toggle="table"
								class="table table-hover table-bordered" id="viewMonitor">
								<thead>
									<tr>
									    
										<th rowspan="2" id="chekhideId"><input id="demo-form-inline-checkboxall"
											class="magic-checkbox" type="checkbox"> <label
											for="demo-form-inline-checkboxall"></label></th>
										<th rowspan="2">Sl#</th>
										<th rowspan="2">Monitor Ref No.</th>
										<th rowspan="2">Monitor Date</th>
										<th rowspan="2">Recommendation no.</th>
										<th rowspan="2">Region</th>
										<th rowspan="2">Zone</th>
										<th rowspan="2">Woreda</th>
										<th rowspan="2">No of PAs<br> Affected
										</th>
										<th rowspan="2">Total Area<br> Infected(ha)
										</th>
										<th rowspan="2">Total Area<br> Controlled(ha)
										</th>
										<th rowspan="2">Total Area Controlled(%)</th>
										<th rowspan="2">Total Fungicides<br> Used (kg(lit))
										</th>
										<th colspan="3">Numbers of <br>Farmers Participated<br>
											on Spraying
										</th>
										
									</tr>
									<tr>
										<th>Male</th>
										<th>Female</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<%-- <c:forEach items="${moniterList}" var="moniter"
										varStatus="count">
										<tr>
											<td><input
												id="demo-form-inline-checkbox${moniter.monitorid }"
												class="magic-checkbox" type="checkbox"
												name="moniterDetailsId" value="${moniter.monitorid}">
												<label for="demo-form-inline-checkbox${moniter.monitorid }"></label>
											</td>

											<td>${count.count}</td>
											<td><a href="javascript:void(0);" class="viewsurvey"
												title="View Details" data-original-title="View Details"
												onclick="edit(${moniter.monitorid})">${moniter.monitorno}</a></td>

											<td>${moniter.monitordate }</td>
											<td>${moniter.recomno}</td>
											<input type="hidden" id="tabRecId" value="${moniter.recomno}">
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

						<%-- <form action="published-discard-monitor" method="post"
							onsubmit="return false"> --%>
							<div class="form-group row" id="actionDivId">
								<label class="col-12 col-md-2 col-xl-2 control-label"
									for="demo-text-input">Action <span class="text-danger">*</span></label>
								<div class="col-sm-3">
									<select class="form-control" id="action">
										<option value="0">Select</option>
										<option value="1">Publish</option>
										<option value="2">Discard</option>
									</select>
								</div>
							</div>
							
							<div class="form-group row" id="remark" style='display:none;'>
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Reason<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-3 col-xl-3"><span class="colon">:</span>
                                 <textarea id="demo-textarea-input" name="feedback" rows="4" class="form-control" placeholder="Enter Reason" maxlength="200" onkeyup="countChar(this)"></textarea><div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div>
							
							
							<div class="form-group row" id="actionBtnID">
								<label class="col-12 col-md-2 col-xl-2 control-label"></label>
								<div class="col-12 col-md-6 col-xl-4">
									<button class="btn btn-primary mb-1" id="btnSubmit"
										onclick="saveData()">Submit</button>
									
									<button class="btn btn-danger mb-1" type="reset"
										id="btnCancelId">Reset</button>
								</div>
							</div>
						<%-- </form> --%>
					</div>
					<form:form action="viewRecommendationsDetailsOnMonitor" name="form"
						method="post">
						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						<input type="hidden" name="monitorId" id="hddenimpleid" />
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
$(function() {

	$('#viewMonitor').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "monitorRecommendationPublishedData",
					"data" : function(d) {
						d.rcNumber=$("#rcNumber").val();
						d.regionId= $("#regionId").val();
						d.zoneId = $("#zoneId").val();
						d.woredaId =$("#woredaId").val();
						d.monitorRefNumber =$("#monitorRefNumber").val();
						d.fromDate =$("#fromDate").val();
						d.toDate =$("#toDate").val();
						//d.woredaId =$("#woredaId").val();
					}
			},
			"dataSrc": "",
			"columns":[
				{"data":"monitorCheckBox"},
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

<script>
function saveData(){
	
	event.preventDefault();
	var form = event.target.form;
	var monitorDetaArr = [];
	var action = $("#action");
	var remark = $("#demo-textarea-input");
	$.each($("input[name='moniterDetailsId']:checked"), function(){
		
		var json = {};
		json.monitorId = $(this).val();
	  // monitorDetaArr.push($(this).val());
	   var rcno = $("#tabRecId").val();
	   json.rcomno=rcno;
	  // monitorDetaArr.push(rcno);
	   var monino = $("#monitorNo").val();
	   json.moniNo=monino;
	   //monitorDetaArr.push(monino);
	   var recomid = $("#recomId").val();
	   json.recomId=recomid;
	   //monitorDetaArr.push(recomid);
	   var remark = $("#demo-textarea-input");
	   var remarks=remark.val();
	   json.rejectremark=remarks;
	   var action = $("#action").val();
	   json.actionId=action;
	   //monitorDetaArr.push(remark.val());
	   monitorDetaArr.push(json);
	});
	console.log(JSON.stringify(monitorDetaArr));
	finalJson = {"RowsData":monitorDetaArr};
	//var monitorId=finalJson;
	//console.log("monitorId=="+monitorId);
	if(!($( ".magic-checkbox:checked" ).length) > 0)
	{
		swal("Required", "Please choose at least one Monitor data", "error");
			return false;
		}

	
	//$("#moniterFinalArrayId").val(monitorId);
	
	if (action.val() == "0")
	{
		swal('Error','Please select any action','error').then(function() 
		{
			$("#action").focus();
		});
		return false; 
	}
	if(action.val() == "1")
	{
		//$("#monitorFinalOptionId").val(action.val());
		swal({
			title: ' Do you want publish ?',
			type: 'warning',
			showCancelButton: true,
			confirmButtonText: 'Yes',
			cancelButtonText: 'No',
			}).then((result) => {
				if (result.value) {
					$.ajax({ 
					    url:"published-discard-monitor",    
					    type:"POST", 
					    contentType: "application/json; charset=utf-8",
					    data: JSON.stringify(finalJson),
					    async: false,   
					    success: function(resposeJsonObject){
					    	swal("Success", "Data saved successfully. ", "success");
					    	//location.reload();
					    	window.location = "viewMonitorImplementation";
					    }
					});
		
					
				}
			})
			return false;
	}
	if(action.val() == "2")
	{

		var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
    	//alert("Hi=="+remark.val());
    	if(remark.val() == "")
    	{
    		  		swal('Error','Please write reason ','error').then(function() 
	    	   		 {
	    				$("#demo-textarea-input").focus();
	    			});
    		return false;
    	}
    	var reson=remark.val();
    	if(!reson.match(desc_regex))
       	{
       		swal("Error", "Reason accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
				   $("#demo-textarea-input").focus();
			   });
   			return false;
       	}
	   	if(reson.charAt(0)== ' ' || reson.charAt(remark.length - 1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in reason", "error");
	            return false;
		   }
	   	if(reson!=null)
       	{
	   		var count= 0;
	   		var i;
	   		for(i=0;i<reson.length && i+1 < reson.length;i++)
	   		{
	   			if ((reson.charAt(i) == ' ') && (reson.charAt(i + 1) == ' ')) 
	   			{
					count++;
				}
	   		}
	   		if (count > 0) {
	   			swal("Error", "Reason should not contain consecutive blank spaces", "error").then(function() {
					   $("#demo-textarea-input").focus();
				   });
				return false;
			}
       	}
	   	var descLen=reson.length;
	   	if (reson.charAt(0) == '!' || reson.charAt(0) == '@' 
			|| reson.charAt(0) == '#' || reson.charAt(0) == '$' 
			|| reson.charAt(0) == '&' || reson.charAt(0) == '*' 
			|| reson.charAt(0) == '(' || reson.charAt(0) == ')' 
			|| reson.charAt(descLen - 1) == '!' || reson.charAt(descLen - 1) == '@' 
			|| reson.charAt(descLen - 1) == '#' || reson.charAt(descLen - 1) == '$' 
			|| reson.charAt(descLen - 1) == '&' || reson.charAt(descLen - 1) == '*' 
			|| reson.charAt(descLen - 1) == '(' || reson.charAt(descLen - 1) == ')') 
	   	{
   			swal("Error", "!@#$&*() characters are not allowed at initial and last place in reason", "error").then(function() {
				   $("#demo-textarea-input").focus();
			   });
			return false;
		}
		
		//$("#monitorFinalOptionId").val(action.val());
		swal({
			title: ' Do you want to discard?',
			type: 'warning',
			showCancelButton: true,
			confirmButtonText: 'Yes',
			cancelButtonText: 'No',
			}).then((result) => {
				if (result.value) {
					$.ajax({ 
					    url:"published-discard-monitor",    
					    type:"POST", 
					    contentType: "application/json; charset=utf-8",
					    data: JSON.stringify(finalJson),
					    async: false,   
					    success: function(resposeJsonObject){
					    	swal("Success", "Data saved successfully. ", "success");
					    	location.reload();
					    }
					});
		
					
				}
		})
		return false;
	}
}
</script>


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
	swal("${errMsg}"," ", "error"); 
	 });
</script>
</c:if>
<script>
function findZoneByRegionId(levelId,parentId)
{
	$('#WoredaFirstZoneId').empty();
	
	$.ajax({
		type : "GET",
		url : "find-zone-by-region-id", 
		async:false,
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			
			var html = "<option value='-1'>--Select--</option>";
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
			 
			var html = "<option value='-1'>--Select--</option>";
			
			var val=JSON.parse(response);
			 
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
				
			}
		} 
		
		
}

</script>
<c:if test="${recommendNumber eq Empty}">
	<script>
$(document).ready(function(){
	
	$("#searchRCNumber").val($("#tabRecId").val());
});
</script>
</c:if>
<c:if test="${recommendNumber ne Empty}">
	<script>
	
	//var x="<c:out value='${recommendNumber}'/>";
	
	$("#searchRCNumber").val('${recommendNumber}');
	
</script>
</c:if>
<script>
function searchData(){
	
	var fromDate=$("#fromDate").val();
	
	var toDate=$("#toDate").val();
	if(fromDate!='')
	{	
	
		if(toDate =='')
		{
			swal('Error','Please enter Monitor to date!','error')
   			$("#toDate").focus();
   			return false; 
		}
		if(Date.parse(fromDate)>Date.parse(toDate))
		{
			swal('Error','Monitor from Date Should be less than Monitor to date!','error')
			$("#toDate").focus();
   			return false; 
		}
	}
	if(toDate !='')
	{
		if(fromDate == '')
		{
		 swal(
 	   				'Error', 
 	   				'Please enter  Monitor From date',
 	   				'error'
 	   			).then(function() {
					   $("#fromDate").focus();
				   });
    		return false; 
		}
	}	
	$("#searchForm").submit();
}
</script>
<script>
function edit(impleId){
    //alert(impleId);
	$("#hddenimpleid").val(impleId);
	$("form[name='form']").submit();
}


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
	});
</script>

<c:choose>
  <c:when test="${Show eq true }">
   	<script>
   $(document).ready(function(){
	$("#chekhideId").show();
   $("#actionDivId").show();
   $("#actionBtnID").show();
   });
   </script>
  </c:when>
  <c:otherwise>
   <script>
   $(document).ready(function(){
	$("#chekhideId").hide();
	$("#actionDivId").hide();
	$("#actionBtnID").hide();
   });
   </script>
  </c:otherwise>
</c:choose>