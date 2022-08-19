<link rel="stylesheet" href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
<!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
<script
    src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
<script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>

<style>
    #map {
        height: 600px;
    }

    #loaderPage {
        position: absolute;
        width: 100%;
        text-align: center;
        height: 100vh;
        display: block;
        background: rgba(255, 255, 255, 0.61);
        z-index: 999;
    }

   /* .dateOpts {
        display: none;
    }*/
    
    
   

    /*****POPUP STYLE*****/
    .ol-popup {
        position: absolute;
        background-color: white;
        -webkit-filter: drop-shadow(0 1px 4px rgba(0, 0, 0, 0.2));
        filter: drop-shadow(0 1px 4px rgba(0, 0, 0, 0.2));
        border: 1px solid #cccccc;
        border-radius: 12px;
        bottom: 12px;
        left: -50px;
        min-width: 300px;
        font-size: .9rem;
        /*font-family: inherit;*/
        padding:5px;
        font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif
    }
    .heading{
    	color:#01a05d;
    	font-size:1rem;
    }

   

    .ol-popup:after,
    .ol-popup:before {
        top: 100%;
        border: solid transparent;
        content: " ";
        height: 0;
        width: 0;
        position: absolute;
        pointer-events: none;
    }

    .ol-popup:after {
        border-top-color: white;
        border-width: 10px;
        left: 48px;
        margin-left: -10px;
    }

    .ol-popup:before {
        border-top-color: #cccccc;
        border-width: 11px;
        left: 48px;
        margin-left: -11px;
    }

    .ol-popup-closer {
        text-decoration: none;
        position: absolute;
        top: -1px;
        right: -1px;
        padding: 5px 10px;
        border-top-right-radius: 10px;
    }

    .ol-popup-closer:after {
        content: "X";
    }
    .popuplist{
    	font-size:1.2rem;
    	color:black;
    	font-weight:bold;
    	
    }
    .countList{
    	font-size:2rem;
    	color:#ffffff;
    	text-align:center;
    	font-weight:bold;
		height:80px;
		width:80px;
		border-radius:80px;
		background-color:#ebcc34; 
		padding-top:5px;   	
    }
    
    .countList:hover{
    	cursor:pointer;
    	box-shadow:0px 0px 5px black;
    }
    
    .popuplist span,.countList span{
    	font-size:.8rem;
    	color:grey;
    	font-weight:normal;
    }

    /****MEASUREMENT TOOLTIP STYLE****/
    .tooltip {
        position: relative;
        background: rgba(0, 0, 0, 0.5);
        border-radius: 4px;
        color: white;
        padding: 4px 8px;
        opacity: 0.7;
        white-space: nowrap;
    }

    .tooltip-measure {
        opacity: 1;
        font-weight: bold;
    }

    .tooltip-static {
        background-color: #ffcc33;
        color: black;
        border: 1px solid white;
    }

    .tooltip-measure:before,
    .tooltip-static:before {
        border-top: 6px solid rgba(0, 0, 0, 0.5);
        border-right: 6px solid transparent;
        border-left: 6px solid transparent;
        content: "";
        position: absolute;
        bottom: -6px;
        margin-left: -7px;
        left: 50%;
    }

    .tooltip-static:before {
        border-top-color: #ffcc33;
    }

    .mapcontainer {
        margin-right: 220px;
        position: relative;
        border: 2px solid #ccc;
        background: #f2efe9;
    }

    .mapfilter {
        width: 220px;
        position: absolute;
        right: 20px;
        top: 15px;
        padding: 0 0 0 15px;
    }

    .expand {
        right: 3px;
        background: rgba(0, 0, 0, 0.82);
        padding: 4px 8px;
        left: auto;
        position: absolute;
        top: 3px;
        font-size: 1.2rem;
    }

    .expand button {
        background: transparent;
        border: 0px;
    }

    .expand button:focus {
        border: 0;
        outline: 0;
    }

    .expand button span {
        color: #fff;
    }

    #open_btn {
        display: none;
    }

    .mapcontainer .Legend ul {
        margin: 10px 0 0 0px;
        padding: 0 0 0 20px;
        font-weight: bold;
        border-bottom: #ccc 1px solid;
    }

    .mapcontainer .Legend li {
        display: inline-block;
        margin: 0 20px 0px 0;
        list-style-type: none;
    }

    .mapcontainer .Legend li p {
        float: left;
        margin-bottom: 5px;
    }
    .popover-body {
    	min-height:150px;
    	max-height:250px;
    	overflow-y:auto;    	
    }
    /* width */
		.popover-body::-webkit-scrollbar {
  			width: 7px;
		}

		/* Track */
		.popover-body::-webkit-scrollbar-track {
		  background: #f1f1f1; 
		}
 
		/* Handle */
		.popover-body::-webkit-scrollbar-thumb {
		  background: #888; 
		}

		/* Handle on hover */
		.popover-body::-webkit-scrollbar-thumb:hover {
		  background: #555; 
		}
		
	.ivrModal .modal-content{
		top:50px;
		height:600px;
		overflow-x:auto;
	}
 
    
    
