 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     
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
    
      <style type="text/css">
     .subject-info-box-1,
     .subject-info-box-2 {
    float: left;
    width: 100%;
    
    select {
        height: 200px;
        padding: 0;

        option {
            padding: 4px 10px 4px 10px;
        }

        option:hover {
            background: #EEEEEE;
        }
    }
    }

.subject-info-arrows {
    float: left;
    width: 100%;

    input {
        width: 70%;
        margin-bottom: 9px;
    }
    }
   </style>
     
 <div class="mainpanel">
 <form action="configureResearchCenterMasterView" method="get" id="cancelForm"></form>
           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Research Center</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                            <li class="breadcrumb-item">Manage Master</li>
                            <li class="breadcrumb-item active" aria-current="page">Research Center</li>
                          
                          
                        </ol>
                     </nav>
                  </div>
               
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="configureResearchCenterMaster">Edit</a>
                              <a class="nav-item nav-link "  href="configureResearchCenterMasterView" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="cancel()"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                           <!--Static-->
                           
                            <div class="width50">
                           
                           <form action="insert-research-center" method="post" id="centerMasterformId" onsubmit="return false">
                           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        	 <input type="hidden"  name="researchCenterId" value="${center.researchCenterBeanId }"> 
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Research Center Name<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <input type="text" id="center-name" name="name" maxlength="50"  class="form-control" placeholder="" value="${center.researchCenterBeanName }" tabindex="1">
                              </div>
                           </div>
                           
                             <div class="form-group row">
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Region Name</label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                     
                                     <select class="form-control" id="regionId" name="regionId"    onchange="findZoneByRegionId(3,this.value);"  tabindex="2">
                                   <option value="0">--Select--</option>
                                   <c:forEach items="${regionList}" var="region"> 
                                  	 <option value="${region.demographyId}">${region.demographyName}</option>
                                   </c:forEach>
                                    </select>
                                    </div>
                            </div>	
                            
                            <div class="form-group row">
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Zone Name</label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                      <span class="colon">:</span>
                                     <select class="form-control" id="zoneId" name="zoneId" onchange="findWoredaByZoneId(4,this.value)" tabindex="3">
                                  		<%-- <option value="${center.zoneBeanId}" selected="selected">${center.zoneNameBean}</option> --%>
                                  		<option value="0">--Select--</option>
                                    </select>
                                    </div>
                                 </div>
                                 
                                 <div class="form-group row">
                                 	<label class="col-12 col-md-4 col-xl-4 control-label">Woreda Name<span class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8">
									
										<span class="colon">:</span>
										<div class="subject-info-box-1" >
											<select multiple="multiple" id="WoredaFirstZoneId" class="form-control selectbox-scrollable lstBox1" tabindex="4">
											
											<c:forEach items="${center.checkWoridaListBean }" var="woridaName">
												
												<option value="${woridaName.key }">${woridaName.value}</option>
												</c:forEach>
											
											</select>
										</div>
										<!-- div For Arrow Start -->
										<div class="subject-info-arrows text-center">
											<input type="button" id='btnRight' value="+" class="btn btn-primary" tabindex="5"/>
											<input type="button" id='btnLeft' value="-" class="btn btn-danger" tabindex="6"/>
											
										</div>
										<!-- div For Arrow End -->
										
										<div class="subject-info-box-2">
											<select multiple="multiple" id="woridaResultId" name="f_woredaId" class="form-control selectbox-scrollable lstBox1" tabindex="7">
												
												
												<c:forEach items="${center.checkWoridaBeanID }" var="woridaName">
												
												<option value="${woridaName.key }">${woridaName.value}</option>
												</c:forEach>
												
											</select>
											<input type="button" id="select_all" name="select_all" value="Select All" style="display:none;">
										</div>
									
									</div>	                                 
                                 </div>
                                 
                                 
                             
                                       
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Does this Lab exist ? <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <!-- Radio Buttons -->
                                 <div class="radio">
                                    <input  id="demo-form-radio-3" class="magic-radio labexityes" type="radio" name="labStaus" value="true" <c:if test="${(empty center.labStatusBean) or (center.labStatusBean=='true')}">checked="checked"</c:if>>
                                    <label for="demo-form-radio-3" tabindex="5" tabindex="8">Yes</label>
                             
                                    <input id="demo-form-radio-4" class="magic-radio labexitno" type="radio" name="labStaus" value="false" <c:if test="${center.labStatusBean=='false'}">checked="checked"</c:if>>
                                    <label for="demo-form-radio-4" tabindex="6" tabindex="9">No</label>
                                 </div>
                              </div>
                           </div>
                                     
                                    
                                    
                                    
                               <div class="form-group row" id="specializationLabelId">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Specialization <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8" id="rust">
                                 <span class="colon">:</span>
                                 
                                 
                                 
                                 <div class="dropdown-container">
						    <div class="dropdown-button noselect">
						        <div class="dropdown-label" tabindex="7"></div>
						        <div class="dropdown-quantity"><span class="quantity"></span></div>
						        <i class="fa fa-caret-down pull-right"></i>
						    </div>
						    <div class="dropdown-list" style="display: none;">
						        <input type="search" placeholder="Search Specialization" class="dropdown-search"/>
						         <ul>
						         <c:forEach items="${rustTypeList}" var="rust">
						        	 <c:set var="chval">0</c:set>
									  <c:forEach items="${center.rustBeanIDEdit}" var="rustIdName"> 
									      <c:if test="${rustIdName eq rust.rustId}">
									  	    <c:set var="chval">1</c:set>
									      </c:if> 
									 </c:forEach>
						        <li>
							        <div class="checkbox">
	                                    <%-- <form:checkbox id="${month.monthId}" value="${month.monthId}" path="monthId" class="magic-checkbox" /> --%>
	                                    <input type="checkbox" id="check_rust_${rust.rustId}" value="${rust.rustId}" <c:if test="${chval eq 1 }" >checked</c:if>  class="magic-checkbox" name="rustId" />
	                                    <label for="check_rust_${rust.rustId}"></label> 
	                                 </div>
	                                  <label for="check_rust_${rust.rustId}" id="check_rust_val_${rust.rustId}"> ${rust.typeOfRust}</label>
	                              </li>
	                              </c:forEach>
                             
                              </ul>
						    </div>
						</div>
                        
                               </div>
                           </div>
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Description</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <textarea tabindex="10" rows="5" cols="100" class="form-control" name="description" id="descriptionID" maxlength="200" >${center.descriptionBean }</textarea><div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div>         
                                     <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <input id="demo-form-radio" class="magic-radio sampleyes" type="radio" name="status" value="false" <c:if test="${(empty center.statusBean) or (center.statusBean=='false')}">checked="checked"</c:if>>
                                    <label for="demo-form-radio" tabindex="11">Active</label>
                             
                                    <input id="demo-form-radio-2" class="magic-radio sampleno" type="radio" name="status"  value="true" <c:if test="${center.statusBean=='true'}">checked="checked"</c:if>>
                                    <label for="demo-form-radio-2" tabindex="12">Inactive</label>
                                 </div>
                              </div>
                           </div>
                         
                         
                          
                           
                           
                           
                           
                         
						  <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnUpdateId" onclick="return save();" tabindex="13">Update</button>
								 <button class="btn btn-danger mb-1" type="reset" id="btnCancelId" onclick="cancel()" tabindex="14">Cancel</button>
							  </div>
					      </div>
                         </form>
                        </div>  
                        <div class="clearfix"></div>
                           
                           <br> <br> <br> <br> <br> <br>
                           
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
 <script type="text/javascript">
    
 $(document).redy(function(){
	//alert("In Edit View"); 
 });
 
      function save()
      {
    	  $("#select_all").click();
    	   event.preventDefault();
   		 var form = event.target.form;
   		   var name_regex = /^[a-zA-Z ]{1,50}$/;
   		var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
   		var desc=$("#descriptionID").val();
		var descLen=desc.length;
    	 var centerName=$("#center-name").val();
	   	 if(centerName=='')
    	{
	   		swal('Error','Please enter the Research Center Name','error').then(function() 
	   		   		{
						$("#center-name").focus();
					});
					return false;
    	}
	   if(!centerName.match(name_regex))
    	{
		   swal("Error", "Research center name accept only alphabets", "error").then(function() 
	   		   		{
						$("#center-name").focus();
					});
			return false;
    	}
	   if(centerName.charAt(0)== ' ' || centerName.charAt(centerName.length - 1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in Research Center Name", "error").then(function() 
	   		   		{
						$("#center-name").focus();
					});
        return false;
	   }
	   if(centerName!=null)
    	{
	   		var count= 0;
	   		var i;
	   		for(i=0;i<centerName.length && i+1 < centerName.length;i++)
	   		{
	   			if ((centerName.charAt(i) == ' ') && (centerName.charAt(i + 1) == ' ')) 
	   			{
					count++;
				}
	   		}
	   		if (count > 0) {
	   			swal("Error", "Research Center Name should not contain consecutive blank spaces", "error").then(function() 
		   		   		{
					$("#center-name").focus();
				});
	   			return false;
			}
    	}
	   	 
	   /* 	var regionId=$("#regionId").val();
	   	 if(regionId=='0')
	   	{
	   		swal(
					'Warning!',
					'Please select Region!',
					'warning'
					)
					$("#regionId").focus();
	   		
	   		return false;
	   	 } */
	   /* 	var zoneId=$("#zoneId").val();
	   	 if(zoneId=='0')
	   	{
	   		swal(
					'Warning!',
					'Please select Zone!',
					'warning'
					)
	   		return false;
	   	 } */
	 	
	 	 var WoredaId = $("#woridaResultId").val();
	   	 if(WoredaId == '')
		  {
	   		swal(
					'Error',
					'Please select at least one Woreda Name',
					'error'
					).then(function() 
			   		   		{
						$("#woridaResultId").focus();
					});
		   		return false;
		   	 }
	    
	       
	      
	        var radioValue = $("input[name='labStaus']:checked").val();
	        if(radioValue=='true')
	        {
	        	
	        	var checked = $("input[type=checkbox]:checked").length;
	        	if(checked== '0')
	        	{
	        		swal(
	    					'Error',
	    					'Please select specialization at list one',
	    					'error'
	    					).then(function() 
	    			   		   		{
	    						$("#rust").focus();
	    					});
	    	   		return false;
	        	}
	        }
	        
	   /* 	var specializationId=$("#specializationId").val();
	   	if(specializationId =='0')
	   	{
	   		swal(
					'Error!',
					'Please select Specialization!',
					'error'
					)
	   		return false;
	   	 } */
	   	if(desc.charAt(0)== ' ' || desc.charAt(descLen-1)== ' '){
	   	 swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() 
	   		   		{
				$("#descriptionID").focus();
			});
	         return false;
		   }if(!desc.match(desc_regex))
	    	{
			   swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() 
		   		   		{
					$("#descriptionID").focus();
				});
				return false;
	    	}
		   	if(desc!=null)
	    	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<desc.length && i+1 < desc.length;i++)
		   		{
		   			if ((desc.charAt(i) == ' ') && (desc.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Description should not contain consecutive blank spaces", "error").then(function() 
			   		   		{
						$("#descriptionID").focus();
					});
		   			return false;
				}
	    	}
		   	var descLen=desc.length;
		   	if (desc.charAt(0) == '!' || desc.charAt(0) == '@' 
				|| desc.charAt(0) == '#' || desc.charAt(0) == '$' 
				|| desc.charAt(0) == '&' || desc.charAt(0) == '*' 
				|| desc.charAt(0) == '(' || desc.charAt(0) == ')' 
				|| desc.charAt(descLen - 1) == '!' || desc.charAt(descLen - 1) == '@' 
				|| desc.charAt(descLen - 1) == '#' || desc.charAt(descLen - 1) == '$' 
				|| desc.charAt(descLen - 1) == '&' || desc.charAt(descLen - 1) == '*' 
				|| desc.charAt(descLen - 1) == '(' || desc.charAt(descLen - 1) == ')') 
		   	{
		   		swal("Error", "!@#$&*() characters are not allowed at initial and last place in Description", "error").then(function() 
		   		   		{
					$("#descriptionID").focus();
				});
		   		return false;
			}
		swal({
			title: "Do you want to update ?",
			type: "warning",
			cancelButtonText: "No",
			confirmButtonText: "Yes",
			showCancelButton: true
	    })
	    	.then((result) => {
				if (result.value) {
					 form.submit();
				} 
			})
			return false;
      }
