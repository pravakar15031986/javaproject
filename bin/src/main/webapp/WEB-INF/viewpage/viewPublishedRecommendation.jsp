<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Published Recommendation</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Recommendation</li>
                           <li class="breadcrumb-item" aria-current="page">Published Recommendation</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                                <a class="nav-item nav-link active"  href="viewPublishedRecommendation">View</a>
                           </ul>
                           <div class="indicatorslist">
                              <a  id="printicon" href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Print"><i class="icon-printer1"></i></a>
                              <a  id="deleteIcon" href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"><i class="icon-trash-21"></i></a>
                              <a  title="" href="javascript:void(0)"  id="excelIcon" data-toggle="tooltip" data-placement="top" data-original-title="Excel"><i class="icon-excel-file"></i></a>
                              </div> 
                        </div>
                        <!-- Search Panel -->
                         <div class="search-container">
                           <div class="search-sec">
                           <div class="form-group">
                              <div class="row">
                              <label class="col-lg-2 ">Recommendation No.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                                    </div>
                                </div> 
                              <div class="form-group">
                                    <div class="row">
                                    <label class="col-lg-2 ">Recommendation Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <label class="col-lg-2 ">Recommendation Date To</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                    
                                    
                                   </div>
                                  </div>
                            <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Region Name</label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                   <option value="0">--Select--</option>
                                    <option value="1">Amhara</option>
                                    <option value="1">Oromia</option>
                                    <option value="1">Somali</option>
                                    </select>
                                    </div>
                                    <label class="col-lg-2 ">Zone Name</label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                   <option value="0">--Select--</option>
                                    <option value="1">North Shewa</option>
                                    <option value="1">East Gojjam</option>
                                    <option value="1">Oromiya</option>
                                    </select>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                              <div class="row">
                               <label class="col-lg-2 ">Woreda Name</label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                   <option value="0">--Select--</option>
									<option value="1">Menze Keya Gebreal</option>
									<option value="1">Shebel Berenta</option>
									<option value="1">Dawa Chefa</option>
                                    </select>
                                    </div>
                               <label class="col-lg-2 ">Kebele Name</label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                          <option value="0">--Select--</option>
                                          <option value="1">Siter(022)	</option>
                                          <option value="2">Arbkuyina Dedehana	</option>
                                          <option value="3">Kemise Akababi	</option>
                                       </select>
                                    </div>
                                    
                                    
                                     <div class="col-lg-2">
                                       <button class="btn btn-primary"> <i class="fa fa-search"></i> Search</button>
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
                              <table data-toggle="table" class="table table-hover table-bordered">
                                 <thead>
                                    <tr>
                                       <th width="40px">Sl#</th>
                                       <th>Recommendation No.</th>
                                       <th>Recommendation Date</th>
                                       <th>Region</th>
                                       <th>Zone</th>
                                       <th>Woreda</th>
                                       <th>Kebele</th>
                                       <th>Recommendation Document</th>
                                       <th>Remark</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                       <td>1</td>
                                       <td>RC115</td>
                                       <td>05-Oct-2019</td>
                                       <td>Amhara</td>
                                       <td>Oromiya</td>
                                       <td>Dawa Chefa</td>
                                       <td>Kemise Akababi</td>
                                       <td>
                                       	<a title="" href="recommendation/recommendation.jpeg" download="recommendation.jpeg" id="downloadIcon" data-toggle="tooltip" data-placement="top" data-original-title="Download">recommendDoc05102019.jpeg</a>
                                       </td>
                                       <td>OK</td>
                                    </tr>
                                    <tr>
                                       <td>2</td>
                                       <td>RC114</td>
                                       <td>04-Oct-2019</td>
                                       <td>Amhara</td>
                                       <td>East Gojjam</td>
                                       <td>Dawa Chefa</td>
                                       <td>Kemise Akababi</td>
                                       <td>
                                       	<a title="" href="recommendation/recommendation.jpeg" download="recommendation.jpeg" id="downloadIcon" data-toggle="tooltip" data-placement="top" data-original-title="Download">recommendDoc04102019.jpeg</a>
                                       </td>
                                       <td>Ok</td>
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
							$(function ()
									{
							        $(".publish").click(function () 
							        		{
									        	 swal({
								            		title: ' Do you want to publish?',
								            		  type: 'warning',
								            		  showCancelButton: true,
								            		  confirmButtonText: 'Yes',
								            		  cancelButtonText: 'No',
								            		  /* reverseButtons: true */
								        	    }).then((result) => {
								        	    	  if (result.value) { 
								        	    		  swal("Success", "Published Successfully ", "success");
								        	    		  }
								        	    		})  
								        	    		return false;
							        		});
							        $(".deleteClass").click(function () 
							        		{
									        	 swal({
								            		title: ' Do you want to delete?',
								            		  type: 'warning',
								            		  showCancelButton: true,
								            		  confirmButtonText: 'Yes',
								            		  cancelButtonText: 'No',
								            		  confirmButtonColor: '#d33',
								            		  /* reverseButtons: true */
								        	    }).then((result) => {
								        	    	  if (result.value) { 
								        	    		  swal("Success", "Deleted Successfully ", "success");
								        	    		  }
								        	    		})  
								        	    		return false;
							        		});
						    		});
							</script>