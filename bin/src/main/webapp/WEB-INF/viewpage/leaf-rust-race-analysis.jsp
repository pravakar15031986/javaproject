<div class="mainpanel">
            <div class="section">
               <div class="page-title"> 
                  <div class="title-details">
                     <h4>Race Analysis</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Race Analysis</li>
                           <li class="breadcrumb-item active" aria-current="page">Race Analysis</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="leaf-rust-race-analysis">Pending Samples</a>
                              <a class="nav-item nav-link"  href="leafRustinoculatedsample">Inoculated Sample</a>
                              <a class="nav-item nav-link"  href="leafRustraceanalysisresult">Race Analysis Result</a>
                           </ul>
                            <div class="indicatorslist">
                              <a  id="printicon" href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Print"><i class="icon-printer1"></i></a>
                              
                              <a  title="" href="javascript:void(0)"  id="excelIcon" data-toggle="tooltip" data-placement="top" data-original-title="Excel"><i class="icon-excel-file"></i></a>
                               
                              <a  title="" href="javascript:void(0)" id="downloadIcon" data-toggle="tooltip" data-placement="top" data-original-title="Download"><i class="icon-download1"></i></a>
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                           <div class="form-group">
                              <div class="row">
                              <label class="col-lg-2 ">Survey No.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                               <label class="col-lg-2 ">Sample ID</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                              </div>
                              </div>
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Allocation Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">Allocation Date To</label>
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
                                    <option value="2">Oromia</option>
                                    <option value="3">Somali</option>
                                    </select>
                                    </div>
                                    <label class="col-sm-2 ">Rust Type</label>
                                    <div class="col-sm-3">
                                       <select class="form-control">
                                          <option value="0">--Select--</option>
                                          <option value="1">Stem Rust</option>
                                          <option value="2">Yellow Rust</option>
                                          <option value="3">Leaf Rust</option>
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
                        <form action="" autocomplete="off" name="myForm">
                     <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           
                              <table data-toggle="table" class="table table-hover table-bordered">
                                 <thead>
                                    <tr>
                                    
                                       
                                       <th width="40px" rowspan="2">Sl#</th>
                                       <th rowspan="2">Survey No.</th>
                                       <th rowspan="2">Sample ID</th>
                                       <th rowspan="2"> Allocation Date </th>
                                       <th rowspan="2">Rust Type</th>
                                       <th rowspan="2">Sample Collected On</th>
                                       <th colspan="4" class="text-center">Location</th>
                                       <th rowspan="2" width="100px">Action</th>
                                    </tr>
                                    <tr>
                                    	<th>Region</th>
                                    	<th>Zone</th>
                                    	<th>Woreda</th>
                                    	<th>Kebele</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                      
                                       
                                       <td>1</td>
                                       <td><a href="viewsurvey"><b>S1001</b></a></td>
                                       <td><b>HS-13123</b></td>
                                       <td>01-Sep-2019</td>
                                       <td>Leaf Rust</td>
                                       <td>03-Sep-2019</td>
                                       <td>Amhara</td>
                                       <td>Oromiya</td>
                                       <td>Dawa Chefa</td>
                                       <td>Kemise Akababi</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip"  title="" href="leafRustRaceAnalysisDetails" data-original-title="View Details"><i class="icon-edit1"></i></a>
                                          
                                       </td>
                                    </tr>
                                    <tr>
                                      
                                       
                                       <td>2</td>
                                       <td><a href="viewsurvey"><b>S1001</b></a></td>
                                       <td><b>HS-13124</b></td>
                                       <td>17-Oct-2019</td>
                                       <td>Leaf Rust</td>
                                       <td>20-Oct-2019</td>
                                       <td>Amhara</td>
                                       <td>East Gojjam</td>
                                       <td>Shebel Berenta</td>
                                       <td>Arbkuyina Dedehana</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip"  title="" href="leafRustRaceAnalysisDetails" data-original-title="View Details"><i class="icon-edit1"></i></a>
                                       </td>
                                    </tr>
                                    <tr>
                                    	
                                       <td>3</td>
                                       <td><a href="viewsurvey"><b>S1002</b></a></td>
                                       <td><b>HS-13125</b></td>
                                       <td>14-Oct-2019</td>
                                       <td>Leaf Rust</td>
                                       <td>	16-Oct-2019</td>
                                       <td>Amhara</td>
                                       <td>East Gojjam</td>
                                       <td>Dawa Chefa</td>
                                       <td>Kemise Akababi</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip"  title="" href="leafRustRaceAnalysisDetails" data-original-title="View Details"><i class="icon-edit1"></i></a>
                                          
                                       </td>
                                    </tr>
                                    <tr>
                                   
                                                                          
                                 </tbody>
                              </table>
                              
                           
                           
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
                        </form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
 							$(document).ready(function(){
 							    $('#action').on('change', function() {
 							      if ( this.value == '2')
 							      //.....................^.......
 							      {
 							        $("#remark").show();
 							      }
 							      else
 							      {
 							        $("#remark").hide();
 							      }
 							    });
 							});
 							
							</script>
							
							
							 <script language="JavaScript">
							var card = document.getElementById("action")[0].value;
								function validateForm(f) {
								  if (action.value==0) {
								     alert("Please select Action");
								     return false;
								  }
								  else
								     return true;
								}
								function checkData(field) {
			                        	   if(action.value==2 && field.value==="")
			                        		   {
			                        		   alert("Please enter the remark.");
			                        		   }
			                        	 } 
								
								
							</script>