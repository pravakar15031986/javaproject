<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Update Race Analysis Result</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Manage Race
								Analysis</li>
						<li class="breadcrumb-item active" aria-current="page">External
							Tagged Samples</li>
					</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="#">Update Race
								Result</a>
							<a class="nav-item nav-link " href="externalTaggedSamples">View</a>
						</ul>
						<div class="indicatorslist">
							
							<a title="" href="externalTaggedSamples" id="backIcon"
								data-toggle="tooltip" data-placement="top"
								data-original-title="Back"><i class="icon-arrow-left1"></i></a>
							<p class="ml-2" style="color: red;">(*) Indicates mandatory</p>
						</div>
					</div>
					<!-- BASIC FORM ELEMENTS -->
					<!--===================================================-->
					<form:form action="updateExtTaggedSample"
						modelAttribute="extTaggedSampledetails" autocomplete="off"
						method="post">
						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						<form:hidden path="sampleLabTagId" />
						<div class="card-body">
							<!--Static-->
							<!--Text Input-->

							<div class="form-group row">
								<label class="col-12 col-md-2 col-xl-2 control-label"
									for="demography-name">Sample ID</label>
								<div class="col-12 col-md-6 col-xl-4">
									<span class="colon">:</span>
									<c:out value="${extTaggedSampledetails.sampleIdValue }" />
									<form:hidden path="sampleIdValue" />
								</div>
							</div>

							<div class="form-group row">
								<label class="col-12 col-md-2 col-xl-2 control-label"
									for="description">Survey Date</label>
								<div class="col-12 col-md-6 col-xl-4">
									<span class="colon">:</span>
									<c:out value="${extTaggedSampledetails.surveyDate }" />
									<form:hidden path="surveyDate" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-12 col-md-2 col-xl-2 control-label"
									for="short-name">Survey No. </label>
								<div class="col-12 col-md-6 col-xl-4">
									<span class="colon">:</span>
									<c:out value="${extTaggedSampledetails.surveyNo }" />
									<form:hidden path="surveyNo" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-12 col-md-2 col-xl-2 control-label"
									for="description">Rust Type</label>
								<div class="col-12 col-md-6 col-xl-4">
									<span class="colon">:</span>
									<c:out value="${extTaggedSampledetails.rustType }" />
									<form:hidden path="rustType" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-12 col-md-2 col-xl-2 control-label">Region</label>
								<div class="col-12 col-md-6 col-xl-4">
									<span class="colon">:</span>
									<c:out value="${extTaggedSampledetails.regionName }" />
									<form:hidden path="regionName" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-12 col-md-2 col-xl-2 control-label"
									for="description">Sample Action<span
									class="text-danger">*</span></label>
								<div class="col-12 col-md-6 col-xl-4">
									<span class="colon">:</span>
									<div class="radio">
										<form:radiobutton id="demo-form-radio" value="2"
											class="magic-radio" path="raceStatus" checked="checked" />
										<label for="demo-form-radio">Race Result</label>
										<form:radiobutton id="demo-form-radio-2" value="3"
											path="raceStatus" class="magic-radio" />
										<label for="demo-form-radio-2">Dump</label>
									</div>
								</div>
							</div>
							<div class="form-group row divRaceResult">
								<label class="col-12 col-md-2 col-xl-2 control-label"
									for="description">Race Name<span class="text-danger">*</span></label>
								<div class="col-12 col-md-6 col-xl-4">
									<span class="colon">:</span>
									<form:input id="raceResult" class="form-control"
										path="raceResult" placeholder="Race Name"
										autofocus="autofocus" maxlength="50" />
								</div>
							</div>
							<div class="form-group row divremark">
								<label class="col-12 col-md-2 col-xl-2 control-label"
									for="description">Remark<span class="text-danger">*</span></label>
								<div class="col-12 col-md-6 col-xl-4">
									<span class="colon">:</span>
									<form:textarea id="remark" class="form-control"
										path="rejectRemark" placeholder="Remark" autofocus="autofocus"
										maxlength="200" />
									<div id="charNum"></div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-12 col-md-2 col-xl-2 control-label"></label>
								<div class="col-12 col-md-6 col-xl-4">
									<button class="btn btn-primary mb-1" id="btnUpdateId"
										tabindex="10">Update</button>
									<a class="btn btn-danger mb-1" tabindex="11"
										href="externalTaggedSamples">Cancel</a>
								</div>
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


<script>
$(document).ready(function(){
	   $('#btnUpdateId').click(function(){
		   event.preventDefault();
	  		 var form = event.target.form;
            	swal({
            		title: ' Do you want to update?',
            		  type: 'warning',
            		  showCancelButton: true,
            		  confirmButtonText: 'Yes',
            		  cancelButtonText: 'No',
            		  /* reverseButtons: true */
        	    }).then((result) => {
        	    	  if (result.value) {
        	    		  form.submit();
        	    		  }
        	    		})
	    });
	   return false;
	});
</script>
<script>
$(document).ready(function()
		{
	var val=$('input[type=radio][name=raceStatus]').val()
	if(val == 3)
	  {
	  $(".divremark").show();
	  $(".divRaceResult").hide();
	  $("#raceResult").val('');
	  }
else if(val == 2)
	  {
	  $(".divRaceResult").show();
	  $(".divremark").hide();
	  $('#remark').val('');
	  }
		});
</script>

<script>
	$('input[type=radio][name=raceStatus]').on('change', function() {
		  var val = $(this).val();
		  if(val == 3)
			  {
			  $(".divremark").show();
			  $(".divRaceResult").hide();
			  $("#raceResult").val('');
			  var text_max = 200;
			  $('#charNum').html('Maximum characters :' + text_max);
				 $('#remark').keyup(function() {
				     var text_length = $('#remark').val().length;
				     var text_remaining = text_max - text_length;
				     $('#charNum').html('Maximum characters :' + text_remaining);
				 });
			  }
		  else if(val == 2)
			  {
			  $(".divRaceResult").show();
			  $(".divremark").hide();
			  $('#remark').val('');
			  }
		});
</script>

<c:if test="${errMsg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>