</script>
<script>
function findZoneByRegionId(levelId,parentId)
{
	$('#WoredaFirstZoneId').empty();
	if(parentId==0 || parentId==-1){
		return false;
	}
	
	$.ajax({
		type : "GET",
		url : "find-zone-by-region-id", 
	 
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			//alert(response);
			var html = "<option value='0'>---Select---</option>";
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				$.each(val,function(index, value) {						
					html=html+"<option value="+value.zoneId+" >"+value.zoneName+"</option>";
				});
			}
			$('#zoneId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});
}


function findWoredaByZoneId(levelId,parentId)
{
	$('#WoredaFirstZoneId').empty();
	if(parentId==0 || parentId==-1){
		return false;
	}
	var assignedworedaIds = new Array();
	$('#woridaResultId').find('option').each(function() {
		assignedworedaIds.push(this.value);
	});
	
			
	$.ajax({
		type : "GET",
		url : "find-woreda-by-zone-id", 
	 
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			//alert(response);
			var html = "";//"<option value=''>---Select---</option>";
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				var exist=true;
				$.each(val,function(index, value) {		
					exist=false;
					if(assignedworedaIds.size !=0){
						assignedworedaIds.forEach(function(item) {
							if(item==value.woridaId){
								exist=true;
							}
						});
					}
					
					if(!exist)	
						html=html+"<option value="+value.woridaId+" >"+value.woridaName+"</option>";
				});
			}
			$('#WoredaFirstZoneId').empty().append(html);
			
		},error : function(error) {
			 
		}
	});
}

