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
          	 <ul class="utility pull-right">
          		
          		<li><a class="btn bg-purple btn-flat" data-toggle="tooltip" title="Print" data-placement="bottom"><i class="fa fa-print"></i> </a></li>
          		<li><a class="btn bg-olive btn-flat" data-toggle="tooltip" title="PDF" data-placement="bottom"><i class="fa fa-file-pdf-o"></i> </a></li>
          		
          	</ul> 
           <ul class="nav nav-tabs">
              <li><a href="addComanyMaster">Add</a></li>
              <li class="active"><a href="viewComanyMaster" >View</a></li>
            </ul>
            <div class="clearfix"></div>
            <div class="tab-content">
           
            
              <div class="tab-pane active" id="fa-icons">
    <section id="new">
	<div class="box collapsed-box">
       
      </div></section>
                 </div>
						  <div class="table-responsive">
                  
                
               <table class="mytable">
                   
                   <thead>
                    <th>Sl.No</th>
                    <th>Company Name</th>
                    <th>Company Code</th>
                    <th>Status</th>
                    <th>Action</th>
                   </thead>
              <tbody>
 <tr>
   <td>1</td>
    <td>Venus Tea Ltd</td>
    <td>001</td>
    <td><font color="green">Active</font></td>
    <td><a  href="viewCompanyMasterEdit"  class="btn btn-primary btn-xs" data-title="Edit"  ><span class="glyphicon glyphicon-pencil"></span></a></td>
    
 </tr>
 <tr>
    <td>2</td>
    <td>Mitchell Cotts Freight (K) Ltd</td>
    <td>101</td>
     <td><font color="green">Active</font></td>
    <td><a  href="viewCompanyMasterEdit"  class="btn btn-primary btn-xs" data-title="Edit"  ><span class="glyphicon glyphicon-pencil"></span></a></td>
 </tr>
 <tr>
   <td>3</td>
    <td>RISALA LIMITED</td>
    <td>201</td>
     <td><font color="green">Active</font></td>
    <td><a  href="viewCompanyMasterEdit"  class="btn btn-primary btn-xs" data-title="Edit"  ><span class="glyphicon glyphicon-pencil"></span></a></td>
 </tr>
 <tr>
    <td>4</td>
    <td>AFRO TEAS LIMITED</td>
    <td>301</td>
     <td><font color="red">Inactive</font></td>
    <td><a  href="viewCompanyMasterEdit"  class="btn btn-primary btn-xs" data-title="Edit"  ><span class="glyphicon glyphicon-pencil"></span></a></td>
 </tr>
    
    </tbody>
        
</table>

<div class="clearfix"></div>

                
            </div>
               </div>
              

            </div>
          </div>
        </div>
      </div>
 