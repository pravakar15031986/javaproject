
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>Configure Approval Level and Period</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Manage Approval Process</li>
						<li class="breadcrumb-item active" aria-current="page">Multilevel Approval</li>
					</ol>
				</nav>
			</div>

		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="addApprovalAuthority">Add</a>
							
						</ul>
						<div class="indicatorslist">
							
							
							<p class="ml-2" style="color: red;">(*) Indicates mandatory</p>
						</div>
					</div>
					<!-- BASIC FORM ELEMENTS -->
					<!--===================================================-->
					<form action="addApprovalAuthorityStoring" autocomplete="off">
						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						<div class="card-body">
							<!--Static-->
							<!--Text Input-->
							<div class="form-group row">
								<label class="col-12 col-md-2 col-xl-2 control-label"
									for="demo-text-input2">Process <span
									class="text-danger">*</span></label>
								<div class="col-12 col-md-6 col-xl-4">
									<span class="colon">:</span> <select class="form-control"
										id="processId">
										<option value="0">--Select--</option>
										<c:forEach items="${processList}" var="processObj">
											<option value="${processObj.processId}">${processObj.processName}</option>
										</c:forEach>
									</select>
									<%-- <form:hidden id="jsonData" path="jsonData" /> --%>
								</div>
							</div>


							<div class="">
								<table class="table table-bordered" id="authority">

									<thead>
										<tr>
											<th>Level No.</th>
											<th >From<span class="mandatory">*</span></th>
											<th >Role</th>
											<th >Officer Name</th>
											<th >Time Line&nbsp;<br>(Days)
											</th>
											<th >Approval Action</th>
											<th  class="center addDelete">Add
												More/Delete</th>

										</tr>

									</thead>
									<tbody class="appendTr">
										<tr class="addTr">
											<td ><label class="lblSlNo">1</label></td>

											<td><label id="lblDesg1" class="lblDesg">Applicant</label></td>
											<td><select class="form-control d" id="role_1" onchange="roleOnchange(this,0)">
													<option value="0">Select Role</option>
													<c:forEach items="${adminRole}" var="admin">
														<option value="${admin.roleId}">${admin.aliasName}</option>
													</c:forEach>
											</select></td>
											<td><select class="form-control ul" id="officer_1">
													<option value="0">Select User</option>
													<%-- <c:forEach items="${userName}" var="userNameObj">
														<option value="${userNameObj.userId}">${userNameObj.fullName}</option>
													</c:forEach> --%>
											</select></td>
											<td><input type="text" class="form-control" id="timeline_1"></td>
											<td>
												<c:forEach
													var="actionObj" items="${actionList}" varStatus="status">
													<div class="col-12 col-md-6 col-xl-4">
														<div
															class="custom-control custom-checkbox custom-control-inline">
															<input id="action${status.index}" name="action${status.index}" class="Checkbox" class="custom-control-input" type="checkbox" value="${actionObj.actionId}" />
															<label class="custom-control-label" for="action${status.index}">
															<c:out value="${actionObj.actionName}" /></label>
														</div>
													</div>
												</c:forEach>
											</td>
											<td  align="center" class="center addDelete"><a
												href="javascript:void(0);"
												class="btn btn-xs btn-success  addMore m-t-lg"
												title="Add More"> <i class="fa fa-plus-square"></i>
											</a> &nbsp; <a href="javascript:void(0);"
												class="btn btn-xs btn-danger remove m-t-lg" title="Remove"
												style="display: none"> <i class="fa fa-minus-square"></i>
											</a></td>
										</tr>

									</tbody>
								</table>

								<div class="form-group row">
									<label class="col-12 col-md-4 col-xl-4 control-label"></label>
									<div class="col-12 col-md-8 col-xl-8">
										<button class="btn btn-primary mb-1" id="btnSubmitId" type="button">Submit</button>
										<button type="reset" class="btn btn btn-danger">Reset</button>
									</div>
								</div>

								<%-- 	<center>
									<div class="form-group row">
										<label class="col-12 col-md-2 col-xl-2 control-label"></label>
										<div class="col-12 col-md-6 col-xl-4">
											<!-- <button class="btn btn-primary mb-1" type="button"><a  href="viewTypeofRust.html" >Submit</a></button> -->
											<button class="btn btn-primary mb-1" id="btnSubmitId">Submit</button>
											<button type="reset" class="btn btn btn-danger">Reset</button>
											<!-- <button class="btn btn-danger mb-1">Cancle</button> -->
										</div>
									</div>
									
								</center> --%>

							</div>


						</div>
					</form>
					<!--===================================================-->
					<!-- END BASIC FORM ELEMENTS -->
				</div>
			</div>
		</div>
	</div>
</div>