</style>
<div class="mainpanel">
    <div class="section">
        <div class="page-title">
            <div class="title-details">
                <h4>View IVR Map details on Map</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                        <li class="breadcrumb-item">GIS Map</li>
                        <li class="breadcrumb-item active" aria-current="page">IVR Map</li>
                    </ol>
                </nav>
            </div>
            
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="card">

                    <!-- Search Panel -->
                    <!--===================================================-->
                    <form action="" autocomplete="off" name="myForm">
                        <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>" />
                        <div class="card-body">
                            <div class="Surveysec">
                                <div class="clearfix"></div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-12 ">
                                        <div class="mapcontainer">
                                            <div class="Legend">
                                               <!-- <ul>
                                                    <li>
                                                        <p class="font-bold">Legend :
                                                    </li>
                                                    <li>
                                                        <span class="green"></span>
                                                        <p>None or Trace (0)</p>
                                                    </li>
                                                    <li>
                                                        <span class="blue"></span>
                                                        <p>Low (20%)</p>
                                                    </li>
                                                    <li>
                                                        <span class="yellow"></span>
                                                        <p>Moderate (20%-40%)</p>
                                                    </li>
                                                    <li>
                                                        <span class="red"></span>
                                                        <p>High (40%)</p>
                                                    </li>
                                                </ul> --> 


                                            </div>
                                            <div id="map"></div>
                                            <div class="expand">
                                                <!-- sidebar close button -->
                                                <button type="button" id="close_btn" class="border-0">
                                                    <span class="fa fa-arrows-alt"></span>
                                                </button>
                                                <!-- sidebar close button -->
                                                <!-- open button for sidebar -->
                                                <button type="button" id="open_btn" class="border-0">
                                                    <span class="fa fa-compress"></span>
                                                </button>
                                                <!-- open button for sidebar -->
                                            </div>
                                        </div>

                                        


                                        
                                    </div>


                                    <div class="rightpannel mapfilter">
                                        <!-- <div class="form-group row">
                                            <div class="col-12 col-md-12 col-xl-12">
                                            	<div class="checkbox" >
                                    				<input id="filterDate" class='' type="checkbox" value=''>
                                    				<label for="filterDate">Filter Date Wise</label>
                                				</div>
                                            </div>
                                        </div> -->

                                     

										<label><strong>Filter Date :</strong></label>
                                        <!-- Datewise filters starts -->
                                        <div class="form-group row dateOpts">
                                            <label class="col-12 col-md-12 col-xl-12 control-label"
                                                for="demo-email-input">From</label>
                                            <div class="col-12 col-md-12 col-xl-12">
                                                <div id="datepicker1" class="input-group date"
                                                    data-date-format="dd-mm-yyyy">
                                                    <input class="form-control" id="dateFrom" type="text"
                                                        placeholder="Select Date From" />
                                                    <span class="input-group-addon"><i
                                                            class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row dateOpts">
                                            <label class="col-12 col-md-12 col-xl-12 control-label"
                                                for="demo-email-input">To</label>
                                            <div class="col-12 col-md-12 col-xl-12">
                                                <div id="datepicker2" class="input-group date"
                                                    data-date-format="dd-mm-yyyy">
                                                    <input class="form-control" id="dateTo" type="text"
                                                        placeholder="Select Date To" />
                                                    <span class="input-group-addon"><i
                                                            class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Datewise filters Ends -->

                                        <input type="button" class="btn buttonfill mb-5 mt-3" value="Show All"
                                            id="showIVRData" disabled>

                                    </div>


                                </div>

                            </div>

                            <!-- Popup content -->
                            <div id="popup" class="ol-popup">
                                <a href="#" id="popup-closer" class="ol-popup-closer"></a>
                                <div id="popup-content"></div>
                            </div>
                            
                       <!-- Large modal -->

