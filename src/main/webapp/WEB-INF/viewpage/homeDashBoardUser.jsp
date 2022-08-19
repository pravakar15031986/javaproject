<link href="wrsis/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
<link rel="stylesheet" href="wrsis/css/chartist-plugin-tooltip.css">
 
<script src="wrsis/js/chartist.min.js"></script>
<script src="wrsis/js/chartist-plugin-tooltip.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chartist-plugin-legend/0.6.1/chartist-plugin-legend.min.js"></script>
<script src="wrsis/js/dashboard.js"></script>


 
 
 
 
 <div class="mainpanel">
            <div class="section">
               <div class="top-portlets">
                  <div>
                  	<p style=" font-weight: bold;">Statistic For The Current Season</p>
                  </div>
                  <div class="row">
                  
                     <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="portlets__card ">
                           <div class="portlets__card__content green">
                              <p><i class="icon-user1"></i> Rust Reported</p>
                              <h4><a href="#" style="color:white;">425</a></h4>
                           </div>
                           <div class="portlets__card__charts green-dark">
                              <div class="charts__content" id="newclints">
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="portlets__card ">
                           <div class="portlets__card__content Orange">
                              <p><i class="icon-user1"></i> Race Analysts</p>
                              <h4 ><a href="#" style="color:white;">123</a></h4>
                           </div>
                           <div class="portlets__card__charts Orange-dark">
                              <div class="charts__content" id="newclints">
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="portlets__card ">
                           <div class="portlets__card__content red">
                              <p><i class="icon-user1"></i> IVR Data Collected</p>
                              <h4 ><a href="#" style="color:white;">72</a></h4>
                           </div>
                           <div class="portlets__card__charts red-dark">
                              <div class="charts__content" id="newclints">
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="portlets__card ">
                           <div class="portlets__card__content cyan">
                              <p><i class="icon-user1"></i> Monitoring Data Collected</p>
                              <h4 ><a href="#" style="color:white;">5450</a></h4>
                           </div>
                           <div class="portlets__card__charts cyan-dark">
                              <div class="charts__content" id="newclints">
                              </div>
                           </div>
                        </div>
                     </div>
                   
                  </div>
               </div>
               <div class="row">
                  <div class="col-12 col-md-6 col-lg-4">
                     <div class="dashboard-portlet">
                     	<h6>Survey Statistic <a class="float-right more-links" href="javascript:void(0)" ><span class="icon-more-vertical1"></span></a>
                           </h6>
                           <div id="chartContainerPai" style="height: 300px; width: 100%;"></div>
                     </div>
                  </div>
                  <div class="col-12 col-md-6 col-lg-4">
                     <div class="dashboard-portlet">
                     	<h6>Region Wise Survey<a class="float-right more-links" href="javascript:void(0)" ><span class="icon-more-vertical1"></span></a>
                           </h6>
                           <div id="chartContainerBar" style="height: 300px; width: 100%;"></div>
                     </div>
                  </div>
                  <div class="col-12 col-md-6 col-lg-4">
                     <div class="dashboard-portlet">
                     	<h6>Monitoring Progress<a class="float-right more-links" href="javascript:void(0)" ><span class="icon-more-vertical1"></span></a>
                           </h6>
                           <div id="chartContainerLine" style="height: 300px; max-width: 400px; margin: 0px auto;"></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <script src="wrsis/js/canvasjs.min.js"></script>
         <script src="wrsis/js/jquery.canvasjs.min.js"></script>
         <script>
         
         window.onload = function() {

var chart = new CanvasJS.Chart("chartContainerPai", {
	animationEnabled: true,
	title: {
		//text: "Survey Statistic"
	},
	data: [{
		type: "doughnut",
		   //showInLegend: true, 
		    //indexLabelPlacement: "inside",
		   indexLabelLineColor: "red",
		//startAngle: 240,
		 radius:  "90%",
		 indexLabelColor: "red",
		yValueFormatString: "##0\"%\"",
		indexLabel: "{label} {y}",
		dataPoints: [
			{y: 60, label: "Stem Rust"},
			{y: 20, label: "Yellow Rust"},
			{y: 20, label: "Leaf Rust"}
			
		]
	}]
});
chart.render();

//}

         /* window.onload = function () { */
        	    var chart = new CanvasJS.Chart("chartContainerBar",
        	    {
        	      toolTip: {
        	        shared: true  //disable here. 
        	      },
        	      title:{
        	        //text: "Comparison Between Survey,Ivr and Incident"       
        	      },
        		  axisY: {
        			title: " Survey, Ivr and Incident"
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
        		dataPointWidth: 10,
        	        data: [
        	      {        
        	       type: "column",       
        	       name: "Survey",
        		   showInLegend: true, 
        	       dataPoints: [
        				{ y: 243, label: "Amhara" },
        				{ y: 236, label: "Oromia" },
        				{ y: 243, label: "Somali" },
        				{ y: 273, label: "South" }
        	       
        	       ]
        	     },
        	     {        
        	       type: "column",       
        	       name: "Ivr",
        		   showInLegend: true, 
        	       dataPoints: [
        		   { y: 212, label: "Amhara" },
        				{ y: 186, label: "Oromia" },
        				{ y: 272, label: "Somali" },
        				{ y: 299, label: "South" }
        	     
        	       ]
        	     },
        	     {        
        	       type: "column",       
        	       name: "Incident",
        		   showInLegend: true, 
        	       dataPoints: [
        		   { y: 236, label: "Amhara" },
        				{ y: 172, label: "Oromia" },
        				{ y: 309, label: "Somali" },
        				{ y: 302, label: "South" }
        	      
        	       ]
        	     }
        	     
        	     ]
        	   });

        	chart.render();
        	}        
         
        	var options = {
        			animationEnabled: true,
        			theme: "light2",
        			title:{
        				//text: "Monitoring Progress"
        			},
        			axisX:{
        				valueFormatString: "#,##0.##",
        			},
        			axisY: {
        				title: "Survey Recorded",
        				//suffix: "K",
        				minimum: 20
        			},
        			toolTip:{
        				shared:true
        			},  
        			legend:{
        				cursor:"pointer",
        				verticalAlign: "bottom",
        				horizontalAlign: "left",
        				dockInsidePlotArea: true,
        				itemclick: toogleDataSeries
        			},
        			data: [{
        				type: "line",
        				showInLegend: true,
        				name: "Survey",
        				markerType: "square",
        				xValueFormatString: "String",
        				color: "#F08080",
        				
        				yValueFormatString: "##0\"%\"",
        				dataPoints: [
        					{ label: "JUN", y: 20 },
        					{ label: "JUL", y: 29 },
        					{ label: "AUG", y: 65 },
        					{ label: "SEP", y: 70 },
        					{ label: "OCT", y: 71 }
        					
        				]
        			},
        			{
        				type: "line",
        				showInLegend: true,
        				name: "Monitor",
        				markerType: "square",
        				
        				yValueFormatString: "##0\"%\"",
        				dataPoints: [
        					{ label: "JUN", y: 20 },
        					{ label: "JUL", y: 30 },
        					{ label: "AUG", y: 51 },
        					{ label: "SEP", y: 56 },
        					{ label: "OCT", y: 54 }
        					
        				]
        			}]
        		};
        		$("#chartContainerLine").CanvasJSChart(options);

        		function toogleDataSeries(e){
        			if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
        				e.dataSeries.visible = false;
        			} else{
        				e.dataSeries.visible = true;
        			}
        			e.chart.render();
        		}      
         </script>