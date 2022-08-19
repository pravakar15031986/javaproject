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
                     <h4>Survey Excel </h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                            
                              
                           </ul>
                           
                        </div>
                        <!-- Search Panel -->
                        
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <form action="uploadExcelFileRedData" autocomplete="off" name="myForm" onsubmit="return false" method="post" enctype="multipart/form-data">
                       
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                        <div class="card-body">
                            <div class="form-group row">
                            
                                     </div>
                              
                          <div class="form-group row">
                             
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input">
                            Download sample survey excel
                              </label>
                                       
                                       	<a  title="" href="javascript:void(0)"  id="downloadIcon"  class="download" data-toggle="tooltip" data-placement="top" data-original-title="Download"  onclick="downloadExcel()"><i class="icon-download1"></i></a> 
                           </div>
                          
							<hr>
                           
                           </div>
                            </form>
                           
                            	<input type="hidden" id="viewInputId" value="0">
                           </div> 
                           
                        <input type="hidden" id="excelListId" value="${excelList}">
                        <input type="hidden" id="excelListIdSize" value="${excelList.size()}">
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
               <form action="downloadSurveyExcelFormat" method="get" id="excelForm">
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
           if (!(/\.(xlsx|xls)$/i).test(filePath)) 
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
      		/*$("#viewTableId").hide(); 
      		  $("#checkViewId").click(function()
      		{
      			
     		  	
     		  	$(document).ready(function() {
     		  		//alert("d Tab");
     		  	    $('#myExcelTable').DataTable();
     		  	} );	
      		  }); */
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
    
    
   /*  var t1=$("#viewInputId").val();
    if(t1==1)
    {
    	$("#viewDivId").show();
    }else{
    	$("#viewDivId").hide();
    } */
   
   }
      </script>
      <script>
	   $(document).ready(function(){
	   	if('${ErrorMessage}' != '')
	   	{
			swal("Error", "${ErrorMessage}", "error");
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
	//alert("totalSize=="+excelSize);


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
						
						//alert("qustion value=="+qustion);
						/* testArr.push({
							"qustion_"+i+"_":qustion,
							})  */
						dataQArr.push({"Question":question});
					
					}
					
					/* for(g=1;g<testArr.length;g++)
					{
						alert("Array Data test=="+testArr[g].qustion_g);
					} */
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
   		   				//alert("testArr length in push array=="+testArr.length);
   		   				/*  "qustion_1":qustion_1,
   		   				"qustion_2":qustion_2,
   		   				"qustion_3":qustion_3, */
   		   				
   		   		
   		   				"fileName":fileName
   		   			})
   		   			//alert("In Last");
   		   			
      			}
      			console.log(finalArray);
      			/* alert("valArray=="+valArray.length);
      			for(var z=0;z<valArray.length;z++)
          			{
      				alert("Data=="+valArray[z].qustion);
						alert("Data=="+valArray[z].phone);
          			} */
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