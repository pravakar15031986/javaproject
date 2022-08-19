<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                     <h4>View Season</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Season Master</li>
                        </ol>
                     </nav>
                  </div>
                 
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="seasonMaster">Add</a>
                              <a class="nav-item nav-link active"  href="seasonMasterView" >View</a>
                           </ul>
                           <div class="indicatorslist">
                          </div>
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                              <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Season Name </label>  
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" id="name" name="name" placeholder="" data-bv-field="fullName" maxlength="50">
                                    </div>
                                    
                                    <label class="col-sm-2 ">Month</label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="monthId">
                                       <option value="select">--Select--</option>
                                       <c:forEach items="${monthList}" var="month">
                                          
                                          <option value="${month.monthId}">${month.monthName}</option>
                                       </c:forEach>   
                                       </select>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <div class="row">
                                     <label class="col-sm-2 ">Status</label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="status">
                                       
                                        <option value="select">-Select-</option>
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
                              <table data-toggle="table" class="table table-hover table-bordered" id="myTable">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Season Name</th>
                                       <th>Month</th>
                                       <th>Description</th>
                                       <th>Status</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody id="responseBody">
                                <%--  <c:forEach items="${seasonList}" var="season" varStatus="count">
                                 	<tr>
                                 		<td>${count.count}</td>
                                 		<td>${season.seasonName }</td>
                                 		<td>
                                 		 <c:forEach items="${season.dispMonthName}" var="month" varStatus="c"> 
                                 			
                                 			${month},
                                 			
                                 			
                                 		</c:forEach>
                                 		</td>
                                 		<td>${season.desc}</td>
                                 		
                                 		 <c:if test="${season.status eq false}"> 
                                       	<td>Active</td>
                                        </c:if>
                                       <c:if test="${season.status eq true}"> 
                                       <td>In Active</td>
                                        </c:if>  
                                 		<td>
                                 		<a class="btn btn-info btn-sm" data-toggle="tooltip" title="" data-original-title="Edit" onclick="edit(${season.seasonIdBean})"><i class="icon-edit1"></i></a>
                                          <!-- <a class="btn btn-danger btn-sm" data-toggle="tooltip" title="" data-original-title="Delete"><i class="icon-trash-21"></i></a> -->
                                       </td>
                                 	</tr>
                                 </c:forEach> --%>
                                 
                                 
                                    
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
                         <form action="seasonMasterEdit" id="editForm" method="post">
                          <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                           <input type="hidden" id="id" name="seasonIdBean">
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
			url:"viewAllSeasonPage",
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
					 listDataLen=listDataLen+val.seasonList.length-backUp;
  					 var dataLen=val.seasonList.length;
					 var indexLen=listDataLen-dataLen;
					
					$.each(val.seasonList,function(index,value)
					{
									count=indexLen+index+1 + (10*array0.pageNo);
									 $("#p4").text(count);
									html=html+"<tr><td>"+count+"</td>";
									html=html+"<td>"+value.name+"</td>";
									html=html+"<td>"+value.month+"</td>";
									html=html+"<td>"+value.descr+"</td>";
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
	var table=$("#myTable").DataTable();
	table.clear().draw();
}

function edit(id){
	$("#id").val(id);
	$("#editForm").submit();
}
function searchData(pSize,pageNumber){
	var name=$("#name").val();
	var status=$("#status").val();
	var monthId=$("#monthId").val();
	var pageSize=10;
	
	var name_regex = /^[a-zA-Z ]{0,50}$/;
	 if(!name.match(name_regex))
 	{
 		swal("Error", "Season Name accept only alphabets", "error").then(function() {
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
	   			swal("Error", "Season Name should not contain consecutive blank spaces", "error").then(function() {
					   $("#name").focus();
				   });
				return false;
			}
 	}
	   	if(name.charAt(0)== ' ' || name.charAt(name.length - 1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Season Name", "error").then(function() {
				   $("#name").focus();
			   });
	            return false;
		   }
	$.ajax({
		type:"GET",
		url:"search-Season",
		data:{
				"pageSize":pageSize,
				"pageNumber":pageNumber,
				"name":name,
				"status":status,
				"monthId":monthId
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
				$("#myTable").hide();
				$("#pageId").hide();
				$("#showPageNId").hide();
				swal("No Record Found");
				return false;
			}
			$("#myTable").show();
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
				 listDataLen=listDataLen+val.seasonList.length-backUp;
					 var dataLen=val.seasonList.length;
				 var indexLen=listDataLen-dataLen;
				
				$.each(val.seasonList,function(index,value)
				{
								count=indexLen+index+1 + (10*array0.pageNo);
								 $("#p4").text(count);
								html=html+"<tr><td>"+count+"</td>";
								html=html+"<td>"+value.name+"</td>";
								html=html+"<td>"+value.month+"</td>";
								html=html+"<td>"+value.descr+"</td>";
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
     