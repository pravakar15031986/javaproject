<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>





<style type="text/css">   
    .modal
    {
        position: fixed;
        z-index: 999;
        height: 100%;
        width: 100%;
        top: 0;
        left: 0;
        
    }
    .center
    {
        z-index: 1000;
        margin: 300px auto;
        padding:10px;
        height:50px;
        width: 150px;
        background-color: White;
        border-radius: auto;
        text-align: center;
    }
    
</style>

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
	function changeRoleName(){
			$("#roleId").val(0);
		}
</script>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View User Location Tagging</h4>
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
                                 <a class="nav-item nav-link "  href="demographicTagging">Add</a>
                              <a class="nav-item nav-link active"  href="demographicTaggingView" >View</a>
                           </ul> 
                           <div class="indicatorslist">
                             
                               
                            
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                           
                           <div class="form-group">
                            <div class="row">
                              <label class="col-lg-2 ">Organization Name<span class="text-danger">*</span></label>
                                    <div class="col-lg-3">
                                      <select class="form-control" id="orgName"  tabindex="1" onchange="changeRoleName()">
											 <option value="0">--Select--</option>
											  <c:forEach items="${orgList}" var="orgName">
											 	<option value="${orgName.levelDetailId }">${orgName.levelName}</option>
											 </c:forEach>
												
									 </select>
                                    </div>
                                    
                                    
                              <label class="col-lg-2 ">Role Name<span class="text-danger">*</span></label>
                                    <div class="col-sm-3">
                                        <select class="form-control" id="roleId" onchange="findUserName(this.value);" tabindex="2">
                                     <option value="0">--Select--</option>
                                   	<c:forEach items="${roleName}" var="rName">
										<option value="${rName.roleId }">${rName.roleName}</option>
											 
								    </c:forEach>
                                    </select>
                                    </div>
                              
                           </div>
                           </div>
                           <div class="form-group">
                            <div class="row">
                              <label class="col-lg-2 ">User Name</label>
                                    <div class="col-lg-3">
                                      
                                    <select class="form-control" id="userId" name="userNameId"  tabindex="3"> 
                                  	 <option value="0">--Select--</option>
                                    </select>
                                    </div>
                                    
                                    
                              <label class="col-lg-2 ">Status</label>
                                    <div class="col-sm-3">
                                        <select class="form-control" id="Status"> 
                                          <option value="0">--Select--</option>
                                          <option value="false">Active</option>
                                          <option value="true">Inactive</option>
                                       </select>
                                    </div>
                              <div class="col-lg-2">
                                       <button class="btn btn-primary" onclick="searchData(10,1)"> <i class="fa fa-search"></i> Search</button>
                                    </div> 
                           </div>
                           </div>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div> 
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                            <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
                                 <thead>
                                    <tr>
                                       <th  width="40px">Sl#</th>
                                       <th >Organization Name</th>
                                       <th>Role Name</th>
                                       <th>User Name</th>
                                        <th >Region</th>
                                        <th >Zone</th>
                                        <th >Woreda</th>
                                        <th >Kebele</th>
                                        <th width="100px">Status</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody id="responseBody">
                               
                                 </tbody>
                              </table>
                          </div>
                           <div id="showPageNId">
						</div>
						<div style="float: right;" id="pageId">
							<ul class="pagination">
  							</ul>
						</div>
                        </div>
                           
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
            </div>
				<div class="modal" style="display: none">
					<div class="center">
						Processing...
					</div>
            <form action="demographicTaggingEdit" method="post" id="editForm">
           <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
            <input type="hidden" id="tagId" name="locationtagId">
            </form> 
    