<div class="modal fade ivrModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">IVR Survey Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Region</th>
      <th scope="col">Zone</th>
      <th scope="col">Woreda</th>
      <th scope="col">Type</th>
      <th scope="col">Gender</th>
      <th scope="col">Mobile</th>
      <th scope="col">Title</th>
      <th scope="col">Language</th>
      <th scope="col">Response</th>
      <th scope="col">Q&As</th>
    </tr>
  </thead>
  <tbody>
   
  </tbody>
</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
                            <link href="wrsis/css/bootstrap-datepicker.min.css" rel="stylesheet">
                            <script src="wrsis/js/bootstrap-datepicker.min.js"></script>
                            <script>
                                /*****GIS/OPENLAYERS MAP CODE*****/
                                /****DEVELOPED BY TARUN KUMAR MEHER :: DATE:21-01-2020****/
                            


                                /**
                                   * Elements that make up the popup.
                                   */
                                var container = document.getElementById('popup');
                                var content = document.getElementById('popup-content');
                                var closer = document.getElementById('popup-closer');


                                /**
                                 * Create an overlay to anchor the popup to the map.
                                 */
                                var overlay = new ol.Overlay({
                                    element: container,
                                    autoPan: true,
                                    autoPanAnimation: {
                                        duration: 250
                                    }
                                });


                                /**
                                 * Add a click handler to hide the popup.
                                 * @return {boolean} Don't follow the href.
                                 */
                                closer.onclick = function () {
                                    overlay.setPosition(undefined);
                                    closer.blur();
                                    return false;
                                };



                                //creating scalelinecontrol object
                                var scaleLineControl = new ol.control.ScaleLine();



                                //initializing raster layer
                                var raster = new ol.layer.Tile({
                                    source: new ol.source.OSM()
                                });

                                var ivrFeatures=[];
								var ivrSource= new ol.source.Vector({});
								var ivrLayer = new ol.layer.Vector({
									source:null,
									style: new ol.style.Style({
										image: new ol.style.Circle({
						                    radius: 7,
						                    fill: new ol.style.Fill({
						                        color: "#fff705"
						                    }),
						                    stroke: new ol.style.Stroke({
						                        color: "#02db4e",
						                        width: 5
						                    })
						                })
									})
								});




                                //Initializing map
                                var map = new ol.Map({
                                    layers: [raster,ivrLayer],
                                    controls: ol.control.defaults().extend([scaleLineControl]),
                                    overlays: [overlay],
                                    target: 'map',
                                    view: new ol.View({
                                        center: ol.proj.transform([40.4897, 9.1450], "EPSG:4326", "EPSG:3857"),
                                        zoom: 6,
                                        minZoom: 5
                                    })
                                });




                                /*********Ethiopia Polygon for Highlight the country*************/

                                var points = [];
                                var pointArray = [[37.90607, 14.95943], [38.51295, 14.50547], [39.0994, 14.74064], [39.34061, 14.53155], [40.02625, 14.51959], [40.8966, 14.11864], [41.1552, 13.77333], [41.59856, 13.45209], [42.00975, 12.86582], [42.35156, 12.54223], [42, 12.1], [41.66176, 11.6312], [41.73959, 11.35511], [41.75557, 11.05091], [42.31414, 11.0342], [42.55493, 11.10511], [42.776852, 10.926879], [42.55876, 10.57258], [42.92812, 10.02194], [43.29699, 9.54048], [43.67875, 9.18358], [46.94834, 7.99688], [47.78942, 8.003], [44.9636, 5.00162], [43.66087, 4.95755], [42.76967, 4.25259], [42.12861, 4.23413], [41.855083, 3.918912], [41.1718, 3.91909], [40.76848, 4.25702], [39.85494, 3.83879], [39.559384, 3.42206], [38.89251, 3.50074], [38.67114, 3.61607], [38.43697, 3.58851], [38.120915, 3.598605], [36.855093, 4.447864], [36.159079, 4.447864], [35.817448, 4.776966], [35.817448, 5.338232], [35.298007, 5.506], [34.70702, 6.59422], [34.25032, 6.82607], [34.0751, 7.22595], [33.56829, 7.71334], [32.95418, 7.78497], [33.2948, 8.35458], [33.8255, 8.37916], [33.97498, 8.68456], [33.96162, 9.58358], [34.25745, 10.63009], [34.73115, 10.91017], [34.83163, 11.31896], [35.26049, 12.08286], [35.86363, 12.57828], [36.27022, 13.56333], [36.42951, 14.42211], [37.59377, 14.2131], [37.90607, 14.95943]];
                                for (var i = 0; i < pointArray.length; i++) {
                                    points.push(ol.proj.transform(pointArray[i], 'EPSG:4326', 'EPSG:3857'));
                                }

                                var featurePolygon = new ol.Feature({
                                    geometry: new ol.geom.Polygon([points])
                                });

                                var vectorPolygon = new ol.source.Vector({});
                                vectorPolygon.addFeature(featurePolygon);

                                var vectorPolygonLayer = new ol.layer.Vector({
                                    source: vectorPolygon,
                                    style: new ol.style.Style({
                                        stroke: new ol.style.Stroke({ color: '#fadf32', width: 10 })
                                    })
                                });
                                map.addLayer(vectorPolygonLayer);
                                var from = '';
								var to = '';
								$(document).ready(function(){
									var settings = {
	                                        "url": "gisapi/getGISIVRdata?startDate=&endDate=",
	                                        "method": "POST",
	                                        "timeout": 0,
	                                        "headers": {
	                                            "Content-Type": "application/json"
	                                        },
	                                        "data": JSON.stringify(),
	                                    };

	                                 $.ajax(settings).done(function (response) {
	                                	 var res = JSON.parse(response);                         
		                                 if(res.status!==200 && res.response.ivrApiArr!=undefined){			                                
		                                	 showIVRsurveyOnMap(res.response.ivrApiArr);
		                                	 from = res.response.startDate.split("-").reverse().join("-");
		                                	 to = res.response.endDate.split("-").reverse().join("-");
		                                	 $("#datepicker1").datepicker("update",from);
		                                	 $("#datepicker2").datepicker("update",to);
		                                	 $("#showIVRData").removeAttr("disabled");
			                             }else{
			                            	 alert("No Record Found !!");
				                         }
	                                 });
								});
	
								var monthArr = ['January','February','March','April','May','June','July','August','September','October','November','December'];
								
								$("#showIVRData").click(function(){
									var fromdate = $("#dateFrom").val();
									var todate = $("#dateTo").val();
									if(fromdate=='' || todate==''){
										alert("Please Select Both From and To Date");
									}else{
										if(fromdate.split("-").reverse().join("")<=todate.split("-").reverse().join("")){
											from = fromdate.split("-")[0]+"-"+monthArr[Number(fromdate.split("-")[1])-1]+"-"+fromdate.split("-")[2];
											to = todate.split("-")[0]+"-"+monthArr[Number(todate.split("-")[1])-1]+"-"+todate.split("-")[2];
											var settings = {
			                                        "url": "gisapi/getGISIVRdata?startDate="+from+"&endDate="+to,
			                                        "method": "POST",
			                                        "timeout": 0,
			                                        "headers": {
			                                            "Content-Type": "application/json"
			                                        },
			                                        "data": JSON.stringify(),
			                                    };

			                                 $.ajax(settings).done(function (response) {
			                                	 var res = JSON.parse(response);                         
				                                 if(res.status!==200 && res.response.ivrApiArr!=undefined){			                                
				                                	 showIVRsurveyOnMap(res.response.ivrApiArr);
					                             }else{
					                            	 ivrLayer.setSource(null);
					                            	 alert("No Record Found !!");
						                         }
			                                 });
										}else{
											alert("From date is greater then To date");
										}
									}									
								});

								/*showIVRsurveyOnMap show ivr survey location based on wareda*/								
								function showIVRsurveyOnMap(ivrData){
									overlay.setPosition(undefined);
									if(ivrData.length>0){
										ivrFeatures=[];
										for(var i=0;i<ivrData.length;i++){
											feature = new ol.Feature(new ol.geom.Point(ol.proj.transform([parseFloat(ivrData[i].lat),parseFloat(ivrData[i].long)], 'EPSG:4326', 'EPSG:3857')));
								            feature.setProperties(ivrData[i]);
								            ivrFeatures.push(feature)
										}
										ivrSource= new ol.source.Vector({
											features: ivrFeatures
										});	

										ivrLayer.setSource(null);
										ivrLayer.setSource(ivrSource);
										
		                             }else{
		                            	 ivrLayer.setSource(null);
		                            	 alert("No Record Found !");
				                     }
								}

								map.on('singleclick', function(evt){
									map.forEachFeatureAtPixel(evt.pixel,function(feature){
										var featureProp = feature.getProperties();
										if(featureProp.count!=undefined){
											var featureProp = feature.getProperties();
											content.innerHTML = "<div><div class='heading'><strong>&nbsp;<u>IVR Survey Detail</u></strong></div><div style='padding:5px 10px;display:flex;justify-content:space-around;'><div><div class='popuplist regName'><span>Region</span>"+featureProp.region+"</div><div class='popuplist zoneName'><span>Zone</span>"+featureProp.zone+"</div><div class='popuplist worName'><span>Woreda</span>"+featureProp.woreda+"</div></div><div class='countList' onclick='getCountDetail(this);'>"+featureProp.count+"<span style='display:block;margin-top:-15px;color:white;'>Survey Count</span></div></div></div>";
	                                        overlay.setPosition(evt.coordinate);
										}else{
											overlay.setPosition(undefined);
										}
									});
								});

								function getCountDetail(evt){
									var ele = $(evt).prev()[0];
									var query = "regionName="+$(ele).find('.regName').text().slice(6)+"&zoneName="+$(ele).find('.zoneName').text().slice(4)+"&woredaName="+$(ele).find('.worName').text().slice(6);
									var settings = {
	                                        "url": "gisapi/getIVRCountDetails?startDate="+from+"&endDate="+to+"&"+query,
	                                        "method": "POST",
	                                        "timeout": 0,
	                                        "headers": {
	                                            "Content-Type": "application/json"
	                                        },
	                                        "data": JSON.stringify(),
	                                    };

	                                 $.ajax(settings).done(function (response) {
	                                	 var res = JSON.parse(response);                         
		                                 if(res.status!==200){			                                
		                                	 if(res.response.ivrCountArray.length>0){
												var ivrCountDetail = res.response.ivrCountArray;
												$(".modal-body tbody").html("");
												for(var i=0;i<ivrCountDetail.length;i++){
													$(".modal-body tbody").append("<tr><td>"+(i+1)+"</td><td>"+ivrCountDetail[i].vch_region+"</td><td>"+ivrCountDetail[i].vch_zone+"</td><td>"+ivrCountDetail[i].vch_woreda+"</td><td>"+ivrCountDetail[i].vch_client_type+"</td><td>"+ivrCountDetail[i].vch_gender+"</td><td>"+ivrCountDetail[i].vch_mobileno+"</td><td>"+ivrCountDetail[i].vch_survey_title+"</td><td>"+ivrCountDetail[i].vch_language+"</td><td>"+ivrCountDetail[i].vch_responded+"</td><td><button type='button' class='btn btn-warning' data-container='body' data-toggle='popover' data-placement='left' data-trigger='focus' data-content=''>Q&As</button></td></tr>");
													var queAns = ivrCountDetail[i].q_and_a;
													var qaTemplate = "<div class='p-1 bg-warning'><strong>Survey Title : </strong>"+ivrCountDetail[i].vch_survey_title+"</div>";
													for(var q=0;q<queAns.length;q++){
														qaTemplate+="<div><strong>Q"+queAns[q].slno+".</strong> "+queAns[q].que+"<br><strong>Answer : </strong>"+queAns[q].ans+"</div><hr>"
													}
													
													$('[data-toggle="popover"]').popover({
														animation: false,
													    html: true,
													    sanitize: false,
													    content: qaTemplate																											
													});

													$('.popover-dismiss').popover({
														  trigger: 'focus'
													});
												}
												$(".ivrModal").modal("show");
			                                }else{
												alert("Count Details Not Found !!");
				                            }
			                             }else{
			                            	 alert(res.msg);
				                         }
	                                 });
								}

								



                                

                                /*********Ethiopia Polygon for Highlight the country*************/

                                map.on('moveend', function (e) {
                                    var newZoom = map.getView().getZoom();
                                    if (newZoom >= 9) {
                                        map.removeLayer(vectorPolygonLayer);
                                    } else {
                                        map.removeLayer(vectorPolygonLayer);
                                        map.addLayer(vectorPolygonLayer);
                                    }
                                });





                                /****ADDING MEASUREMENT BUTTON AND COORDINATE BOX****/
                                $('.ol-viewport').append("<span id='latlong' style='border-bottom-left-radius:10px;padding:5px;top:0;right:0;background-color: rgba(0,60,136,.3);color:whitesmoke;position:absolute;max-width:400px;'></span>");
                                $(".ol-zoom").append("<button type='button' id='measuerButton' title='Measurement'><img src='wrsis/images/meserment.png' height='15px'></button>");
                                $(".ol-zoom").append("<button type='button' id='homeButton' title='Home'><img src='wrsis/images/home.png' height='15px'></button>");
                                /****ADDING MEASUREMENT BUTTON AND COORDINATE BOX****/


                                $("#homeButton").click(function () {
                                    var location = ol.proj.transform([40.4897, 9.1450], "EPSG:4326", "EPSG:3857");

                                    gotoEthiopia(location, function () { });
                                    map.removeLayer(vectorPolygonLayer);
                                    map.addLayer(vectorPolygonLayer);
                                });

                                function gotoEthiopia(location, done) {
                                    var view = map.getView();
                                    var duration = 2000;
                                    var zoom = view.getZoom();
                                    var parts = 2;
                                    var called = false;
                                    function callback(complete) {
                                        --parts;
                                        if (called) {
                                            return;
                                        }
                                        if (parts === 0 || !complete) {
                                            called = true;
                                            done(complete);
                                        }
                                    }
                                    view.animate({
                                        center: location,
                                        duration: duration
                                    }, callback);
                                    view.animate({
                                        zoom: zoom - 1,
                                        duration: duration / 2
                                    }, {
                                        zoom: 6,
                                        duration: duration / 2
                                    }, callback);
                                }







                             


                              
                                /********Mouse Position Control*********/
                                var mousePositionControl = new ol.control.MousePosition({
                                    coordinateFormat: ol.coordinate.createStringXY(10),
                                    projection: 'EPSG:4326',
                                    // comment the following two lines to have the mouse position
                                    // be placed within the map.
                                    className: 'custom-mouse-position',
                                    target: document.getElementById('latlong'),
                                    undefinedHTML: '&nbsp;'
                                });

                                map.addControl(mousePositionControl)







                                /****ADDING MEASUREMENT TOOL****/
                                var measurementVal = 1;
                                $("#measuerButton").click(function () {
                                    if (measurementVal == 1) {
                                        map.addLayer(vectorDraw);
                                        addInteraction();
                                        measurementVal = 2;
                                    } else {
                                        //measurementVal = 1
                                        clearDraw();
                                    }
                                });


                                var sourceDraw = new ol.source.Vector();
                                var vectorDraw = new ol.layer.Vector({
                                    source: sourceDraw,
                                    style: new ol.style.Style({
                                        fill: new ol.style.Fill({
                                            color: "rgba(255, 255, 255, 0.2)"
                                        }),
                                        stroke: new ol.style.Stroke({
                                            color: "#ffcc33",
                                            width: 2
                                        }),
                                        image: new ol.style.Circle({
                                            radius: 7,
                                            fill: new ol.style.Fill({
                                                color: "#ffcc33"
                                            })
                                        })
                                    })
                                });

                                /**
                                 * Currently drawn feature.
                                 * @type {ol.Feature}
                                 */
                                var sketch;

                                /**
                                 * The help tooltip element.
                                 * @type {Element}
                                 */
                                var helpTooltipElement;

                                /**
                                 * Overlay to show the help messages.
                                 * @type {ol.Overlay}
                                 */
                                var helpTooltip;

                                /**
                                 * The measure tooltip element.
                                 * @type {Element}
                                 */
                                var measureTooltipElement;

                                /**
                                 * Overlay to show the measurement.
                                 * @type {ol.Overlay}
                                 */
                                var measureTooltip;


                                var draw; // global so we can remove it later

                                function addInteraction() {
                                    /**
                                     * Message to show when the user is drawing a line.
                                     * @type {string}
                                     */
                                    var continueLineMsg = "Click to continue drawing the line";
                                    var type = "LineString";
                                    draw = new ol.interaction.Draw({
                                        source: sourceDraw,
                                        type: type,
                                        style: new ol.style.Style({
                                            fill: new ol.style.Fill({
                                                color: "rgba(255, 255, 255, 0.2)"
                                            }),
                                            stroke: new ol.style.Stroke({
                                                color: "rgba(0, 0, 0, 0.5)",
                                                lineDash: [10, 10],
                                                width: 2
                                            }),
                                            image: new ol.style.Circle({
                                                radius: 5,
                                                stroke: new ol.style.Stroke({
                                                    color: "rgba(0, 0, 0, 0.7)"
                                                }),
                                                fill: new ol.style.Fill({
                                                    color: "rgba(255, 255, 255, 0.2)"
                                                })
                                            })
                                        })
                                    });
                                    map.addInteraction(draw);

                                    createMeasureTooltip();
                                    createHelpTooltip();

                                    var listener;
                                    draw.on(
                                        "drawstart",
                                        function (evt) {
                                            // set sketch

                                            $('.ol-overlay-container').find('.tooltip-static').hide();


                                            sketch = evt.feature;

                                            /** @type {ol.Coordinate|undefined} */
                                            var tooltipCoord = evt.coordinate;

                                            listener = sketch.getGeometry().on("change", function (evt) {
                                                var geom = evt.target;
                                                var output;
                                                output = formatLength(geom);
                                                //console.log(output)
                                                tooltipCoord = geom.getLastCoordinate();
                                                measureTooltipElement.innerHTML = output;
                                                measureTooltip.setPosition(tooltipCoord);
                                            });
                                        },
                                        this
                                    );

                                    draw.on(
                                        "drawend",
                                        function (e) {
                                            measureTooltipElement.className = "tooltip tooltip-static";
                                            measureTooltip.setOffset([0, -7]);
                                            // unset sketch
                                            sketch = null;
                                            // unset tooltip so that a new one can be created
                                            measureTooltipElement = null;
                                            createMeasureTooltip();
                                            ol.Observable.unByKey(listener);
                                        },
                                        this
                                    );

                                    /**
                                     * Creates a new help tooltip
                                     */
                                    function createHelpTooltip() {
                                        if (helpTooltipElement) {
                                            helpTooltipElement.parentNode.removeChild(helpTooltipElement);
                                        }
                                        helpTooltipElement = document.createElement("div");
                                        helpTooltipElement.className = "tooltip hidden";
                                        helpTooltip = new ol.Overlay({
                                            element: helpTooltipElement,
                                            offset: [15, 0],
                                            positioning: "center-left"
                                        });
                                        map.addOverlay(helpTooltip);
                                    }

                                    /**
                                     * Creates a new measure tooltip
                                     */
                                    function createMeasureTooltip() {
                                        if (measureTooltipElement) {
                                            measureTooltipElement.parentNode.removeChild(measureTooltipElement);
                                        }
                                        measureTooltipElement = document.createElement("div");
                                        measureTooltipElement.className = "tooltip tooltip-measure";
                                        measureTooltip = new ol.Overlay({
                                            element: measureTooltipElement,
                                            offset: [0, -15],
                                            positioning: "bottom-center"
                                        });
                                        map.addOverlay(measureTooltip);
                                    }

                                    var pointerMoveHandler = function (evt) {
                                        if (evt.dragging) {
                                            return;
                                        }
                                        /** @type {string} */
                                        var helpMsg = "Click to start drawing";

                                        if (sketch) {
                                            var geom = sketch.getGeometry();
                                            if (geom instanceof ol.geom.Polygon) {
                                                helpMsg = continuePolygonMsg;
                                            } else if (geom instanceof ol.geom.LineString) {
                                                helpMsg = continueLineMsg;
                                            }
                                        }
                                        //console.log(helpMsg)
                                        helpTooltipElement.innerHTML = helpMsg;

                                        helpTooltip.setPosition(evt.coordinate);

                                        helpTooltipElement.classList.remove("hidden");
                                    };
                                    map.on("pointermove", pointerMoveHandler);

                                    map.getViewport().addEventListener("mouseout", function () {
                                        helpTooltipElement.classList.add("hidden");
                                    });

                                    var typeSelect = document.getElementById("type");

                                    /**
                                     * Format length output.
                                     * @param {ol.geom.LineString} line The line.
                                     * @return {string} The formatted length.
                                     */
                                    var formatLength = function (line) {
                                        var length = ol.Sphere.getLength(line);
                                        var output;
                                        if (length > 100) {
                                            output = Math.round((length / 1000) * 100) / 100 + " " + "km";
                                        } else {
                                            output = Math.round(length * 100) / 100 + " " + "m";
                                        }
                                        return output;
                                    };

                                    /**
                                     * Format area output.
                                     * @param {ol.geom.Polygon} polygon The polygon.
                                     * @return {string} Formatted area.
                                     */
                                    var formatArea = function (polygon) {
                                        var area = ol.Sphere.getArea(polygon);
                                        var output;
                                        if (area > 10000) {
                                            output =
                                                Math.round((area / 1000000) * 100) / 100 + " " + "km<sup>2</sup>";
                                        } else {
                                            output = Math.round(area * 100) / 100 + " " + "m<sup>2</sup>";
                                        }
                                        return output;
                                    };
                                }

                                function clearDraw() {//Function to clear the draw
                                    measurementVal = 1;
                                    map.removeInteraction(draw);
                                    map.removeLayer(vectorDraw);
                                    sourceDraw.clear();
                                    map.removeOverlay(helpTooltip);
                                    map.removeOverlay(measureTooltip);
                                    $('.ol-overlay-container').find('.tooltip-static').hide();
                                }


                                /*season/datewise dropdown show/hide upon filterType change*/
                                /*$("#filterDate").change(function () {
									if($(this).is(":checked")){
										$(".dateOpts").show();
										$("#showIVRData").removeAttr("disabled");
									}else{
										$(".dateOpts").hide();
                                    	$("#showIVRData").attr("disabled","disabled");
                                    }
                                });*/


                                $("#datepicker1").datepicker({
                                    autoclose: true,
                                    todayHighlight: true,
                                    clearBtn: true,
                                    buttonImage: "ui-icon-calendar",
                                    maxDate: 0
                                });


                                $("#datepicker2").datepicker({
                                    autoclose: true,
                                    todayHighlight: true,
                                    clearBtn: true,
                                    buttonImage: "ui-icon-calendar",
                                    maxDate: 0
                                });

                                $("#datepicker1,#datepicker2").change(function(){
									if($("#dateFrom").val()!='' && $("#dateTo").val()!=''){
										$("#showIVRData").removeAttr("disabled");
									}else{
										$("#showIVRData").attr("disabled","disabled");										
									}
                                });

 

                               

                                /*close button sidebar */
                                $('#close_btn').click(function () {
                                    $('.mapfilter').animate({
                                        width: "0"
                                    }, function () {
                                        $(this).css("display", "none")
                                    });
                                    $('.mapcontainer').animate({
                                        marginRight: "0"
                                    });
                                    $(this).hide('fast');
                                    $('#open_btn').show('slow');
                                    setTimeout(function () {
                                        map.updateSize();
                                    }, 1000);
                                });
                                /*close button sidebar */
                                /*open button sidebar */
                                $('#open_btn').click(function () {
                                    $('.mapfilter').animate({
                                        width: "220px"
                                    }).css("display", "block");
                                    $('.mapcontainer').animate({
                                        marginRight: "220px"
                                    });
                                    $(this).hide('fast');
                                    $('#close_btn').show('slow');
                                    setTimeout(function () {
                                        map.updateSize();
                                    }, 1000);
                                });
                                /*open button sidebar */

                            </script>
                        </div>
                    </form>
                    <!--===================================================-->
                </div>
            </div>
        </div>
    </div>

</div>
