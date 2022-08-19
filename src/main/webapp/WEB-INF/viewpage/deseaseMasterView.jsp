<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Disease</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                             <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Disease Master</li>
                        </ol>
                     </nav>
                  </div>
                 
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                             <a class="nav-item nav-link "  href="deseaseMaster">Add</a>
                              <a class="nav-item nav-link active"  href="deseaseMasterView" >View</a>
                           </ul>
                          <div class="indicatorslist">
                             
                              
                           
                              
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                              <div class="form-group">
                                 <div class="row">
                                    <label class="col-sm-2 ">Disease</label>
                                    <div class="col-sm-3">
                                       <input type="text" class="form-control" id="fName" placeholder="" data-bv-field="fullName" maxlength="50">
                                    </div>
                                    <label class="col-sm-2 ">Alias Name</label>
                                    <div class="col-sm-3">
                                       <input type="text" class="form-control" id="sName" placeholder="" data-bv-field="fullName" maxlength="50">
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Status</label>
                                      <div class="col-sm-3">
                                       <select class="form-control" id="statusId">
                                          <option value="select">Select</option>
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
                              <table data-toggle="table" class="table table-hover table-bordered" id="dynamicTable">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Disease Name</th>
                                       <th>Alias Name</th>
                                       <th>Other Details Required</th>
                                       <th>Description</th>
                                        <th>Status</th>
                                        <th>Severity Required</th>
                                        <th>Min Severity</th>
                                        <th>Max Severity</th>
                                      
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
                        <form action="disease-edit" method="post" id="editForm">
						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						<input type="hidden" name="diseaseId" id="diseaseId">
					</form>
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
 <link href="wrsis/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="wrsis/js/bootstrap.min.js"></script> 
<script src="wrsis/js/jquery.dataTables.min.js"></script>
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
			url:"viewAllDiseaseMasterPage",
			data:{
					"pageSize":pageSize,
					"pageNumber":pageNumber
			},
			success:function(response){
				//alert(response);
				var html="";
				var prev="";
				var val=JSON.parse(response);
				var array0=val;
				if(array0.totalRowNo==0)
				{
					cearTable();
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
					 listDataLen=listDataLen+val.diseaseList.length-backUp;
  					 var dataLen=val.diseaseList.length;
					 var indexLen=listDataLen-dataLen;
					
					$.each(val.diseaseList,function(index,value)
					{
									count=indexLen+index+1 + (10*array0.pageNo);
									 $("#p4").text(count);
									html=html+"<tr><td>"+count+"</td>";
									html=html+"<td>"+value.name+"</td>";
									html=html+"<td>"+value.aliseName+"</td>";
									html=html+"<td>"+value.other+"</td>";
									html=html+"<td>"+value.descr+"</td>";
									html=html+"<td>"+value.status+"</td>";
									html=html+"<td>"+value.severityReq+"</td>";
									html=html+"<td>"+value.minseverity+"</td>";
									html=html+"<td>"+value.maxseverity+"</td>";
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
	var table=$("#dynamicTable").DataTable();
	table.clear().draw();
}
function edit(id){
	$("#diseaseId").val(id);
	$("#editForm").submit();
}


function searchData(pSize,pageNumber)
{
	var fName=$("#fName").val();
	var sName=$("#sName").val();
	var status=$("#statusId").val();
	var name_regex = /^[a-zA-Z ]{0,50}$/;
	
	if(fName.charAt(0)== ' ' || fName.charAt(fName.length - 1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in Disease", "error").then(function() {
			   $("#fName").focus();
		   });
         return false;
	   }
	   if(fName!=null)
    	{
	   		var count= 0;
	   		var i;
	   		for(i=0;i<fName.length && i+1 < fName.length;i++)
	   		{
	   			if ((fName.charAt(i) == ' ') && (fName.charAt(i + 1) == ' ')) 
	   			{
					count++;
				}
	   		}
	   		if (count > 0) {
	   			swal("Error", "Disease should not contain consecutive blank spaces", "error").then(function() {
					   $("#fName").focus();
				   });
				return false;
			}
    	}
	   if(!fName.match(name_regex))
		{
			swal("Error", "Disease accept only alphabets", "error").then(function() {
				   $("#fName").focus();
			   });
			return false;
		}
	   if(!sName.match(name_regex))
     	{
     		swal("Error", "Short Name accept only alphabets", "error").then(function() {
				   $("#sName").focus();
			   });
 			return false;
     	}
	 if(sName.charAt(0)== ' ' || sName.charAt(sName.length - 1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in Short Name", "error").then(function() {
			   $("#sName").focus();
		   });
          return false;
	   }
	 if(sName!=null)
     	{
	   		var count= 0;
	   		var i;
	   		for(i=0;i<sName.length && i+1 < sName.length;i++)
	   		{
	   			if ((sName.charAt(i) == ' ') && (sName.charAt(i + 1) == ' ')) 
	   			{
					count++;
				}
	   		}
	   		if (count > 0) {
	   			swal("Error", "Short Name should not contain consecutive blank spaces", "error").then(function() {
					   $("#sName").focus();
				   });
				return false;
			}
     	}
	
	var pageSize=10;
	$.ajax({
			type:"GET",
			url:"searchAllDiseaseMasterPage",
			data:{
					"pageSize":pageSize,
					"pageNumber":pageNumber,
					"fName":fName,
					"sName":sName,
					"status":status
			},
			success:function(response){
				//alert(response);
				var html="";
				var prev="";
				var val=JSON.parse(response);
				var array0=val;
				if(array0.totalRowNo==0)
				{
					
					$("#pageId").hide();
					$("#showPageNId").hide();
					//cearTable();
					$("#dynamicTable").hide();
					swal("No Record Found");
					return false;
				}
				$("#dynamicTable").show();
				//var tblInfo="Showing "+(array0.currentPage+1)+"\t"+"<p id='p4'></p>of"+"\t"+array0.totalRowNo+" of entries";
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
					 listDataLen=listDataLen+val.diseaseList.length-backUp;
  					 var dataLen=val.diseaseList.length;
					 var indexLen=listDataLen-dataLen;
					
					$.each(val.diseaseList,function(index,value)
					{
									count=indexLen+index+1 + (10*array0.pageNo);
									 $("#p4").text(count);
									html=html+"<tr><td>"+count+"</td>";
									html=html+"<td>"+value.name+"</td>";
									html=html+"<td>"+value.aliseName+"</td>";
									html=html+"<td>"+value.other+"</td>";
									html=html+"<td>"+value.descr+"</td>";
									html=html+"<td>"+value.status+"</td>";
									html=html+"<td>"+value.severityReq+"</td>";
									html=html+"<td>"+value.minseverity+"</td>";
									html=html+"<td>"+value.maxseverity+"</td>";
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
<c:if test="${msg ne Empty}">
	<script>
	 $(document).ready(function(){  
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	 });
</script>
</c:if>