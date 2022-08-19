

 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Configure Approval Period</h4>
                   
                  </div>
    
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link "  href="addTimeLimit">Add</a>
                              <a class="nav-item nav-link active"  href="viewTimeLimit" >View</a>
                           </ul>
                   
                        </div>
                      
                       
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                           <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered">
                                 <thead>
                                    <tr>
                                    
                                       <th width="40px">Sl#</th>
                                       <th>Survey Publish<br> Time Limit</th>
                                       <th>Race Analysis <br>Publish Time Limit</th>
                                       <th>Recommendation <br>Publish Time Limit</th>
                                       <th>Monitor Implementation<br> Publish Time Limit</th>
                                       <th>Advisory <br>Publish Time Limit</th>
                                       <th width="100px">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                       <td>1</td>
                                       <td>30</td>
                                       <td>25</td>
                                       <td>30</td>
                                       <td>22</td>
                                       <td>15</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip" href="editTimeLimit" title="" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>2</td>
                                       <td>5</td>
                                       <td>15</td>
                                       <td>12</td>
                                       <td>11</td>
                                       <td>20</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip" href="editTimeLimit" title="" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                           <nav aria-label="Page navigation example">
                              <ul class="pagination justify-content-end">
                                 <li class="page-item "><a class="page-link" href="#">Previous</a></li>
                                 <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                 <li class="page-item"><a class="page-link" href="#">2</a></li>
                                 <li class="page-item"><a class="page-link" href="#">3</a></li>
                                 <li class="page-item"><a class="page-link" href="#">Next</a></li>
                              </ul>
                           </nav>
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
  
<script>
	$(function(){

		   $(".selectall").click(function(){
			$(".individual").prop("checked",$(this).prop("checked"));
			});
		
		
	});
</script>


<script>
$(document).ready(function(){
	   $('#btnSubmitId').click(function(){
		   if ($('#demo-text-input1').val() == ""){
	        	swal("Error", "Please enter the Type of Rust", "error");
	            /* alert('Please select the survey to date.'); */
	            return false;
	        }
		   if ($('#demo-text-input2').val() == ""){
	        	swal("Error", "Please enter the Short Name", "error");
	            /* alert('Please select the survey to date.'); */
	            return false;
	        }
           if($("input[name='form-radio-button']:checked").length==0){
           	swal("Error", "Please select Status", "error");
	            /* alert('Please select the survey to date.'); */
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
       	    		  window.location.href="viewTypeofRust.html";
       	    		  return true;
       	    		  }
       	    		})
       	    return false;
           }
	   });
	   });
function countChar(val) {
    var len = val.value.length;
    if (len > 200) {
    	
    } else {
      var remaining_len=$('#charNum').text(200 - len+" characters left");
    }
  };
</script>