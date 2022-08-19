<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     
     
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Recommendation</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Recommendation</li>
                           <li class="breadcrumb-item" aria-current="page">Prepare Recommendation</li>
                        </ol>
                     </nav>
                  </div>

               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">

                                <a class="nav-item nav-link active"  href="javascript:void(0)">Add Recommendation</a>

                           </ul>
                           <div class="indicatorslist">
                            <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="history.back()"><i class="icon-arrow-left1"></i></a>
                             
                           </div> 
                        </div>
                      
                        <!--===================================================-->
                        
                      
                        <div class="card-body">
                          <form action="add-recommendation"  method="post"  onsubmit="return false" enctype="multipart/form-data">
                         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                          <input type="hidden" value="${advisoryId}" name="advisoryId">
                          
                          <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Advisory No.</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <div class="col-xl-4">
                                        ${adviosryNo}
                                    </div>
                                 
                              </div>
                           </div>
                          
                          
                           <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Type of Recommendation <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <!-- Radio Buttons -->
                                 <div class="radio">
                                    <input id="demo-form-radio-3" class="magic-radio recommendGen" type="radio" name="recommendType" value="1" checked="checked">
                                    <label for="demo-form-radio-3">General</label>
                             
                                    <input id="demo-form-radio-4" class="magic-radio recommendRegion" type="radio" name="recommendType" value="2">
                                    <label for="demo-form-radio-4">Region Specific</label>
                                 </div>
                              </div>
                           </div>
                           <div id="regionSpecificId">
                           	<div class="form-group row">
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
						        	
						        <li>
							        <div class="checkbox">
	                                    <input type="checkbox" id="${region.demographyId}" value="${region.demographyId}"  class="magic-checkbox" name="regionId" id="regionId" onclick="searchZoneNameByRegionId(3)"/>
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
                         <div class="form-group row">
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
                           <div class="form-group">
                              <div class="row">
                                    <label class="col-lg-2 ">Upload Recommendation<span class="text-danger">*</span></label>
                                    <div class="input-group col-lg-3">
                                    <span class="colon">:</span>
                                        <input type="file" id="recommendFileName" name="recommendFileName" class="form-control" placeholder="">                                    </div>
                                         <small>Max size: 5MB<br> Allowed types: pdf,doc,docx</small>
                                </div>
                            </div>
                             <div class="form-group">
                              <div class="row">
                                    <label class="col-lg-2 ">Recommendation Summary<span class="text-danger">*</span></label>
                                    <div class="input-group col-lg-3">
                                    <span class="colon">:</span>
                                        <textarea rows="5" cols="100" class="form-control" maxlength="200" onkeyup="countChar(this)" name="recommendRemark" id="recommendRemark"></textarea>
                                        
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
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                  <div class="radio">
                                    <form:radiobutton id="demo-form-radio" class="magic-radio sampleyes" value="0" path="status" name="form-radio-button" checked/>
                                    <input type="radio" id="demo-form-radio" name="statusBean" class="magic-radio sampleyes" value="false" checked="checked" name="form-radio-button"/>
                                    <label for="demo-form-radio" tabindex="3">Active</label>
                             
                                    <input type="radio"  id="demo-form-radio-2" name="statusBean" class="magic-radio sampleyes" value="true" name="form-radio-button"/>
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
                                    <input id="demo-form-radio-5" class="magic-radio smsYes" type="radio" name="sendType" value="true" checked="checked">
                                    <label for="demo-form-radio-5">Yes</label>
                             
                                    <input id="demo-form-radio-6" class="magic-radio smsNo" type="radio" name="sendType" value="false">
                                    <label for="demo-form-radio-6">No</label>
                                 </div>
                              </div>
                           </div>
                           
                           
                           <!-- sms content -->
                           
                           <div class="form-group" >
                              <div class="row" >
                                    <label class="col-lg-2 " id="content" >Recommendation Content For SMS<span class="text-danger">*</span></label>
                                    <div class="input-group col-lg-3">
                                    <span class="colon" id="col">:</span>
                                        <textarea rows="4" cols="100" class="form-control" maxlength="140" onkeyup="countSms(this)" name="smsRemark" id="smsRemark"></textarea>
                                        
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
								 <button class="btn btn-primary mb-1" id="btnSubmitId" onclick="saveRecommendetion()">Submit</button>
								 <button class="btn btn-danger mb-1" id="btnCancelId" type="reset">Reset</button>
							 
							</div>
							</div>
							</div>
                          </form>
                         </div>
                         
                         
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
 <script>