<script>
$(document).ready(function(){
	callData(10,1);
});
var listDataLen=0;
var backUp=0;
function callData(pSize,pageNumber)
{
	
	var pageSize=10;
	$.ajax({
			type:"GET",
			url:"viewAllDemogrphyLocationTagByPage",
			data:{
					"pageSize":pageSize,
					"pageNumber":pageNumber,
			},beforeSend: function () {
                $(".modal").show();
            },
            complete: function () {
                $(".modal").hide();
            },
			success:function(response){
				//alert(response);
				var html="";
				var prev="";
				var val=JSON.parse(response);
				var array0=val;
				
				if(array0.totalRowNo==0)
				{
					//cearTable();
					$("#viewTable").hide();
 					$("#pageId").hide();
 					$("#showPageNId").hide();
 					swal("No Record Found");
					return false;
				}
				$("#viewTable").show();
				var tblInfo="Showing <span id='p4'></span> of"+"\t"+array0.totalRowNo+" of entries";
				$("#showPageNId").empty().append(tblInfo);
				var prevP=array0.startPage-1;
				if(array0.pageNo==0)
				{
					 prev=prev+"<li class='page-item  previous disabled' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_previous'><a class='page-link' onclick='callData("+pageSize+","+array0.pageNo+")' >Previous</a></li>"	;	
				}else{
					prev=prev+"<li class='page-item previous' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_previous'><a class='page-link' onclick='callData("+pageSize+","+array0.pageNo+")'  style='cursor: pointer;'>Previous</a></li>"	;
				}
				if(array0.pageNo==(array0.endPage-1))
				{
					 next="<li class='page-item next disabled' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_next'><a class='page-link' onclick='callData("+pageSize+","+array0.pageNo+")' >Next</a></li>"	;	
				}else{
					next="<li class='page-item next' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_next'><a  class='page-link' onclick='callData("+pageSize+","+(array0.pageNo+2)+")'  style='cursor: pointer;'>Next</a></li>"	;
				}
				for(var i=array0.startPage;i<=array0.endPage;i++)
				{
					 prev=prev+"<li class='page-item' aria-controls='dynamicTable' tabindex='0' id='btn"+i+"'><a class='page-link' onclick='callData("+pageSize+","+i+")'  style='cursor: pointer;'>"+i+"</a></li>";	
				}
				 prev=prev+next;
				 $(".pagination").empty().append(prev);
				 $("#btn"+pageNumber).attr("class","page-item active");
				 
				 var count=0;
				 if(val!=" " || val!=null )
				{
					 listDataLen=listDataLen+val.locationTagList.length-backUp;
  					 var dataLen=val.locationTagList.length;
					 var indexLen=listDataLen-dataLen;
					
					$.each(val.locationTagList,function(index,value)
					{
									count=indexLen+index+1 + (10*array0.pageNo);
									$("#p4").text(count);
									html=html+"<tr><td>"+count+"</td>";
									html=html+"<td>"+value.orgName+"</td>";
									html=html+"<td>"+value.roleName+"</td>";
									html=html+"<td>"+value.name+"</td>";
									html=html+"<td>"+value.region+"</td>";
									html=html+"<td>"+value.zone+"</td>";
									html=html+"<td>"+value.woreda+"</td>";
									html=html+"<td>"+value.kebele+"</td>";
									html=html+"<td>"+value.status+"</td>";
									html=html+"<td><a class='btn btn-info btn-sm' data-toggle='tooltip' data-original-title='Edit' onclick='edit("+value.id+")'><i class='icon-edit1'></i></a></td></tr>";
									
					});	 
					backUp = listDataLen;
				 }
				 $("#responseBody").empty().append(html);
			},
			error:function(error){
				 $(".modal").hide();
			}
	});	
	
}
function cearTable()
{
	var table=$("#viewTable").DataTable();
	table.clear().draw();
}
function edit(id){
	$("#tagId").val(id);
	$("#editForm").submit();
}
</script>
 <script>
 var listDataLen=0;
 var backUp=0;
 function searchData(pSize,pageNumber)
 {
	
	 var orgName=$("#orgName").val();
	 var roleId=$("#roleId").val();
	 var userId=$("#userId").val();
	 var Status=$("#Status").val(); 
	if(orgName!='0')
	{
		 if(roleId=='0')
		   	{
		   		swal('Error','Please select Role Name','error').then(function() 
		   		   		{
					$("#roleId").focus();
				});
				return false;
		   	 }
		   	 
		   	 var userId=$("#userId").val();
		   	
		   	 if(userId=='0')
		   	{
		   		swal('Error','Please select User Name','error').then(function() 
		   		   		{
					$("#userId").focus();
				});
						
		   		return false;
		   	 }
	}
	
 	if(userId == '0'&& Status =='0' )
 	 {	 	 return false;	
 	 }
 	var pageSize=10;
 	$.ajax({
 			type:"GET",
 			url:"searchDemogrphyLocationTagByPage",
 			data:{
 					"pageSize":pageSize,
 					"pageNumber":pageNumber,
 					"orgName":orgName,
 					"Status":Status,
 					"roleId":roleId,
 					"userId":userId
 			},
 			success:function(response){
 				//alert(response);
 				var html="";
 				var prev="";
 				var val=JSON.parse(response);
 				var array0=val;
 				
 				if(array0.totalRowNo==0)
 				{
 					//cearTable();
 					$("#viewTable").hide();
 					$("#pageId").hide();
 					$("#showPageNId").hide();
 					
 					$("#viewTable_paginate").hide();
 					$("#viewTable_info").hide();
 					$("#viewTable_length").hide();
 					$("#viewTable_filter").hide();
 					swal("No Record Found"); 
 					return false;
 				}
 				$("#viewTable").show();
 				$("#viewTable_paginate").show();
				$("#viewTable_info").show();
				$("#viewTable_length").show();
				$("#viewTable_filter").show();
 				var tblInfo="Showing <span id='p4'></span> of"+"\t"+array0.totalRowNo+" of entries";
 				$("#showPageNId").empty().append(tblInfo);
 				var prevP=array0.startPage-1;
 				if(array0.pageNo==0)
 				{
 					 prev=prev+"<li class='page-item  previous disabled' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_previous'><a class='page-link' onclick='searchData("+pageSize+","+array0.pageNo+")' >Previous</a></li>"	;	
 				}else{
 					prev=prev+"<li class='page-item previous' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_previous'><a class='page-link' onclick='searchData("+pageSize+","+array0.pageNo+")'  style='cursor: pointer;'>Previous</a></li>"	;
 				}
 				if(array0.pageNo==(array0.endPage-1))
 				{
 					 next="<li class='page-item next disabled' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_next'><a class='page-link' onclick='searchData("+pageSize+","+array0.pageNo+")' >Next</a></li>"	;	
 				}else{
 					next="<li class='page-item next' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_next'><a  class='page-link' onclick='searchData("+pageSize+","+(array0.pageNo+2)+")'  style='cursor: pointer;'>Next</a></li>"	;
 				}
 				for(var i=array0.startPage;i<=array0.endPage;i++)
 				{
 					 prev=prev+"<li class='page-item' aria-controls='dynamicTable' tabindex='0' id='btn"+i+"'><a class='page-link' onclick='searchData("+pageSize+","+i+")'  style='cursor: pointer;'>"+i+"</a></li>";	
 				}
 				 prev=prev+next;
 				 $(".pagination").empty().append(prev);
 				 $("#btn"+pageNumber).attr("class","page-item active");
 				 
 				 var count=0;
 				 if(val!=" " || val!=null )
 				{
 					 listDataLen=listDataLen+val.locationTagList.length-backUp;
   					 var dataLen=val.locationTagList.length;
 					 var indexLen=listDataLen-dataLen;
 					
 					$.each(val.locationTagList,function(index,value)
 					{ 
 									count=indexLen+index+1 + (10*array0.pageNo);
 									$("#p4").text(count);
 									html=html+"<tr><td>"+count+"</td>";
 									html=html+"<td>"+value.orgName+"</td>";
 									html=html+"<td>"+value.roleName+"</td>";
 									html=html+"<td>"+value.name+"</td>";
 									html=html+"<td>"+value.region+"</td>";
 									html=html+"<td>"+value.zone+"</td>";
 									html=html+"<td>"+value.woreda+"</td>";
 									html=html+"<td>"+value.kebele+"</td>";
 									html=html+"<td>"+value.status+"</td>";
 									html=html+"<td><a class='btn btn-info btn-sm' data-toggle='tooltip' data-original-title='Edit' onclick='edit("+value.id+")'><i class='icon-edit1'></i></a></td></tr>";
 									
 					});	 
 					backUp = listDataLen;
 				 }
 				 $("#responseBody").empty().append(html);
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
         var regionId=$("#RegionId").val();
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
						html=html+"<option value="+value.zoneId+">"+value.zoneName+"</option>"; 
					});
				}
				$('#ZoneId').empty().append(html);
				
				
			},error : function(error) {
				 
			}
		}); 
	} 
</script>
<script type="text/javascript">
	function findUserName(id)
	{	var orgId=$("#orgName").val();
		$.ajax({
				type:"GET",
				url:"findUserNameByOrgIDAndRoleIDSearch", 
				data:{
						"orgId":orgId,
						"roleId":id,
				},
				success:function(response){
					
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
				},
				error:function(error){
				}
		});
	}  
	
</script>