$(function(){
	$("#btnRight").click(function(){
	
		$("#WoredaFirstZoneId option:selected").each(function()
		{
			$(this).remove().appendTo("#woridaResultId");
			
		});
	});
	$("#btnLeft").click(function(){
		$("#woridaResultId option:selected").each(function()
		{
			$(this).remove().appendTo("#WoredaFirstZoneId");
			
		});
	});
});

$('#select_all').click(function() {
       $('#woridaResultId option').prop('selected', true);
   });
function cancel()
{
	$("#cancelForm").submit();	
}
</script>

<script>
$(document).ready(function(){
	 //$('#alertId').hide();
	 var text_max = 200;
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#descriptionID').keyup(function() {
	     var text_length = $('#descriptionID').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
	   
	/* $('[data-toggle="tooltip"]').tooltip(); 
	setTimeout(function() {$("#messageId").hide(); }, 3000); */
	
});
</script>     
  <script>
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
			//alert('${ErrorMessage}');
			swal("Error", "${errMsg}", "error");
			document.getElementById('${FieldId}').value="";
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>     


<script>
$(document).ready(function(){



/*
	Dropdown with Multiple checkbox select with jQuery - May 27, 2013
	(c) 2013 @ElmahdiMahmoud
	license: https://www.opensource.org/licenses/mit-license.php
*/

$(".dropdown dt a").on('click', function() {
  $(".dropdown dd ul").slideToggle('fast');
});

$(".dropdown dd ul li a").on('click', function() {
  $(".dropdown dd ul").hide();
});

function getSelectedValue(id) {
  return $("#" + id).find("dt a span.value").html();
}

$(document).bind('click', function(e) {
  var $clicked = $(e.target);
  if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
});

$('.mutliSelect input[type="checkbox"]').on('click', function() {

  var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
    title = $(this).val() + ",";

  if ($(this).is(':checked')) {
    var html = '<span title="' + title + '">' + title + '</span>';
    $('.multiSel').append(html);
    $(".hida").hide();
  } else {
    $('span[title="' + title + '"]').remove();
    var ret = $(".hida");
    $('.dropdown dt a').append(ret);
  }
});
});
</script>




