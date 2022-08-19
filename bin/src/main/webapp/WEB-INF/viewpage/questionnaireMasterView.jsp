<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details"> 
                     <h4>View Questionnaire</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                             <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Questionnaire Master</li>
                        </ol>
                     </nav>
                  </div>
                 
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="questionnaireMaster">Add</a>
                              <a class="nav-item nav-link active"  href="questionnaireMasterView" >View</a>
                           </ul>
                           <div class="indicatorslist">
                             
                               
                            
                              
                              
                             </div>
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                              <div class="form-group">
                                 <div class="row">
                                    <label class="col-sm-2 ">Applicable for </label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="typeOfQustion">
                                          <option value="0">--Select--</option>
                                          <option value="1">IVR</option>
                                          <option value="2">Mobile</option>
                                          <option value="3">IVR API</option>
                                       </select>
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
                                       <button class="btn btn-primary" onclick="search(10,1)"> <i class="fa fa-search"></i> Search</button>
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
                                       <th>Question</th>
                                       <th>Applicable for</th>
                                       <th>Order No.</th>
                                       <th>No. of Options</th>
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
						<form action="qustion-edit" method="post" id="editForm">
						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
						<input type="hidden" name="qustionId" id="qustionId">
					</form>
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         
          <h4 class="modal-title">Option Details</h4>
        </div>
        <table id="checkId">
        		
        	</table>
        <div class="modal-body">
        		
         		<div class="form-group row" id="qusOptionId">
                              
                           </div>
                          <!--  <div class="form-group row" id="optionId_2">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Option-2</label>
                              <div class="col-lg-4"><span class="colon">:</span>
                              	<div id="infoValueId_2"></div>
                              </div>
                              
                              <div class="col-lg-4">
                              	<div id="infoId_2"></div>
                              </div>
                           </div>
                           <div class="form-group row" id="optionId_3">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Option-3</label>
                              <div class="col-lg-4"><span class="colon">:</span>
                                 <div id="infoValueId_3"></div>
                              </div>
                              
                              <div class="col-lg-4">
                              	<div id="infoId_3"></div>
                                 
                              </div>
                           </div>
                           <div class="form-group row" id="optionId_4">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Option-4</label>
                              <div class="col-lg-4"><span class="colon">:</span>
                              <div id="infoValueId_4"></div>
                               
                              </div>
                              <div class="col-lg-4">
                              	<div id="infoId_4"></div>
                                
                              </div>
                           </div> -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
			url:"viewAllQustionPage",
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
					//alert("No Record Found");
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
					 listDataLen=listDataLen+val.qustionList.length-backUp;
  					 var dataLen=val.qustionList.length;
					 var indexLen=listDataLen-dataLen;
					
					$.each(val.qustionList,function(index,value)
					{
									count=indexLen+index+1 + (10*array0.pageNo);
									 $("#p4").text(count);
									html=html+"<tr><td>"+count+"</td>";
									html=html+"<td>"+value.name+"</td>";
									html=html+"<td>"+value.qustionType+"</td>";
									html=html+"<td>"+value.orderNumber+"</td>";
									html=html+"<td><a href data-toggle='modal' data-target='#myModal' onclick='optionValue("+value.optionNumber+","+value.id+")'>"+value.optionNumber+"</a></td>";
									html=html+"<td>"+value.status+"</td>";
									if(value.questionType == 1 || value.questionType == 2){
									html=html+"<td><a class='btn btn-info btn-sm' data-toggle='tooltip' data-original-title='Edit' onclick='edit("+value.id+")'><i class='icon-edit1'></i></a></td></tr>";
									}else{
									html=html+"<td></td></tr>";	
									}
									
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
	$("#qustionId").val(id);
	$("#editForm").submit();
}

function optionValue(optionCount,qustionId)
{
	if(optionCount!='0')
	{
		if(qustionId!='')
		{
		
		
		$.ajax({
			type:"GET",
			url:"viewQustionOptionByQustionId",
			data:{
					"qustionId":qustionId
				},
			success:function(response){
				
				var val=JSON.parse(response);
				$( "#qusOptionId" ).html('');
				//$( '.modal-body' ).html('');
				var qusoptions='';
				var v=val.valueL;
				var valArr = v.toString().split(",");
				var info=val.infoL;
				var infoArr = info.toString().split(",");
				for(var i=0;i<val.optionNumber;i++)
				{
					var y = i;
					var z=y+1;
					var info=valArr[i];
					var infoId=infoArr[i];
					//document.getElementById("infoValueId_"+z).innerHTML=valArr[i];
					//document.getElementById("infoId_"+z).innerHTML=infoArr[i];
					
					qusoptions += '<label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Option-'+z+'</label>'
					qusoptions += '<div class="col-lg-4"><span class="colon">:</span>'
					qusoptions += '<div >'+info+'</div>'
					qusoptions += '</div>'
					qusoptions += '<div class="col-lg-4">'
					qusoptions += '<div >'+infoId+'</div>'
					qusoptions += '</div>'
                 
					
					
				}
				
				$( "#qusOptionId").append(qusoptions);
			}
				
		   });
		
		}
	}
	
}	
	
	
function search(pSize,pageNumber)
{
	var typeOfQustion=$("#typeOfQustion").val();
	var status=$("#status").val();
	var pageSize=10;
	$.ajax({
			type:"GET",
			url:"searchAllQustionPage",
			data:{
					"pageSize":pageSize,
					"pageNumber":pageNumber,
					"typeOfQustion":typeOfQustion,
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
					$("#dynamicTable").hide();
					$("#showPageNId").hide();
					$("#pageId").hide();
					swal("No Record Found");
					return false;
				}
				$("#dynamicTable").show();
				$("#showPageNId").show();
				$("#pageId").show();
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
					 listDataLen=listDataLen+val.qustionList.length-backUp;
  					 var dataLen=val.qustionList.length;
					 var indexLen=listDataLen-dataLen;
					
					$.each(val.qustionList,function(index,value)
					{
									count=indexLen+index+1 + (10*array0.pageNo);
									 $("#p4").text(count);
									html=html+"<tr><td>"+count+"</td>";
									html=html+"<td>"+value.name+"</td>";
									html=html+"<td>"+value.qustionType+"</td>";
									html=html+"<td>"+value.orderNumber+"</td>";
									/* html=html+"<td>"+value.optionNumber+"</td>"; */
									html=html+"<td><a href data-toggle='modal' data-target='#myModal' onclick='optionValue("+value.optionNumber+","+value.id+")'>"+value.optionNumber+"</a></td>";
									html=html+"<td>"+value.status+"</td>";
									if(value.questionType == 1 || value.questionType == 2){
									html=html+"<td><a class='btn btn-info btn-sm' data-toggle='tooltip' data-original-title='Edit' onclick='edit("+value.id+")'><i class='icon-edit1'></i></a></td></tr>";	
									}else{
									html=html+"<td></td></tr>";	
									}
									
									
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