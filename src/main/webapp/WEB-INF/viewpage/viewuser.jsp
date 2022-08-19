<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Manage User</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Manage User</li>
                        </ol>
                     </nav>
                  </div>
      
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link"  href="adduser">Add</a>
                              <a class="nav-item nav-link active"  href="viewuser" >View</a>
                           </ul>
                    
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-sec">
                                   <div class="form-group">
                                 <div class="row">
                                 <label class="col-lg-2 ">Name</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                                    <label class="col-lg-2 ">User Group</label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
												<option>--select--</option>
												<option>User Group 1</option>
												<option>User Group 2</option>
												<option>User Group 3</option>
												<option>User Group 4</option>
												<option>User Group 5</option>
											</select>
                                    </div>
                                 </div>
                                 </div>
                                 
                                 
                                 <div class="form-group">
                                    <div class="row">
                                    <label class="col-lg-2 ">Created On From</label>
                                    <div class="input-group col-lg-3">
                                       <input type="text" class="form-control datepicker" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                       <div class="input-group-append">
											<span class="input-group-text" id="inputGroup-sizing-default"><i class="icon-calendar1"></i></span>
										</div>
                                    </div>
                                   <label class="col-lg-2 ">Created On To</label>
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
                               <label class="col-lg-2 ">Name</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                               <label class="col-lg-2 ">Mobile no.</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                              </div>
                              </div>
                              <div class="form-group">
                                 <div class="row">
                                    <label class="col-lg-2 ">Email</label>
                                    <div class="col-lg-3">
                                       <input type="text" class="form-control" name="fullName" placeholder="" data-bv-field="fullName">
                                    </div>
                                    <label class="col-sm-2 ">Status</label>
                                    <div class="col-sm-3">
                                       <select class="form-control">
                                          <option value="0">--Select--</option>
                                          <option value="1">Active</option>
                                          <option value="2">Inactive</option>
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
                                       <th>Name</th>
                                       <th>Organization Name</th>
                                       <th>User Role</th>
                                       <th>Research Center Name</th>
                                       <th>Created On</th>
                                       <th>Designation</th>
                                       <th>Mobile</th>
                                       <th>Email</th>
                                       <th>Status</th>
                                       <th>Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                      
                                       <td>1</td>
                                       <td>Name 1</td>
                                       <td>EIAR</td>
                                       <td>CMMYT NODAL OFFICER</td>
                                       <td>Ambo Agriculture Research Center</td>
                                       <td>10-Nov-2019</td>
                                       <td>-NA-</td>
                                       <td>8625245655</td>
                                       <td>example123@demo.com</td>
                                       <td>Active</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip" href="edituser" title="" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                       </td>
                                    </tr>
                                    <tr>
                                      
                                       <td>2</td>
                                       <td>Name 2</td>
                                       <td>CIMMYT</td>
                                       <td>MOA NODAL OFFICER</td>
                                       <td>-NA-</td>
                                       <td>22-Oct-2019</td>
                                       <td>Designation 3</td>
                                       <td>8232335698</td>
                                       <td>example124@demo.com</td>
                                       <td>Active</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip" href="edituser" title="" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                       </td>
                                    </tr>
                                    <tr>
                                      
                                       <td>3</td>
                                       <td>Name 3</td>
                                       <td>EIAR</td>
                                       <td>ATA NODAL OFFICER</td>
                                       <td>Kulumsa Research Center</td>
                                       <td>01-Oct-2019</td>
                                       <td>Designation 2</td>
                                       <td>8665454632</td>
                                       <td>example125@demo.com</td>
                                       <td>Inactive</td>
                                       <td><a class="btn btn-info btn-sm" data-toggle="tooltip" href="edituser" title="" data-original-title="Edit"><i class="icon-edit1"></i></a>
                                       </td>
                                    </tr>
                                    <tr>
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