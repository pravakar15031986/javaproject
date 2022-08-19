<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script language="javascript">
	pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";

</script>
<script>

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
              <li><a href="addProvince">Add</a></li>
              <li class="active"><a href="viewProvince" >View</a></li>
            </ul>
            <div class="clearfix"></div>
            <div class="tab-content">
           
            
              <div class="tab-pane active" id="fa-icons">
    <section id="new">
	<div class="box collapsed-box">
       
      </div></section>
                 </div>
						  <div class="table-responsive">
                   <div class="col-md-12">
                  		<c:if test="${not empty errMsg}">
                  			<div class="alert alert-custom-danger fade in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Error!</strong>${errMsg}
							</div>
                  		</c:if>
                		<c:if test="${not empty msg}">
                			<div class="alert alert-custom-success fade in alert-dismissible" style="margin-top:18px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
						    	<strong>Success!</strong>${msg}
							</div>
                		</c:if>
                	</div>
                
               <table class="mytable">
                   
                   <thead>
                   <th>SL. No</th>
                    <th>Country Name</th>
                     <th>Province/County Name</th>
                     <th>Province/County Code</th>
                     <th>Status</th>
                     <th>Action</th>
                   </thead>
              <tbody>
 <tr>
    <td>1</td>
    <td>KENYA</td>
    <td>Kilifi</td>
    <td>6760</td>
    <td style="color :green;">Active</td>
  <td style="text-align: center;"><a href="editProvince" data-placement="top" data-toggle="tooltip" title="Edit"  class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></a></td>
    
    </tr>
    <tr>
    <td>2</td>
    <td>UGANDA</td>
    <td>Adjumani</td>
    <td>6761</td>
    <td style="color :green;">Active</td>
  <td style="text-align: center;"><a href="editProvince" data-placement="top" data-toggle="tooltip" title="Edit"  class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></a></td>
    
    </tr>
    <tr>
    <td>3</td>
    <td>MALAWI</td>
    <td>Kasungu</td>
    <td>6762</td>
    <td style="color :green;">Active</td>
  <td style="text-align: center;"><a href="editProvince" data-placement="top" data-toggle="tooltip" title="Edit"  class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></a></td>
    
    </tr>
    <tr>
    <td>4</td>
    <td>UGANDA</td>
    <td>Alebtong</td>
    <td>6763</td>
    <td style="color :green;">Active</td>
  <td style="text-align: center;"><a href="editProvince" data-placement="top" data-toggle="tooltip" title="Edit"  class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></a></td>
    
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
 
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2();
    
  //Date range picker
    $('#reservation, #reservation1').daterangepicker()
    
  

    //Date picker
    $('#datepicker, #datepicker1').datepicker({
      autoclose: true
      
    })
    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    

    //Timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass   : 'iradio_minimal-blue'
    })
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass   : 'iradio_minimal-red'
    })
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass   : 'iradio_flat-green'
    })
  });
    </script>

