<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Recommendation Advisory</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                         <li class="breadcrumb-item"><a href="uploadSurveyDataXcelView">Import Survey Details</a></li> 
                           <li class="breadcrumb-item active" aria-current="page">Upload Advisory Report Details</li>
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
                           <div class="indicatorslist">
                              <a  title="" onclick="history.back()" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a> 
                              <a  id="printicon" href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Print"><i class="icon-printer1"></i></a>
                              <a  title="" href="javascript:void(0)"  id="excelIcon" data-toggle="tooltip" data-placement="top" data-original-title="Excel"><i class="icon-excel-file"></i></a>
                               <a  title="" href="javascript:void(0)" id="downloadIcon" data-toggle="tooltip" data-placement="top" data-original-title="Download"><i class="icon-download1"></i></a>
                              
                        <!-- Search Panel -->
                         <div class="search-container">
                           <div class="search-sec">
                                   <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Region</label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                   <option value="0">--Select--</option>
                                    <option value="1">Amhara</option>
                                    <option value="1">Oromia</option>
                                    <option value="1">Somali</option>
                                    </select>
                                    </div>
                                    <label class="col-lg-2 ">Zone</label>
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
                                <label class="col-lg-2 ">Woreda </label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                          <option value="0">--Select--</option>
                                          <option value="1">Menze Keya Gebreal</option>
                                          <option value="2">Shebel Berenta	</option>
                                          <option value="3">Dawa Chefa	</option>
                                       </select>
                                    </div>
                              <label class="col-lg-2 ">Kebele</label>
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
                                  </div>
                     
                      
                           </div>
                        </div> 
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body">
                         <div class="table-responsive">
                              <table data-toggle="table" class="table table-hover table-bordered" >
                              
                                       		<tr>
	                                       		<th rowspan="3">Sl#</th>
	                                       		<th rowspan="3">date</th>
	                                       		<th rowspan="3">Season</th>
	                                       		<th rowspan="3">Zone</th>
	                                       		<th rowspan="3">Woreda</th>
	                                       		<th rowspan="3">Kebele</th>
	                                       		<th rowspan="3">Altitude</th>
	                                       		<th rowspan="3">Latitude</th>
	                                       		<th rowspan="3">Longitude</th>
	                                       		<th rowspan="3">Previous crop</th>
	                                       		<th rowspan="3">Type of wheat</th>
	                                       		<th rowspan="3">Variety</th>
	                                       		<th rowspan="3">G. Stage</th>
	                                       		<th rowspan="3">Area(ha)</th>
	                                       		<th rowspan="3">Fungicidesprayed(yes/No)</th>
	                                       		<th colspan="5" class="text-center">YR</th>
	                                       		<th colspan="3" class="text-center">SR</th>
	                                       		<th colspan="3" class="text-center">LR</th>
	                                       		<th colspan="2">Septoria</th>
	                                       		<th colspan="2">Fusarium Head scab</th>
	                                       		<th>Loose Smut</th>
	                                       		<th>Take-All</th>
	                                       		<th colspan="2">Eye spot</th>
	                                       		<th colspan="2">Tan spot</th>
	                                       		<th rowspan="3">Stem rust sample ID	</th>
	                                       		<th rowspan="3">Remark</th>
	                                       		</tr>
	                                       	<tr>
	                                       		<th colspan="2">Head</th>
	                                       		<th colspan="3">Leaf</th>
	                                       		<th rowspan="2">Inc%</th>
	                                       		<th rowspan="2">Sev</th>
	                                       		<th rowspan="2">Reaction</th>
	                                       		<th rowspan="2">Inc%</th>
	                                       		<th rowspan="2">Sev</th>
	                                       		<th rowspan="2">Reaction</th>
	                                       		<th rowspan="2">Inc%</th>
	                                       		<th rowspan="2">Sev(00-99)</th>
	                                       		<th rowspan="2">Inc%</th>
	                                       		<th rowspan="2">Sev(0-5)</th>
	                                       		<th rowspan="2">Inc%</th>
	                                       		<th rowspan="2">Inc%</th>
	                                       		<th rowspan="2">Inc%</th>
	                                       		<th rowspan="2">sev%</th>
	                                       		<th rowspan="2">Inc%</th>
	                                       		<th rowspan="2">sev%</th>
                                       		</tr>
                                       		<tr>
	                                       		<th>Inc%</th>
	                                       		<th>Sev</th>
	                                       		<th>Inc%</th>
	                                       		<th>Sev</th>
	                                       		<th>Reaction</th>
	                                       	</tr>
	                                       	<tr>
	                                       		<td>1</td>
	                                       		<td>01-Nov-2019</td>
	                                       		<td>Normal</td>
	                                       		<td>Amhara</td>
	                                       		<td>North Shewa</td>
	                                       		<td>Menze Keya Gebreal</td>
	                                       		<td></td>
	                                       		<td></td>
	                                       		<td></td>
	                                       		<td>RIO KJKJ</td>
	                                       		<td>RO vmdfd</td>
	                                       		<td>Topl Hil</td>
	                                       		<td>Dasp LOPs</td>
	                                       		<td>Hip Jolp</td>
	                                       		<td>Yes</td>
	                                       		<td>10</td>
	                                       		<td>20</td>
	                                       		<td>0.76</td>
	                                       		<td>8</td>
	                                       		<td>30</td>
	                                       		<td>30</td>
	                                       		<td>40</td>
	                                       		<td>50</td>
	                                       		<td>10</td>
	                                       		<td>30</td>
	                                       		<td>0.0</td>
	                                       		<td>10</td>
	                                       		<td>78</td>
	                                       		<td>54</td>
	                                       		<td>3</td>
	                                       		<td>36</td>
	                                       		<td>45</td>
	                                       		<td>48</td>
	                                       		<td>46</td>
	                                       		<td>50</td>
	                                       		<td>0.6</td>
	                                       		<td>1001</td>
	                                       		<td>OK</td>
	                                       	</tr>
	                                       	
	                                       	<tr>
	                                       		<td>2</td>
	                                       		<td>31-Oct-2019</td>
	                                       		<td>Cool</td>
	                                       		<td>Amhara</td>
	                                       		<td>North Shewa</td>
	                                       		<td>Menze Keya Gebreal</td>
	                                       		<td></td>
	                                       		<td></td>
	                                       		<td></td>
	                                       		<td>RIO KJKJ</td>
	                                       		<td>RO vmdfd</td>
	                                       		<td>Topl Hil</td>
	                                       		<td>Dasp LOPs</td>
	                                       		<td>Hip Jolp</td>
	                                       		<td>No</td>
	                                       		<td>8</td>
	                                       		<td>20</td>
	                                       		<td>0.76</td>
	                                       		<td>8</td>
	                                       		<td>30</td>
	                                       		<td>20</td>
	                                       		<td>60</td>
	                                       		<td>10</td>
	                                       		<td>10</td>
	                                       		<td>30</td>
	                                       		<td>0.0</td>
	                                       		<td>10</td>
	                                       		<td>78</td>
	                                       		<td>54</td>
	                                       		<td>3</td>
	                                       		<td>36</td>
	                                       		<td>45</td>
	                                       		<td>48</td>
	                                       		<td>46</td>
	                                       		<td>50</td>
	                                       		<td>0.6</td>
	                                       		<td>1002</td>
	                                       		<td>OK</td>
	                                       	</tr>
	                                       	
	                                       	<tr>
	                                       		<td>3</td>
	                                       		<td>30-Oct-2019</td>
	                                       		<td>Warm</td>
	                                       		<td>Amhara</td>
	                                       		<td>North Shewa</td>
	                                       		<td>Menze Keya Gebreal</td>
	                                       		<td></td>
	                                       		<td></td>
	                                       		<td></td>
	                                       		<td>RIO KJKJ</td>
	                                       		<td>RO vmdfd</td>
	                                       		<td>Topl Hil</td>
	                                       		<td>Dasp LOPs</td>
	                                       		<td>Hip Jolp</td>
	                                       		<td>Yes</td>
	                                       		<td>10</td>
	                                       		<td>20</td>
	                                       		<td>0.76</td>
	                                       		<td>8</td>
	                                       		<td>30</td>
	                                       		<td>20</td>
	                                       		<td>0</td>
	                                       		<td>0</td>
	                                       		<td>50</td>
	                                       		<td>70</td>
	                                       		<td>6.0</td>
	                                       		<td>9</td>
	                                       		<td>37</td>
	                                       		<td>45</td>
	                                       		<td>1</td>
	                                       		<td>24</td>
	                                       		<td>76</td>
	                                       		<td>98</td>
	                                       		<td>76</td>
	                                       		<td>40</td>
	                                       		<td>1.6</td>
	                                       		<td>1003</td>
	                                       		<td>OK</td>
	                                       	</tr>
                          
                              </table>
                           
                           
                           </div>
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>