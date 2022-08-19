<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:if test="${msg ne Empty}">

	<script>
	 $(document).ready(function(){  
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	 });
</script>
</c:if>
<c:if test="${errMsg ne Empty}">
	<script>
	 $(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	 });
</script>
</c:if>

<div class="mainpanel">
	<form action="wheatDifferentialLineMasterView" method="get"
		id="cancelForm">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

		</form>
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Edit Wheat Differential Line</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Manage Master</li>
						<li class="breadcrumb-item active" aria-current="page">Wheat
							Differential Line</li>

					</ol>
				</nav>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="#">Edit</a>
							<a class="nav-item nav-link "
								href="wheatDifferentialLineMasterView">View</a>
						</ul>
						<div class="indicatorslist">
							<a title="" href="javascript:void(0)" id="backIcon"
								data-toggle="tooltip" data-placement="top"
								data-original-title="Back"><i class="icon-arrow-left1"
								onclick="history.back()"></i></a>
							<p class="ml-2" style="color: red">(*) Indicates mandatory</p>
						</div>
					</div>
					<!-- BASIC FORM ELEMENTS -->
					<!--===================================================-->
					<div class="card-body">
						<!--Static-->

						<div class="width50">

							<form:form action="addEditWheatDiffLine"
								modelAttribute="wheatDiffLineDetails" method="post">
								
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

								<form:hidden path="wheatDifLineId" />
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label">Applicable
										for Type of Rust<span class="text-danger">*</span>
									</label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:select class="form-control" id="typeofRustId"
											path="rustTypeId" autofocus="autofocus" tabindex="1" onchange="return getSeqNo(this.value)">
											<form:option value="0">--Select--</form:option>
											<form:options items="${rustTypeList}" itemLabel="typeOfRust"
												itemValue="rustId" />
										</form:select>
									</div>

								</div>
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-text-input1">Is 1<sup>st</sup> Differential
										Line ?<span class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:select class="form-control" id="is1stDiff" tabindex="2"
											path="firstLine">
											<form:option value="0">Used only for Repetition</form:option>
											<form:option value="1">Used only for 1st Differential Line</form:option>
											<form:option value="2">Used for 1st Differential Line and Repetition</form:option>
										</form:select>
									</div>
								</div>


								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-text-input1">Differential Line Name<span
										class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:input id="diffLineId" class="form-control"
											placeholder="Differential Line Name" path="difLine"
											maxlength="50" tabindex="3" />
									</div>
								</div>
								<div class="form-group row hidsec diffsetno">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-text-input1">Differential Set Number<span
										class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:select class="form-control" id="diffSetNoId"
											tabindex="4" path="diffSetNo">
											<form:option value="0">--Select--</form:option>
											<c:forEach var="i" begin="1" end="${diffsetno}">
												<form:option value="${i}">${i}</form:option>
											</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="form-group row hidsec">

									<label class="col-12 col-md-4 col-xl-4 control-label">Sequence
										No.<span class="text-danger">*</span>
									</label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:input id="seqNo" class="form-control" path="seqNo"
											placeholder="Sequence No." maxlength="50" tabindex="6" />
									</div>
								</div>
								<div class="form-group row hidsec">

									<label class="col-12 col-md-4 col-xl-4 control-label">Seed
										Source</label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:select class="form-control" id="seedSourceId"
											path="seedSrcId" tabindex="5">
											<form:option value="0">--Select--</form:option>
											<form:options items="${seedSourceList}" itemLabel="seedSrc"
												itemValue="seedSrcId" />
										</form:select>
									</div>
								</div>
								<div class="form-group row hidsec">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-text-input2">Gene<span
										class="text-danger gene">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:input id="geneId" class="form-control" path="gene"
											placeholder="Gene" maxlength="50" tabindex="6" />
									</div>
								</div>
								<div class="form-group row hidsec">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-text-input3">Expected Low IT</label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:input id="expectedLowItId" class="form-control"
											path="expectLowIt" placeholder="Expected Low IT"
											maxlength="50" tabindex="7" />
									</div>
								</div>
								<div class="form-group row hidsec" id="divracephenotype">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-text-input3">Race Phenotype<span
										class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:input id="racephenotype" class="form-control"
											path="racePhenotype" placeholder="Race Phenotype"
											maxlength="50" tabindex="7" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"
										for="demo-email-input">Description</label>
									<div class="col-12 col-md-8 col-xl-8">
										<span class="colon">:</span>
										<form:textarea rows="4" class="form-control" maxlength="200"
											id="descId" path="desc" tabindex="8" />
										<div id="charNum"></div>
									</div>
									<label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
									<div class="col-12 col-md-6 col-xl-4">
										<span class="colon">:</span>
										<div class="radio">
											<form:radiobutton id="demo-form-radio" path="status"
												value="false" class="magic-radio sampleyes"
												checked="checked" />
											<label for="demo-form-radio" tabindex="9">Active</label>

											<form:radiobutton id="demo-form-radio-2" path="status"
												value="true" class="magic-radio sampleno" />
											<label for="demo-form-radio-2" tabindex="10">Inactive</label>
										</div>
									</div>
								</div>

								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"></label>
									<div class="col-12 col-md-8 col-xl-8">
										<button class="btn btn-primary mb-1" id="btnUpdateId"
											tabindex="11">Update</button>
										<button class="btn btn-danger mb-1" type="button"
											id="btnCancelId" onclick="history.back()" tabindex="12">Cancel</button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
        
         $(document).ready(function(){
         	   $('#btnUpdateId').click(function()
         			   {
         		  event.preventDefault(); 
    			  var form = event.target.form;
    			  if ( $('#typeofRustId').val() == '0')
     	    	  {
     	    	  swal("Error", "Please select Applicable for Type of Rust ", "error").then(function() {
       				   $("#typeofRustId").focus();
       			   });
     	    	  return false;
     	    	  }
         		  
         		   if ($('#diffLineId').val() == "")
         		   {
         	        	swal("Error", "Please enter the Differential Line Name", "error").then(function() {
		       				   $("#diffLineId").focus();
		       			   });
         	            return false;
         	        }
         		  if ($('#seqNo').val() == "")
         		   {
         	        	swal("Error", "Please enter the Sequence No.", "error").then(function() {
		       				   $("#seqNo").focus();
		       			   });
         	            return false;
         	        }
         		  if($('#diffLineId').val().charAt(0)== ' ' || $('#diffLineId').val().charAt($('#diffLineId').val().length -1)== ' '){
	           		   swal("Error", "White space is not allowed at initial and last place in Differential Line Name", "error").then(function() {
	       				   $("#diffLineId").focus();
	       			   });
	                    return false;
	           	   }
	           	   if($('#diffLineId').val()!=null)
	               	{
	           	   		var count= 0;
	           	   		var i;
	           	   		for(i=0;i<$('#diffLineId').val().length && i+1 < $('#diffLineId').val().length;i++)
	           	   		{
	           	   			if (($('#diffLineId').val().charAt(i) == ' ') && ($('#diffLineId').val().charAt(i + 1) == ' ')) 
	           	   			{
	           					count++;
	           				}
	           	   		}
	           	   		if (count > 0) {
	           	   			swal("Error", "Differential Line Name should not contain consecutive blank spaces", "error").then(function() {
	        					   $("#diffLineId").focus();
	        				   });
	           				return false;
	           			}
	               	}
		           	if ($('#is1stDiff').val() !=1)
	        		   {
		         			 if ($("#typeofRustId").val()!=3 && $('#diffSetNoId').val() == 0)
		          		   {
		          	        	swal("Error", "Please select Differential Set Number", "error").then(function() {
				       				   $("#diffSetNoId").focus();
				       			   });
		          	        	return false;
		          	        }
		         			if ($("#typeofRustId").val()==3 && $('#geneId').val() == "")
			          		   {
			          	        	swal("Error", "Please enter Gene", "error").then(function() {
					       				   $("#geneId").focus();
					       			   });
			          	        	return false;
			          	        }
		         			if ($("#typeofRustId").val()==3 && $('#racephenotype').val() == "")
			          		   {
			          	        	swal("Error", "Please enter Race Phenotype", "error").then(function() {
					       				   $("#racephenotype").focus();
					       			   });
			          	        	return false;
			          	        }
				           	if($('#geneId').val().charAt(0)== ' ' || $('#geneId').val().charAt($('#geneId').val().length -1)== ' '){
				           		   swal("Error", "White space is not allowed at initial and last place in Gene", "error").then(function() {
				       				   $("#geneId").focus();
				       			   });
				                    return false;
				           	   }
				           	   if($('#geneId').val()!=null)
				               	{
				           	   		var count= 0;
				           	   		var i;
				           	   		for(i=0;i<$('#geneId').val().length && i+1 < $('#geneId').val().length;i++)
				           	   		{
				           	   			if (($('#geneId').val().charAt(i) == ' ') && ($('#geneId').val().charAt(i + 1) == ' ')) 
				           	   			{
				           					count++;
				           				}
				           	   		}
				           	   		if (count > 0) {
				           	   			swal("Error", "Gene should not contain consecutive blank spaces", "error").then(function() {
				        					   $("#geneId").focus();
				        				   });
				           				return false;
				           			}
				               	}
				           	if($('#expectedLowItId').val().charAt(0)== ' ' || $('#expectedLowItId').val().charAt($('#expectedLowItId').val().length -1)== ' '){
				           		   swal("Error", "White space is not allowed at initial and last place in Expected Low It", "error").then(function() {
				       				   $("#expectedLowItId").focus();
				       			   });
				                    return false;
				           	   }
				           	   if($('#expectedLowItId').val()!=null)
				               	{
				           	   		var count= 0;
				           	   		var i;
				           	   		for(i=0;i<$('#expectedLowItId').val().length && i+1 < $('#expectedLowItId').val().length;i++)
				           	   		{
				           	   			if (($('#expectedLowItId').val().charAt(i) == ' ') && ($('#expectedLowItId').val().charAt(i + 1) == ' ')) 
				           	   			{
				           					count++;
				           				}
				           	   		}
				           	   		if (count > 0) {
				           	   			swal("Error", "Expected Low It should not contain consecutive blank spaces", "error").then(function() {
				        					   $("#expectedLowItId").focus();
				        				   });
				           				return false;
				           			}
				               	}
	        	      }
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
      	        return false;
         });
});
</script>

