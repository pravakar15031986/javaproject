<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<style>

input[type="checkbox"]+label:before, input[type="radio"]+label:before{
	border: 1px solid #afafaf;
}
input[type="checkbox"]+label:after{
	left: 6px;
    top: 7px;
    width: 5px;
    height: 10px;
    border-bottom: 1px solid #01a15c;
    border-right: 1px solid #01a15c;
}
.form-group label {
  position: relative;
  cursor: pointer;
  display: block;
  padding-left: 25px;
}

.form-group label:before {
  content: '';
    -webkit-appearance: none;
    background-color: transparent!important;
    border: 1px solid rgb(206 209 199)!important;
    padding: 6px;
    display: inline-block;
    position: relative!important;
    vertical-align: middle;
    top: 0px!important;
    cursor: pointer;
    margin-right: 6px;
  margin-right: 6px;
}

.form-group input:checked + label:after {
  content: '';
  display: block;
  position: absolute;
  top: 20px;
  left: 52px;
  width: 4px;
  height: 8px;
  border: solid rgb(93 122 21);
  border-width: 0 1px 1px 0;
  transform: rotate(45deg);
}
.form-group input:checked + label:before {border: 1px solid #5d7a15;}
.input-group {
    display: inline-flex!important;
    }
.input-group-append, .input-group-prepend {
    display: inline-flex!important;
}
.report-content {
    margin: 1rem;
    border: 1px solid rgb(93 122 21);
    padding: 1rem;
    text-align: center;
}
.text-green{
  color: rgb(93 122 21);
}
.bg-green{
  background-color: rgb(93 122 21);
}
iframe{
  width: 100%;
}



	#sidebar-wrapper {
 /*  z-index: 1000;
  position: fixed;
  right: 250px;*/
  width: 100%; 
  top: 0;
/*   padding-top: 80px; */
  height: 100%;
  margin-right: -250px;
  overflow-y: auto;
  background: #fff;
  box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}

#wrapper.toggled #sidebar-wrapper {
  width: 300px;
}

#page-content-wrapper {
  width: 100%;
  position: absolute;
  padding: 15px;
}

#wrapper.toggled #page-content-wrapper {
  position: absolute;
  margin-right: 0px;
}
/* Sidebar Styles */

.sidebar-nav {
  width: 100%;
  margin: 0;
  padding: 0;
  list-style: none;
}

.sidebar-nav li {
  text-indent: 20px;
  line-height: 40px;
}

.sidebar-nav li a {
  display: block;
  text-decoration: none;
  color: #999999;
}

