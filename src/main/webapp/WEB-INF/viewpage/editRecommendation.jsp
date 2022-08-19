<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="mainpanel">

            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Recommendation</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Recommendation</li>
                           <li class="breadcrumb-item" aria-current="page">Recommendation</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <form action="viewrecommendation" method="get" id="cancelForm">
               <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
               </form>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                                
                                <a class="nav-item nav-link active"  href="#">Edit Recommendation</a>
                                 <a class="nav-item nav-link "  href="viewrecommendation">View Recommendation</a>
                           </ul>
                           <div class="indicatorslist">
                            <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           
                           </div> 
                        </div>
                      
                        <!--===================================================-->
                        
                      
                        <div class="card-body">
                          <form action="add-recommendation"  method="post"  onsubmit="return false" enctype="multipart/form-data">
                          <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                          
                          <input type="hidden" value="${beanEdit.recomendId}" name="recomendId">
                          
                          <input type="hidden" value="${beanEdit.advisoryIdBean}" name="advisoryId">
                          
                         
                         
                          
                          <div class="form-group">
                              <div class="row">
                                    <label class="col-lg-2 ">Recommendation Number</label>
                                    <div class="input-group col-lg-3">
                                    <span class="colon">:</span>
                                         <input type="text" value="${beanEdit.recomendNoBean}"  class="form-control" readonly="readonly">
                                    </div>
                                    
                                </div>
                               
                            </div>
                          
                           <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Type of Recommendation <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <!-- Radio Buttons -->
                                 <div class="radio">
                                    <input id="demo-form-radio-3" class="magic-radio recommendGen" type="radio" name="recommendType" value="1"  <c:if test="${(empty beanEdit.recomendTypeBean) or (beanEdit.recomendTypeBean=='1')}">checked="checked"</c:if> >
                                    <label for="demo-form-radio-3">General</label>
                             
                                    <input id="demo-form-radio-4" class="magic-radio recommendRegion" type="radio" name="recommendType" value="2" <c:if test="${beanEdit.recomendTypeBean=='2'}">checked="checked"</c:if>>
                                    <label for="demo-form-radio-4">Region Specific</label>
                                 </div>
                              </div>
                           </div>
                           <div id="regionSpecificId">
                           	<div class="row">
                                    <label class="col-lg-2 ">Region<span class="text-danger">*</span></label>
                                    <div class="col-lg-3">
                                     <span class="colon">:</span>
                                       <div class="dropdown-container" id="Region_div_Id_1" tabindex="4">
						    <div class="dropdown-button noselect" id="rRegionId">
						        <div class="dropdown-label">Region Name</div>
						        <div class="dropdown-quantity"><span class="quantity" ></span></div>
						        <i class="fa fa-caret-down pull-right"></i>
						    </div>
						    <div class="dropdown-list" style="display: none;" >
						        <input type="search" placeholder="Search Region" class="dropdown-search"/>
						        
						        <%-- <input type="text" id="checkRegion" value="${regionList}"> --%>
						        <ul>
						        <c:forEach items="${regionList}" var="region">
						        	<c:set var="rval">0</c:set>
						        	<c:forEach items="${beanEdit.regiLi}" var="rez">
						        		<c:if test="${rez eq region.demographyId}">
						        			<c:set var="rval">1</c:set>
						        		</c:if>
						        	</c:forEach>
						        <li>
							        <div class="checkbox">
	                                    <input type="checkbox" id="${region.demographyId}" <c:if test="${rval eq 1 }" >checked</c:if> value="${region.demographyId}"  class="magic-checkbox" name="regionId" id="regionId" onclick="searchZoneNameByRegionId(3)"/>
	                                    <label for="${region.demographyId}"></label> 
	                                 </div>
	                                  <label for="${region.demographyId}"> ${region.demographyName}</label>
	                              </li>
	                              </c:forEach>
                             
                              </ul>
						    </div>
						</div>
                                    </div>
                                   
                                   
                                    <label class="col-lg-2 ">Zone<span class="text-danger">*</span></label>
                                     <div class="col-lg-3">
                                     <span class="colon">:</span>
                                       <div class="dropdown-container" id="Region_div_Id_2" tabindex="4">
						    <div class="dropdown-button noselect" >
						        <div class="dropdown-label">Zone Name</div>
						        <div class="dropdown-quantity"><span class="quantity" ></span></div>
						        <i class="fa fa-caret-down pull-right"></i>
						    </div>
						    <div class="dropdown-list" style="display: none;" >
						        <input type="search" placeholder="Search Zone" class="dropdown-search"/>
						        <ul id="zoneId">
						       </ul>
						    </div>
						</div>
                        </div>
                                    
                       </div>
                         <div class="row">
                                    <label class="col-lg-2 ">Woreda<span class="text-danger">*</span></label>
                                    <div class="col-lg-3">
                                     <span class="colon">:</span>
                                       <div class="dropdown-container" id="Region_div_Id_3" tabindex="4">
						    <div class="dropdown-button noselect" >
						        <div class="dropdown-label">Woreda Name</div>
						        <div class="dropdown-quantity"><span class="quantity" ></span></div>
						        <i class="fa fa-caret-down pull-right"></i>
						    </div>
						    <div class="dropdown-list" style="display: none;" >
						        <input type="search" placeholder="Search Woreda" class="dropdown-search"/>
						        
						        <%-- --%>
						        <ul id="WoredaId">
						       </ul>
						      
						    </div>
						     <input type="hidden" id="f_WoredaNameId" name="WoredaNameId_1"> 
						</div>
                                    </div>
                                   
                                   
                                    <label class="col-lg-2 ">Kebele</label>
                                     <div class="col-lg-3">
                                     <span class="colon">:</span>
                                       <div class="dropdown-container" id="Region_div_Id_1" tabindex="4">
						    <div class="dropdown-button noselect" >
						        <div class="dropdown-label">Kebele Name</div>
						        <div class="dropdown-quantity"><span class="quantity" ></span></div>
						        <i class="fa fa-caret-down pull-right"></i>
						    </div>
						    <div class="dropdown-list" style="display: none;" >
						        <input type="search" placeholder="Search Kebele" class="dropdown-search"/>
						        
						        <%-- <input type="text" id="checkRegion" value="${regionList}"> --%>
						        <ul id="kebeleId">
						       </ul>
						      
						    </div>
						     <input type="hidden" id="f_kebeleNameId" name="kebeleNameId_1"> 
						</div>
                        </div>
                                    
                       </div>  
                           
                           
                           
                           </div>
                           <%-- <div class="form-group">
                              <div class="row">
                                    <label class="col-lg-2 ">Upload Recommendation<span class="text-danger">*</span></label>
                                    <div class="input-group col-lg-3">
                                    <span class="colon">:</span>
                                        <input type="file" id="recommendFileName" name="recommendFileName" class="form-control" placeholder="" accept="application/pdf">                                    </div>
                                         <br><small>Max size: 2MB<br> Allowed types: pdf</small>
                                         <br><a href='javascript:void(0)' onclick="recommendFileDownload(${beanEdit.recomendId})" ><center><i class="fa fa-file-pdf-o fa-2x" aria-hidden="true"></i></center></a>
                                </div>
                            </div> --%>
                             <div class="form-group">
                              <div class="row">
                                    <label class="col-lg-2 ">Upload Recommendation<span class="text-danger">*</span></label>
                                    <div class="input-group col-lg-3">
                                    <span class="colon">:</span>
                                        <input type="file" id="recommendFileName" name="recommendFileName" class="form-control" placeholder="">                                    </div>
                                         <small>Max size: 5MB<br> Allowed types: pdf,doc,docx</small>
                                        <c:set var="fname" value="${beanEdit.recFileName}"/>   
                                        <c:choose>
                                        	<c:when test="${fn:endsWith(fname, '.pdf')==true}">
                                        		<br><a href='javascript:void(0)' onclick="recommendFileDownload(${beanEdit.recomendId})" ><center><i class="fa fa-file-pdf-o fa-2x" aria-hidden="true"></i></center></a>
                                        	</c:when>
                                        	<c:when test="${fn:endsWith(fname, '.doc')==true}">
                                        		<br><a href='javascript:void(0)' onclick="recommendFileDownload(${beanEdit.recomendId})" ><center><i class="fa  fa-file-word-o fa-2x" aria-hidden="true"></i></center></a>
                                        	</c:when>
                                        	<c:when test="${fn:endsWith(fname, '.docx')==true}">
                                        		<br><a href='javascript:void(0)' onclick="recommendFileDownload(${beanEdit.recomendId})" ><center><i class="fa fa-file-word-o fa-2x" aria-hidden="true"></i></center></a>
                                        	</c:when>
                                        </c:choose>
            								
                                </div>
                            </div>
                             <div class="form-group">
                              <div class="row">
                                    <label class="col-lg-2 ">Recommendation Summary<span class="text-danger">*</span></label>
                                    <div class="input-group col-lg-3">
                                    <span class="colon">:</span>
                                        <textarea rows="5" cols="100" class="form-control" maxlength="200" onkeyup="countChar(this)" name="recommendRemark" id="recommendRemark">${beanEdit.recomendSummaryBean}</textarea>
                                        
                                    </div>
                                    
                                </div>
                               
                            </div>
                          	<div class="form-group">
                              <div class="row">
                                    <label class="col-lg-2 "></label>
                                    <div class="input-group col-lg-3">
                                        <div id="charNum">Maximum 200 characters</div>
                                    </div>
                                    
                                </div>
                               
                            </div>
                           <%--  <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                  <div class="radio">
                                   
                                    <input type="radio" id="demo-form-radio" name="statusBean" class="magic-radio sampleyes" value="false" <c:if test="${(empty beanEdit.statusBean) or (beanEdit.statusBean=='false')}">checked="checked"</c:if>  name="form-radio-button"/>
                                    <label for="demo-form-radio" tabindex="3">Active</label>
                             
                                    <input type="radio"  id="demo-form-radio-2" name="statusBean" class="magic-radio sampleyes" value="true" <c:if test="${beanEdit.statusBean=='true'}">checked="checked"</c:if> name="form-radio-button"/>
                                    <label for="demo-form-radio-2" tabindex="4">Inactive</label>
                                 </div> 
                              </div>
                           </div> --%>
                           
                           
                           
                           
                              
                           <!-- Send sms -->
                           
                           <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Is SMS Required ?<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <!-- Radio Buttons -->
                                 <div class="radio">
                                    <input id="demo-form-radio-5" class="magic-radio smsYes" type="radio" name="sendType" value="true"   <c:if test="${(empty beanEdit.requiredSms) or (beanEdit.requiredSms=='true')}">checked="checked"</c:if> >
                                    <label for="demo-form-radio-5">Yes</label>
                             
                                    <input id="demo-form-radio-6" class="magic-radio smsNo" type="radio" name="sendType" value="false" <c:if test="${beanEdit.requiredSms=='false'}">checked="checked"</c:if>>
                                    <label for="demo-form-radio-6">No</label>
                                 </div>
                              </div>
                           </div>
                           
                           
                           <!-- sms content -->
                           
                           <div class="form-group">
                              <div class="row" >
                                    <label class="col-lg-2 " id="content" >Recommendation Content For SMS<span class="text-danger">*</span></label>
                                    <div class="input-group col-lg-3">
                                    <span class="colon" id="col">:</span>
                                        <textarea rows="4" cols="100" class="form-control" maxlength="140"  onkeyup="countSms(this)"  name="smsRemark" id="smsRemark">${beanEdit.smsContent}</textarea>
                                        
                                    </div>
                                    
                                </div>
                               
                            </div>
                            
                         
                              <div class="row">
                                    <label class="col-lg-2 "></label>
                                    <div class="input-group col-lg-3">
                                        <div id="smsNum">Maximum 140 characters</div>
                                    </div>
                                    
                                </div>
                           
                           
                           
                           
                           
                            <div class="form-group ">
                           	<div class="row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnSubmitId" onclick="saveRecommendetion()">Update</button>
								 <button class="btn btn-danger mb-1" id="btnCancelId" type="reset" onclick="cancel()">Cancel</button>
							 
							</div>
							</div>
							</div>
                          </form>
                         </div>
                         <c:forEach items="${beanEdit.zonLi}" var="zo">
					        <div class="checkbox" >
	                         <input type="checkbox" id="${zo}" checked="checked" value="${zo}"  class="magic-checkbox" name="testZone"/>
	                          </div>
	                     </c:forEach>
	                    
	                     <c:forEach items="${beanEdit.woreLis}" var="wo">
					        <div class="checkbox" > 
	                         <input type="checkbox" id="${wo}" checked="checked" value="${wo}"  class="magic-checkbox" name="testWoreda"/>
	                          </div>
	                     </c:forEach>
	                     <c:forEach items="${beanEdit.kebeLis}" var="kebe">
					        <div class="checkbox" >
	                         <input type="checkbox" id="${kebe}" checked="checked" value="${kebe}"  class="magic-checkbox" name="testKebele"/>
	                          </div>
	                     </c:forEach>
	                     
	                     <form action="recommend-file-download" id="recommendFileForm"  method="POST">
	                     <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						<input type="hidden" name="fileId"  id="fileNameId">
 					</form>
                          
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
        
 <c:if test="${beanEdit.recomendTypeBean=='2'}">
