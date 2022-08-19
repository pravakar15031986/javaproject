 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
     <title>demographicTagging</title>
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
    padding: 7px 0;
    input {
        width: 70%;
        margin-bottom: 10px;
    }
    }
    
    
    
    
      </style>
   
</head>

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
<script>
$(document).ready(function()
{
	$("#Region_div_Id_2").hide();
	$("#Zone_div_Id_2").hide();
	$("#ListBoxId_2").hide();
});
   </script>    
 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add User Location Tagging</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item" aria-current="page">Manage User</li>
                           <li class="breadcrumb-item active" aria-current="page">User Location Tagging</li>
                          
                          
                        </ol>
                     </nav>
                  </div>
               
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="demographicTagging">Add</a>
                              <a class="nav-item nav-link "  href="demographicTaggingView" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                           <!--Static-->
                           
                            <div class="width50">
                            
                           <form action="insert-demography-tagging" method="post" id="centerMasterformId" onsubmit="return false">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                         <div class="form-group row">
										<label class="col-12 col-md-4 col-xl-4 control-label"
											for="demo-email-input">Organization Name<span
											class="text-danger">*</span></label>
										<div class="col-12 col-md-8 col-xl-8">
											 <select class="form-control" id="organizationId" onchange="changeRoleName(this.value);" tabindex="1" autofocus="autofocus">
											 <option value="0">--Select--</option>
											  <c:forEach items="${orgList}" var="orgName">
											 	<option value="${orgName.levelDetailId }">${orgName.levelName}</option>
											 </c:forEach>
												
											</select>
										</div>
									</div>
                          <div class="form-group row">
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Role Name<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                     <select class="form-control" id="roleId" onchange="findUserName(this.value);" tabindex="2">
                                     <option value="0">--Select--</option>
                                   <c:forEach items="${roleName}" var="rName">
											 	<option value="${rName.roleId }">${rName.roleName}</option>
											 
											 </c:forEach>
                                    </select>
                                    </div>
                            </div>	
                            <div class="form-group row">
                                    <label class="col-12 col-md-4 col-xl-4 control-label">User Name<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                     <select class="form-control" id="userId" name="userNameId"  onchange="serchLocationDetails(this.value);" tabindex="3"> 
                                  	 <option value="0">--Select--</option>
                                    </select>
                                    </div>
                            </div>	
                             
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Region Name <span class="text-danger">*</span></label>
                           	<div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                          <div class="dropdown-container" id="Region_div_Id_1" tabindex="4">
						    <div class="dropdown-button noselect" >
						        <div class="dropdown-label">Region Name</div>
						        <div class="dropdown-quantity">(<span class="quantity" >Any</span>)</div>
						        <i class="fa fa-caret-down pull-right"></i>
						    </div>
						    <div class="dropdown-list" style="display: none;" >
						        <input type="search" placeholder="Search Region" class="dropdown-search"/>
						        
						        <%-- <input type="text" id="checkRegion" value="${regionList}"> --%>
						        <ul>
						        <c:forEach items="${regionList}" var="region">
						        	
						        <li>
							        <div class="checkbox">
	                                    <input type="checkbox" id="${region.demographyId}" value="${region.demographyId}"  class="magic-checkbox" name="regionId" onclick="searchZoneNameByRegionId(3)"/>
	                                    <label for="${region.demographyId}"></label> 
	                                 </div>
	                                  <label for="${region.demographyId}"> ${region.demographyName}</label>
	                              </li>
	                              
	                              
	                              </c:forEach>
                             
                              </ul>
						    </div>
						</div>
						<!-- Here get Region From the RC Location Start-->
						<div class="dropdown-container" id="Region_div_Id_2" tabindex="4">
						    <div class="dropdown-button noselect" >
						        <div class="dropdown-label">Region Name</div>
						        <div class="dropdown-quantity">(<span class="quantity" >Any</span>)</div>
						        <i class="fa fa-caret-down pull-right"></i>
						    </div>
						    <div class="dropdown-list" style="display: none;" >
						        <input type="search" placeholder="Search Region" class="dropdown-search"/>
						        <ul id="region_Ul_Id">
                             
                              </ul>
						    </div>
						</div>
						<!-- Here get Region From the RC Location End-->
						</div>
						</div>
                            
                         <div class="form-group row zone">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Zone Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                          <div class="dropdown-container" id="Zone_div_Id_1" tabindex="5">
						    <div class="dropdown-button noselect" >
						        <div class="dropdown-label">Zone Name</div>
						        <div class="dropdown-quantity">(<span class="quantity">Any</span>)</div>
						        <i class="fa fa-caret-down pull-right"></i>
						    </div>
						    <div class="dropdown-list" style="display: none;">
						        <input type="search" placeholder="Search Zone" class="dropdown-search"/>
						        <ul id="zoneId">
						       </ul>
						    </div>
						</div>
						<div class="dropdown-container" id="Zone_div_Id_2" tabindex="5">
						    <div class="dropdown-button noselect" >
						        <div class="dropdown-label">Zone Name</div>
						        <div class="dropdown-quantity">(<span class="quantity">Any</span>)</div>
						        <i class="fa fa-caret-down pull-right"></i>
						    </div>
						    <div class="dropdown-list" style="display: none;">
						        <input type="search" placeholder="Search Zone" class="dropdown-search"/>
						        <ul id="zone_Ul_Id">
						       </ul>
						    </div>
						</div>
						</div>
						</div>
                                 <div class="form-group row woreda">
                                 	<label class="col-12 col-md-4 col-xl-4 control-label">Woreda Name<span class="text-danger">*</span></label>
									<div class="col-12 col-md-8 col-xl-8" id="ListBoxId_1">
									
										<span class="colon">:</span>
										
										<div class="subject-info-box-1" style="height:108px;">
											<select multiple="multiple" id="WoredaFirstZoneId" class="form-control selectbox-scrollable lstBox1" tabindex="6">
											
											</select>
											<input type="button" id="" name="select_all_woreda_first_list" value="Select All" style="display:none;">
										</div>
										
										<!-- div For Arrow Start -->
										<div class="subject-info-arrows text-center">
											<input type="button" id='btnRight' value="+" class="btn btn-primary" tabindex="7"/>
											<input type="button" id='btnLeft' value="-" class="btn btn-danger" tabindex="8"/><br>
											
										</div>
										<!-- div For Arrow End -->
										
										<div class="subject-info-box-2" style="height:108px;">
											<select multiple="multiple" id="woridaResultId" name="f_woredaId" class="form-control selectbox-scrollable lstBox1" tabindex="9">
												
											</select>
											<input type="button" id="select_all" name="select_all" value="Select All" style="display:none;">
										</div>
										
									</div>
									<div class="col-12 col-md-8 col-xl-8" id="ListBoxId_2">
									
										<span class="colon">:</span>
										
										<div class="subject-info-box-1" style="height:108px;">
											<select multiple="multiple" id="WoredaFirstZoneId_2" class="form-control selectbox-scrollable lstBox1" tabindex="10">
											
											</select>
										</div>
										
										<!-- div For Arrow Start -->
										<div class="subject-info-arrows text-center">
											<input type="button" id='btnRight_2' value=">" class="btn btn-primary" tabindex="11"/><br>
											<button id='btnLeft_2' class="btn btn-danger" tabindex="12"><</button>
										</div>
										<!-- div For Arrow End -->
										
										<div class="subject-info-box-2" style="height:108px;">
											<select multiple="multiple" id="woridaResultId_2" name="f_woredaId" class="form-control selectbox-scrollable lstBox1" tabindex="13">
												
											</select>
											<input type="button" id="select_all" name="select_all" value="Select All" style="display:none;">
										</div>
										
									</div>	                                 
                                 </div>
                                 
                                 <div class="form-group row kebele">
                                 	<label class="col-12 col-md-4 col-xl-4 control-label">Kebele Name</label>
									<div class="col-12 col-md-8 col-xl-8">
									
										<span class="colon">:</span>
										<div class="subject-info-box-1" style="height:108px;">
											<select multiple="multiple" id="kebeleFirstId" class="form-control selectbox-scrollable lstBox1" tabindex="14">
											
											</select>
											<input type="button" id="select_all_first_kebele" name="select_all_first_kebele" value="Select All" style="display:none;">
										</div>
										
										<!-- div For Arrow Start -->
										<div class="subject-info-arrows text-center">
											<input type="button" id='btnRightKebele' value="+" class="btn btn-primary" tabindex="14"/>
											<input type="button" id='btnLeftKebele' value="-" class="btn btn-danger" tabindex="16"/><br>
											
										</div>
										<!-- div For Arrow End -->
										
										<div class="subject-info-box-2" style="height:108px;">
											<select multiple="multiple" id="kebeleResultId" name="f_kebeleId" class="form-control selectbox-scrollable lstBox1" tabindex="17">
											
											</select>
											<input type="button" id="select_all_kebele" name="select_all_kebele" value="Select All" style="display:none;">
										</div>
									
									</div>	                                 
                                 </div> 
                                 <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <input type="radio" name="status" id="demo-form-radio" value="0" class="magic-radio sampleyes"  name="form-radio-button" checked="checked"/>
                                    <label for="demo-form-radio" tabindex="18">Active</label>
                             
                                    <input type="radio" name="status" id="demo-form-radio-2" value="1" class="magic-radio sampleno"  name="form-radio-button" />
                                    <label for="demo-form-radio-2" tabindex="19">Inactive</label>
                                 </div>
                              </div>
                           </div> 
                                 <input type="hidden" id="vlWoredaId" value="">
						  <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" onclick="return save();" tabindex="20">Submit</button>
								 <button class="btn btn-danger mb-1" type="reset" id="btnResetId" tabindex="21">Reset</button>
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
         
     
<link href="wrsis/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="wrsis/js/bootstrap.min.js"></script> 
<script src="wrsis/js/jquery.dataTables.min.js"></script>
<script>
	function changeRoleName(id)
	{
		$("#roleId").val(0);
		$("input[name='regionId']:checkbox").prop('checked',false);
		$('#zoneId').empty();
		$("#WoredaFirstZoneId").empty();
		$("#woridaResultId").empty();

		$('#kebeleFirstId').empty();
		$("#kebeleResultId").empty();
		//$("input[name='ZoneNameId']:checkbox").prop('checked',false);
	}
