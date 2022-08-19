<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="wrsis/css/jquery.dataTables.min.css" rel="stylesheet">
     <c:if test="${msg ne Empty}">
	<script>
	$(document).ready(function(){  
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	 });
</script>
</c:if>
      <c:if test="${errMsg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>  

<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Upload IVR Data</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Survey</li>
                           <li class="breadcrumb-item active" aria-current="page">Import IVR Data</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                            <a class="nav-item nav-link 	active"  href="uploadIvrData">Add</a>
                              <a class="nav-item nav-link"  href="viewIvrData">View</a>
                               
                           </ul>
                            <div class="indicatorslist">
                                <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- Search Panel -->
                        
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <form action="uploadExcelFileRedData" autocomplete="off" name="myForm" onsubmit="return false" method="post" enctype="multipart/form-data">
                       
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        <div class="card-body">
                           
                              
                          <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">
                             Upload IVR Data <span class="text-danger">*</span>
                              </label>
                               <div class="col-sm-3" >
                                  <input type="file" id="demo-text-input1" name="ivrExcel" class="form-control" placeholder="" accept=".xls,.xlsx,.csv" >  
                                  
                              </div>
                              <small>Max size: 2MB<br> Allowed types: .xlsx, .xls, .csv</small>
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">
                             Download Sample IVR Excel  
                              </label>
                                       
                                       	<a  title="" href="javascript:void(0)"  id="downloadIcon"  class="download" data-toggle="tooltip" data-placement="top" data-original-title="Download"  onclick="downloadExcel()"><i class="icon-download1"></i></a> 
                           
                           </div>
                           <div class="col-12 col-md-4 col-xl-4">              	
	                          <div class="rightlist" for="demo-text-input">
	                         	 <ul>
	                         	   <li>Before upload, try to download the latest IVR excel.</li>
	                         	    <li>All Fields in IVR Excel are mandatory.</li>
	                         	   <li>File type accepts only XLS,XLSX and CSV</li>
	                         	   <li>Max file Size accept 2MB</li>
	                         	   <li>Record limit 100</li>
	                            </ul>
	                          </div>
	                         </div>
							<hr>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                  <button class="btn btn-primary mb-1" id="btnSubmitId" type="submit">Upload</button> 
                                 <button class="btn btn-danger mb-1" type="reset" >Reset</button>
                              </div>
                              
                           </div>
                           </div>
                            </form>
                           
                            	<input type="hidden" id="viewInputId" value="0">
                           </div> 
                            <div class="table-responsive" id="viewTableId">
                              <table data-toggle="table" class="table table-hover table-bordered" id="myExcelTable">
                              
                                       		<tr>
	                                       		<th>Sl#</th>
	                                       		 <th>Phone</th>
	                                       		<th>Zone</th>
	                                       		<th>Woreda</th>
	                                       		<th>Language</th>
	                                       		
	                                       		<c:forEach items="${qustList}" var="qust" varStatus="st">
														<th>Question-${st.count}</th>
													</c:forEach>
	                                       		</tr>
	                                       	<tr>
								<c:forEach items="${excelList}" var="excel" varStatus="count" >
									<tr>
										<td>${count.count}</td>
										<td><input type="hidden" id="phone_${count.count}" value="${excel.phone}">${excel.phone}</td>
										<td><input type="hidden" id="zone_${count.count}" value="${excel.zone}">${excel.zone}</td>
										<td><input type="hidden" id="woreda_${count.count}" value="${excel.woreda}">${excel.woreda}</td>
										<td><input type="hidden" id="language_${count.count}" value="${excel.language}">${excel.language}</td>
										
										<input type="hidden" id="qstListId_${count.count}" value="${excel.qustions.size()}">
										
										<c:forEach items="${excel.qustions}" var="qust" varStatus="st">
											<td><input type="hidden" id="quone_${count.count}_${st.count}" value="${qust}">${qust}</td>
										</c:forEach>
										
										<input type="hidden" id="fileName_${count.count}" value="${excel.fileName}"><%-- ${excel.fileName} --%>  
										
									</tr>
								</c:forEach>
	                                       		
	                                       	
                          
                              </table>
                           <div class="col-12 col-md-6 col-xl-4">
                           		<form:form action="insert-ivr-data" method="post" modelAttribute="ivrData" id="insertFormId" onsubmit="return false;">
                           			
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                           			
                           			<form:hidden path="excelBeanListString" id="valueArrayListId"/>
                                  <button class="btn btn-primary mb-1"  onclick="validateExcel()">Submit</button> 
                                 <a class="btn btn-danger mb-1" type="reset"  onclick="history.back()">Cancel</a>
                                 </form:form>
                              </div>
                        </div>
                        <input type="hidden" id="excelListId" value="${excelList}">
                        <input type="hidden" id="excelListIdSize" value="${excelList.size()}">
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
               <form action="ivr-excel-file-download" method="post" id="excelForm">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

               </form>
            </div>
            
      
           </div>
 
 <script src="wrsis/js/bootstrap.min.js"></script> 
