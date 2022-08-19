<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script language="javascript">
	pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";

</script>

<style>
.breadcrumb>li+li:before
{
display:none;
}

</style>


<div id="mainTable">
<div class="row">

        <div class="col-xs-12">
          <div class="nav-tabs-custom">
          
           <ul class="nav nav-tabs">
              <li><a href="addUser">Add</a></li>
              <li class="active"><a href="#" >View</a></li>
            </ul>
            <div class="clearfix"></div>
            <div class="tab-content">
            <form:form  method="get">
            
              <div class="tab-pane active" id="fa-icons">
    <section id="new">
     <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title" data-widget="collapse">Search Panel</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
            <div class="col-md-12">
              
               <section id="new">
				           <div class="">
		               <div class="form-horizontal">
		            <div class="form-group">
		                  <label class="col-sm-1 control-label"><Strong>Member Type</Strong></label>
		                  <div class="col-sm-2">
									<span class="colon">:</span>
								  <select class="form-control">
		                            <option>-Select-</option>
									<option>01-Associates</option>
									<option>02-Broker</option>
									<option>03-Buyer</option>
									<option>04-Packer</option>
									<option>05-Producer</option>
									<option>06-Transporter</option>
									<option>07-Warehouse</option>
		                      </select>
		              </div>
		                  <label class="col-sm-1 control-label"><strong>Country Name</strong></label>
		                   <div class="col-sm-2">
									<span class="colon">:</span>
								  <select class="form-control">
		                            <option>-Select-</option>
									<option value="1">01-Sudan</option>
											<option value="2">02-Mauritius</option>
											<option value="3">03-Uganda</option>
											<option value="4" >04-Kenya</option>
											<option value="5">05-Tanzania</option>
											<option value="6">06-Zambia</option>
											<option value="7">07-Zimbabwe</option>
		                      </select>
		                   </div>
		              
		                  <label class="col-sm-1 control-label"><strong>Company</strong></label>
		                   <div class="col-sm-2">
									<span class="colon">:</span>
								  <select class="form-control">
		                       <option>-Select-</option>
									<option>001-Chebango EPZ Tea Company Ltd</option> 
		                          	<option>002-Abbas Traders Ltd</option>
		                            <option>003-Atlas Tea Brokers Ltd </option>
									<option>004-Bryson Express Ltd </option>
									
		                      </select>
		                   </div>
		              
								<div class="col-sm-3">
								  <button type="submit" class="btn btn-info">Show</button>
								   <button type="reset" class="btn btn-info">Reset</button>
								</div>
							  </div>
		                  </div>
                  </div>
				 </section>
            </div>
          </div>
        </div>
      </div>
      
      
 <div class="table-responsive">
<table id="mytable" class="mytable">
                   
                   <thead>
                   <th>#</th>
                   <th>Membership no.</th>
                   <th>Business Code(EATTA)</th>
                   <th>Company</th>
                     <th>Entry Date</th>
                     <th>Member Type</th>
                     <th>Mobile No</th>
                     <th>Email Id</th>
                     <th colspan="2" style="text-align:center" >Action</th>
                     
                   </thead>
              <tbody>
   <tr><td>1</td>
   <td>040100011</td>
   <td>CTCL</td>
   <td>001-Chebango EPZ Tea Company Ltd</td>
   <td>07-2015</td>
   <td>05-Producer</td>
   <td>0715881338</td>
   <td>chebango@chebango.co.ke</td>
   <td style="text-align:center"><a href="editExistingUser" data-placement="top" data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
     <a class="btn btn-danger btn-xs del" data-placement="top" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a></td>
    </tr>
 
  <tr><td>2</td>
  <td>040200021</td>
    <td>ATL</td>
    <td>002-DL Koisagat Tea Estate Ltd     </td>
   <td>01-1986</td>
   <td>03-Buyer</td>
   <td>0715881338</td>
   <td>office@abbastraders.com</td>
   <td style="text-align:center"><a href="editExistingUser" data-placement="top" data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
     <a class="btn btn-danger btn-xs del" data-placement="top" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a></td>
   </tr>
 
  <tr><td>3</td>
  <td>040300031</td>
    <td>ATB</td>
     <td>003-Eastern Produce Kenya Ltd</td>
    <td>07-2015</td>
   <td>02-Broker</td>
   <td>0715881338</td>
   <td>atlasteabrokersltd@gmail.com</td>
   <td style="text-align:center"><a href="editExistingUser" data-placement="top" data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
     <a class="btn btn-danger btn-xs del" data-placement="top" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a></td>
   </tr>

    <tr><td>4</td>
    <td> 040400041</td>
    <td>ATB</td>
     <td>004-Elgon Tea and Coffee Limited </td>
     <td>09-2000</td>
   <td>07-Warehouse</td>
   <td>0715881338</td>
   <td>brysonexpress@gmail.com</td>
   <td style="text-align:center"><a href="editExistingUser" data-placement="top" data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
    <a class="btn btn-danger btn-xs del" data-placement="top" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a></td>
   </tr>
   
   
    </tbody>
        
</table>

<div class="clearfix"></div>
<ul class="pagination pull-right">
  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul>
  </div>
      </section>
                 </div>
					</form:form>
                </div>
             </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      
</div>
<script type="text/javascript">
$(function() {
    $('input[name="daterange"]').daterangepicker();
});

 //Warning Message
    $('.del').click(function(){
        swal({   
            title: "Are you sure?",   
            text: "You will not be able to recover this file!",   
            type: "warning",   
            showCancelButton: true,   
            confirmButtonColor: "#DD6B55",   
            confirmButtonText: "Yes, delete it!",   
            closeOnConfirm: false 
        }, function(){   
            swal("Deleted!", "Your file has been deleted.", "success"); 
        });
    });
</script>