</script>
<script type="text/javascript">
	function findUserName(id)
	{
		
		//alert(id);
		var orgId=$("#organizationId").val();
		//alert("orgId=="+orgId);
		
		$.ajax({
				type:"GET",
				url:"findUserNameByOrgIDAndRoleID", 
				data:{
						"orgId":orgId,
						"roleId":id,
				},
				success:function(response){
					//alert(response);
					var html = "<option value='0'>---Select---</option>";
						var val=JSON.parse(response);
						
						 if(val!='' && val!= null)
						{
							$.each(val.userList,function(index,value)
							{
								html=html+"<option value="+value.userId+" >"+value.fullName+"</option>";
							});
							
						}
						$("#userId").empty().append(html);
						$("input[name='regionId']:checkbox").prop('checked',false);
						//$("input[name='ZoneNameId']:checkbox").prop('checked',false);
						$('#zoneId').empty();
						$("#WoredaFirstZoneId").empty();
						$("#woridaResultId").empty();

						$('#kebeleFirstId').empty();
						$("#kebeleResultId").empty();
				},
				error:function(error){
				}
		});
	}  
</script>
<script type="text/javascript">

	//retrive Zone Name
	 function searchZoneNameByRegionId(levelId)
	{
		 var parentIdArr = [];
         $.each($("input[name='regionId']:checked"), function(){
        	 parentIdArr.push($(this).val());
         });
         var regionId=parentIdArr.toString();
         var zoneNameIdArr = [];
         $.each($("input[name='ZoneNameId']:checked"), function(){
        	 zoneNameIdArr.push($(this).val());
         });

		var zoneForWoredaId=[]; 
         
		 $.ajax({
			type : "GET",
			url : "find-multiple-zone-by-region-id", 
			data:{
					"levelId":levelId,
					"regionId":regionId
				},		
			success : function(response) {
				 
				
				var html =" ";
				var val=JSON.parse(response);
				 
				if (val != "" || val != null) {
					var checkData = false;
					$.each(val,function(index, value) {
						checkData = true;						
					
						console.log("Selected Zone Id=="+zoneNameIdArr); 
						var check=false;
						for(i=0;i<zoneNameIdArr.length;i++)
						{
							
							if(zoneNameIdArr[i]==value.zoneId)
							{
								html=html+" <li><div class='checkbox'>";
								html=html+"<input type='checkbox' id='"+value.zoneId+"' value='"+value.zoneId+"'  class='magic-checkbox' name='ZoneNameId' onchange='findWoredaByZoneId(4);' checked/>";
								html=html+"<label for='"+value.zoneId+"'></label></div>";
								html=html+"<label for='"+value.zoneId+"'>"+value.zoneName+"</label></li>"; 
								//select_all_woreda_first_list
								zoneForWoredaId.push(value.zoneId);
								
								check = true;
								break;
							}
						}
						if(check==false)
						{	
							
							html=html+" <li><div class='checkbox'>";
							html=html+"<input type='checkbox' id='"+value.zoneId+"' value='"+value.zoneId+"'  class='magic-checkbox' name='ZoneNameId' onchange='findWoredaByZoneId(4);'/>";
							html=html+"<label for='"+value.zoneId+"'></label></div>";
							html=html+"<label for='"+value.zoneId+"'>"+value.zoneName+"</label></li>"; 
							
							
						}
					});
					if(checkData == false)
					{
						$('#zoneId').empty();
						$('#WoredaFirstZoneId').empty();
						$('#woridaResultId').empty();
						$('#kebeleFirstId').empty();
						$('#kebeleResultId').empty();
					}
				}
				$('#zoneId').empty().append(html);
				 for(k=0;k<zoneForWoredaId.length;k++)
				{	
					findWoredaByZoneId(4);
				} 
				/*  var resWori=[];
					$('#woridaResultId option').each(function() {
						resWori.push($(this).val());
					});
					console.log("resWori in REGION=="+resWori);
					searchKebele(5,resWori); */

				
				//$("#WoredaFirstZoneId").empty();
				//$("#woridaResultId").empty();
				
			},error : function(error) {
				 
			}
		}); 
	} 