<script>
$(document).ready(function(){
			/* $('.gene').hide();
			$('#divracephenotype').hide(); */
			if($("#typeofRustId").val()!=3 && $("#is1stDiff").val()!=1)
				{
				$('.gene').hide();
				$('#divracephenotype').hide();
				$('#racephenotype').val('');
				}else if($("#typeofRustId").val()==3 && $("#is1stDiff").val()!=1)
					{
					$('.gene').show();
					$('#divracephenotype').show();
					$('#diffSetNoId').val(0);
					$('.diffsetno').hide();
					}
			$("#typeofRustId").change(function()
					{
						if($("#typeofRustId").val()!=3 && $("#is1stDiff").val()!=1)
						{
							$('.hidsec').show();
							$('.gene').hide();
							$('#divracephenotype').hide();
							$('#racephenotype').val('');
							$('.diffsetno').show();
						}
						else if($("#typeofRustId").val()==3 && $("#is1stDiff").val()!=1)
						{
							$('.hidsec').show();
							$('.gene').show();
							$('#divracephenotype').show();
							$('.diffsetno').hide();
							$('#diffSetNoId').val(0);
						}
				});
			$("#is1stDiff").change(function()
					{
				if($("#is1stDiff").val()==1)
				{
					$('.hidsec').hide();
					$('#diffSetNoId').val(0);
					$('#seedSourceId').val(0);
					$('#geneId').val('');
					$('#expectedLowItId').val('');
					$('#racephenotype').val('');
					$('#seqNo').val(0);
				}else if($("#typeofRustId").val()!=3 && $("#is1stDiff").val()!=1)
				{
					$('.hidsec').show();
					$('.gene').hide();
					$('#divracephenotype').hide();
					$('#racephenotype').val('');
					$('.diffsetno').show();
				}
				else if($("#typeofRustId").val()==3 && $("#is1stDiff").val()!=1)
				{
					$('.hidsec').show();
					$('.gene').show();
					$('#divracephenotype').show();
					$('.diffsetno').hide();
					$('#diffSetNoId').val(0);
				}
					});
});
</script>
<script>
function getSeqNo(rustid)
{
	if(rustid!=0)
	{
		 $.ajax({
				type : "POST",
				url : "getMaxSeqNo", 
				data:{
						"rustid":rustid
				},
				success : function(response) {
					
					var val=JSON.parse(response);
				    var maxsqno=val.no;
					$('#seqNo').val(maxsqno);
					
				},error : function(error) {
					 
				}
			});
	} else
		return false;
}
</script>