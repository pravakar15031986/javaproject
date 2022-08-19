

 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Region And Rust Report</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">MIS Reprt</li>
                            <li class="breadcrumb-item"><a href="regionAndRustTypeReport">Region And Rust Chart</a></li>
                           <li class="breadcrumb-item active" aria-current="page">Zone wise Rust Chart</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link 	active"  href="regionAndRustTypeByZoneChart">View</a>
                              
                           </ul>
                            <div class="indicatorslist">
                           <a  title="" href="regionAndRustTypeReport" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                          </div>
                          
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                           <div class="search-container">
                           <div class="search-sec">
                           <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Year </label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                   <option value="0">--Select--</option>
                                    <option value="1">2019</option>
                                    <option value="2">2018</option>
                                    <option value="3">2017</option>
                                    </select>
                                    </div>
                                    <label class="col-lg-2 ">Season </label>
                                    <div class="col-lg-3">
                                     <select class="form-control">
                                     <option value="0">--Select--</option>
                                    <option value="1">Normal</option>
									<option value="2">Late</option>
									<option value="3">Early</option>
									<option value="4">Dry</option>
									<option value="5">Wet</option>
									<option value="6">Warm</option>
									<option value="7">Cool</option>
									</select>
									</div>
                              	</div>
                              </div>
                              
                              
									
                              
                              
                              
                              <div class="form-group">
                              	<div class="row">
                              	<label class="col-lg-2 ">Verity</label>
                                    <div class="col-lg-3">
                                       <select class="form-control">
                                   <option value="0">--Select--</option>
                                   	<option value="1">Kakaba</option>
									<option value="2">Kubsa</option>
									<option value="3">Ogolcho</option>
									<option value="4">Local</option>
									<option value="5">Danda’a</option>
									<option value="6">Kingbird</option>
									<option value="7">Digelu</option>
									<option value="8">Hidase</option>
									<option value="9">Huluka</option>
                                    </select>
                                    </div>
                              	
                                    
                                    <label class="col-sm-2 ">Rust Type</label>
                                    <div class="col-sm-3">
                                       <select class="form-control" id="filter">
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
                           
                        </div>
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <form action="" autocomplete="off">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        
                        </div>
                       <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                           
                        </div>
                        </form>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
        
<script src="wrsis/js/canvasjs.min.js"></script>

  <script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      toolTip: {
        shared: true  //disable here. 
      },
      title:{
        text: "Zone And Rust Type"       
      },
	  axisY: {
		title: "Count"
	},
	legend: {
		cursor:"pointer",
		 itemclick: function (e) {
                   if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                    e.dataSeries.visible = false;
                } else {
                    e.dataSeries.visible = true;
                }

                e.chart.render();
            }
	},
	dataPointWidth: 40,
        data: [
      {        
       type: "column",       
       name: "stem rust",
	   showInLegend: true, 
       dataPoints: [
			{ y: 283, label: "North Shewa" },
			{ y: 236, label: "East Gojjam" },
			{ y: 243, label: "Oromiya" }
			/* { y: 273, label: "South" } */
       
       ]
     },
     {        
       type: "column",       
       name: "Yellow Rust",
	   showInLegend: true, 
       dataPoints: [
	   		{ y: 212, label: "North Shewa" },
			{ y: 186, label: "East Gojjam" },
			{ y: 272, label: "Oromiya" }
			/* { y: 299, label: "South" } */
     
       ]
     },
     {        
       type: "column",       
       name: "Leaf Rust",
	   showInLegend: true, 
       dataPoints: [
	   		{ y: 236, label: "North Shewa" },
			{ y: 172, label: "East Gojjam" },
			{ y: 309, label: "Oromiya" }
			/* { y: 302, label: "South" } */
      
       ]
     }
     
     ]
   });

chart.render();
}

</script>
<script>
$(document).ready(function(){
	//alert("In Zone Chart");
})
	function searchZone(id){
		alert(id);
		
	}
</script>