</script>
<script>

//retrive Woreda Name
function findWoredaByZoneId(levelId)
{
	
	 var parentZoneIdArr = [];
     $.each($("input[name='ZoneNameId']:checked"), function(){
    	 parentZoneIdArr.push($(this).val());
     });

    // alert("Zone Id in Woreda find== "+parentZoneIdArr);
     var zoneId=parentZoneIdArr.toString();

     $("#select_all").click();
    	 var woredaRes=$("#woridaResultId").val();
    	 var woriARR=[];
			for(i=0;i<woredaRes.length;i++)
			{
				woriARR.push(woredaRes[i]);
				//searchKebele(5,woredaRes[i]);
			}

			
      $.ajax({
 		type : "GET",
 		url : "find-multiple-woreda-by-zone-id", 
 	 
 		data : {
 			"levelId":levelId,
 			"zoneId" : zoneId
 		},
 		success : function(response) {
 			
 			var html = "";
 			var html_2 = "";
 			var val=JSON.parse(response);

 			var woredaRes=$("#woridaResultId").val();
			
 			/* var woriARR=[];
 			for(i=0;i<woredaRes.length;i++)
 			{
 				woriARR.push(woredaRes[i]);
 			} */
 			//alert("result Woreda=="+woriARR);
 			
 			if (val != "" || val != null) {
 				$.each(val,function(index, value) 
 		 		{	
 					var check = false;
 					for(i=0;i<woriARR.length;i++)
 	 					{
							if(woriARR[i] == value.woridaId)
								{
									html_2=html_2+"<option value="+value.woridaId+" >"+value.woridaName+"</option>";
									check = true;
									break;
								}
 	 					}
	 					if(check == false)
		 				{
 	 		 		 			html=html+"<option value="+value.woridaId+" >"+value.woridaName+"</option>";
 	 	 		 	 }
 	 	 	 	});
 			}
 			$('#WoredaFirstZoneId').empty().append(html);
 			$("#woridaResultId").empty().append(html_2);
 		
 			var resWori=[];
				$('#woridaResultId option').each(function() {
					resWori.push($(this).val());
				});
				console.log("resWori=="+resWori);
				searchKebele(5,resWori);
 			
 			//;
 			//$('#kebeleFirstId').empty();
			//$("#kebeleResultId").empty();
			
 		},error : function(error) {
 			
 		}
 	});
} 

	//Button For Woreda Srart
	 $(function(){
		
	$("#btnRight").click(function()
	{
			//This commeted today
			/*   $("#WoredaFirstZoneId option:selected").each(function()
			{
				
				
				$(this).remove().appendTo("#woridaResultId");
				var resWori=$("#woridaResultId").val();
				searchKebele(5,resWori);
			});   */

			//Today Code start
			 $("#WoredaFirstZoneId option:selected").each(function()
			{
						
				
				$(this).remove().appendTo("#woridaResultId");
				var resWori=[];
				$('#woridaResultId option').each(function() {
					resWori.push($(this).val());
				});
				
				searchKebele(5,resWori);
			});  

			
		});
		$("#btnLeft").click(function(){
		
			
			$("#woridaResultId option:selected").each(function()
			{
				$(this).remove().appendTo("#WoredaFirstZoneId");
					
			/* $("#woridaResultId option").each(function()
			{
					searchKebele(5,$(this).val());
			}); */
				
			
			});
			var t=[];
			$("#woridaResultId option").each(function(){
							t.push($(this).val());
				});
			console.log("T=="+t);
			searchKebele(5,t);
		});
	}); 

	 $('#select_all').click(function() {
	       $('#woridaResultId option').prop('selected', true);
	 });
 
	//Button For Woreda End
