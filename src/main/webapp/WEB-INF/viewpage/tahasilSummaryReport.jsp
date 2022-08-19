<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<style>
	.th_box{
            vertical-align: middle!important;
            background: #f2f2f2;
            text-align: center;
        }
        table td{text-align: center;}
</style>
<div class="mainpanel">
    <div class="section">
     <div class="page-title">
          <div class="title-details">
             <h4>Survey Report</h4>
             <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                   <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                   <li class="breadcrumb-item">Web GIS</li>
                   <li class="breadcrumb-item active" aria-current="page">Tahsil Summary</li>
                </ol>
             </nav>
          </div>
       </div>
       <div class="row">
         <div class="col-md-12 col-sm-12">
            <div class="card">
            	<div class="card-header">
                  <ul class="nav nav-tabs nav-fill" role="tablist">
                     <!-- <a class="nav-item nav-link " href="addGlobalLink">Add</a> -->
                     <a class="nav-item nav-link active" href="viewGlobalLink">Tahsil Summary</a>
                  </ul>
               </div>
               <div class="card-body">
               		 <!-- Search Panel -->
             <form method="post">
                        <div class="search-container survey_report">
                           <div class="search-sec">
                             <div class="row ascr_view">
           
                        <!-- <label for="inputJTitle" class="col-lg-3 col-md-5 col-sm-12 col-form-label label-left">Beneficiary Number<span class="text-danger">*</span> </label> -->
                        <div class="col-lg-3 col-md-7 col-sm-12 mb-3"> 
                            <select class="form-control">
                            	<option>-- Select District --</option>
                            	<option>Bargarh</option>
                            	<option>Khurda</option>
                            	<option>Puri</option>
                            </select>
                        </div>
                        
                         <!-- <label for="inputJTitle" class="col-lg-3 col-md-5 col-sm-12 col-form-label label-left">Beneficiary Number<span class="text-danger">*</span> </label> -->
                        <div class="col-lg-3 col-md-7 col-sm-12 mb-3"> 
                            <select class="form-control">
                            	<option>-- Select Tehsil --</option>
                            	<option>Bargarh</option>
                            	<option>Khurda</option>
                            	<option>Puri</option>
                            </select>
                        </div>               
                  
                  <div class="col-lg-3 col-md-7 col-sm-12 mb-3">  <button type="button" class="btn btn-primary btn-md m-0 waves-effect waves-light" id="button2">Search</button></div>
                  
                </div> 
              </div>
             <div class="text-center"> <a class="searchopen" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Search"> <i class="fa fa-search"></i> </a></div>
          </div>
                        </form>
                        
                          <div class="table-responsive mt-4">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th rowspan="3" class="th_box">Village Name</th>
                        <th colspan="3" class="th_box">Farmer Reporting</th>
                        <th colspan="4" class="th_box">Image Validation</th>
                        <th rowspan="3" class="th_box">Not Found</th>
                    </tr>
                    <tr>
                        <th rowspan="2" class="th_box">No. of Farmers</th>
                        <th rowspan="2" class="th_box">No. of Plots</th>
                        <th rowspan="2" class="th_box">Area Reported</th>
                        <th colspan="2" class="th_box">No Paddy Crop</th>
                        <th colspan="2" class="th_box">Doubtful Paddy Crop</th>
                    </tr>
                    <tr>
                        <th class="th_box">No.</th>
                        <th class="th_box">Area</th>
                        <th class="th_box">No.</th>
                        <th class="th_box">Area</th>
                    </tr>
                </thead>
                <tbody>
                	<tr>
                		<td>Gajapati Gram</td>
                		<td>25</td>
                		<td>360</td>
                		<td>380</td>
                		<td>32</td>
                		<td>380</td>
                		<td>20</td>
                		<td>430</td>
                		<td>85</td>
                	</tr>
                	<tr>
                		<td>Gajapati Gram</td>
                		<td>25</td>
                		<td>360</td>
                		<td>380</td>
                		<td>32</td>
                		<td>380</td>
                		<td>20</td>
                		<td>430</td>
                		<td>85</td>
                	</tr>
                </tbody>
            </table>
        </div>
               </div>
            </div>
          </div>
       </div>
      </div>
    </div>
    <script>
    	$(document).ready(function(){
    		//search-form
    		$('.searchform').hide();
    			$('.searchbtn').click(function(){
    				$('.searchform').slideToggle();
    				$('.searchbtn .fa').toggleClass('fa-chevron-down fa-chevron-up');
    				if ($('.searchbtn span').text() == "Hide")
    				   $('.searchbtn span').text("Search")
    				else
    				   $('.searchbtn span').text("Hide");		
    			});
    			//search-form end
    	})
    </script>
    <script>
		$(document).ready(function(){
		    $('.searchform').show();
		});
	</script>