$(document).ready(function()
{
	 $("#regionSpecificId").hide();
	$(".recommendGen").click(function()
	{
		 $("#regionSpecificId").hide();
		 
	 });
		  
	 $(".recommendRegion").click(function(){
		 $("#regionSpecificId").show();
	 });		
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
         var regionId=parentIdArr.toString();

        /*  var zoneNameIdArr = [];
         $.each($("input[name='ZoneNameId']:checked"), function(){
        	 zoneNameIdArr.push($(this).val());
         });

         var zoneForWoredaId=[];  */
         
		 $.ajax({
			type : "GET",
			url : "find-multiple-zone-by-region-id", 
			data:{
					"levelId":levelId,
					"regionId":regionId
				},		
			success : function(response) {
				 
				
				var checkData=true;
				var html =" ";
				var val=JSON.parse(response);
				/* var checkData = false; */
				if (val != "" || val != null) {
					var check=false;
					$.each(val,function(index, value) {						

							html=html+" <li><div class='checkbox'>";
							html=html+"<input type='checkbox' id='"+value.zoneId+"' value='"+value.zoneId+"'  class='magic-checkbox' name='ZoneNameId' onchange='findWoredaByZoneId(4);'/>";
							html=html+"<label for='"+value.zoneId+"'></label></div>";
							html=html+"<label for='"+value.zoneId+"'> "+value.zoneName+"</label></li>"; 
	
						
					});
					/* if(checkData == false)
					{
						$('#zoneId').empty();
						$('#WoredaId').empty();
						$('#kebeleId').empty();
						/* $('#kebeleFirstId').empty();
						$('#kebeleResultId').empty(); 
					} */
				}
				$('#zoneId').empty().append(html);
				$('#WoredaId').empty();
				$('#kebeleId').empty();
				
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

	
   /*   var woredaNameIdArr=[];
     $.each($("input[name='WoredaNameId']:checked"),function())
     {
    	 woredaNameIdArr.push($(this).val());
      });
   
 		var WoredaForKebeleId=[]; */
     
     
     
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
 			
 			var html = "";
 			var val=JSON.parse(response);

 			var woredaRes=$("#woridaResultId").val();

 			/* var woriARR=[];
 			for(i=0;i<woredaRes.length;i++)
 			{
 				woriARR.push(woredaRes[i]);
 			} */
 			
 			if (val != "" || val != null) {
 	 			var check=false;
 				$.each(val,function(index, value) 
 		 		{	
 					/* var check = false; 
 					for(i=0;i<woriARR.length;i++)
 	 					{
							if(woriARR[i] == value.woridaId)
								{
									check = true;
									break;
								}
 	 					}
	 					if(check == false)
		 			{ */
 	 		 		 
 	 		 			
 	 		 			html=html+" <li><div class='checkbox'>";
						html=html+"<input type='checkbox' id='"+value.woridaId+"' value='"+value.woridaId+"'  class='magic-checkbox' name='WoredaNameId' onchange='searchKebele(5);'/>";
						html=html+"<label for='"+value.woridaId+"'></label></div>";
						html=html+"<label for='"+value.woridaId+"'> "+value.woridaName+"</label></li>";  
		 			/* } */
 	 	 	 	});
 			}
 			$('#WoredaId').empty().append(html);
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
	

	 var parentWoredaIdArr = [];
     $.each($("input[name='WoredaNameId']:checked"), function(){
    	 parentWoredaIdArr.push($(this).val());
     });
   
     var woredaId=parentWoredaIdArr.toString();
    
   
	
   /*  var demograpId= woredaId.toString();

    $("#select_all_kebele").click();
	var kebRes=$("#kebeleResultId").val();
	
	var kebResARR=[];
		for(i=0;i<kebRes.length;i++)
		{
			kebResARR.push(kebRes[i]);
		} */
		
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
 </script>
 <script>
 function saveRecommendetion()
 {

	 event.preventDefault();
	 var form = event.target.form;
	
	 var regionSpecific = $("input[name='recommendType']:checked").val();
	
	if(regionSpecific=='2')
	{
		var regionId = $("input[name='regionId']:checked").length;
		
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
		     
			$("#f_WoredaNameId").val(parentWoredaIdArray);


			var parentKebeleIdArray = [];
		     $.each($("input[name='kebeleNameId']:checked"), function(){
		    	 parentKebeleIdArray.push($(this).val());
		     });
		    
			$("#f_kebeleNameId").val(parentKebeleIdArray);
			
	}
	
	
	var fileInput = $('#recommendFileName').val();
    if(fileInput=='')
    {
    	swal("Error", "Please Upload Recommendation.", 
    	    	"error").then(function() {
					   $("#recommendFileName").focus();
				   });
    	return false;
    }
     var filePath = fileInput;

     var allowedExtensions = /(.doc|.docx|.pdf)$/i;
    //var allowedExtensions = /.*\.(pdf)$/i;
    
     if(!allowedExtensions.exec(filePath)){
    	
    	swal("Error", "Please upload file with .pdf or .doc or .docx extensions only", 
    	    	"error").then(function() {
    	    		
					   $("#recommendFileName").focus();
				   });
       
        return false; 
    }
     var file_size = $('#recommendFileName')[0].files[0].size;
    if (file_size > 5242880) { 
        swal("Error", "Please upload file less than 5MB!",
                 "error").then(function() {
     	    		
					   $("#recommendFileName").focus();
				   });
     
        return false;
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
   	
   	
   /* 	validation for sms */
   
   
    var smsRemark=$("#smsRemark").val();
    if(recommendRemark=="")
     {
    	swal("Error", "Please enter SMS", "error").then(function() {
			   $("#smsRemark").focus();
		   });
			return false;
     }
	if(!smsRemark.match(desc_regex))
   	{
	   	
   		swal("Error", "SMS accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
			   $("#smsRemark").focus();
		   });
			return false;
   	}
   	if(smsRemark.charAt(0)== ' ' || smsRemark.charAt(smsRemark.length - 1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in SMS", "error");
            return false;
	   }
   	if(smsRemark!=null)
   	{
   		var count= 0;
   		var i;
   		for(i=0;i<smsRemark.length && i+1 < smsRemark.length;i++)
   		{
   			if ((smsRemark.charAt(i) == ' ') && (smsRemark.charAt(i + 1) == ' ')) 
   			{
				count++;
			}
   		}
   		if (count > 0) {
   			swal("Error", "SMS should not contain consecutive blank spaces", "error").then(function() {
				   $("#smsRemark").focus();
			   });
			return false;
		}
   	}
   	var fescLen=smsRemark.length;
   	if (smsRemark.charAt(0) == '!' || smsRemark.charAt(0) == '@' 
		|| smsRemark.charAt(0) == '#' || smsRemark.charAt(0) == '$' 
		|| smsRemark.charAt(0) == '&' || recommendRemark.charAt(0) == '*' 
		|| smsRemark.charAt(0) == '(' || recommendRemark.charAt(0) == ')' 
		|| smsRemark.charAt(fescLen - 1) == '!' || smsRemark.charAt(fescLen - 1) == '@' 
		|| smsRemark.charAt(fescLen - 1) == '#' || smsRemark.charAt(fescLen - 1) == '$' 
		|| smsRemark.charAt(fescLen - 1) == '&' || smsRemark.charAt(fescLen - 1) == '*' 
		|| smsRemark.charAt(fescLen - 1) == '(' || smsRemark.charAt(fescLen - 1) == ')') 
   	{
			swal("Error", "!@#$&*() characters are not allowed at initial and last place in SMS", "error").then(function() {
			   $("#smsRemark").focus();
		   });
		return false;
	} 
  
   
    /* 	validation for sms (ends) */
    
    
   	swal({
   		title: 'Do you want to submit?',
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
		        		valu += " , "+$("#check_val_"+val1).html();
	        			}
		        		if(val2 != undefined && val2 != null  && val2.trim() != '')
	        			{
		        		valu +=  " , "+$("#check_val_"+val2).html();
	        			}
		        		if(val3 != undefined && val3 != null  && val3.trim() != '')
	        			{
		        		valu +=  " , "+$("#check_val_"+val3).html();
	        			}
		        		if(val4 != undefined && val4 != null  && val4.trim() != '')
	        			{
		        		valu +=  " , "+$("#check_val_"+val4).html();
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
      function countSms(val) {
         var len = val.value.length;
        if (len > 140) {
        	
        } else {
          var remaining_len=$('#smsNum').text(140 - len+" characters left");
        } 
        
        
        
      };
    </script>






<script>
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
/* $("#general").click(function(){
	  $(".region").hide();
});
$("#gregionSpecific").click(function(){
	  $(".region").show();
}) */;

</script>
         