</script>
<script>

 function searchKebele(levelId,woredaId)
{
	
    var demograpId= woredaId.toString();

    $("#select_all_kebele").click();
	var kebRes=$("#kebeleResultId").val();
	//alert("In Search Kebele=="+kebRes);
	var kebResARR=[];
		for(i=0;i<kebRes.length;i++)
		{
			kebResARR.push(kebRes[i]);
		}
		//alert(kebResARR);
     $.ajax({
		type : "GET",
		 url : "find-multiple-kebele-by-woreda-id", 
	   data : {
			"levelId":levelId,
			"woredaId":demograpId
			
		},
		success : function(response) {
			var html = " ";
			html_2=" ";
			var val=JSON.parse(response);
			 
			if (val != "" || val != null) {
				$.each(val,function(index, value) {	
					var check = false;
 					for(i=0;i<kebResARR.length;i++)
 	 					{
							if(kebResARR[i] == value.kebeleId)
								{
									html_2=html_2+"<option value="+value.kebeleId+" >"+value.kebeleName+"</option>";
									check = true;
									break;
								}
 	 					}
	 					if(check == false)
		 					{					
						html=html+"<option value="+value.kebeleId+" >"+value.kebeleName+"</option>";
 	 	 			}	
				});
			}
			$('#kebeleFirstId').empty().append(html);
			$("#kebeleResultId").empty().append(html_2); 
		},error : function(error) {
			 
		}
	});

	
} 



 $(function(){
		$("#btnRightKebele").click(function(){
		
			$("#kebeleFirstId option:selected").each(function()
			{
				$(this).remove().appendTo("#kebeleResultId");
				
			});
		});
		$("#btnLeftKebele").click(function(){
			$("#kebeleResultId option:selected").each(function()
			{
				$(this).remove().appendTo("#kebeleFirstId");
				
			});
		});
	});

	$('#select_all_kebele').click(function() {
	       $('#kebeleResultId option').prop('selected', true);
	   });

