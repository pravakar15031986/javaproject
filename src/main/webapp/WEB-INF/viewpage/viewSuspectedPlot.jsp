<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Odisha Paddy Land Monitor</title>
<link rel="stylesheet" type="text/css" href="wrsis/css/style.css">
<link rel="stylesheet" type="text/css"
	href="wrsis/css/dataTables.bootstrap4.min.css" />
	<style>
	/* .table-responsive{
	margin-top:-3rem;
	} */
	div.dataTables_wrapper div.dataTables_info{padding-top:0px}
	 .hideshowdiv {
            display: none;
            padding: 10px;
    		background-color: #fff;
        }

        .accordianBtn {
            width: 100%;
            padding: 8px 10px;
		    background-color: #f6f6f6;
		    border-bottom: 2px solid white;
        }
      
        .toogleIcon{
            float: right;
        }
        .accordianBtn:hover{
            cursor: pointer;
        }
        
         #spotlight .footer {width: 100%;text-align: center;}
        
        .acc_heading{color:#5a5a5a; font-size:18px; font-weight:500}
.acc_heading + span i{margin-top: 5px}
.hideshowdiv select.form-control {
    border: 1px solid #ddd;
    box-shadow: none;
}

.pt_2{padding-top:2.6rem}
	</style>
<script src="wrsis/js/jquery.dataTables.min.js"></script>
<script src="wrsis/js/dataTables.bootstrap4.min.js"></script>
<script src="/wrsis/js/bootstrap.min.js" defer></script>
</head>
<body>
	<div class="mainpanel">
		<div class="section">
			<div class="page-title">
				<div class="title-details">
					<h4>View Suspected Plot</h4>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="Home"><span
									class="icon-home1"></span></a></li>
							<li class="breadcrumb-item">Suspected Plot</li>
							<li class="breadcrumb-item active" aria-current="page">
								View Suspected Plot</li>
						</ol>
					</nav>
				</div>

			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<ul class="nav nav-tabs nav-fill" role="tablist">
								<!-- <a class="nav-item nav-link " href="addGlobalLink">Add</a> -->
								<a class="nav-item nav-link active" href="viewSuspectedPlot">View</a>
							</ul>

						</div>
						<%-- <c:if test="${not empty errMsg}">
                  			<div class="alert alert-custom-danger" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong id="messageId" style="color: red">${errMsg}</strong>
							</div>
                  		</c:if> --%>
                  		 <!-- <p class="ml-2" style="color: red;">(*) Indicates mandatory </p> -->
                  		 
                  		 
                  		 
						<!-- Search Panel -->
						<form:form method="post" action="viewSuspectedPlot" modelAttribute="viewSurveyreport" autocomplete="off">
							<div class="search-container survey_report">
								<div class="search-sec">
									<div class="row ascr_view">
										 <div class="col-lg-2 col-md-6 col-sm-12 mt-3">
										<div class="form-group">
											<label class="control-label label_style">District <span class="text-danger">*</span></label>
											<form:select id="distId" class="form-control" path="districtId">
												<form:option value="0">--Select District--</form:option>
												<c:if test="${not empty districtList}">
												
													<form:options items="${districtList}" itemValue="districtId" itemLabel="districtName"/>
												
												</c:if>
												<c:if test="${not empty distCode}">
													<form:option value='${distCode}'>${distname}</form:option>
												</c:if>
											</form:select>
										</div>
										</div>
										
										<div class="col-lg-2 col-md-3 col-sm-12 mt-3">
										
										<div class="form-group">
											<label class="control-label label_style">Society <span class="text-danger"></span></label>
											
											<form:select class="form-control" id="pacsId" path="pacsId">
												<form:option value="0">-- Select Society --</form:option>
												 <form:options items="${pacsList}" itemValue="pacsId" itemLabel="pacsName"/>

											</form:select>
										</div>
										</div> 
										<!-- <label for="inputJTitle" class="col-lg-3 col-md-5 col-sm-12 col-form-label label-left mt-3">Programme Name<span class="text-danger">*</span> </label> -->
										<div class="col-lg-2 col-md-6 col-sm-12 mt-3">
										
										<div class="form-group">
											<label class="control-label label_style">Tehsil <span class="text-danger"></span></label>
											
											<form:select class="form-control" id="tahasilId" path="tahasilId">
												<form:option value="0">-- Select Tehsil --</form:option>
												<form:options items="${tahasilList}" itemValue="tahasilId" itemLabel="tahsilName"/>

											</form:select>
										</div>
										</div> 
										<!--  <label for="inputJTitle" class="col-lg-3 col-md-5 col-sm-12 col-form-label label-left mt-3">Organization Name<span class="text-danger">*</span> </label> -->
										<div class="col-lg-2 col-md-6 col-sm-12 mt-3">
											
											<div class="form-group">
											<label class="control-label label_style">Village <span class="text-danger"></span></label>
											
											<form:select class="form-control" id="villageId" path="villageId">
												<form:option value="0">-- Select Village --</form:option>
												<form:options items="${VillageList}" itemValue="villageId" itemLabel="villageName"/>
											</form:select>
										</div>
											
											
											
										</div>
										<div class="col-lg-2 col-md-6 col-sm-12 mt-3">
									<div class="form-group">
											<label class="control-label label_style">Plot No. <span class="text-danger"></span></label>
											<form:input type="text" class="form-control"
												placeholder="Enter Plot No." path="plot_no"/>
									</div>
										</div>
										
								
										<div class="col-lg-2 col-md-6 col-sm-12 pt_2">
											<button type="submit"
												class="btn btn-primary btn-md m-0 waves-effect waves-light"
												id="button2" onclick="return searchValidation();">Search</button>
										</div>
									</div>
						</form:form>


					</div>
					<div class="text-center">
						<a class="searchopen" title="" data-toggle="tooltip"
							data-placement="bottom" data-original-title="Search"> <i
							class="icon-angle-arrow-down"></i>
						</a>
					</div>
				</div>
				
				<div class="card-body">
				 <p class="count_section"><!-- <strong>Total Count : <span class="count_color">1076</span></strong> -->
              	<!-- <span class="red_dot">( <span></span> ) Recently Visited</span> -->
              </p>
					<!--  <p class=""><strong>Total Count : <span class="count_color">1076</span></strong></p> -->
					<div class="table-responsive survey_tbl">
					 <%-- <c:if test="${not empty surveyReportDataList}"> --%>
						<table class="table table-bordered viewTbl">
							<thead>
								<tr>
									<th>Sl#</th>
									<th>District</th>
									<th>Tehsil</th>
									<th>Society</th>
									<th>Village</th>
									<th>Plot No. / Khatian No.</th>
									 <th> Reason For Survey</th>
									 <th>Total Plot Area(In Acre)</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="listValue" items="${surveyReportDataList}"
									varStatus="myIndex">
									<tr>
										<td><c:out value="${(myIndex.index)+1}" /></td>
										<td>${listValue.distname}</td>
										<td>${listValue.tahasilName}</td>
										<td>${listValue.pacsName} (${listValue.pacsCode})</td>
										<td>${listValue.villageName}</td>
										<td>${listValue.plotNo}/${listValue.khataNo}</td>
									    <td>${listValue.surveyReason}</td>
									     <td>${listValue.total_area}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%-- </c:if> --%>
					</div>
				</div>

	
			</div>
		</div>
	</div>
	</div>
	</div>
 <input  type="hidden" value="${message}" id="messageId"/>
	<script src="wrsis/js/spotlight.bundle.js"></script>
	<script>
    	$(document).ready(function(){
    		
    		   if($("#messageId").val()!=''){
    		    	swal({
    					
    					  text: $("#messageId").val(),  
    					  icon: "success",
    					  button: "Close",
    					})
    		    }
    		//search-form
    		$('.searchform').hide();
    			$('.searchbtn').click(function(){
    				$('.searchform').slideToggle();
    				$('.searchbtn .fa').toggleClass('fa-chevron-down fa-chevron-up');
    				if ($('.searchbtn span').text() == "Hide")
    				   $('.searchbtn span').text("Search")
    				else
    				   $('.searchbtn span').text("Hide");		
    			});
    			//search-form end
    	})
    </script>

	<script>
    	$(document).ready(function(){
    		
    		
    	    $('.searchform').show();
    	    
    	    $(".viewDetails").on("click",function(){
    	    var plotCode=$(this).attr("pid");
    	    	//$("#submitModal").modal('show');
    	    	$(this).parent().parent().siblings().find('.visited').removeClass("visited");
    	    	$(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().addClass("visited");
    	    	//.addClass("visited");
    	    	   $.ajax({
    	   			type : "POST",
    	   			url : "fetchPlotDetailsByPlotCode",
    	   			data : 'plotcode='+plotCode,
    	   			cache : false,
    	   			timeout : 600000,
    	   			success : function(response) {
    	   				console.log(response);
    	   				
    	   				$("#pltno").val(response.plotNo);
    	   				$("#khtNo").val(response.khataNo);
    	   				$("#crStus").val(response.cropStatus);
    	   				$("#sp").val(response.position);
    	   				$("#surd").val(response.distance);
    	   				$("#tpa").val(response.total_area);
    	   				$("#aca").val(response.area_valid);
    	   				$("#name").val(response.name);
    	   				$("#sjd").val(response.villageName+","+response.tahasilName+","+response.distname)
    	   				
    	   				$("#sr").val(response.surveyReason);
    	   				$("#mob").val(response.mobile);
    	   				$("#selfeImg").attr("src","data:image/jpeg;base64,"+response.selfeImage);
    	   				$("#selfeLink").attr("href","data:image/jpeg;base64,"+response.selfeImage);
    	   				$("#LandImage1").attr("src","data:image/jpeg;base64,"+response.fieldPhoto1);
    	   				$("#landImage1Link").attr("href","data:image/jpeg;base64,"+response.fieldPhoto1);
    	   				$("#landImage1Link").attr("data-description",parseFloat(response.latitude).toFixed(6)+","+parseFloat(response.longitude).toFixed(6)+" "+new Date(response.survey_time).toLocaleString("en-US").replace(",","") );
    	   				$(".latImg").text(parseFloat(response.latitude).toFixed(6)+","+parseFloat(response.longitude).toFixed(6));
    	   				$(".dat").text(new Date(response.survey_time).toLocaleString("en-US").replace(",","") );
    	   				var landImageArr=[];
    	   				
    	   				var html='';
                            
    	   				//debugger;
    	   				$("#otherLandImg").text('');
    	   				if(response.fieldPhoto2!=""){
    	   					landImageArr.push(response.fieldPhoto2);
    	   				}
    	   				if(response.fieldPhoto3!=""){
    	   					landImageArr.push(response.fieldPhoto3);
    	   				}
    	   				if(response.fieldPhoto4!=""){
    	   					landImageArr.push(response.fieldPhoto4);
    	   				}
    	   				
    	   				
    	   				for(var i=0;i<landImageArr.length;i++){
    	   					html+='<a class="spotlight d-none" href="data:image/jpeg;base64,'+landImageArr[i]+'"><img src="data:image/jpeg;base64,'+landImageArr[i]+'"></a>';
    	   				}
    	   				$("#otherLandImg").append(html);
    	   				
    	   				while(landImageArr.length > 0) {
    	   					landImageArr.pop();
    	   				}
    	   				
    	   				$("#deviceId").val(response.deviceId);
    	   				$("#mobNum").val(response.mobile);
    	   				$("#lat").val(parseFloat(response.latitude).toFixed(6));
    	   				$("#long").val(parseFloat(response.longitude).toFixed(6));
    	   				$("#surt").val(new Date(response.survey_time).toLocaleString("en-US").replace(",",""));
    	   				$("#sso").val(new Date(response.created_on).toLocaleString("en-US").replace(",","")); 
    	   				$("#pc").val(response.plot_code);
    	   				
    	   				//debugger;
    	   				//console.log(new Date(response.survey_time).toLocaleString("en-US").replace(",",""))
    	   				if(response.roleId==5){  //for state 
    	   					if(response.status=='2'){
        	   					$(".blankDiv").hide();
        	   					$("#afStatus").val("Approved");
        	   					$(".prDiv").show();
        	   					$("#statusSubmitBtn").hide();
        	   				}else if(response.status=='3'){
        	   					$(".blankDiv").hide();
        	   					$("#afStatus").val("Rejected");
        	   					$(".prDiv").show();
        	   					$("#statusSubmitBtn").hide();
        	   				}else{
        	   					$(".blankDiv").hide();
        	   					$("#afStatus").val("Pending");
        	   					$(".prDiv").show();
        	   					$("#statusSubmitBtn").hide();
        	   				}
    	   				}else{
    	   				
    	   				if(response.status=='2'){
    	   					$(".blankDiv").hide();
    	   					$("#afStatus").val("Approved");
    	   					$(".prDiv").show();
    	   					$("#statusSubmitBtn").hide();
    	   				}else if(response.status=='3'){
    	   					$(".blankDiv").hide();
    	   					$("#afStatus").val("Rejected");
    	   					$(".prDiv").show();
    	   					$("#statusSubmitBtn").hide();
    	   				}else{
    	   					$(".blankDiv").show();
    	   					$(".prDiv").hide();
    	   					$("#statusSubmitBtn").show();
    	   				}
    	   				}
    	   				
    	   				$("#submitModal").modal('show');

    	   			},
    	   			error:function(err){
    	   				console.log(err);
    	   			}
    	   			
    	   		});
    	    })
    	    

    	            
    	});
    	
    	
    </script>
	<script>
    $(document).ready(function(){
        $('input[name="inlineRadioOptions"]').on("click",function(){
       	 var radioVal=$(this).val();
       	/*  alert(radioVal)
       	 debugger; */
       	if(radioVal=="1"){
       		$(".ascr_view").show();
       		$(".dscr_view").hide()
       	}
       	else{
       		$(".dscr_view").show();
       		$(".ascr_view").hide();
       	}
        });
        
        
    });
    	</script>

	<script>
    	$(document).ready(function(){
    		$('.viewTbl').DataTable( {
    		    "pagingType": "full_numbers",
    		    searching: false
    		    });
    	})
    	
    	</script>

	<script type="text/javascript">
	$(document).ready(function(){
	
	
	$("#distId").on("change",function(){
	var distId=$(this).val();

	
	
	
	fetchPacsListByDistCode(distId);

   
   $.ajax({
		type : "POST",
		url : "fetchtahasilListByDistCode",
		data : 'distId='+distId,
		cache : false,
		timeout : 600000,
		success : function(response) {
			console.log(response)
			var len=response.length;
			var html='';
			html+='<option value="0">--Select Tahasil--</option>';
			for(var i=0;i<len;i++){
				
				html+='<option value="'+response[i].tahasilId+'">'+response[i].tahsilName+'</option>';
				
			}
			$("#tahasilId").empty();
			$('#villageId option:first').attr('selected',true);
			$("#tahasilId").append(html);

		},
		error:function(err){
			console.log(err);
		}
		
	});

});
	
	function fetchPacsListByDistCode(distId){
		
		   $.ajax({
				type : "POST",
				url : "fetchPacsListByDistCode",
				data : 'distId='+distId,
				cache : false,
				timeout : 600000,
				success : function(response) {
					console.log(response)
					var len=response.length;
					var html='';
					html+='<option value="0">--Select Society--</option>';
					for(var i=0;i<len;i++){
						
						html+='<option value="'+response[i].pacsId+'">'+response[i].pacsName+'</option>';
						
					}
					$("#pacsId").empty();
					$('#villageId option:first').attr('selected',true);
					$("#pacsId").append(html);

				},
				error:function(err){
					console.log(err);
				}
				
			});
		
	}
	
	
	$("#tahasilId").on("change",function(){
		var tahasilId=$(this).val();
		
		
	   $.ajax({
		type : "POST",
		url : "fetchvillageListByTahasilCode",
		data : 'tahasilId='+tahasilId,
		cache : false,
		timeout : 600000,
		success : function(response) {
			//console.log(response);
			var len=response.length;
			var html='';
			html+='<option value="0">--Select Village--</option>';
			for(var i=0;i<len;i++){
			
				html+='<option value="'+response[i].villageId+'">'+response[i].villageName+'</option>';
				
			}
			$("#villageId").empty();
			$("#villageId").append(html);

		},
		error:function(err){
			console.log(err);
		}
		
	});
	
	});
	
});
</script>
	<script>
    $(document).ready(function(){
    	$("#fsstatus").on("change",function(){
    		var status=$(this).val();
    		if(status=='3'){
    			$(".rDiv").show();
    		}else{
    			$(".rDiv").hide();
    		}
    	});
    	
    	$("#statusSubmitBtn").on("click",function(){
    		var status=$("#fsstatus").val();
    		var remark=$("#remark").val();
    		if(status=='3' && remark.trim()==''){
    			alert("Please Enter Remark")
    			return false;
    		}
    		if(status=='0'){
    			alert("Please Choose a Status")
    			return false;
    		}
    		
    	})
    });
    </script>
    
       <script>
        $(".accordianBtn").click(function(){
            $(this).next().slideToggle();
            $(this).find('.toogleIcon').toggleClass('fa-plus fa-minus');
        });
    </script>
    
    <script>
	function searchValidation(){
		var roleId="${roleId}";
		//console.log(roleId);
	var distId=$("#distId").val();
	if(distId == '0' && roleId=="1" || roleId=="5"){
		swal("Please Select District");
		return false;
		}
	/* var tahasilId=$("#tahasilId").val();
	if(tahasilId == '0'){
		alert("Please Select Tehsil");
		return false;
		}

	var villageId=$("#villageId").val();
	if(villageId == '0'){
		alert("Please Select Village");
		return false;
		} */
	}
    </script>