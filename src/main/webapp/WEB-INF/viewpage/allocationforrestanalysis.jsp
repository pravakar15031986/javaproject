<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	 
<style>
  .container-fluid {padding-right: 0;padding-left: 0;}
</style>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Allocation For Race Analysis</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Race Analysis</li>
                           <li class="breadcrumb-item active" aria-current="page">Tag Sample</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link 	active"  href="allocationforrestanalysis">Tag Sample</a>
                              <a class="nav-item nav-link" href="viewsample">View Tagged Samples</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                             
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec"> 
                           <form:form action="allocationforrestanalysis" autocomplete="off" modelAttribute="searchVo"  method="post">
                                  <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                                   <div class="form-group">
                                 <div class="row">
                                  <label class="col-lg-2 ">Survey No.</label>
                                    <div class="col-lg-3">
                                       <form:input type="text" class="form-control"  placeholder="" data-bv-field="fullName" id="surveyNo" path="surveyNo" />
                                    </div>
                                    <label class="col-lg-2 ">Sample ID</label>
                                    <div class="col-lg-3">
                                       <form:input type="text" class="form-control" placeholder="" data-bv-field="fullName" id="sampleId" path="sampleId" />
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Survey Date From</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"  path="startDate" id="startDate"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Survey Date To</label>
                                    <div class="input-group col-lg-3">
                                       <form:input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default"  path="endDate" id="endDate"/>
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                              	</div>
                              </div>
                              <div class="form-group">
                                 <div class="row">
                                  <label class="col-lg-2 ">Region Name</label>
                                    <div class="col-lg-3">
                                   <form:select  class="form-control"  path="regionId">
                                   <form:option value="0">--Select--</form:option>
                                   <c:forEach items="${regionList}" var="region"> 
                                   	<form:option value="${region.demographyId}">${region.demographyName}</form:option>
                                   </c:forEach>
                                    </form:select>
                                    </div>
                                    <label class="col-sm-2 ">Type of Rust</label>
                                    <div class="col-sm-3">
										<form:select class="form-control"  path="rustTypeId">
											<form:option value="0">--select--</form:option>
											<c:forEach items="${rustTypeList}" var="rustTypeList">
												<form:option value="${ rustTypeList.rustId}">${ rustTypeList.typeOfRust}</form:option>
											</c:forEach>
										</form:select>
									</div>
                                     <div class="col-lg-2">
                                       <button type="submit" onclick="return checkSearch()" class="btn btn-primary"  > <i class="fa fa-search"></i> Search</button>
                                    </div>
                                 </div>
                              </div>
                           </form:form>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                           
                        </div>
                                   <form action="viewSurveyDetailsForTagSample" autocomplete="off" id="myForm1"   method="post">
                                  <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                                   <input type="text" value="" style="display:none;" name="surveyId" id="surveyId1">
                                <input type="hidden"   name="r_url" value="allocationforrestanalysis">
                                 </form>
       
       <%--  <form method="post" action="searchSurveyTagSample" id="check">
        	
        </form> --%>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <form action="" autocomplete="off">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                        
                            <div class=""> 
                              <table data-toggle="table" id="viewTagSample" class="table table-hover table-bordered">
                                 <thead>
                                    <tr>
                                        <th width="25px" valign="top" id="checkid">
                                          <input id="demo-form-inline-checkboxall" class="magic-checkbox" type="checkbox" >
                                          <label for="demo-form-inline-checkboxall"></label>
                                       </th>
                                       <th width="40px">Sl#</th>
                                       <th>Sample ID</th>
                                       <th>Survey No.</th>
                                       <th>Survey Date</th>
                                       <th>Published Date</th>
                                       <th>Region</th>
                                       <th>Rust Type</th>
                                       <th>Laboratory Name</th>
                                       
                                   
                                    </tr>
                                 </thead>
                                 <tbody>
                                   <%-- <c:forEach items="${samples}" var="dtls" varStatus="theCount">
                                    <tr>
                                    
                                    
									   <td>
                                       		 <input id="checkbox_${theCount.index }" class="magic-checkbox" type="checkbox" name="surveyDetailsId" value="${dtls.sampleId }" >
                                          	<label for="checkbox_${theCount.index }"></label>
                                         </td>
                                         
                                        <td>${theCount.index + 1 }</td>
                                        <td>
                                        <input type="hidden" id="sample_${theCount.index }"  value="${dtls.sampleValue }">
                                        <input type="hidden" id="sampleids_${theCount.index }"  value="${dtls.samplesId }">
                                        ${dtls.sampleValue }
                                        </td>
                                       <td>
                                       <input type="hidden" id="surveyid_${theCount.index }"  value="${dtls.surveyId }">
                                       <input type="hidden" id="surveyval_${theCount.index }"  value="${dtls.surveyNo }"> <a href="javascript:void(0);" class="viewsurvey" survey-id="${dtls.surveyId }">${dtls.surveyNo }</a>
                                       </td>
                                       <td>
                                       <input type="hidden" id="surveydt_${theCount.index }"  value="${dtls.surveyDate }">
                                       ${dtls.surveyDate }
                                       </td>
                                       <td>
                                       <input type="hidden" id="publishdt_${theCount.index }"  value="${dtls.surveyPublishDate }">
                                       ${dtls.surveyPublishDate }
                                       </td>
                                       <td>
                                       <input type="hidden" id="regionid_${theCount.index }"  value="${dtls.regionId }">
                                       ${dtls.region }
                                       </td>
                                       <td>
                                       <input type="hidden" id="rustid_${theCount.index }"  value="${dtls.rustId }">
                                       ${dtls.rustType }
                                       </td>
                                       <td>${dtls.researchCenter }</td>
                                       <td>
                                        <select class="form-control" id="select_${theCount.index }">
                                        <c:forEach items="${dtls.researchCenterDetails}" var="list">
										<option value="${list.researchCenterId}">${list.researchCenter}</option> 
										</c:forEach>
										</select>
                                       </td>
                                    </tr>
                                    
                                   </c:forEach> --%>
                                 </tbody>
                              </table>
                              <c:if test="${Show eq true }">
                             <div class="form-group row pad-ver" id="researchId">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Lab Tagging<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <input type="radio"  id="demo-form-radio" value="false" class="magic-radio sampleyes" name="status"  checked="checked"/>
                                    <label for="demo-form-radio" tabindex="0">Internal</label>
                             
                                    <input type="radio" id="demo-form-radio-2" value="true" name="status" class="magic-radio sampleno" />
                                    <label for="demo-form-radio-2" tabindex="0">External</label>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 <button class="btn btn-primary mb-1" id="btnSubmitId">Submit</button>
                                 <button class="btn btn-danger mb-1" type="reset" id="btnResetId">Reset</button>
                              </div>
                           </div>
                           </c:if>
                          </div> 
                        </div>
                        </form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
            <form action="viewSurveyDetailsById" autocomplete="off" id="myForm"   method="post">
            <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                             <input type="text" value="" style="display:none;" name="surveyId" id="surveyId">
                             <input type="hidden"   name="r_url" value="allocationforrestanalysis">
                           </form>
         <script>
           $(document).on('click', '.viewsurvey', function()
       			{
       			  //window.location.href="modifySurveyData";
       			   var surveyId = $(this).attr('survey-id');
       			   $("#surveyId1").val(surveyId);
       			   $("#myForm1").submit();

       	 
       			});  
           $(document).ready(function(){
               
				/* 	var samplevalue ="${samples}";
					if(samplevalue == "[]"){
						$("#researchId").hide();
					    $("#checkid").hide();
					    $("#btnSubmitId").hide();
				    $("#btnResetId").hide();
						}else{
							$("#researchId").show();
							$("#checkid").show();
							$("#btnSubmitId").show();
							$("#btnResetId").show();
							} */
				   

					
					$("#demo-form-inline-checkboxall").click(function(){
		        $("input[type=checkbox]").prop('checked', $(this).prop('checked'))}
					);
					
					  $("#btnSubmitId").click(function(){
						 
						 if($( ".magic-checkbox:checked" ).length > 0)
					  {
							
							//var x = $("#demo-form-radio-2").val();
							
							var surveyDetaArr = [];
							var check = true;
		                $.each($("input[name='surveyDetailsId']:checked"), function(){
		                	
			                var json = {};
			                json.sampleId = $(this).val();
			                var index = $(this).attr('id').split("_")[1];
			                var opt = $("#select_"+index).val();
			                
			                
			                if($("#select_"+index).val() == null && $("#demo-form-radio").prop('checked')){
			                	swal("Error", "Please add Laboratory", "error");
			                	check = false;
			                	 
								 	return false;
				               } 
			                var splv = $("#sample_"+index).val();
			                var splids = $("#sampleids_"+index).val();
			                var surveyId = $("#surveyid_"+index).val();
			                var surveyVal = $("#surveyval_"+index).val();
			                var surveydt = $("#surveydt_"+index).val();
			               //var publdat = $("#publishdt_"+index).val();
			                var regionid = $("#regionid_"+index).val();
			                var rustid = $("#rustid_"+index).val();
			                json.regionid = regionid;
			                json.rustid = rustid;
			                json.surveydt = surveydt;
			                //json.publisdat = publdat;
			                json.surveyId = surveyId;
			                json.surveyValue = surveyVal;
			                json.samplids = splids;
			                json.samplval = splv;
			                json.labId = opt;
			                json.labstat = (($("#demo-form-radio").prop('checked') == true )?false:true);
			                var labid = json.labId;
		                	surveyDetaArr.push(json);
		                });

		                if(check == false)
			                {
			                return false;
			                }
		                finalJson = {"RowsData":surveyDetaArr};
		    			console.log(JSON.stringify(finalJson));
					    swal({
				         		title: 'Do you want to Submit?',
				         		  type: 'warning',
				         		  showCancelButton: true,
				         		  confirmButtonText: 'Yes',
				         		  cancelButtonText: 'No',
				        	    }).then((result) => {
			    					if (result.value) {
			    						$.ajax({ 
			    						    url:"addTagSample",    
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
						 else
							 {
							 	swal("Error", "Please choose atleast one sample", "error");
							 	return false;
							 }
					  } );
				});

$(function() {
	

	$('#viewTagSample').dataTable({
		
			'processing' : true,
			'serverSide' : true,
			 "searching": false,
	      "ordering": false, 
			 "ajax" : {
					"url" : "tagSampleDetailsData",
					"data" : function(d) {
						d.surveyNo= $("#surveyNo").val();
						d.sampleId = $("#sampleId").val();
						d.startDate =$("#startDate").val();
						d.endDate = $("#endDate").val();
						d.regionId = $("#regionId").val();
						d.rustTypeId = $("#rustTypeId").val();
					}
			},
			"dataSrc": "",
			"columns":[
				{"data":"surveyCheckBox"},
				{"data":"sNo"},
				{"data":"sampleValue"},
				{"data":"surveyNo"},
				{"data":"surveyDate"},
				{"data":"surveyPublishDate"},
				{"data":"region"},
				{"data":"rustType"},
				{"data":"rcDropDown"}
				
			]
	
  
	});
	});	


function checkSearch()
{
	
	 var startDate = $("#startDate").val();
	 var endDate =  $("#endDate").val();
	 if(startDate.trim() != '' && endDate.trim() == '')
		 {
		 $("#endDate").focus();
		 swal(
					'Error!',
					'Please select Survey Date To.',
					'error'
				)
				return false;
		 }
	 
	 if(startDate.trim() == '' && endDate.trim() != '')
	 {
	 $("#startDate").focus();
	 swal(
				'Error!',
				'Please select Survey Date From.',
				'error'
			)
			return false;
	 }
	 
	 

     if(Date.parse(startDate) > Date.parse(endDate)){
   	  swal("Error", "Survey date to  should not be less than Survey date from", "error");
       	 $("#dateto").focus();
           return false;
   	}
     
	 
}
</script>
							
					