<script>
$(document).ready(function(){

	// Events
	$('.dropdown-container')
		.on('click', '.dropdown-button', function() {
	        $(this).siblings('.dropdown-list').toggle();
		})
		.on('input', '.dropdown-search', function() {
	    	var target = $(this);
	        var dropdownList = target.closest('.dropdown-list');
	    	var search = target.val().toLowerCase();
	    
	    	if (!search) {
	            dropdownList.find('li').show();
	            return false;
	        }
	    
	    	dropdownList.find('li').each(function() {
	        	var text = $(this).text().toLowerCase();
	            var match = text.indexOf(search) > -1;
	            $(this).toggle(match);
	        });
		})
		.on('change', '[type="checkbox"]', function() {
	       /*  var container = $(this).closest('.dropdown-container');
	        var numChecked = container. find('[type="checkbox"]:checked').length;
	    	container.find('.quantity').text(numChecked || 'Any'); */

	    	 var attrId = $(this).attr("id");
	        var container = $(this).closest('.dropdown-container');
			 
	        var numChecked = container. find('[type="checkbox"]:checked').not(".nocheck").length;
		        if(numChecked > 4)
	        	{
	    			container.find('.quantity').text(numChecked || 'Any');
	        	}
	        else
	        	{
	        	var obj = container. find('[type="checkbox"]:checked').not(".nocheck");
	        	 
	        	var obj1 = obj[0];
	        	var text1 = $(obj1).attr("id");
	        	var val1 = (obj1 != null && obj1 != undefined && text1.split('_')[2] != null && text1.split('_')[2] != undefined) ? text1.split('_')[2]:"";
	        	
	        	var obj2 = obj[1];
	        	var text2 = $(obj2).attr("id");
	        	var val2 = ( obj2 != null && obj2 != undefined && text2.split('_')[2] != null && text2.split('_')[2] != undefined ) ? text2.split('_')[2] : "";
	        	
	        	var obj3 = obj[2];
	        	var text3 = $(obj3).attr("id");
	        	var val3 = ( obj3 != null && obj3 != undefined && text3.split('_')[2] != null && text3.split('_')[2] != undefined  ) ? text3.split('_')[2] :"" ;
	        	
	        	var obj4 = obj[3];
	        	var text4 = $(obj4).attr("id");
	        	var val4 = (obj4 != null && obj4 != undefined &&  text4.split('_')[2] != null &&  text4.split('_')[2] != undefined ) ?  text4.split('_')[2] : "";
	        	
	        	if(attrId.includes("rust") && numChecked == 0 )
		        {
	        		container.find('.quantity').text('');
		        }
	        	if(attrId.includes("rust"))
	        		{
	        		var valu = "";
	        		if(val1 != undefined && val1 != null  && val1.trim() != '')
        			{
	        		valu += " , "+$("#check_rust_val_"+val1).html();
	        		
        			}
	        		if(val2 != undefined && val2 != null  && val2.trim() != '')
        			{
	        		valu +=  " , "+$("#check_rust_val_"+val2).html();
        			}
	        		if(val3 != undefined && val3 != null  && val3.trim() != '')
        			{
	        		valu +=  " , "+$("#check_rust_val_"+val3).html();
        			}
	        		if(val4 != undefined && val4 != null  && val4.trim() != '')
        			{
	        		valu +=  " , "+$("#check_rust_val_"+val4).html();
        			}
	        		container.find('.quantity').text("");
	        		container.find('.quantity').text(valu.substring(2,valu.length));
	        		}

	        	}
		});

	// JSON of States for demo purposes
	var usStates = [
	    { name: 'ALABAMA', abbreviation: 'AL'},
	    { name: 'ALASKA', abbreviation: 'AK'},
	    { name: 'AMERICAN SAMOA', abbreviation: 'AS'},
	    { name: 'ARIZONA', abbreviation: 'AZ'},
	    { name: 'ARKANSAS', abbreviation: 'AR'},
	    { name: 'CALIFORNIA', abbreviation: 'CA'},
	    { name: 'COLORADO', abbreviation: 'CO'},
	    { name: 'CONNECTICUT', abbreviation: 'CT'}
	];

	// <li> template
<%-- 	var stateTemplate = _.template(
	    '<li>' +
	    	'<input name="<%= abbreviation %>" type="checkbox">' +
	    	'<label for="<%= abbreviation %>"><%= capName %></label>' +
	    '</li>'
	); --%>

	// Populate list with states
	_.each(usStates, function(s) {
	    s.capName = _.startCase(s.name.toLowerCase());
	    $('ul').append(stateTemplate(s));
	});
	

});


</script>
   </body>
</html>



<script>
$(document).ready(function(){
	
	
	 $(".labexityes").click(function(){
		  $("#specializationLabelId").show();
	 });
		  
	 $(".labexitno").click(function(){
	    $("#specializationLabelId").hide();
	 });
	
	  /* $("#firstZone").hide();
	  $("#secondZone").hide(); */
	 
	// $("#rustDetailId").hide();
	// $("#dataTable").hide();
	// $("#sampleDetailId").hide();
	// $("#dataTable1").hide();
	// $("#hdnImgdiv").hide();
	// $("#fungicideDetailId").hide();
	 $("#specializationLabelId").hide();

	var labStatus= "${center.labStatusBean}"
	if(labStatus=='true'){
		 $("#specializationLabelId").show();
	}
	 
	 
	
	 
 
  
});
</script>