</script>
<script>
	  function serchLocationDetails(userId)
	{
	
		//alert("serchLocationDetails=="+userId);
		$.ajax({
			type : "GET",
			 url : "serchLocationDetails-by-userId", 
		   data : {
				"userId":userId
			},
			success : function(response) {
				//alert(response);

				var region="";
				var val=JSON.parse(response);
				
				if(val.locationList.length>0 )
				{
					//alert("Tagging with RC");
					//retrive region 
					$.each(val.locationList,function(index,value)
					{
						/* alert("regionId=="+value.regionId);
						alert("regionName=="+value.regionName); */
						 region=region+"<li>";
						 region=region+"<div class='checkbox'>";
						 region=region+"<input type='checkbox' id="+"region_"+value.regionId+" value="+value.regionId+"  class='magic-checkbox' name='regionId' checked onclick='searchZoneNameByRegionIdByRCCnter(this.value)'/>";    
						 region=region+"<label for="+"region_"+value.regionId+"></label>"; 
						 region=region+"</div>";
						 region=region+"<label for="+"region_"+value.regionId+"> "+value.regionName+"</label>";
						 region=region+"</li>";

						
					    
					});
					$("#region_Ul_Id").empty().append(region);
					$("#Region_div_Id_1").hide();
					$("#Region_div_Id_2").show();
					//retrive Zone 
					var zone="";
					$.each(val.locationList,function(index,value)
					{
						/*  alert("Zone Id=="+value.zoneId);
						    alert("Zone Name=="+value.zoneName); */ 

						    zone=zone+" <li><div class='checkbox'>";
						    zone=zone+"<input type='checkbox' id="+value.zoneId+" value="+value.zoneId+"  class='magic-checkbox' name='ZoneNameId' checked/>";
						    zone=zone+"<label for='"+value.zoneId+"'></label></div>";
						    zone=zone+"<label for='"+value.zoneId+"'>"+value.zoneName+"</label></li>"; 
					});

					$('#zone_Ul_Id').empty().append(zone);
					$("#Zone_div_Id_1").hide();
					$("#Zone_div_Id_2").show();

					// retrive Woreda
					var woreda="";
					$.each(val.locationList,function(index,value)
					{
						
						 woreda=woreda+"<option value="+value.woredaId+" >"+value.woredaName+"</option>";
						
					});
					
					$('#WoredaFirstZoneId_2').empty().append(woreda);
					$("#ListBoxId_1").hide();
					$("#ListBoxId_2").show();
					$("#vlWoredaId").val("yes");
					//woredaListValidation(yes);
				}else{
						//alert("Not Taging With RC");
						$("#Region_div_Id_1").show();
						$("#Region_div_Id_2").hide();
						$("#Zone_div_Id_1").show();
						$("#Zone_div_Id_2").hide();
						$("#ListBoxId_1").show();
						$("#ListBoxId_2").hide();
					}
				
			},
			error : function(error) {
				 
			}
		}); 
	}

