<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
     
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Research Center</h4>
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
                               <a class="nav-item nav-link "  href="configureResearchCenterMaster">Add</a>
                              <a class="nav-item nav-link active "  href="configureResearchCenterMasterView" >View</a>
                           </ul> 
                           <div class="indicatorslist">
                              
                             
                             
                                
                           
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                           
                           <div class="form-group">
                            <div class="row">
                             
                              <label class="col-lg-2 ">Region</label>
                                    <div class="col-sm-3">
                                    
                                       <select class="form-control" id="regionId" onchange="findZoneByRegionId(3,this.value);">
                                        <option value="0">--Select--</option>
                                       <c:forEach items="${regionList}" var="region">
                                         <option value="${region.demographyId}">${region.demographyName}</option>
                                       </c:forEach>
                                       </select>
                                       
                                    </div>
                                     <label class="col-lg-2 ">Zone</label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="zoneId">
                                         <option value="0">--Select--</option>
                                       </select>
                                    </div>
                              
                           </div>
                           </div>
                            <div class="form-group">
                            <div class="row">
                            
                             <label class="col-lg-2 ">Research Center Name</label>  
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" id="name" placeholder="" data-bv-field="fullName" maxlength="50">
                                    </div>
                             
                              <label class="col-sm-2 ">Status</label> 
                                    <div class="col-sm-3">
                                       <select class="form-control" id="status">
                                          <option value="select">--Select--</option>
                                          <option value="false">Active</option>
                                          <option value="true">Inactive</option>
                                       </select>
                                    </div>     
                                   
                                    <div class="col-lg-2">
                                       <button class="btn btn-primary" onclick="searchOne(10,1)"> <i class="fa fa-search"></i> Search</button>
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
                              <table data-toggle="table" class="table table-bordered" id="viewTableId">
                                 <thead>
                                    <tr>
                                       <th  width="40px">Sl#</th>
                                       <th >Research Center Name</th>
                                        <th >Region</th>
                                        <th >Zone</th>
                                        <th >Woreda</th>
                                        <th >Is Lab Exist</th>
                                        <th >Specialization</th>
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
				<div class="modal" style="display: none">
					<div class="center">
						Processing...
					</div>
				</div>
				<form action="configureResearchCenterMasterEdit" method="post" id="editForm">
                        	<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        	<input type="hidden" name="centerId" id="id">
                        </form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
            

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
			url:"viewAllResearchCenterPage",
			data:{
					"pageSize":pageSize,
					"pageNumber":pageNumber
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
					swal("No Record Found");
					return false;
				}
				//var tblInfo="Showing "+(array0.currentPage+1)+"\t"+"<p id='p4'></p>of"+"\t"+array0.totalRowNo+" of entries";
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
					 listDataLen=listDataLen+val.researchCenterList.length-backUp;
  					 var dataLen=val.researchCenterList.length;
					 var indexLen=listDataLen-dataLen;
					
					$.each(val.researchCenterList,function(index,value)
					{
									count=indexLen+index+1 + (10*array0.pageNo);
									 $("#p4").text(count);
									html=html+"<tr><td>"+count+"</td>";
									html=html+"<td>"+value.name+"</td>";
									html=html+"<td>"+value.region+"</td>";
									html=html+"<td>"+value.zone+"</td>";
									html=html+"<td>"+value.worida+"</td>";
									html=html+"<td>"+value.lab+"</td>";
									html=html+"<td>"+value.rust+"</td>";
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
function cearTable()
{
	var table=$("#viewTableId").DataTable();
	table.clear().draw();
}

function edit(id){
	
	$("#id").val(id);
	$("#editForm").submit();
}
function searchOne(pSize,pageNumber)
{
	/* alert("In Search pSize=="+pSize);
	alert("In Search pageNumber=="+pageNumber); */
	var name=$("#name").val();
	//alert("name"+name);
	
	var status=$("#status").val();
	//alert("status=="+status);
	var zoneId=$("#zoneId").val();
	//alert("zoneId"+zoneId);
	var regionId=$("#regionId").val();
	//alert("regionId"+regionId);
	var name_regex = /^[a-zA-Z ]{0,50}$/;
	 if(!name.match(name_regex))
	{
		swal("Error", "Research Center Name accept only alphabets", "error").then(function() {
				   $("#name").focus();
			   });
			return false;
	}
	 if(name!=null)
		{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<name.length && i+1 < name.length;i++)
		   		{
		   			if ((name.charAt(i) == ' ') && (name.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Research Center Name should not contain consecutive blank spaces", "error").then(function() {
						   $("#name").focus();
					   });
					return false;
				}
		}
		   	if(name.charAt(0)== ' ' || name.charAt(name.length - 1)== ' '){
				   swal("Error", "White space is not allowed at initial and last place in Research Center Name", "error").then(function() {
					   $("#name").focus();
				   });
		            return false;
			   }
	if(name == '' && status=='select' && zoneId=='0' && regionId=='0')
	{
		return false;
	}
	var pageSize=10;
	$.ajax({
			type:"GET",
			url:"search-ResearchCenter",
			data:{
					"pageSize":pageSize,
					"pageNumber":pageNumber,
					"name":name,
					"status":status,
					"zoneId":zoneId,
					"regionId":regionId
					
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
					$("#viewTableId").hide();
					$("#pageId").hide();
					$("#showPageNId").hide();
					swal("No Record Found");
					return false;
				}
				$("#viewTableId").show();
				//var tblInfo="Showing "+(array0.currentPage+1)+"\t"+"<p id='p4'></p>of"+"\t"+array0.totalRowNo+" of entries";
				var tblInfo="Showing <span id='p4'></span> of"+"\t"+array0.totalRowNo+" of entries";
				$("#showPageNId").empty().append(tblInfo);
				var prevP=array0.startPage-1;
				if(array0.pageNo==0)
				{
					 prev=prev+"<li class='page-item  previous disabled' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_previous'><a class='page-link' onclick='searchOne("+pageSize+","+array0.pageNo+")' >Previous</a></li>"	;	
				}else{
					prev=prev+"<li class='page-item previous' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_previous'><a class='page-link' onclick='searchOne("+pageSize+","+array0.pageNo+")'  style='cursor: pointer;'>Previous</a></li>"	;
				}
				if(array0.pageNo==(array0.endPage-1))
				{
					 next="<li class='page-item next disabled' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_next'><a class='page-link' onclick='searchOne("+pageSize+","+array0.pageNo+")' >Next</a></li>"	;	
				}else{
					next="<li class='page-item next' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_next'><a  class='page-link' onclick='searchOne("+pageSize+","+(array0.pageNo+2)+")'  style='cursor: pointer;'>Next</a></li>"	;
				}
				for(var i=array0.startPage;i<=array0.endPage;i++)
				{
					prev=prev+"<li class='page-item' aria-controls='dynamicTable' tabindex='0' id='btn"+i+"'><a class='page-link' onclick='searchOne("+pageSize+","+i+")'  style='cursor: pointer;'>"+i+"</a></li>";
				}
				 prev=prev+next;
				 $(".pagination").empty().append(prev);
				 $("#btn"+pageNumber).attr("class","page-item active");
				 
				 var count=0;
				 if(val!=" " || val!=null )
				{
					 listDataLen=listDataLen+val.researchCenterList.length-backUp;
  					 var dataLen=val.researchCenterList.length;
					 var indexLen=listDataLen-dataLen;
					
					$.each(val.researchCenterList,function(index,value)
					{
									count=indexLen+index+1 + (10*array0.pageNo);
									 $("#p4").text(count);
									html=html+"<tr><td>"+count+"</td>";
									html=html+"<td>"+value.name+"</td>";
									html=html+"<td>"+value.region+"</td>";
									html=html+"<td>"+value.zone+"</td>";
									html=html+"<td>"+value.worida+"</td>";
									html=html+"<td>"+value.lab+"</td>";
									html=html+"<td>"+value.rust+"</td>";
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
 <script>       
function findZoneByRegionId(levelId,parentId)
{
	//alert("Search Zone");
	$.ajax({
		type : "GET",
		url : "find-zone-by-region-id", 
	 
		data : {
			"levelId":levelId,
			"parentId" : parentId
			
		},
		success : function(response) {
			 
			//alert(response);
			var html = "<option value=''>---Select---</option>";
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
/* $.fn.dataTable.ext.errMode = 'none';
$('#viewTableId').dataTable({
	'processing' : true,
	'serverSide' : true,
	"searching" : false,
	"ordering" : false,
	"lengthChange": false,
	"info": true
}); */
</script>