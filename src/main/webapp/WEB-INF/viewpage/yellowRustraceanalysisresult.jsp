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
                              <a class="nav-item nav-link"  href="yellow-rust-race-analysis">Pending Samples</a>
                              <a class="nav-item nav-link"  href="yellowRustinoculatedsample">Inoculated Sample</a>
                              <a class="nav-item nav-link active"  href="yellowRustraceanalysisresult">Race Analysis Result</a>
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
                              	<label class="col-lg-2 ">Survey Date From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                 <label class="col-lg-2 ">To Survey Date</label>
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
                           
                              <table data-toggle="table" class="table table-bordered">
                                 <thead>
                                    <tr>
                                  
                                       <th rowspan="2" width="40px">Sl#</th>
                                       <th rowspan="2">Survey No.</th>
                                       <th rowspan="2">Sample ID</th>
                                       <th rowspan="2">Rust Type</th>
                                       <th rowspan="2">Survey Date</th>
                                       <th colspan="4" class="text-center">Location</th>
                                       <th rowspan="2">Inoculation Date</th>
                                       <th rowspan="2">Repeatation on<br> Differencials</th>
                                       <th rowspan="2">Race</th>
                                       <th rowspan="2" width="100px" class="text-center">Publish</th>
                                       <th rowspan="2" width="100px">Published On </th>
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
                                       <td rowspan="2">1</td>
                                       <td rowspan="2"><a href="viewsurvey"><b>S1001</b></a></td>
                                       <td rowspan="2"><b>HS-13123</b></td>
                                       <td rowspan="2">Yellow Rust</td>
                                       <td rowspan="2">01-Sep-2019</td>
                                       <td rowspan="2">Amhara</td>
                                       <td rowspan="2">Oromiya</td>
                                       <td rowspan="2">Dawa Chefa</td>
                                       <td rowspan="2">Kemise Akababi</td>
                                       <td rowspan="2">01-Oct-2019</td>
                                       <td align="center"><a data-toggle="tooltip" href="viewYellowRustRaceAnalysisFirstRepetition" data-original-title="View Completed Repetition ">I</a></td>
                                       <td align="center">KTTTK</td>
                                       <td rowspan="2" align="center"><a  class="btn btn-info btn-sm" data-toggle="tooltip"   title="" href="yellowRustRaceAnalysisFinalResult" data-original-title="View Details"><i class="icon-edit1"></i></a>
                                       </td>
                                       <td rowspan="3" align="center"> --</td>
                                    </tr>
                                     <tr>
                                       <td align="center"><a data-toggle="tooltip" href="viewYellowRustRaceAnalysisSecondRepetition" data-original-title="View Completed Repetition ">II </a></td>
                                        <td align="center">KTTTT</td>
                                    </tr>
                                  
                                    <tr>
                                             <tr>
                                       <td rowspan="2">2</td>
                                       <td rowspan="2"><a href="viewsurvey"><b>S1001</b></a></td>
                                       <td rowspan="2"><b>HS-13123</b></td>
                                       <td rowspan="2">Yellow Rust</td>
                                       <td rowspan="2">01-Sep-2019</td>
                                       <td rowspan="2">Amhara</td>
                                       <td rowspan="2">East Gojjam</td>
                                       <td rowspan="2">Shebel Berenta</td>
                                       <td rowspan="2">Arbkuyina Dedehana</td>
                                       <td rowspan="2">01-Oct-2019</td>
                                       <td align="center"><a  data-toggle="tooltip" href="viewYellowRustRaceAnalysisFirstRepetition" data-original-title="View Completed Repetition ">I</a></td>
                                       <td align="center">KTTTK</td>
                                       <td rowspan="2" align="center">
                                         --
                                       </td>
                                       <td rowspan="2">01-Oct-2019 </td>
                                    </tr>
                                     <tr>
                                       <td align="center"><a data-toggle="tooltip" href="viewYellowRustRaceAnalysisSecondRepetition" data-original-title="View Completed Repetition ">II </a></td>
                                        <td align="center">KTTTT</td>
                                    </tr>
                                     <tr>
                                             <tr>
                                       <td>3</td>
                                       <td><a href="viewsurvey"><b>S1002</b></a></td>
                                       <td><b>HS-13124</b></td>
                                       <td>Yellow Rust</td>
                                       <td>02-Sep-2019</td>
                                       <td>Amhara</td>
                                       <td>East Gojjam</td>
                                       <td>Dawa Chefa</td>
                                       <td>Kemise Akababi</td>
                                       <td>02-Oct-2019</td>
                                       <td align="center"><a  data-toggle="tooltip" href="viewYellowRustRaceAnalysisFirstRepetition" data-original-title="View Completed Repetition ">I</a></td>
                                       <td align="center" align="center">KTTTK</td>
                                       <td align="center">--
                                       </td>
                                       <td>02-Oct-2019 </td>
                                    </tr>
                                     
                                  
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