//this is use for woreda Listbox 

 $(function(){
		$("#btnRight_2").click(function(){

			//chenge by me
			/* $("#WoredaFirstZoneId_2 option:selected").each(function()
			{
				$(this).remove().appendTo("#woridaResultId_2");
				var resWori=$("#woridaResultId_2").val();
				searchKebele(5,resWori);
			}); */

			//Today Code start for 2nd list box
			$("#WoredaFirstZoneId_2 option:selected").each(function()
			{
			$(this).remove().appendTo("#woridaResultId_2");
			var resWori=[];
			$('#woridaResultId_2 option').each(function() {
			resWori.push($(this).val());
			});
			searchKebele(5,resWori);
			});  
			
		});
		$("#btnLeft_2").click(function(){
			$("#woridaResultId_2 option:selected").each(function()
			{
				$(this).remove().appendTo("#WoredaFirstZoneId_2");
				//$('#kebeleFirstId').empty();
				//$('#kebeleFirstId').empty().append(html);
				//$("#kebeleResultId").empty();
				
			});
			var woreResArray_2=[];
			$("#woridaResultId_2 option").each(function(){
				woreResArray_2.push($(this).val());
			});
			searchKebele(5,woreResArray_2);
		});
	}); 

	 $('#select_all').click(function() {
	       $('#woridaResultId option').prop('selected', true);
	 });

		//This function is used for woreda List validation
		/* function woredaListValidation(tagval)
		{
		
		} */
</script>

