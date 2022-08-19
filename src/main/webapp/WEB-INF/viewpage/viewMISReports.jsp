<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>MIS Reports</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">MIS Reports</li>
                           <li class="breadcrumb-item active" aria-current="page">MIS Reports</li>
                        </ol>
                     </nav>
                  </div>
           
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                         
                           <div class="indicatorslist">
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        
                        <div class="card-body">
                         <div class="width50">
                        
                        <h3>MIS Report List 1</h3>
                        <div class="report-list">
                         <ul>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is. Lorem Ipsum has been the industry's standard dummy.</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum.</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply  Lorem Ipsum has been the industry's standard dummy.</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy. the industry's standard dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the standard dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. standard dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the printing and dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem industry. Lorem Ipsum has been the industry's standard dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the printing standard dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text.</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the been the industry's standard dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simplyhas been the industry.</span> </li>
                         </ul>
                        
                        </div>
                        
                        
                         </div>
                        
                        <div class="width50 mrgnl40">
                        
                        <h3>MIS Report List 2</h3>
                        <div class="report-list">
                         <ul>
                           <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. standard dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the printing and dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem industry. Lorem Ipsum has been the industry's standard dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the printing standard dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text.</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the been the industry's standard dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simplyhas been the industry.</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is. Lorem Ipsum has been the industry's standard dummy.</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum.</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply  Lorem Ipsum has been the industry's standard dummy.</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy. the industry's standard dummy</span> </li>
                            <li><i class="fa fa-hand-o-right" aria-hidden="true"></i> <span>Lorem Ipsum is simply dummy text of the standard dummy</span> </li>
                            
                         </ul>
                        
                        </div>
                        
                        
                         </div>
                        
                           </div>
                        <!--===================================================-->
                        <!-- END BASIC FORM ELEMENTS -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
$(document).ready(function(){
	   $('#btnSubmitId').click(function(){
	        if ($('#txtDate1').val() == ""){
	        	swal("Error", "Please select the Survey From Date.", "error");
	            /* alert('Please select the survey from date.'); */
	            return false;
	        }
	        if ($('#txtDate2').val() == ""){
	        	swal("Error", "Please select the Survey To Date.", "error");
	            /* alert('Please select the survey to date.'); */
	            return false;
	        }
			var fromDate=$("#txtDate1").val();
    		var toDate=$("#txtDate2").val();
    		if(Date.parse(fromDate)>Date.parse(toDate))
    		{
    			/* alert("From Date Should be less than To Date");
    			return false; */
    			swal(
    					'Error',
    					'From Date Should be less than To Date!',
    					'warning'
    					)
    	   		 	   		return false; 
    		}
	        
	        var fileInput = $('#demo-text-input1').val();
            if(fileInput=='')
            {
            	swal("Advisory Document Required!", "Please Upload Advisory.", "error");
            	/* alert('Please upload file'); */
            	return false;
            }
             var filePath = fileInput;
            var allowedExtensions = /.*\.(pdf|doc|docx)$/i;
            
            if(!allowedExtensions.exec(filePath)){
            	swal("Error", "Please upload file with .pdf, .doc or .docx extension only", "error");
                /* alert('Please upload file with .plf only.'); */
                fileInput.value = '';
                return false; 
            }
            var file_size = $('#demo-text-input1')[0].files[0].size;
            if (file_size > 2097152) { 
                swal("Error", "Please upload file less than 2MB!", "error");
                return false;
            }
            else{
            	swal({
            		title: ' Do you want to Submit?',
            		  type: 'warning',
            		  showCancelButton: true,
            		  confirmButtonText: 'Yes',
            		  cancelButtonText: 'No',
            		  /* reverseButtons: true */
        	    }).then((result) => {
        	    	  if (result.value) {
        	    		  swal("Success", "Submitted Successfully ", "success"); 
        	    		  window.location.href="viewadvisory";
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