<script>

  $(document).ready(function() {

	 //var obj_ = {"RowsData":[{"Role":"7","Officer":"17","Timeline":"12","Action":"1,3"},{"Role":"5","Officer":"6","Timeline":"221","Action":"1,2"},{"Role":"7","Officer":"12","Timeline":"23","Action":"3"}]};
	//var obj_ = {"RowsData":[{"Role":"7","Officer":"17","Timeline":"12","Action":"1,3"}]};

	var off ;
	var id_ ;
	var arr = new Array();
	$("#processId").change(function()
			{
		arr = new Array();
		       
				var changeVal = $(this).val();
			
                	var objRowsData ="";
    				var dataString = 'processId='+ changeVal;
    				 $.ajax({
    					 type: "POST",
    			         url : 'getAuthorityData',
    			         data: dataString,
    						cache: false,
    			         success : function(data) {  	             
    			        	   
    				var row = document.getElementById("authority").rows[document.getElementById("authority").rows.length-1];
    			        	 $('input:checkbox').removeAttr('checked');
    				var clonedRow = $(row).clone();
    				var clonedRow1 = clonedRow;
    				var rowData =  data;
    				var response=JSON.parse(rowData);
    				if(response.length!='0' )
    				{
    				     				
    				if(response.length > 0)
    					{
    					 $("#authority").find("tr:gt(1)").remove();
    					}
    				for(a=0;a<response.length;a++)
    					{
                         
    					//alert(JSON.parse(rowData));
    						var jsonObj = response[a];
    						var Role = jsonObj.Role;
    						var Officer = jsonObj.Officer;
    						var Timeline = jsonObj.Timeline;
    						$("#role_"+(a+1)).val(Role);
    						arr.push(Officer);
    						//$("#officer_"+(a+1)).val(Officer);
    						$("#timeline_"+(a+1)).val(Timeline);
    						//Action
    						var action_ = (jsonObj.Action).split(",");
    						//action0
    						var childrens = document.getElementById("authority").rows[a+1].cells[5];
    						var x= $(childrens).find('[type=checkbox]');
    						for(c=0;c<x.length;c++)
							{
									 $(x[c]).attr('checked', false);
							}    						
    						for(b=0;b<action_.length;b++)
    						{
    							for(c=0;c<x.length;c++)
    							{
    								var val_ = $(x[c]).val();
    								//alert(val_ +"  , "+action_[b]);
    								if(val_ == action_[b].trim())
    									{
    									 $(x[c]).attr('checked', true);
    									}
    								
    							}

    						}
    						
    						//$(this).prev().find($('#authority tbody')).append(clonedRow); 
    						row = document.getElementById("authority").rows[document.getElementById("authority").rows.length-1];
    						clonedRow = $(row).clone();
    						 
    						$("#authority tbody").append(clonedRow);
    						//$("#authority").find("tr:gt(1)").remove();




    						var len = document.getElementById("authority").rows.length;
    						var counter = len-1;
    						for(i=len-1;i>0;i--)
    							{
    								document.getElementById("authority").rows[i].cells[0].innerHTML = i;

    								var cell = document.getElementById("authority").rows[i].cells[2].children[0];
    								cell.setAttribute("id", "role_"+i);

    								cell = document.getElementById("authority").rows[i].cells[3].children[0];
    								cell.setAttribute("id", "officer_"+i);
    								
    								cell = document.getElementById("authority").rows[i].cells[4].children[0];
    								cell.setAttribute("id", "timeline_"+i);

    								var childrens = document.getElementById("authority").rows[i].cells[5];

    								var x= $(childrens).find('[type=checkbox]');
    								var y = $(childrens).find('.custom-control-label');
    								var actionAttrs = document.getElementById("authority").rows[i].cells[6];
    								for(j=0;j<x.length;j++)
    									{
    									if(i == (len-1))
    										{
    										 $(x[j]).attr("name","checkbox_"+counter);
    										 $(x[j]).attr("id","checkbox_"+counter);
    										 $(y[j]).attr("for","checkbox_"+counter);
    										}
    									else
    										{
    										 $(x[j]).attr("name","checkbox_"+counter);
    										 $(x[j]).attr("id","checkbox_"+counter);
    										 $(y[j]).attr("for","checkbox_"+counter);
    										 }


    									
    									 counter--;
    									} 
    								
    								document.getElementById("authority").rows[i].cells[6].innerHTML="";
    								if(i != 1)
    								{
    									/* var addHtml = '<a href="javascript:void(0);" class="btn btn-xs btn-success  addMore m-t-lg" title="Add More"><span class="ripple rippleEffect" style="width: 15.975px; height: 15.975px; top: 0.825px; left: 18.7625px;"></span> <i class="fa fa-plus-square"></i></a>'; */
    									var removeHtml = '<a href="javascript:void(0);"class="btn btn-xs btn-danger remove m-t-lg" title="Remove"style=""> <i class="fa fa-minus-square"></i></a>';
    									$(actionAttrs).append(removeHtml+"&nbsp;");
    								}
    								else
    									{
    										var addHtml = '<a href="javascript:void(0);" class="btn btn-xs btn-success  addMore m-t-lg" title="Add More"><span class="ripple rippleEffect" style="width: 15.975px; height: 15.975px; top: 0.825px; left: 18.7625px;"></span> <i class="fa fa-plus-square"></i></a>';
    										$(actionAttrs).append(addHtml+"&nbsp;");
    									}
    								
    							}
    						
    						
    					}
    				if(response.length > 0){
						 $('#authority tr:last').remove();
						}
    				}else{

    					$("#authority").find("tr:gt(1)").remove();
    					$("#role_1").val(0);
    					$("#officer_1").val(0);
    					$("#timeline_1").val("");

    					 
    					document.getElementById("authority").rows[1].cells[5].innerHTML = 
							'<div class="col-12 col-md-6 col-xl-4">'+
								'<div class="custom-control custom-checkbox custom-control-inline">'+
									'<input id="action0" name="action0" class="Checkbox" type="checkbox" value="1">'+
									'<label class="custom-control-label" for="action0">'+
									'Publish</label>'+
								'</div>'+
							'</div>'+
						
							'<div class="col-12 col-md-6 col-xl-4">'+
								'<div class="custom-control custom-checkbox custom-control-inline">'+
								'	<input id="action1" name="action1" class="Checkbox" type="checkbox" value="2">'+
									'<label class="custom-control-label" for="action1">'+
									'Approve</label>'+
								'</div>'+
							'</div>'+
						
							'<div class="col-12 col-md-6 col-xl-4">'+
								'<div class="custom-control custom-checkbox custom-control-inline">'+
									'<input id="action2" name="action2" class="Checkbox" type="checkbox" value="3">'+
									'<label class="custom-control-label" for="action2">'+
								'	Reject</label>'+
								'</div>'+
							'</div>';
    					
    				}

    			
    				 
    				var len = document.getElementById("authority").rows.length-1;
    				for(i=0;i<len;i++)
        				{
							var rol = "#role_"+(i+1);
							roleOnchange($(rol),arr[i]);
        				}
    				 
    					
    			          }

    	             });
        
				
		});
	  //===========remove row =============
	  $(document).on('click','.remove', function() {
		  var row = $(this).closest('tr').remove();
	  });
	  
		//================== Add more row ===========
		$(document).on('click','.addMore', function() {
			 
			var row = $(this).closest('tr');
			var clonedRow = $(row).clone();
			$(clonedRow).find('[type=text]').val('');
			$(clonedRow).find('[type=checkbox]').prop('checked', false);
			//$(this).prev().find($('#authority tbody')).append(clonedRow); 
			$("#authority tbody").append(clonedRow);
			// row iteerator
			var len = document.getElementById("authority").rows.length;
			var counter = len-1;
			for(i=len-1;i>0;i--)
				{
					document.getElementById("authority").rows[i].cells[0].innerHTML = i;

					var cell = document.getElementById("authority").rows[i].cells[2].children[0];
					cell.setAttribute("id", "role_"+i);

					cell = document.getElementById("authority").rows[i].cells[3].children[0];
					cell.setAttribute("id", "officer_"+i);

					cell = document.getElementById("authority").rows[i].cells[4].children[0];
					cell.setAttribute("id", "timeline_"+i);

					var childrens = document.getElementById("authority").rows[i].cells[5];

					var x= $(childrens).find('[type=checkbox]');
					var y = $(childrens).find('.custom-control-label');
					var actionAttrs = document.getElementById("authority").rows[i].cells[6];
					for(j=0;j<x.length;j++)
						{
						if(i == (len-1))
							{
							 $(x[j]).attr("name","checkbox_"+counter);
							 $(x[j]).attr("id","checkbox_"+counter);
							 $(y[j]).attr("for","checkbox_"+counter);
							}
						else
							{
							 $(x[j]).attr("name","checkbox_"+counter);
							 $(x[j]).attr("id","checkbox_"+counter);
							 $(y[j]).attr("for","checkbox_"+counter);
							 }


						
						 counter--;
						} 
					document.getElementById("authority").rows[i].cells[6].innerHTML="";
					if(i != 1)
					{
						var addHtml = '<a href="javascript:void(0);" class="btn btn-xs btn-success  addMore m-t-lg" title="Add More"><span class="ripple rippleEffect" style="width: 15.975px; height: 15.975px; top: 0.825px; left: 18.7625px;"></span> <i class="fa fa-plus-square"></i></a>';
						var removeHtml = '<a href="javascript:void(0);"class="btn btn-xs btn-danger remove m-t-lg" title="Remove"style=""> <i class="fa fa-minus-square"></i></a>';
						$(actionAttrs).append(removeHtml+"&nbsp;");
					}
					else
						{
							var addHtml = '<a href="javascript:void(0);" class="btn btn-xs btn-success  addMore m-t-lg" title="Add More"><span class="ripple rippleEffect" style="width: 15.975px; height: 15.975px; top: 0.825px; left: 18.7625px;"></span> <i class="fa fa-plus-square"></i></a>';
							$(actionAttrs).append(addHtml+"&nbsp;");
						} 
					
					
				}
			
		});


		$("#btnSubmitId").click(function(){

			var tableLength = document.getElementById("authority").rows.length;
			var tableObj = document.getElementById("authority");


			var finalJson  = {};
			var jsonArray =new Array();
			
			for(i=1;i<tableLength;i++)
				{
					var role = document.getElementById("role_"+i).value;
					var officer = document.getElementById("officer_"+i).value;
					var timeline = document.getElementById("timeline_"+i).value;

					//validations
					 
					
					     if($("#processId").val() == '0'){
					    	 swal("Error", "Please select Process", "error");
					    	 document.getElementById("processId").focus();
					    	 return false;
						     }
					
						if(role == 0 || role == '0')
							{
								//alert('Please select Role.');
								swal("Error", "Please select Role", "error");
								document.getElementById("role_"+i).focus();
								return false;
							}

						if(officer == 0 || officer == '0')
						{
							//alert('Please select Role.');
							swal("Error", "Please select Officer Name", "error");
							document.getElementById("officer_"+i).focus();
							return false;
						}

						if(timeline == '')
						{
							//alert('Please select Role.');
							swal("Error", "Please provide Time Line ", "error");
							document.getElementById("timeline_"+i).focus();
							return false;
						}
					/* 	 if(checkboxStatus == false)
						{
						   // alert ( "ERROR! Please select at least one checkbox" );
						    swal("Error", "Please select at least one checkbox. ", "error");
						    return false;
						}  */

					
						
					var childrens = tableObj.rows[i].cells[5];
					var x= $(childrens).find('[type=checkbox]');
					//var checkboxArr = new Array();
					var checkboxes = "";
					var checkboxStatusCount=0;
					for(j=0;j<x.length;j++)
					{
						var checkboxStatus = $(x[j]).prop("checked");
						if(checkboxStatus == true)
							{
								//checkboxArr.push($(x[j]).val());
								checkboxes += $(x[j]).val()+",";
							}
						if(checkboxStatus == false){
							checkboxStatusCount++;
							}
					
					}
					if(checkboxStatusCount == x.length){
						swal("Error", "Please select at least one checkbox ", "error");
					    return false;
						}
					var json = {"Role":role,"Officer":officer,"Timeline":timeline,"Action":checkboxes.substring(0,checkboxes.length-1)};
					
					jsonArray.push(json);
					
				}

			finalJson = {"Process":$("#processId").val(),"RowsData":jsonArray};
			console.log(JSON.stringify(finalJson));
			//return false;
            if(jsonArray.length > 0)
			{

            	swal({
    				title: "Do you want to Submit ?", 
    				//text: "You will be redirected to https://utopian.io", 
    				type: "warning",
    				confirmButtonText: "Yes",
    				showCancelButton: true,
    				cancelButtonText: "No",
    		    })
    		    	.then((result) => {
    					if (result.value) {
    						$.ajax({ 
    						    url:"addApprovalAuthorityStoring",    
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
    				
		


			
		}
			
		});

		
 

  });

  var idd;
  var v ;
  function roleOnchange(obj,val_)
  {
	  v = val_;
		var changeVal = $(obj).val();
		idd = $(obj).attr('id').split("_")[1];
		
	   var objRowsData ="";
		var dataString = 'roleId='+ changeVal;
		 $.ajax({
			 type: "POST",
	         url : 'getUsersByRoleId',
	         data: dataString,
				cache: false,
				async:false,
	         success : function(data) {
	        	  
	        	 var option="<option value='0'>--Select--</option>";
	        	 if(data.length > 0){
	        		// officer_1.empty();
	     		
		            for(var i=0; i<data.length; i++){
		                option = option + "<option value='"+data[i].userId + "'>"+data[i].userName + "</option>";
		            }
		            $("#officer_"+idd).html(option);
		            //officer_1.append(option);
					 
						$("#officer_"+idd).val(v);
						 
					 

	        	 }else{
	        		 $("#officer_"+idd).html(option);
	        		 //officer_1.append(option);
		         }
	        	
		         
		     
	         } 	             
		 });
		
  }
</script>