.sidebar-nav li a:hover {
  text-decoration: none;
  color: #fff;
  background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav li a:active, .sidebar-nav li a:focus {
  text-decoration: none;
}

.sidebar-nav>.sidebar-brand {
  height: 65px;
  font-size: 18px;
  line-height: 60px;
}

.sidebar-nav>.sidebar-brand a {
  color: #999999;
}

.sidebar-nav>.sidebar-brand a:hover {
  color: #fff;
  background: none;
}



.search-group .form-control:focus {
  border-color: #5d7a15;
  outline: 0;
  box-shadow: none;
}
.nav-handle{
  width: 25px;
  height: 18px;
  border-radius: 10px;
  border: none;
  display: flex;
  flex-flow: column;
  justify-content: space-between;
  cursor: pointer;
}
.nav-handle span{
  display: block;
  height: 2px;
  width: 100%;
  background: #f3f3f3;
}
.report-data {
  display: flex;
  justify-content: space-between;
  line-height: 28px !important;
  background: #f6f6f6;
  margin-bottom: 5px;
  padding: 8px 20px 0 0;
}
span.report-data__text {
  font-size: 1rem;
  display: block;
  margin-bottom: 4px;
  color: #1e1e1e;
}
span.report-data__info {
  color: #5d7a15;
  font-size: 1.2rem;
  font-weight: 600;
}
.expand-bar {position: relative;}
.expand-bar::after, .expand-bar::before {
  content: "";
  position: absolute;
  height: 2px;
  width: 14px;
  background: #777777;
  right: 1.5rem;
  transition: .5s;
  top: 42%;
  cursor: pointer;
}
.expand-bar::after {transform: rotate(90deg);}
.expand-bar.active::after {transform: rotate(-180deg);}
.navbar {z-index: 10001;}
iframe {
  height: calc(100vh - 185px);
}
.legend{position: relative;}
.legend::after{
  content: '';
  position: absolute;
  top: 18px;
  left: 2px;
  width: 14px;
  height: 14px;
  display: block;
  border-radius: 2px;
}
.legend-blue::after {background-color: #7fb7ff;}
.legend-pink::after {background-color: #ebd2ee;}
.legend-purple::after {background-color: #d091e5;}
.legend-grey::after {background-color: #d8d8d8;}
.legend-orange::after {background-color: #ffaa7f;}
.legend-yellow::after {background-color: #ffaa00;}
.legend-red::after {background-color: #fff; border: 2px solid red;}
.legend-green::after {background-color: #d4ff7f;}
.legend-black::after {background-color: #7f7f7f;}
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
                          <!-- <label for="inputJTitle" class="col-lg-3 col-md-5 col-sm-12 col-form-label label-left">Beneficiary Number<span class="text-danger">*</span> </label> -->
                        <div class="col-lg-3 col-md-7 col-sm-12 mb-3"> 
                            <select class="form-control">
                            	<option>-- Select Village --</option>
                            	<option>Bargarh</option>
                            	<option>Khurda</option>
                            	<option>Puri</option>
                            </select>
                        </div>  
                          <!-- <label for="inputJTitle" class="col-lg-3 col-md-5 col-sm-12 col-form-label label-left">Beneficiary Number<span class="text-danger">*</span> </label> -->
                        <div class="col-lg-3 col-md-7 col-sm-12 mb-3"> 
                            <div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
							  <label class="form-check-label" for="inlineCheckbox1">Plot No</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
							  <label class="form-check-label" for="inlineCheckbox2">Farmer Name</label>
							</div>
                        </div>   
                         <!-- <label for="inputJTitle" class="col-lg-3 col-md-5 col-sm-12 col-form-label label-left">Beneficiary Number<span class="text-danger">*</span> </label> -->
                        <div class="col-lg-3 col-md-7 col-sm-12 mb-3"> 
                            <input type="text" placeholder="Enter Plot No." class="form-control">
                        </div>            
                  
                  <div class="col-lg-3 col-md-7 col-sm-12 mb-3">  <button type="button" class="btn btn-primary btn-md m-0 waves-effect waves-light" id="button2">Search</button></div>
                  
                </div> 
              </div>
             <div class="text-center"> <a class="searchopen" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Search"> <i class="fa fa-search"></i> </a></div>
          </div>
                        </form>
                        
              <div class="row mt-4">
              	<div class="col-lg-10">
              		<div class="mapouter"><div class="gmap_canvas"><iframe class="gmap_iframe" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?hl=en&amp;q=University of Oxford&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe></div><style>.mapouter{position:relative;}.gmap_canvas {overflow:hidden;background:none!important;}.gmap_iframe {height:100vh;width:100%;}</style></div>
              	</div>
              	<div class="col-lg-2">
              			<!-- Sidebar -->
	<div id="sidebar-wrapper" class="scrollbar scroll-style">
		<ul class="sidebar-nav">
			<li>
				<h4 class="mb-3 mt-4">Boundary Layers</h4>
				<div class="form-group">
					<span class="legend legend-blue"></span>
					<input type="checkbox" id="District-Boundary">
					<label for="District-Boundary">District Boundary</label>
				</div>
			</li>
			<li>
				<div class="form-group">
					<span class="legend legend-purple"></span>
					<input type="checkbox" id="Tahsil-Boundary">
					<label for="Tahsil-Boundary">Tahsil Boundary</label>
				</div>
			</li>
			<li>
				<div class="form-group">
					<span class="legend legend-yellow"></span>
					<input type="checkbox" id="Village-Boundary">
					<label for="Village-Boundary">Village Boundary</label>
				</div>
			</li>
			<li>
				<div class="form-group expand-bar">
					<input type="checkbox" id="chkbox">
					<label for="chkbox">Plot Boundary</label>
				</div>
			</li>
			<li class="ml-3">
				<div id="dvcheckbox" style="display: none">
					<div class="form-group">
						<span class="legend legend-green"></span>
						<input type="checkbox" id="Reported-Plot">
						<label for="Reported-Plot">Reported Plot</label>
					</div>
					<div class="form-group">
						<span class="legend legend-grey"></span>
						<input type="checkbox" id="Suspected-land">
						<label for="Suspected-land">Suspected Land</label>
					</div>
					<div class="form-group">
						<span class="legend legend-blue"></span>
						<input type="checkbox" id="non-paddy">
						<label for="non-paddy">Non Paddy Land</label>
					</div>					
				</div>
				<div id="Addcheckbox"></div>
			</li>
			<!-- <li>

				<div class="form-group ml-3">
				<input type="checkbox" id="Reported-Plot">
				<label for="Reported-Plot">Reported Plot</label>
				</div>
			</li>
			<li>
			<div class="form-group ml-3">
				<input type="checkbox" id="non-paddy">
				<label for="non-paddy">Non Paddy Land</label>
				</div>
			</li>

			<li>
			<div class="form-group ml-3">
				<input type="checkbox" id="Suspected-land">
				<label for="Suspected-land">Suspected Land</label>
				</div>
			</li>-->	
			<li> 
				<h4 class="mb-3 mt-3">Satelite Imagery</h4>
				<div class="form-group">
					<span class="legend legend-orange"></span>
					<input type="checkbox" id="Planet-dec">
					<label for="Planet-dec">Planet 2020 - December</label>
				</div>
			</li>
			<li>  
				<div class="form-group">
					<span class="legend legend-red"></span>
					<input type="checkbox" id="Planet-sept">
					<label for="Planet-sept">Planet 2020 - September</label>
				</div>
			</li>
			<li>
				<div class="form-group">
					<span class="legend legend-pink"></span>
					<input type="checkbox" id="World-View">
					<label for="World-View">World View - 2017</label>
				</div>
			</li>
			<li>
				<div class="form-group">
					<span class="legend legend-black"></span>
					<input type="checkbox" id="Google-Imagery">
					<label for="Google-Imagery">Google Imagery </label>
				</div>
			</li>
			
			<li class="report-data mt-4 ">
				<span class="report-data__text">Reported Plot</span>
				<span class="report-data__info">78908</span>
			</li>
			<li class="report-data">
				<span class="report-data__text">Doubtful Plot</span>
				<span class="report-data__info">2178908</span>
			</li>
			<li class="report-data">
				<span class="report-data__text">Non-Paddy Land</span>
				<span class="report-data__info">7808</span>
			</li>
			<li class="report-data">
				<span class="report-data__text">Paddy Land</span>
				<span class="report-data__info">12378908</span>
			</li>
	    </ul>
	</div>
	<!-- Side bar ends here -->
              	</div>
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
		
        $(function () {
            $("#chkbox").click(function () {
                if ($(this).is(":checked")) {
    				// alert("hi");
    				$(this).parents('.expand-bar').addClass('active');
                    $("#dvcheckbox").slideDown();
                    $("#Addcheckbox").hide();
                } else {
    				$(this).parents('.expand-bar').removeClass('active');
                    $("#dvcheckbox").slideUp();
                    $("#Addcheckbox").show();
                }
            });
        });
	</script>