<script>
$(document).ready(function()
		{
		 $("#regionSpecificId").show();
	
		var testZ = $("input[name='testZone']:checked").length;
		//alert("Zone Length=="+testZ);

		var testZoneArray = [];
	     $.each($("input[name='testZone']:checked"), function(){
	    	 testZoneArray.push($(this).val());
	     });
	     /* $("#dmzonId").val(testZoneArray); */
	    // alert("Zone=="+testZoneArray);
	     searchZoneNameByRegionIdEdit(3);

	     var testW = $("input[name='testWoreda']:checked").length;
			//alert("Woreda Length=="+testW);

			var testworedaArray = [];
		     $.each($("input[name='testWoreda']:checked"), function(){
		    	 testworedaArray.push($(this).val());
		     });
		     /* $("#dmzonId").val(testZoneArray); */
		     //alert("WoredA=="+testworedaArray);
		     //findWoredaByZoneId(4);
		     findWoredaByZoneIdEdit(4);

		     var testKebeleArray = [];
		     $.each($("input[name='testKebele']:checked"), function(){
		    	 testKebeleArray.push($(this).val());
		     });
		     searchKebeleEdit(5);
		     
		
	});
</script>
</c:if>
<c:if test="${beanEdit.recomendTypeBean=='1'}">
<script>
$(document).ready(function()
{
		 $("#regionSpecificId").hide();
});
</script>
</c:if>    
<script>
$("#regionSpecificId").hide();
$(".recommendGen").click(function()
{
	 $("#regionSpecificId").hide();
	 
 });
	  
 $(".recommendRegion").click(function(){
	 $("#regionSpecificId").show();
 });		