<script type="text/javascript">
      $(document).ready(function(){
    	  $("#mandeteId").chosen({ allow_single_deselect: true });
          $(".chzn-select-deselect").chosen({ allow_single_deselect: true });  
    	 
      });
     
      function save()
      {
    	  $("#select_all").click();
    	  $("#select_all_kebele").click();
    	  event.preventDefault();
    		 var form = event.target.form;	
    	 var organizationId=$("#organizationId").val();
	   	 if(organizationId=='0')
    	{
	   		swal(
					'Error',
					'Please select Organization Name',
					'error'
					).then(function() 
			   		   		{
						$("#organizationId").focus();
					});
    		
    		return false;
    	}
	   
	   	 var roleId=$("#roleId").val();
	   	 //alert("roleId=="+roleId);
	   	 if(roleId=='0')
	   	{
	   		swal('Error','Please select Role Name','error').then(function() 
	   		   		{
				$("#roleId").focus();
			});
			return false;
	   	 }
	   	 
	   	 var userId=$("#userId").val();
	   	// alert("userId=="+userId);
	   	 if(userId=='0')
	   	{
	   		swal('Error','Please select User Name','error').then(function() 
	   		   		{
				$("#userId").focus();
			});
					
	   		return false;
	   	 }

	   	var checked = $("input[type=checkbox]:checked").length;
    	if(checked== '0')
    	{
    		swal('Error','Please select Region','error').then(function() 
	   		   		{
				$("#Region_div_Id_1").focus();
			});
	   		return false;
    	}
	   	var zoneId = $("input[name=ZoneNameId]:checked").length;
	  	if(roleId!='9' && zoneId=='0')
	   	{
	   		swal(
					'Error',
					'Please select Zone',
					'error'
					).then(function() 
			   		   		{
						$("#zoneId").focus();
					});
	   		return false;
	   	 }
	 	   	 
	       var checkWoreda=$("#vlWoredaId").val();
	      // alert("checkWoreda=="+checkWoreda);
	       if(checkWoreda=="yes")
		   {   
	       	var woredaList=$("#woridaResultId_2").val();
	       	if(roleId!='9' && woredaList=="")
		   	{
	    	   	swal('Error','Please select at least one Woreda','error').then(function() 
		   		   		{
					$("#woridaResultId_2").focus();
				});
		   		return false;
		   	}
		   }else{
			   var woredaList=$("#woridaResultId").val();
		       //	alert("woredaList=="+woredaList);
		       	if(roleId!='9' && woredaList=="")
			   	{
		    	   	swal('Error','Please select at least one Woreda','error').then(function() 
			   		   		{
						$("#woridaResultId").focus();
					});
			   		return false;
			   	}
			   }
	       

	   	swal({
			title: "Do you want to submit?",
			type: "warning",
			confirmButtonText: "Yes",
			cancelButtonText: "No",
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
<script type="text/javascript">
    $(function () {
        $("#btnResetId").bind("click", function () 
		{
			searchZoneNameByRegionId(0.0);
			searchZoneNameByRegionId(0);
			findWoredaByZoneId(0);
			serchLocationDetails(0);
			/* $("#ListBoxId_2").hide(); */
			$("#woridaResultId").empty();
			$("#kebeleFirstId").empty();
			$("#kebeleResultId").empty()
        });
    });
</script>
<script>
$("#roleId").change(function(e) {
    choice = this.value;

    if (choice === '9') {
        $('.zone').hide();
        $('.woreda').hide();
        $('.kebele').hide();
    } else{
    	$('.zone').show();
        $('.woreda').show();
        $('.kebele').show();
}
});
</script>

<script>
function searchZoneNameByRegionIdByRCCnter(regionId)
{
	//alert("In RC Center Region ID=="+regionId);

	
}
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
	        //alert("dropdownList=="+dropdownList);
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
			
	        var container = $(this).closest('.dropdown-container');
	        var numChecked = container. find('[type="checkbox"]:checked').length;
	    	container.find('.quantity').text(numChecked || 'Any');
	    	
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
 



<script>
$(document).ready(function(){
	
	
	 $(".labexityes").click(function(){
		  $("#specializationLabelId").show();
	 });
		  
	 $(".labexitno").click(function(){
	    $("#specializationLabelId").hide();
	 });
	
	  $("#firstZone").hide();
	  $("#secondZone").hide();
	 
	 $("#rustDetailId").hide();
	 $("#dataTable").hide();
	 $("#sampleDetailId").hide();
	 $("#dataTable1").hide();
	 $("#hdnImgdiv").hide();
	 $("#fungicideDetailId").hide();
	 $("#specializationLabelId").hide();
	 
	 
	 $(".rustAffectyes").click(function(){
		  $("#rustDetailId").show();
	 });
		  
	 $(".rustAffectno").click(function(){
	    $("#rustDetailId").hide();
	 });
	
    $(".sampleno").click(function(){
  		 $("#sampleDetailId").hide();
    });
  
	  $(".sampleyes").click(function(){
	 
	  $("#sampleDetailId").show();
		  
	  });
  
  
 	  $(".fungino").click(function(){
	  	 $("#fungicideDetailId").hide();
	  });
	  
	  $(".fungiyes").click(function(){
	  	 $("#fungicideDetailId").show();
	  });
  
	  $(".imgno").click(function(){
		 $("#hdnImgdiv").hide();
	  });
		  
	 $(".imgyes").click(function(){
		 $("#hdnImgdiv").show();
	 });
	 
	/*  $("#btnSubmitId").click(function(){
		 
		 if(confirm("Do you want to Submit?")){
			window.location.href="confirmSurveyData.html";
		 }else{
		   return false;
		}
	}); */
	 
 
  
});
</script>


<script>
var rustDetails = [];
function addRow(tableID) {
	
	var v1=$('#rustTypeId').val();
	var vt1=$("#rustTypeId :selected").text();
	if(v1=='Select'){
		//alert("Rust type should be selected");
		$("#rustTypeId").focus();
		return false;	
	}
	var v2=$('#incidentId').val();
    if(v2==''){
    	//alert("Incident Percentage should not left blank");
		$("#incidentId").focus();
		return false;	
    }
    var v3=$('#severityId').val();
    if(v3==''){
    	//swal("Variety Should be Selected");
    	alert("Severity Percentage should not left blank");
		$("#severityId").focus();
		return false;	
    }
    
    var v4=$('#reactionId').val();
	var vt4=$("#reactionId :selected").text();
	if(v4=='Select'){
		alert("Reaction should be selected");
		$("#reactionId").focus();
		return false;	
	}
    
    //
    
    for(var i = 0; i < rustDetails.length; i++) {
        var cur = rustDetails[i];
        if(cur.rustTypeId == v1 ) {
        	alert('Already added '+vt1+' type !!');
    		return false;
        }
 	}
    
    var v5='<a href="javascript:void(0);" onclick="clearRow(this,\'' + v1 + '\');" class="btn btn-danger">Delete</a>';
    $("#dataTable").show();
   
    var table = document.getElementById(tableID);

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    cell1.innerHTML = rowCount;

    var cell2 = row.insertCell(1);
    cell2.innerHTML = vt1;

    var cell3 = row.insertCell(2);
    cell3.innerHTML = v2;

    var cell4 = row.insertCell(3);
    cell4.innerHTML = v3;
	
    var cell5 = row.insertCell(4);
    cell5.innerHTML = v4;
	
    var cell6 = row.insertCell(5);
    cell6.innerHTML = v5;
	
    rustDetails.push({ 
	        "rustTypeId" : v1,
	        "incidentId" : v2,
	        "severityId" : v3,
	        "reaction"   : v4
    }); 
    
    clearData();
	       
	       
}

function clearData(){
	$('#rustTypeId').val('Select');
	$('#incidentId').val('');
	$('#severityId').val('');
	$('#reactionId').val('Select');
	
	
	
}

function clearRow(currElement,rustTypeId){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 
	 for(var i = 0; i < rustDetails.length; i++) {
	        var cur = rustDetails[i];
	        if(cur.rustTypeId == rustTypeId ) {
	        	rustDetails.splice(i, 1);
	          break;
	        }
	 }
	 
	 document.getElementById("dataTable").deleteRow(parentRowIndex);
		// updateIndex();
	 count=$('table#dataTable tr').length;
	 if(count==1){
	   	$("#dataTable").hide();
	 }
	 
}

function updateIndex() 
{	//
    $("#dataTable tr").each(function(){
    //	alert('hii'+$(this).index() + 1);
      $( this ).find( "td" ).first().html($(this).index() + 1 );
    });
}



function createInputField(fieldCount){
	
	$("#hdnSampleIdEntry").html('');
	
	var html="";
	
	for(i=0;i<fieldCount;i++){
		var sampleId='sampleIdVal'+i;
		html+="<input type='text' class='form-control' id='"+sampleId+"' /><br>"
	}
	$("#hdnSampleIdEntry").html(html);
}



var sampleDetails = [];
function addRow1(tableID) {
	
	var v1=$('#sampleTypeId').val();
	var vt1=$("#sampleTypeId :selected").text();
	if(v1=='Select'){
		alert("Sample type should be selected");
		$("#sampleTypeId").focus();
		return false;	
	}
	var v2=$('#sampleCountId').val();
    if(v2==''){
    	alert("Sample count value should not left blank");
		$("#sampleCountId").focus();
		return false;	
    }
    
    var v3='';
    for(i=0;i<v2;i++){
		var idVal=$("#sampleIdVal"+i).val(); 
		//alert(idVal);
		if(idVal==''){
			alert("Sample ID value should not left blank");
			$("#sampleIdVal"+i).focus();
			return false;	
		}
		
		v3+=idVal+",";
	}
    
    var v4=$('#sampleRemarks').val();
	if(v4==''){
		alert("Remarks should not left blank");
		$("#sampleRemarks").focus();
		return false;	
	}
   
	
    
    for(var i = 0; i < sampleDetails.length; i++) {
        var cur = sampleDetails[i];
        if(cur.sampleTypeId == v1 ) {
        	alert('Already added '+vt1+' type !!');
    		return false;
        }
 	}
    
    var v5='<a href="javascript:void(0);" onclick="clearRow1(this,\'' + v1 + '\');" class="btn btn-danger">Delete</a>';
    $("#dataTable1").show();
   
    var table = document.getElementById(tableID);

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    cell1.innerHTML = rowCount;

    var cell2 = row.insertCell(1);
    cell2.innerHTML = vt1;

    var cell3 = row.insertCell(2);
    cell3.innerHTML = v2;

    var cell4 = row.insertCell(3);
    cell4.innerHTML = v3;
	
    var cell5 = row.insertCell(4);
    cell5.innerHTML = v4;
	
    var cell6 = row.insertCell(5);
    cell6.innerHTML = v5;
	
    rustDetails.push({ 
	        "sampleTypeId" : v1,
	        "sampleCountId" : v2,
	        "sampleIds" : v3,
	        "sampleRemarks"   : v4
    }); 
    
    clearData1();
	       
	       
}

function clearData1(){
	$('#sampleTypeId').val('Select');
	$('#sampleCountId').val('');
	$('#sampleRemarks').val('');
	$('#hdnSampleIdEntry').empty();
	
	
	
}

function clearRow1(currElement,sampleTypeId){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 
	 for(var i = 0; i < sampleDetails.length; i++) {
	        var cur = sampleDetails[i];
	        if(cur.sampleTypeId == sampleTypeId ) {
	        	sampleDetails.splice(i, 1);
	          break;
	        }
	 }
	 
	 document.getElementById("dataTable1").deleteRow(parentRowIndex);
		// updateIndex1();
	 count=$('table#dataTable1 tr').length;
	 if(count==1){
	   	$("#dataTable1").hide();
	 }
	 
}

function updateIndex1() 
{	//
    $("#dataTable1 tr").each(function(){
    //	alert('hii'+$(this).index() + 1);
      $( this ).find( "td" ).first().html($(this).index() + 1 );
    });
}


//#############################################################
function addImg(tableID){
	 var v1='<input type="file" class="form-control" />';
	 var v2='<a href="javascript:void(0);" onclick="removeImg(this);" class="btn btn-danger">Delete</a>';
	 
	 var table = document.getElementById(tableID);

     var rowCount = table.rows.length;
     var row = table.insertRow(rowCount);
 
     var cell1 = row.insertCell(0);
     cell1.innerHTML = v1;

     var cell2 = row.insertCell(1);
     cell2.innerHTML = v2;
}

function removeImg(currElement){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 document.getElementById("imgTable").deleteRow(parentRowIndex);
}

$(function(){

	   $(".selectall").click(function(){
		$(".individual").prop("checked",$(this).prop("checked"));
		});
	
	
});

$('#woridaId').change(function() {
	var zoneVal=$("#zoneId").val();
	if(zoneVal == '0'){
		$("#firstZone").hide();
		$("#secondZone").hide();
		$("#startZone").show();
	}else if(zoneVal == '1'){
		$("#firstZone").show();
		$("#secondZone").hide();
		$("#startZone").hide();
	}else{
		$("#firstZone").hide();
		$("#secondZone").show();
		$("#startZone").hide();
	}
	//alert(zoneVal);
    
});
</script>