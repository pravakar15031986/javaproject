<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript" src="wrsis/pagejs/demography.js"></script>


<div class="mainpanel">
	<form action="viewkebele" method="get" id="cancelForm"><input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/></form>
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Forward Recommendation</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Recommendation</li>
						<li class="breadcrumb-item active" aria-current="page">Recommendation
							By BoA</li>
					</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="#">Forward</a>
						</ul>
						<div class="indicatorslist">
							
							<a title="" href="javascript:void(0)" id="backIcon"
								data-toggle="tooltip" data-placement="top"
								data-original-title="Back" onclick="history.back()"><i
								class="icon-arrow-left1"></i></a>
							<p class="ml-2" style="color: red;">(*) Indicates mandatory</p>
						</div>
					</div>
					<!-- BASIC FORM ELEMENTS -->
					<!--===================================================-->
					<form:form action="updateRecommendationForwardByBoa"
						modelAttribute="recDetails" autocomplete="off" method="post">
						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						<form:hidden path="recomendId" />
						<form:hidden path="recomendTypeBean" value="${recDetails.recomendTypeBean}"/>
						
						<div class="card-body">
							<!--Static-->

							<div class="width50">
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-email-input">Recommendation No.</label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<c:out value="${recDetails.recomendNoBean}" />
									</div>
								</div>



								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-email-input">Type of Recommendation</label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<c:if test="${recDetails.recomendTypeBean eq 1}">
									General
									</c:if>
										<c:if test="${recDetails.recomendTypeBean eq 2}">
									Region Specific
									</c:if>
									</div>
								</div>
								<%-- <c:if test="${recDetails.recomendTypeBean eq 2}">
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Region</label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Woreda</label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span>
										</div>
									</div>
								</c:if> --%>
								
								
								<c:if test="${recDetails.recomendTypeBean eq 2}">
						<div class="table-responsive">
							<table data-toggle="table"
								class="table table-hover table-bordered" id="myTable">
								<thead>
									<tr>
										<th>Region</th>
										<th>Zone</th>
										<th>Woreda</th>
										<th>Kebele</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${locDetails}" var="loc">
								<tr>
									<td>${loc.regionName}</td>
									<td>${loc.zoneName}</td>
									<td>${loc.woredaName}</td>
									<td>${loc.kebeleName}</td>
								<tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</c:if>
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-email-input">Remark <span
										class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<textarea rows="3" cols="100" class="form-control"
											name="forwardRemarkBean" maxlength="200" id="remarkId"></textarea>
										<div id="charNum"></div>
									</div>

								</div>
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"></label>
									<div class="col-12 col-md-8 col-xl-8">
										<button class="btn btn-primary mb-1" id="btnSubmitId">Submit</button>
										<a type="button" class="btn btn-danger mb-1"
											id="btnCancelId" href="viewRecommendationByBoa">Back</a>
									</div>
								</div>
							</div>



							<div class="width50">

								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-email-input">Recommendation Date</label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<c:out value="${recDetails.recDate}"></c:out>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-email-input">Recommendation Document</label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span> <a title=""
											href="javascript:void(0)" id="downloadIcon"
											data-toggle="tooltip" data-placement="top"
											data-original-title="Download"
											onclick="downloadFile(${recDetails.recomendId})">${recDetails.recFileName}</a>
									</div>
								</div>
								<%-- <c:if test="${recDetails.recomendTypeBean eq 2}">
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Zone</label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Kebele</label>
										<div class="col-12 col-md-8 col-xl-8">
											<span class="colon">:</span>
										</div>
									</div>
								</c:if> --%>
							</div>
							
							
					
					
					
								
						</div>
					</form:form>
					<!--===================================================-->
					<!-- END BASIC FORM ELEMENTS -->
				</div>
			</div>
		</div>
	</div>
</div>
<form action="recommendation-file-download" id="downloadForm"
	method="post">
	<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
	<input type="hidden" name="downId" id="downId">
</form>
<script>
$(document).ready(function(){
	
	   $('#btnSubmitId').click(function(){
		    event.preventDefault(); 
			var form = event.target.form;
			var remark=$('#remarkId').val();
			/* if(remark.length>0)
				{
				alert(remark);
				} */
			if(remark.length==0)
				{
				swal("Error", "Please enter Remark", "error").then(function() {
	  				   $("#remarkId").focus();
	  			   });
	  	            return false;
				}
			if(remark.charAt(0)== ' ' || remark.charAt(remark.length - 1)== ' '){
	  			   swal("Error", "White space is not allowed at initial and last place in Remark", "error").then(function() {
	  				   $("#remarkId").focus();
	  			   });
	  	            return false;
	  		   }
	  	   	if(remark!=null)
	    	{
	  	   		var count= 0;
	  	   		var i;
	  	   		for(i=0;i<remark.length && i+1 < remark.length;i++)
	  	   		{
	  	   			if ((remark.charAt(i) == ' ') && (remark.charAt(i + 1) == ' ')) 
	  	   			{
	  					count++;
	  				}
	  	   		}
	  	   		if (count > 0) {
	  	   			swal("Error", "Remark should not contain consecutive blank spaces", "error").then(function() {
	  				   $("#remarkId").focus();
	  				});
	  				return false;
	  			}
	    	}
			swal({
        		title: ' Do you want to forward?',
        		  type: 'warning',
        		  showCancelButton: true,
        		  confirmButtonText: 'Yes',
        		  cancelButtonText: 'No',
    	    }).then((result) => {
    	    	  if (result.value) {
    	    		  form.submit();
    	    		  }
    	    		})
    	    return false;
	   });
});
</script>

<script>
$(document).ready(function(){
	 var text_max = 200;
	 $('#charNum').html('Maximum characters :' + text_max);
	 $('#remarkId').keyup(function() {
	     var text_length = $('#remarkId').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
});
</script>
<script>
 function downloadFile(id)
 {	
	
 	$.ajax({
 		type:"GET",
 		url:"recommendation-file-exists",
 		data:{
 				"downId":id
 		},
 		success:function(response){
			//alert(response);
 			var res=JSON.parse(response);
 			if(res.msg == 'Yes')
 			{	
 				$("#downId").val(id);
 				$("#downloadForm").submit();
 			}else{
 				swal("File not found"," ", "error"); 
 				}
 		},
 		error:function(error)
 		{
 		},		
 		}); 
 }
 </script>

<c:if test="${errMsg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>