</script>    

<script type="text/javascript">

	//retrive Zone Name
	 function searchZoneNameByRegionId(levelId)
	{
		 var parentIdArr = [];
         $.each($("input[name='regionId']:checked"), function(){
        	 parentIdArr.push($(this).val());
         });
        

       /*   var testZoneArray = [];
	     $.each($("input[name='testZone']:checked"), function(){
	    	 testZoneArray.push($(this).val());
	     }); */
	    
	    // alert("Zone In Zone=="+testZoneArray);
         
         var regionId=parentIdArr.toString();
		 $.ajax({
			type : "GET",
			url : "find-multiple-zone-by-region-id", 
			data:{
					"levelId":levelId,
					"regionId":regionId
				},		
			success : function(response) {
				 
				//alert(response);
				var html =" ";
				var val=JSON.parse(response);
				 
				if (val != "" || val != null) {
					$.each(val,function(index, value) {						

						/* var check = false;
	 					for(i=0;i<testZoneArray.length;i++)
	 	 					{
								if(testZoneArray[i] == value.zoneId)
									{
										check = true;	
									}
	 	 					}
		 				if(check == false)
			 			{ */ 
						
						html=html+" <li><div class='checkbox'>";
						html=html+"<input type='checkbox' id='"+value.zoneId+"' value='"+value.zoneId+"'  class='magic-checkbox' name='ZoneNameId' onchange='findWoredaByZoneId(4);'/>";
						html=html+"<label for='"+value.zoneId+"'></label></div>";
						html=html+"<label for='"+value.zoneId+"'> "+value.zoneName+"</label></li>"; 
			 			
					});
				}
				$('#zoneId').empty().append(html);

				$("#WoredaId").empty();
				$("#kebeleId").empty();
				
			},error : function(error) {
				 
			}
		}); 
	} 


	 function searchZoneNameByRegionIdEdit(levelId)
		{
			
			 var parentIdArr = [];
	         $.each($("input[name='regionId']:checked"), function(){
	        	 parentIdArr.push($(this).val());
	         });
	        

	         var testZoneArray = [];
		     $.each($("input[name='testZone']:checked"), function(){
		    	 testZoneArray.push($(this).val());
		     });
		    
		   //  alert("Zone Edit In Zone=="+testZoneArray);
	         
	         var regionId=parentIdArr.toString();
			 $.ajax({
				type : "GET",
				url : "find-multiple-zone-by-region-id", 
				data:{
						"levelId":levelId,
						"regionId":regionId
					},		
				success : function(response) {
					 
					//alert(response);
					var html =" ";
					var val=JSON.parse(response);
					 
					if (val != "" || val != null) {
						$.each(val,function(index, value) {						

							var check = false;
		 					for(i=0;i<testZoneArray.length;i++)
		 	 					{
									if(testZoneArray[i] == value.zoneId)
										{
											check = true;	
										}
		 	 					}
			 				if(check == false)
				 			{ 
							
							html=html+" <li><div class='checkbox'>";
							html=html+"<input type='checkbox' id='"+value.zoneId+"' value='"+value.zoneId+"'  class='magic-checkbox' name='ZoneNameId' onchange='findWoredaByZoneId(4);'/>";
							html=html+"<label for='"+value.zoneId+"'></label></div>";
							html=html+"<label for='"+value.zoneId+"'> "+value.zoneName+"</label></li>"; 
				 			}else{
				 				html=html+" <li><div class='checkbox'>";
								html=html+"<input type='checkbox' id='"+value.zoneId+"' value='"+value.zoneId+"'  class='magic-checkbox' name='ZoneNameId' onchange='findWoredaByZoneId(4);'  checked='checked'/>";
								html=html+"<label for='"+value.zoneId+"'></label></div>";
								html=html+"<label for='"+value.zoneId+"'> "+value.zoneName+"</label></li>";
					 			}
						});
					}
					$('#zoneId').empty().append(html);

					/* $("#WoredaId").empty();
					$("#kebeleId").empty(); */
					
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
   
     var zoneId=parentZoneIdArr.toString();

    /*  var testworedaArray = [];
     $.each($("input[name='testWoreda']:checked"), function(){
    	 testworedaArray.push($(this).val());
     });
     alert("wOREDA in wOREDA=="+testworedaArray); */

     
     //alert(zoneId);
     /*$("#select_all").click();
    	  var woredaRes=$("#woridaResultId").val();
    	 var woriARR=[];
			for(i=0;i<woredaRes.length;i++)
			{
				woriARR.push(woredaRes[i]);
			} */
		
      $.ajax({
 		type : "GET",
 		url : "find-multiple-woreda-by-zone-id", 
 	 
 		data : {
 			"levelId":levelId,
 			"zoneId" : zoneId
 		},
 		success : function(response) {
 			//alert(response);
 			var html = "";
 			var val=JSON.parse(response);

 			var woredaRes=$("#woridaResultId").val();

 			/* var woriARR=[];
 			for(i=0;i<woredaRes.length;i++)
 			{
 				woriARR.push(woredaRes[i]);
 			} */
 			
 			if (val != "" || val != null) {
 				$.each(val,function(index, value) 
 		 		{	
 					/* var check = false;
 					for(i=0;i<testworedaArray.length;i++)
 	 					{
							if(testworedaArray[i] == value.woridaId)
								{
									check = true;	
								}
 	 					}
	 				if(check == false)
		 			{  */
 	 		 		 
 	 		 			
 	 		 			html=html+" <li><div class='checkbox'>";
						html=html+"<input type='checkbox' id='"+value.woridaId+"' value='"+value.woridaId+"'  class='magic-checkbox' name='WoredaNameId' onchange='searchKebele(5);'/>";
						html=html+"<label for='"+value.woridaId+"'></label></div>";
						html=html+"<label for='"+value.woridaId+"'> "+value.woridaName+"</label></li>";  
						/*} else{
		 				html=html+" <li><div class='checkbox'>";
						html=html+"<input type='checkbox' id='"+value.woridaId+"' value='"+value.woridaId+"'  class='magic-checkbox' name='WoredaNameId' onchange='searchKebele(5);' checked='checked'/>";
						html=html+"<label for='"+value.woridaId+"'></label></div>";
						html=html+"<label for='"+value.woridaId+"'> '"+value.woridaName+"'</label></li>";
			 			 }  */
 	 	 	 	});
 			}
 			$('#WoredaId').empty().append(html);
 			
 			$("#kebeleId").empty();
 			//$('#kebeleFirstId').empty();
			//$("#kebeleResultId").empty();
			
 		},error : function(error) {
 			 
 		}
 	});
} 


//retrive Woreda Name In Edit Case
function findWoredaByZoneIdEdit(levelId)
{
	// alert("In Woreda Edit=="+levelId);
	
	 var parentZoneIdArr = [];
     $.each($("input[name='testZone']:checked"), function(){
    	 parentZoneIdArr.push($(this).val());
     });
     var zoneId=parentZoneIdArr.toString();
    

     var testworedaArray = [];
     $.each($("input[name='testWoreda']:checked"), function(){
    	 testworedaArray.push($(this).val());
     });
   
     //alert("wOREDA Edit in wOREDA=="+testworedaArray);

     
     //alert(zoneId);
     /*$("#select_all").click();
    	  var woredaRes=$("#woridaResultId").val();
    	 var woriARR=[];
			for(i=0;i<woredaRes.length;i++)
			{
				woriARR.push(woredaRes[i]);
			} */
		
      $.ajax({
 		type : "GET",
 		url : "find-multiple-woreda-by-zone-id", 
 	 
 		data : {
 			"levelId":levelId,
 			"zoneId" : zoneId
 		},
 		success : function(response) {
 		//alert(response);
 			var html = "";
 			var val=JSON.parse(response);

 			var woredaRes=$("#woridaResultId").val();

 			/* var woriARR=[];
 			for(i=0;i<woredaRes.length;i++)
 			{
 				woriARR.push(woredaRes[i]);
 			} */
 			
 			if (val != "" || val != null) {
 				$.each(val,function(index, value) 
 		 		{	
 					 var check = false;
 					for(i=0;i<testworedaArray.length;i++)
 	 					{
							if(testworedaArray[i] == value.woridaId)
								{
									check = true;	
								}
 	 					}
	 				if(check == false)
		 			{  
 	 		 		 
 	 		 			
 	 		 			html=html+" <li><div class='checkbox'>";
						html=html+"<input type='checkbox' id='"+value.woridaId+"' value='"+value.woridaId+"'  class='magic-checkbox' name='WoredaNameId' onchange='searchKebele(5);'/>";
						html=html+"<label for='"+value.woridaId+"'></label></div>";
						html=html+"<label for='"+value.woridaId+"'> "+value.woridaName+"</label></li>";  
						} else{
		 				html=html+" <li><div class='checkbox'>";
						html=html+"<input type='checkbox' id='"+value.woridaId+"' value='"+value.woridaId+"'  class='magic-checkbox' name='WoredaNameId' onchange='searchKebele(5);' checked='checked'/>";
						html=html+"<label for='"+value.woridaId+"'></label></div>";
						html=html+"<label for='"+value.woridaId+"'> "+value.woridaName+"</label></li>";
			 			 }  
 	 	 	 	});
 			}
 			$('#WoredaId').empty().append(html);
 			//$('#WoredaId').empty();
			$('#kebeleId').empty();
 			//$("#woridaResultId").empty();
 			//$('#kebeleFirstId').empty();
			//$("#kebeleResultId").empty();
			
 		},error : function(error) {
 			 
 		}
 	});
} 
</script>
<script>
//Retrive Kebele name
 function searchKebele(levelId)
{
	//alert(levelId);

	 var parentWoredaIdArr = [];
     $.each($("input[name='WoredaNameId']:checked"), function(){
    	 parentWoredaIdArr.push($(this).val());
     });
   
     var woredaId=parentWoredaIdArr.toString();
    // alert("woredaId=="+woredaId);
   
	
   /*  var demograpId= woredaId.toString();

    $("#select_all_kebele").click();
	var kebRes=$("#kebeleResultId").val();
	
	var kebResARR=[];
		for(i=0;i<kebRes.length;i++)
		{
			kebResARR.push(kebRes[i]);
		} */
		//alert(kebResARR);
     $.ajax({
		type : "GET",
		 url : "find-multiple-kebele-by-woreda-id", 
	   data : {
			"levelId":levelId,
			"woredaId":woredaId
			
		},
		success : function(response) {
			var html = " ";
			var val=JSON.parse(response);
			 //alert(response);
			if (val != "" || val != null) {
				$.each(val,function(index, value)
				 {	
					/* var check = false;
 					for(i=0;i<kebResARR.length;i++)
 	 					{
							if(kebResARR[i] == value.kebeleId)
								{
									check = true;
									break;
								}
 	 					}
	 					if(check == false)
		 					{				 */	
						//html=html+"<option value="+value.kebeleId+" >"+value.kebeleName+"</option>";
						html=html+" <li><div class='checkbox'>";
						html=html+"<input type='checkbox' id='"+value.kebeleId+"' value='"+value.kebeleId+"'  class='magic-checkbox' name='kebeleNameId'/>";
						html=html+"<label for='"+value.kebeleId+"'></label></div>";
						html=html+"<label for='"+value.kebeleId+"'> "+value.kebeleName+"</label></li>"; 
 	 	 			/* } */	
				});
			}
			$('#kebeleId').empty().append(html);
			//$("#kebeleResultId").empty(); 
		},error : function(error) {
			 
		}
	});

	
} 

 function searchKebeleEdit(levelId)
 {
 	//alert(levelId);

 	 var parentWoredaIdArr = [];
      $.each($("input[name='testWoreda']:checked"), function(){
     	 parentWoredaIdArr.push($(this).val());
      });
    
      var woredaId=parentWoredaIdArr.toString();
     // alert("woredaId=="+woredaId);
    
 	 var testKebeleArray = [];
 	 $.each($("input[name='testKebele']:checked"), function(){
 	 testKebeleArray.push($(this).val());
 	});
    /*  var demograpId= woredaId.toString();

     $("#select_all_kebele").click();
 	var kebRes=$("#kebeleResultId").val();
 	
 	var kebResARR=[];
 		for(i=0;i<kebRes.length;i++)
 		{
 			kebResARR.push(kebRes[i]);
 		} */
 		//alert(kebResARR);
      $.ajax({
 		type : "GET",
 		 url : "find-multiple-kebele-by-woreda-id", 
 	   data : {
 			"levelId":levelId,
 			"woredaId":woredaId
 			
 		},
 		success : function(response) {
 			var html = " ";
 			var val=JSON.parse(response);
 			 //alert(response);
 			if (val != "" || val != null) {
 				$.each(val,function(index, value)
 				 {	
 					var check = false;
 					
  					for(i=0;i<testKebeleArray.length;i++)
  	 					{
 							if(testKebeleArray[i] == value.kebeleId)
 								{
 									check = true;
 									break;
 								}
  	 					}
 	 					if(check == false)
 		 					{			
 						
 						html=html+" <li><div class='checkbox'>";
 						html=html+"<input type='checkbox' id='"+value.kebeleId+"' value='"+value.kebeleId+"'  class='magic-checkbox' name='kebeleNameId' />";
 						html=html+"<label for='"+value.kebeleId+"'></label></div>";
 						html=html+"<label for='"+value.kebeleId+"'> "+value.kebeleName+"</label></li>"; 
  	 	 			 }else{
  	 	 				html=html+" <li><div class='checkbox'>";
 						html=html+"<input type='checkbox' id='"+value.kebeleId+"' value='"+value.kebeleId+"'  class='magic-checkbox' name='kebeleNameId' checked='checked'/>";
 						html=html+"<label for='"+value.kebeleId+"'></label></div>";
 						html=html+"<label for='"+value.kebeleId+"'> "+value.kebeleName+"</label></li>";
  	  	 	 			 } 	
 				});
 			}
 			$('#kebeleId').empty().append(html);
 			//$("#kebeleResultId").empty(); 
 		},error : function(error) {
 			 
 		}
 	});

 	
 } 
 </script>
 <script>
 function saveRecommendetion()
 {

	 event.preventDefault();
	 var form = event.target.form;
	
	 var regionSpecific = $("input[name='recommendType']:checked").val();
	//alert("regionSpecific=="+regionSpecific);
	if(regionSpecific=='2')
	{
		var regionId = $("input[name='regionId']:checked").length;
		//alert("regionId=="+regionId);
	   	 if(regionId=='0')
	   	{
	   		swal(
					'Error',
					'Please select at least one region',
					'error'
					).then(function() 
			   		 {
						$("#Region_div_Id_1").focus();
					});
					
	   		
	   		return false;
	   	 }
	   	var zoneId = $("input[name='ZoneNameId']:checked").length;
	 
	   //	alert("zoneId=="+zoneId);
	   	 if(zoneId=='0')
	   	{
	   		swal(
					'Error',
					'Please select at least one zone',
					'error'
					).then(function() 
			   		   		{
						$("#Region_div_Id_2").focus();
					});
	   		return false;
	   	 }
	   	
	   	var woredaId = $("input[name='WoredaNameId']:checked").length;
		  //alert("woredaId=="+woredaId);
		   	 if(woredaId=='0')
		   	{
		   		swal(
						'Error',
						'Please select at least one woreda',
						'error'
						).then(function() 
				   		   		{
							$("#Region_div_Id_3").focus();
						});
		   		return false;
		   	 }

		   	var parentWoredaIdArray = [];
		     $.each($("input[name='WoredaNameId']:checked"), function(){
		    	 parentWoredaIdArray.push($(this).val());
		     });
		     //alert("woredaId=="+parentWoredaIdArray);
			$("#f_WoredaNameId").val(parentWoredaIdArray);


			var parentKebeleIdArray = [];
		     $.each($("input[name='kebeleNameId']:checked"), function(){
		    	 parentKebeleIdArray.push($(this).val());
		     });
		    // alert("KebeleId=="+parentKebeleIdArray);
			$("#f_kebeleNameId").val(parentKebeleIdArray);
			
	}
	
	
	var fileInput = $('#recommendFileName').val();
    if(fileInput!='')
    {
    	/* swal("Error", "Please Upload Recommendation.", 
    	    	"error").then(function() {
					   $("#recommendFileName").focus();
				   });
    	return false;
    } */
     var filePath = fileInput;
   // var allowedExtensions = /.*\.(pdf)$/i;
    var allowedExtensions = /(.doc|.docx|.pdf)$/i;
    if(!allowedExtensions.exec(filePath)){
    	// fileInput.value="";
    	swal("Error", "Please upload file with .pdf extension only", 
    	    	"error").then(function() {
    	    		
					   $("#recommendFileName").focus();
				   });
       
        return false; 
    }
 
    var file_size = $('#recommendFileName')[0].files[0].size;
   // alert("file_size=="+file_size);
    if (file_size > 5242880) { 
        swal("Error", "Please upload file less than 5MB!",
                 "error").then(function() {
     	    		
					   $("#recommendFileName").focus();
				   });
     
        return false;
    }
 }
    var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
    var recommendRemark=$("#recommendRemark").val();
    if(recommendRemark=="")
     {
    	swal("Error", "Please enter recommendation summary", "error").then(function() {
			   $("#recommendRemark").focus();
		   });
			return false;
     }
	if(!recommendRemark.match(desc_regex))
   	{
	   	
   		swal("Error", "Recommendation summary accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
			   $("#recommendRemark").focus();
		   });
			return false;
   	}
   	if(recommendRemark.charAt(0)== ' ' || recommendRemark.charAt(recommendRemark.length - 1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in recommendation summary", "error");
            return false;
	   }
   	if(recommendRemark!=null)
   	{
   		var count= 0;
   		var i;
   		for(i=0;i<recommendRemark.length && i+1 < recommendRemark.length;i++)
   		{
   			if ((recommendRemark.charAt(i) == ' ') && (recommendRemark.charAt(i + 1) == ' ')) 
   			{
				count++;
			}
   		}
   		if (count > 0) {
   			swal("Error", "Recommendation summary should not contain consecutive blank spaces", "error").then(function() {
				   $("#recommendRemark").focus();
			   });
			return false;
		}
   	}
   	var descLen=recommendRemark.length;
   	if (recommendRemark.charAt(0) == '!' || recommendRemark.charAt(0) == '@' 
		|| recommendRemark.charAt(0) == '#' || recommendRemark.charAt(0) == '$' 
		|| recommendRemark.charAt(0) == '&' || recommendRemark.charAt(0) == '*' 
		|| recommendRemark.charAt(0) == '(' || recommendRemark.charAt(0) == ')' 
		|| recommendRemark.charAt(descLen - 1) == '!' || recommendRemark.charAt(descLen - 1) == '@' 
		|| recommendRemark.charAt(descLen - 1) == '#' || recommendRemark.charAt(descLen - 1) == '$' 
		|| recommendRemark.charAt(descLen - 1) == '&' || recommendRemark.charAt(descLen - 1) == '*' 
		|| recommendRemark.charAt(descLen - 1) == '(' || recommendRemark.charAt(descLen - 1) == ')') 
   	{
			swal("Error", "!@#$&*() characters are not allowed at initial and last place in recommendation summary", "error").then(function() {
			   $("#recommendRemark").focus();
		   });
		return false;
	} 
   	swal({
   		title: 'Do you want to update?',
		  type: 'info',
		  showCancelButton: true,
		  confirmButtonText: 'Yes',
		  cancelButtonText: 'No',
	    }).then((result) => {
			if (result.value) {
				
				 form.submit();
			}
		})
}
 </script>
 
 <script>
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
	   		swal("Error", "${errMsg}", "error"); 
			//alert('${ErrorMessage}');
			document.getElementById('${FieldId}').value="";
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>
<!-- Download File -->
 <script>
 function recommendFileDownload(id)
 {	
	
 	$.ajax({
 		type:"GET",
 		url:"recommend-file-exist",
 		data:{
 				"fileId":id
 		},
 		success:function(response){

 			var res=JSON.parse(response);
 			if(res.msg == 'Yes')
 			{	
 				$("#fileNameId").val(id);
 				$("#recommendFileForm").submit();
 			}else{
 				swal("File not found"," ", "error"); 
 				
 				}
 		},
 		error:function(error)
 		{
 		},		
 		
 		}); 
 	

 }
 function cancel()
 {
 	$("#cancelForm").submit();	
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
	    	container.find('.quantity').text(numChecked || 'All');
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
	var stateTemplate = _.template(
	    '<li>' +
	    	<%-- '<input name="<%= abbreviation %>" type="checkbox">' +
	    	'<label for="<%= abbreviation %>"><%= capName %></label>' + --%>
	    '</li>'
	);

	// Populate list with states
	_.each(usStates, function(s) {
	    s.capName = _.startCase(s.name.toLowerCase());
	    $('ul').append(stateTemplate(s));
	});
	

});


</script>
<script>
$(document).ready(function ()
									{
	$(".region").hide();
	 $(".magic-radio").change(function(){
            var radioValue = $("input[name='typeOfRecommendation']:checked").val();
            if(radioValue=="regionSpecific"){
            	$(".region").show();
                return false;
            }else{
            	$(".region").hide();
            	return false;
            }
        });
							        $("#btnSubmitIdw").click(function () 
							        {
							        	/* alert("Hello"); */
							        	 var fileInput = $('#recommendFileName').val();
							            if(fileInput=='')
							            {
							            	swal("Error", "Please Upload Recommendation.", "error");
							            	return false;
							            }
							             var filePath = fileInput;
							            var allowedExtensions = /.*\.(pdf)$/i;
							            
							            if(!allowedExtensions.exec(filePath)){
							            	swal("Error", "Please upload file with .pdf extension only", "error");
							                fileInput.value = '';
							                return false; 
							            }
							            var file_size = $('#demo-text-input1')[0].files[0].size;
							            if (file_size > 5242880) { 
							                swal("Error", "Please upload file less than 5MB!", "error");
							                return false;
							            }
							             else{
									        	 swal({
								            		title: ' Do you want to Submit?',
								            		  type: 'warning',
								            		  showCancelButton: true,
								            		  confirmButtonText: 'Yes',
								            		  cancelButtonText: 'No',
								        	    }).then((result) => {
								        	    	  if (result.value) 
								        	    	  {
								        	    		  swal("Success", "Submitted Successfully ", "success");
								        	    		   window.location.href="viewrecommendation";
								        	    		   return true;
								        	    		  }
								        	    		})  
								        	    		return false;
							        		}
						    		});
									});
</script>
	<script>
      function countChar(val) {
        var len = val.value.length;
        if (len > 200) {
        	
        } else {
          var remaining_len=$('#charNum').text(200 - len+" characters left");
        }
      };
    </script>
    <script>
	$(function(){
		   $(".selectallregion").click(function(){
			$(".individualregion").prop("checked",$(this).prop("checked"));
			});
	});
	$(function(){
		   $(".selectallzone").click(function(){
			$(".individualzone").prop("checked",$(this).prop("checked"));
			});
	});
	$(function(){
		   $(".selectallworeda").click(function(){
			$(".individualworeda").prop("checked",$(this).prop("checked"));
			});
	});
	$(function(){
		   $(".selectallkebele").click(function(){
			$(".individualkebele").prop("checked",$(this).prop("checked"));
			});
	});
</script>

<script>
      function countSms(val) {
         var len = val.value.length;
        if (len > 140) {
        	
        } else {
          var remaining_len=$('#smsNum').text(140 - len+" characters left");
        } 
        
        
        
      };
    </script>


<script>

$(document).ready(function() {
	
	var cchoice=${beanEdit.requiredSms}.toString();
	if (cchoice ==='false') {
		$( "#smsRemark" ).prop( "hidden", true );
		$( "#content" ).prop( "hidden", true );
		$( "#smsNum" ).prop( "hidden", true );
		$( "#col" ).prop( "hidden", true );
		$("#smsRemark").val("");
	} else if (cchoice ==='true'){
		$( "#smsRemark" ).prop( "hidden", false );
		$( "#content" ).prop( "hidden", false );
		$( "#smsNum" ).prop( "hidden", false );
		$( "#col" ).prop( "hidden", false );
	}
});
var smsRadio = $('input[name="sendType"]'),
choice = '';
smsRadio.change(function(e) {
choice = this.value;

if (choice === 'false') {
	$( "#smsRemark" ).prop( "hidden", true );
	$( "#content" ).prop( "hidden", true );
	$( "#smsNum" ).prop( "hidden", true );
	$( "#col" ).prop( "hidden", true );
	$("#smsRemark").val("");
} else if (choice === 'true'){
	$( "#smsRemark" ).prop( "hidden", false );
	$( "#content" ).prop( "hidden", false );
	$( "#smsNum" ).prop( "hidden", false );
	$( "#col" ).prop( "hidden", false );
}
});
</script>


<script>
/* $("#general").click(function(){
	  $(".region").hide();
});
$("#gregionSpecific").click(function(){
	  $(".region").show();
}) */;

</script>
         