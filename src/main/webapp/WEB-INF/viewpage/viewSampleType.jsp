<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="wrsis/css/jquery.dataTables.css" rel="stylesheet">

 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Sample Type</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Sample Type</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="addSampleType">Add</a>
                              <a class="nav-item nav-link active"  href="viewsampletype" >View</a>
                           </ul>
                          <div class="indicatorslist">
                            </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                                   <div class="form-group">
                                 <div class="row">
                                    
                                    <label class="col-lg-2 ">Rust Type</label>
                                    <div class="col-lg-3">
                                    	 <select class="form-control" id="rustTypeId">
                                    	 	<option value="0">--Select--</option>
                                    	 	  <c:forEach items="${rust}" var="rust">
                                    	 	  	<option value="${rust.rustId}">${rust.typeOfRust}</option>
                                       		  </c:forEach>
                                    	 </select>
                                    </div>
                                   <label class="col-sm-2 ">Status</label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="statusID">
                                          <option value="select">--Select--</option>
                                          <option value="false">Active</option>
                                          <option value="true">Inactive</option>
                                       </select>
                                    </div>
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary" onclick="searchSample(10,1)"> <i class="fa fa-search"></i> Search</button>
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
                                       <th width="40px">Sl#</th>
                                       <th>Rust Type</th>
                                       <th>Sample Type</th>
                                       <th>Description</th>
                                       <th>Status</th>
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
                        <form action="editSampleType" method="post" id="editForm">
						
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

						<input type="hidden" name="sampleId" id="sampleId">
					</form>
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
			url:"viewAllSampleTypePage",
			data:{
					"pageSize":pageSize,
					"pageNumber":pageNumber,
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
					show("No Record Found");
					return false;
				}
				
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
					 listDataLen=listDataLen+val.sampleList.length-backUp;
  					 var dataLen=val.sampleList.length;
					 var indexLen=listDataLen-dataLen;
					
					$.each(val.sampleList,function(index,value)
					{
									count=indexLen+index+1 + (10*array0.pageNo);
									$("#p4").text(count);
									html=html+"<tr><td>"+count+"</td>";
									html=html+"<td>"+value.rustType+"</td>";
									html=html+"<td>"+value.name+"</td>";
									html=html+"<td>"+value.desc+"</td>";
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
	var table=$("#viewTable").DataTable();
	table.clear().draw();
}
function edit(id){
	$("#sampleId").val(id);
	$("#editForm").submit();
}
function searchSample(pSize,pageNumber)
{
	
	var rustType=$("#rustTypeId").val();
	
	var status=$("#statusID").val();
	
	/*  if(name=="" && status=="select") 
	{
		return false;
	} */	 
	var pageSize=10;
	$.ajax({
			type:"GET",
			url:"searchAllSampleTypePage",
			data:{
					"pageSize":pageSize,
					"pageNumber":pageNumber,
					"rustType":rustType,
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
					
					//cearTable();
					$("#viewTable").hide();
					 $("#showPageNId").hide();
					 $("#pageId").hide();
					swal("No Record Found");
					return false;
				}
				$("#viewTable").show();
				var tblInfo="Showing <span id='p4'></span> of"+"\t"+array0.totalRowNo+" of entries";
				$("#showPageNId").empty().append(tblInfo);
				var prevP=array0.startPage-1;
				if(array0.pageNo==0)
				{
					 prev=prev+"<li class='page-item  previous disabled' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_previous'><a class='page-link' onclick='searchSample("+pageSize+","+array0.pageNo+")' >Previous</a></li>"	;	
				}else{
					prev=prev+"<li class='page-item previous' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_previous'><a class='page-link' onclick='searchSample("+pageSize+","+array0.pageNo+")'  style='cursor: pointer;'>Previous</a></li>"	;
				}
				if(array0.pageNo==(array0.endPage-1))
				{
					 next="<li class='page-item next disabled' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_next'><a class='page-link' onclick='searchSample("+pageSize+","+array0.pageNo+")' >Next</a></li>"	;	
				}else{
					next="<li class='page-item next' aria-controls='dynamicTable' tabindex='0' id='dynamicTable_next'><a  class='page-link' onclick='searchSample("+pageSize+","+(array0.pageNo+2)+")'  style='cursor: pointer;'>Next</a></li>"	;
				}
				for(var i=array0.startPage;i<=array0.endPage;i++)
				{
					 prev=prev+"<li class='page-item' aria-controls='dynamicTable' tabindex='0' id='btn"+i+"'><a class='page-link' onclick='searchSample("+pageSize+","+i+")'  style='cursor: pointer;'>"+i+"</a></li>";	
				}
				 prev=prev+next;
				 $(".pagination").empty().append(prev);
				 $("#btn"+pageNumber).attr("class","page-item active");
				 
				 
				
				 var count=0;
				 if(val!=" " || val!=null )
				{
					 listDataLen=listDataLen+val.sampleList.length-backUp;
  					 var dataLen=val.sampleList.length;
					 var indexLen=listDataLen-dataLen;
					
					$.each(val.sampleList,function(index,value)
					{
									count=indexLen+index+1 + (10*array0.pageNo);
									$("#p4").text(count);
									html=html+"<tr><td>"+count+"</td>";
									html=html+"<td>"+value.rustType+"</td>";
									html=html+"<td>"+value.name+"</td>";
									html=html+"<td>"+value.desc+"</td>";
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
<c:if test="${msg ne Empty}">
	<script>
	 $(document).ready(function(){   
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	 });
</script>
</c:if>