<script src="wrsis/js/jquery.dataTables.min.js"></script>
 <script type="text/javascript">
     $(document).ready(function(){
    	 $("#viewTableId").hide();
  	   $('#btnSubmitId').click(function(){
  		 event.preventDefault();
		 var form = event.target.form;
  		 var fileInput = $('#demo-text-input1').val();
         if(fileInput=='')
         {
         	swal("Required!", "Please Upload Survey Data File.", "error");
         	return false;
         }
          var filePath = fileInput;
           if (!(/\.(xlsx|xls|csv)$/i).test(filePath)) 
          {
        	    swal("Error", "Please upload file with .xlsx, .xls extension only", "error");
                fileInput.value = '';
                return false;
       	} 
    	 var file_size = $('#demo-text-input1')[0].files[0].size;
          if (file_size > 2097152) 
          { 
             swal("Error", "Please upload file less than 2MB!", "error");
             return false;
         }
          else
          {
        	
        	 swal({
      			
      			text: " Do you want to upload file?", 
      			type: "warning",
      			confirmButtonText: "Ok",
      			showCancelButton: true
      	    }).then((result) => {
      				if (result.value) {
      					
      					 form.submit();
      					$("#viewTableId").show();
      		        	$("#viewInputId").val("1");
      				} else if (result.dismiss === 'cancel') {
      				    swal(
      				      'Cancelled',
      				      'Data Are Not Validated :)',
      				      'error'
      				    )
      				}
      			}) 
         } 
    	 
     });
     });
     </script>
     <script>
      	$(document).ready(function(){
      		
      		var ex=$("#excelListId").val();
      		
      		  $("#viewDivId").hide();
      		 if(ex!='')
      		{
      			$("#viewDivId").show();
      			$("#viewTableId").show();
      			$("#exceInsertId").val(ex);
      			
      			
      			
      		 }
      		
      	})
      	function saveExcel(){
    
    var fileInput = $('#demo-text-input1').val();
    if(fileInput=='')
    {
    	swal(
				'Warning!',
				'Please choose file!',
				'warning'
				)
    	return false;
    }
     var filePath = fileInput;
    
    var allowedExtensions = /.*\.(xlsx|xls|csv)$/i;
    if(!allowedExtensions.exec(filePath)){
    	swal(
				'Warning!',
				'Please upload file having extensions .xlsx only.!',
				'warning'
				)
        fileInput.value = '';
        
        return false; 
    }else{
    	
        swal({
			
			text: " Upload The Data?", 
			type: "warning",
			confirmButtonText: "Ok",
			showCancelButton: true
	    })
	    	.then((result) => {
				if (result.value) {
					
					$("#viewTableId").show();
		        	$("#viewInputId").val("1");
				} else if (result.dismiss === 'cancel') {
				    swal(
				      'Cancelled',
				      'Your stay here :)',
				      'error'
				    )
				}
			})
        
    } 
    
    
   
   
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
function validateExcel()
{
	 var finalArray=[]; 
	
 var excelSize=$("#excelListIdSize").val();
	


				var i;
				
      			for(i=1;i<=excelSize;i++)
      			{
      				var phone = $("#phone_"+i).val();
   	    			var zone = $("#zone_"+i).val();
   	    			var woreda = $("#woreda_"+i).val();
   	    			var language = $("#language_"+i).val();

   	    			var qstListId=$("#qstListId_"+i).val();

   	    			var dataQArr=[];
   	    		
					for(j=1;j<=qstListId;j++)
					{
						//alert(j);
						var question=$("#quone_"+i+"_"+j).val();
						
						
						dataQArr.push({"Question":question});
					
					}
					
					
   	    			var qustion_1 = $("#quone_"+i).val();
   	    			var qustion_2 = $("#qutwo__"+i).val();
   	    			var qustion_3 = $("#quthree__"+i).val(); 
					
   	    			var fileName = $("#fileName_"+i).val();
   	    			finalArray.push(
   	    	    	{
   		   				"phone" : phone ,
   		   				"zone":zone,
   		   				"woreda":woreda,
   		   				"language":language,
   		   				"pageQuestion":JSON.stringify(dataQArr),
   		   				
   		   				
   		   		
   		   				"fileName":fileName
   		   			})
   		   			//alert("In Last");
   		   			
      			}
      			console.log(finalArray);
      			
      			 $("#valueArrayListId").val(JSON.stringify(finalArray));  
	
	event.preventDefault();
	 var form = event.target.form;
	  swal({
		text: 'Do you want to submit data?',
		  type: 'info',
		  showCancelButton: true,
		  confirmButtonText: 'Yes',
		  cancelButtonText: 'No',
	    }).then((result) => 
	    {
	    	if (result.value) {
	    		   form.submit();
	    		  }
	    })
  return false; 
}
function downloadExcel(){
	
	$("#excelForm").submit(); 
}
</script>