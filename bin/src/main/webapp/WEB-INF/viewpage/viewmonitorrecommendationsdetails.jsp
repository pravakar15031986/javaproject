<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>View Monitor Recommendations Details</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Monitor Implementation</li>
                           <li class="breadcrumb-item active" aria-current="page">View</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                               <a class="nav-item nav-link "  href="woredamonitorrecommendations">Add</a>
                                <a class="nav-item nav-link active"  href="viewmonitorrecommendationsdetails">View</a>
                           </ul>
                           <div class="indicatorslist">
                              <a  id="printicon" href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Print"><i class="icon-printer1"></i></a>
                              <a  id="deleteIcon" href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"><i class="icon-trash-21"></i></a>
                              <a  title="" href="javascript:void(0)"  id="excelIcon" data-toggle="tooltip" data-placement="top" data-original-title="Excel"><i class="icon-excel-file"></i></a>
                               <a  title="" href="javascript:void(0)" id="downloadIcon" data-toggle="tooltip" data-placement="top" data-original-title="Download"><i class="icon-download1"></i></a>
                           </div> 
                        </div>
                        <!-- Search Panel -->
                         <div class="search-container">
                           <div class="search-sec">
                                   <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Zone</label>
                                    <div class="col-lg-3">
                                    <select class="form-control">
                                   <option value="0">--Select--</option>
                                    <option value="1">East Gojjam</option>
                                    <option value="1">North Shewa</option>
                                    <option value="1">Oromiya</option>
                                    </select>
                                    </div>
                                   <label class="col-lg-2 ">Monitor Ref No.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                              <div class="row">
                                <label class="col-lg-2 ">Monitor Created Date</label>
                                 <div class="col-lg-3">
                                  <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                 </div>
                                <label class="col-lg-2 ">	No of Woredas Affected</label>
                                 <div class="col-lg-3">
                                  <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
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
                                       <th rowspan="2">Sl#</th>
                                       <th rowspan="2">Monitor Ref No.</th>
                                       <th rowspan="2">Monitor Created Date</th>
                                       <th rowspan="2">Zone</th>
                                       <th rowspan="2">No of Woredas<br> Affected</th>
                                       <th rowspan="2">No of PAs<br> Affected</th>
                                       <th rowspan="2">Total Area<br> Infected(ha)</th>
                                       <th rowspan="2">Total Area<br> Controlled(ha)</th>
                                       <th rowspan="2">%</th>
                                       <th rowspan="2">Total Fungicides<br> Used (kg(lit))</th>
                                       <th colspan="3">Numbers of <br>Farmers Participated<br> on Spraying</th>
                                       <th rowspan="2">View</th>
                                    </tr>
	                                 <tr>
								      <th>Male</th>
								      <th>Female</th>
								      <th>Total</th>
								    </tr>
                                 </thead>
                                 <tbody>
                                   <tr>
                                       <td>1</td>
                                       <td>MRN-01-1001</td>
                                       <td>01-Sep-2019</td>
                                       <td>North Shewa</td>
                                       <td>1</td>
                                       <td>4</td>
                                       <td>57.5</td>
                                       <td>29</td>
                                       <td>50.43</td>
                                       <td>14</td>
                                       <td>75</td>
                                       <td>3</td>
                                       <td>78</td>
                                       <td><a class="btn btn-info btn-sm" href="viewrecommendationsdetails" title="" data-original-title="View Details"><i class="icon-edit1"></i></a>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                              <div id="quantityDiv">
                              	<div class="form-group row">
                              <label class="col-1  control-label" for="demo-readonly-input" style="color:blue;">Quantity</label>
                              <div class="col-1 ">
                                 <span class="colon">:</span>
                                 
                                 <div class="input-group">
                                  <input type="text" class="form-control" aria-label="Default" readonly="readonly" id="quantity_ID" aria-describedby="inputGroup-sizing-default">
                                    
                                 </div>
                              </div>
                           </div>
                              </div>
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
    $(document).ready(function(){
    	$("#quantityDiv").hide();	
    });
    		
    				
    			function quantityChange(test){
    			
    			if(test=='1')
    			{
    				$("#quantity_ID").val("2 Kg. 500 Gm.");	
    				$("#quantityDiv").show();
    			}
    			if(test=='2')
    			{
    				$("#quantity_ID").val("5 L. 200 Ml.");	
    				$("#quantityDiv").show();
    			}
    			if(test=='3')
    			{
    				$("#quantity_ID").val("10 L. 50 Ml.");
    				$("#quantityDiv").show();
    			}
    			if(test=='4')
    			{
    				$("#quantity_ID").val("8.7 L. 200 Ml.");
    				$("#quantityDiv").show();
    			}
    			//alert("test=="+test);
    		}
    	//});
    	
    </script>