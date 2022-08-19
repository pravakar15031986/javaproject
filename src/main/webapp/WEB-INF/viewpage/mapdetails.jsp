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

    .dateOpts {
        display: none;
    }
    .form-check{
    	padding:0 !important;
    }
    #growthStage,#severity{
    	display:none;
    }
    #growthStageBtn:hover,#severityBtn:hover{
    	cursor:pointer;
    }
    #severityBtn i,#growthStageBtn i{
    	margin-top:5px;
    }
    #severityBtn,#growthStageBtn{
		border:0.5px solid #c9c9c9;
    	padding:5px;
    	border-radius:5px;
    }
   

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
        min-width: 350px;
        font-size: .9rem;
        font-family: inherit;
    }

    .ol-popup .heading {
        background-color: #83a750;
        padding: 5px;
        color: white;
        border-top-right-radius: 10px;
        border-top-left-radius: 10px;
        margin-top: -1px;
        margin-left: -1px;
    }

    .ol-popup table {
        width: 100%;
        font-size: .7rem;
    }

    .ol-popup tr:nth-child(even) {
        background-color: #f2f2f2;
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
        background-color: rgb(234, 183, 48);
        border-top-right-radius: 10px;
    }

    .ol-popup-closer:after {
        content: "X";
    }

    td {
        padding: 2px 10px 3px 10px;
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
</style>
<div class="mainpanel">
    <div class="section">
        <div class="page-title">
            <div class="title-details">
                <h4>View Survey details on Map</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                        <li class="breadcrumb-item">GIS Map</li>
                        <li class="breadcrumb-item active" aria-current="page">Survey Map</li>
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
                                                <ul>
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
                                                </ul>


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
                                        <div class="form-group row">
                                            <label class="col-12 col-md-12 col-xl-12 control-label"
                                                for="demo-email-input"><strong>Filter Type</strong></label>
                                            <div class="col-12 col-md-12 col-xl-12">
                                                <select class="form-control" id="filterType">
                                                    <option value='seasonWise'>Season Wise</option>
                                                    <option value='dateWise'>Date Wise</option>
                                                </select>
                                            </div>
                                        </div>

                                        <!-- Season wise filters Starts -->
                                        <div class="form-group row seasonOpts">
                                            <label class="col-12 col-md-12 col-xl-12 control-label"
                                                for="demo-email-input"><strong>Year</strong></label>
                                            <div class="col-12 col-md-12 col-xl-12">
                                                <select class="form-control" id="year">
                                                    <option value=''>--Select Year</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row seasonOpts">
                                            <label class="col-12 col-md-12 col-xl-12 control-label"
                                                for="demo-email-input"><strong>Season</strong></label>
                                            <div class="col-12 col-md-12 col-xl-12">
                                                <select class="form-control" id="season">
                                                    <option>--Select Season--</option>
                                                </select>
                                            </div>
                                        </div>


                                        <!-- Datewise filters starts -->
                                        <div class="form-group row dateOpts">
                                            <label class="col-12 col-md-12 col-xl-12 control-label"
                                                for="demo-email-input"><strong>From Date</strong></label>
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
                                                for="demo-email-input"><strong>To Date</strong></label>
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


                                        <div class="form-group row pad-ver">
                                            <div class="col-12 col-md-12 col-xl-12 disease">
                                                <div class="mb-2">
                                                    <strong>Disease</strong>
                                                </div>
                                                <!-- Radio Buttons-->
                                                <div class="radio">
                                                    <input id="demo-form-radio" class="magic-radio sampleyes"
                                                        type="radio" name="disease-button"> <label
                                                        for="demo-form-radio">Leaf Rust</label>
                                                </div>

                                                <div class="radio">
                                                    <input id="demo-form-radio-2" class="magic-radio sampleno"
                                                        type="radio" name="disease-button" checked=""> <label
                                                        for="demo-form-radio-2">Steam Rust</label>
                                                </div>

                                                <div class="radio">
                                                    <input id="demo-form-radio5" class="magic-radio sampleyes"
                                                        type="radio" name="disease-button"> <label
                                                        for="demo-form-radio5">Yellow Rust</label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group row p-2">
                                            <label class="col-12 col-md-12 col-xl-12 control-label"
                                                for="demo-email-input" id="severityBtn">
                                                <strong>Severity</strong>
                                                <i class="float-right fa fa-plus" aria-hidden="true"></i></label>
                                           
                                            <div class="col-12 col-md-12 col-xl-12" id="severity">
                                               <!--  <select class="form-control" id="severity">
                                                    <option>All Severity</option>
                                                </select> -->
                                            </div>
                                        </div>
                                     
                                        <div class="form-group row p-2" style='margin-top:-20px;'>
                                            <label class="col-12 col-md-12 col-xl-12 control-label"
                                                for="demo-email-input" id="growthStageBtn"><strong>Growth
                                                    Stage</strong>
                                                    <i class="float-right fa fa-plus" aria-hidden="true"></i></label>
                                            <div class="col-12 col-md-12 col-xl-12" id="growthStage">
                                               <!--  <select class="form-control" id="growthStage">
                                                    <option>All Growth Stage</option>
                                                </select> -->
                                            </div>
                                        </div>


                                        <!-- Season wise filters Ends -->




                                        
                                        <input type="button" class="btn buttonfill mb-5 mt-3" value="Show All"
                                            id="showSurveyData">

                                    </div>


                                </div>

                            </div>

                            <!-- Popup content -->
                            <div id="popup" class="ol-popup">
                                <a href="#" id="popup-closer" class="ol-popup-closer"></a>
                                <div id="popup-content"></div>
                            </div>
                            <link href="wrsis/css/bootstrap-datepicker.min.css" rel="stylesheet">
                            <script src="wrsis/js/bootstrap-datepicker.min.js"></script>
                            <script>
                                /*****GIS/OPENLAYERS MAP CODE*****/
                                /****DEVELOPED BY TARUN KUMAR MEHER :: DATE:21-01-2020****/
                                
                                var sevBox=0;
                                var growBox=0;
                                $("#severityBtn").click(function(){
									$("#severity").slideToggle();
									$(this).find('i').toggleClass('fa-plus fa-minus');									
                                });
                                $("#growthStageBtn").click(function(){
									$("#growthStage").slideToggle();
									$(this).find('i').toggleClass('fa-plus fa-minus');	
                                });


                                /*Get GIS Master Data here upon document id ready*/
                                $(document).ready(function () {
                                    var data = { "seasonId": "2" };

                                    var settings = {
                                        "url": "api/getMasterDataforGIS",
                                        "method": "POST",
                                        "timeout": 0,
                                        "headers": {
                                            "Content-Type": "application/json"
                                        },
                                        "data": JSON.stringify(data),
                                    };

                                    $.ajax(settings).done(function (response) {
                                        var data = JSON.parse(response);

                                        if (data.msg == "successful" && data.status == "200") {
                                            /**Year**/
                                            $("#year").html("");
                                            $("#year").append("<option value='" + data.response.yearList[0] + "' selected>" + data.response.yearList[0] + "</option>");
                                            for (var i = 1; i < data.response.yearList.length; i++) {
                                                $("#year").append("<option value='" + data.response.yearList[i] + "'>" + data.response.yearList[i] + "</option>");
                                            }


                                            /**Disease list**/
                                            $(".disease").html("");
                                            $(".disease").append("<div class='mb-2'><strong>Disease</strong></div>");
                                            for (var i = 0; i < data.response.diseaseData.length; i++) {
                                                if (i == 0) {
                                                    $(".disease").append("<div class='radio'><input id='" + data.response.diseaseData[i].rustId + "' class='magic-radio sampleno' type='radio' name='disease-button' value='" + data.response.diseaseData[i].rustId + "' checked><label for='" + data.response.diseaseData[i].rustId + "'>" + data.response.diseaseData[i].rustName + "</label></div>");
                                                } else {
                                                    $(".disease").append("<div class='radio'><input id='" + data.response.diseaseData[i].rustId + "' class='magic-radio sampleno' type='radio' name='disease-button' value='" + data.response.diseaseData[i].rustId + "'><label for='" + data.response.diseaseData[i].rustId + "'>" + data.response.diseaseData[i].rustName + "</label></div>");
                                                }
                                            }


                                            /**Severity Data**/
                                           /* $("#severity").html("");
                                            $("#severity").append("<option value=''>All Severity</option>");
                                            for (var i = 0; i < data.response.severityData.length; i++) {
                                                $("#severity").append("<option value='" + data.response.severityData[i].seveId + "'>" + data.response.severityData[i].seveName + "</option>");
                                            }*/
                                            $("#severity").html("");
                                            for (var i = 0; i < data.response.severityData.length; i++) {
                                                $("#severity").append("<div class='form-check'><input type='checkbox' class='severityData form-check-input' id='severity"+i+"' value='" + data.response.severityData[i].seveId + "'><label class='form-check-label' for='severity"+i+"'>" + data.response.severityData[i].seveName+"</label></div>");
                                            }



                                            /**Growth Stage Data**/
                                           /* $("#growthStage").html("");
                                            $("#growthStage").append("<option value='' selected>All Growth Stage</option>");
                                            for (var i = 0; i < data.response.growthData.length; i++) {
                                                $("#growthStage").append("<option value='" + data.response.growthData[i].gsId + "'>" + data.response.growthData[i].gsName + "</option>");
                                            }*/
                                            $("#growthStage").html("");
                                            for (var i = 0; i < data.response.growthData.length; i++) {
                                                $("#growthStage").append("<div class='form-check'><input type='checkbox' class='growthStgData form-check-input' id='growth"+i+"' value='" + data.response.growthData[i].gsId + "'><label class='form-check-label' for='growth"+i+"'>" + data.response.growthData[i].gsName+"</label></div>");
                                            }

                                            /**Season Data**/
                                            $("#season").html("");
                                            for (var i = 0; i < data.response.seasonData.length; i++) {
                                                $("#season").append("<option value='" + data.response.seasonData[i].seaId + "'>" + data.response.seasonData[i].seaName + "</option>");
                                            }

                                            $("#season").val(data.response.yearSeasonData[0].seaId);

                                            loadSurveyData();
                                        }
                                    });

                                });


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




                                //Initializing map
                                var map = new ol.Map({
                                    layers: [raster],
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







                                /******FETCHING SURVEY DATA BY USER***********/
                                $("#showSurveyData").click(function () {
                                    loadSurveyData();
                                });
                                var wmsSource;
                                var surveyLayer = new ol.layer.Image({
                                    source: null
                                });
                                map.addLayer(surveyLayer);

                                /*Function load survey data and render on the map*/
                                function loadSurveyData() {

                                    overlay.setPosition(undefined);
                                    closer.blur();
                                    map.removeLayer(surveyLayer);
                                    var disease = $("input[name='disease-button']:checked").val();
                                    //var severity = $("#severity option:selected").text();
                                    //var growthData = $("#growthStage option:selected").text();
									var severity=[];
									$(".severityData:checked").each(function(){
										severity.push("'"+$(this).text()+"'");
									});

									var growthStage=[];
									$(".growthStgData:checked").each(function(){
										growthStage.push($(this).val());
									});
									
                                    /*Generating query below for CQL Filter in wms layer*/
                                    var filterQry = '';
                                    if (disease != '') {
                                        if (filterQry == '') {
                                            filterQry = "int_rust_id='" + disease + "'";
                                        } else {
                                            filterQry += " and int_rust_id='" + disease + "'";
                                        }
                                    }

                                   /* if (severity != 'All Severity') {
                                        if (filterQry == '') {
                                            filterQry = "vch_severity_type='" + severity + "'";
                                        } else {
                                            filterQry += " and vch_severity_type='" + severity + "'";
                                        }
                                    }*/
                                    if (severity.length!= 0) {
                                        if (filterQry == '') {
                                            filterQry = "vch_severity_type in(" + severity.join(",") + ")";
                                        } else {
                                            filterQry += " and vch_severity_type in(" + severity.join(",") + ")";
                                        }
                                    }
                                    

                                    /*if (growthData != 'All Growth Stage') {
                                        if ($("#growthStage").val() == 8) {
                                            if (filterQry == '') {
                                                filterQry = "int_stage_id in(-1, 8)";
                                            } else {
                                                filterQry += " and int_stage_id in(-1, 8)";
                                            }
                                        } else {
                                            if (filterQry == '') {
                                                filterQry = "int_stage_id=" + $("#growthStage").val() + "";
                                            } else {
                                                filterQry += " and int_stage_id=" + $("#growthStage").val() + "";
                                            }
                                        }
                                    }*/
                                    if (growthStage.length== 0) {
                                        if (filterQry == '') {
                                            filterQry = "int_stage_id in(-1, 8)";
                                        } else {
                                            filterQry += " and int_stage_id in(-1, 8)";
                                        }
                                    } else {
                                        if (filterQry == '') {
                                            filterQry = "int_stage_id in("+growthStage.join(",")+")";
                                        } else {
                                            filterQry += " and int_stage_id in("+growthStage.join(",")+")";
                                        }
                                    }
                                    

                                    if ($("#filterType").val() == 'seasonWise') {
                                        var year = $("#year").val();
                                        var seasonId = $("#season").val();
                                        if (year != '') {
                                            if (filterQry == '') {
                                                filterQry = "vch_year='" + year + ".0'";
                                            } else {
                                                filterQry += " and vch_year='" + year + ".0'";
                                            }
                                        }



                                        if (seasonId != '') {
                                            if (filterQry == '') {
                                                filterQry = "int_season_id='" + seasonId + "'";
                                            } else {
                                                filterQry += " and int_season_id='" + seasonId + "'";
                                            }
                                        }
                                    } else {
                                        var fromDate = $("#dateFrom").val().split("-").reverse().join("");
                                        var toDate = $("#dateTo").val().split("-").reverse().join("");
                                        //alert(fromDate)
                                        //alert(toDate)
                                        if (fromDate == '') {
                                            alert("Select From Date");
                                        }
                                        if (toDate == '') {
                                            alert("Select To Date");
                                        }

                                        if (fromDate != '' && toDate != '') {
                                            filterQry = filterQry + " and (survey_date_numeric<=" + toDate + " and survey_date_numeric>=" + fromDate + ")";
                                        }
                                    }
                                   // alert(filterQry)



                                    wmsSource = new ol.source.ImageWMS({
                                        url: '${GIS_URL}',
                                        params: { 'LAYERS': "${WORKSPACE}:view_survey_details", "CQL_FILTER": "" + filterQry + "" },
                                        serverType: "geoserver",
                                        crossOrigin: 'anonymous'
                                    });

                                    surveyLayer = new ol.layer.Image({
                                        source: wmsSource
                                    });

                                    map.addLayer(surveyLayer);
                                }



                                /*Popup data fetching from the layer and showing on the screen upon clicking on the map*/
                                map.on('singleclick', function (evt) {
                                    var viewResolution = /** @type {number} */ (map.getView().getResolution());
                                    var coordinate = ol.proj.toLonLat(evt.coordinate);
                                    var url = wmsSource.getGetFeatureInfoUrl(
                                        evt.coordinate,
                                        viewResolution,
                                        "EPSG:3857",
                                        "EPSG:4326",
                                        { INFO_FORMAT: "text/xml" }
                                    );


                                    if (measurementVal == 1) {
                                        if (url) {
                                            var x = new XMLHttpRequest();
                                            x.open("GET", url, true);
                                            x.send();
                                            x.onreadystatechange = function () {
                                                if (x.readyState == 4 && x.status == 200) {
                                                    var resText = x.responseText.split("\n");
                                                    var monthArray = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                                                    var surveyDate = resText[4].split("=")[1].split("-")[2] + " " + monthArray[Number(resText[4].split("=")[1].split("-")[1]) - 1] + " " + resText[4].split("=")[1].split("-")[0];
                                                    var rust_details = JSON.parse(resText[24].split("=")[1]);
                                                    var surveyDetailsTemplate = '';
                                                    for (var i = 0; i < rust_details.length; i++) {
                                                        surveyDetailsTemplate += "<tr><th>Severity " + rust_details[i].vch_rust_type + "</th><td>" + rust_details[i].vch_severity_type + "</td></tr><tr><th>Incident " + rust_details[i].vch_rust_type + "</th><td>" + rust_details[i].vch_incident_type + "</td></tr>"
                                                    }
                                                    var areaHA = resText[17].split("=")[1].trim() == "" ? 'NA' : resText[17].split("=")[1];
                                                    var surveySite = resText[14].split("=")[1].trim() == 'null' ? 'NA' : resText[14].split("=")[1];
                                                    var wheatType = resText[15].split("=")[1].trim() == 'null' ? 'NA' : resText[15].split("=")[1];
                                                    var growthStage = resText[13].split("=")[1].trim() == 'null' ? 'NA' : resText[13].split("=")[1];
                                                    content.innerHTML = "<div><div class='heading'><strong>Survey Detail</strong></div><div style='padding:5px 10px;'><table><tr><th>Survey No.</th><td>" + resText[3].split("=")[1] + "</td></tr><tr><th>Survey Date</th><td>" + surveyDate + "</td></tr><tr><th>Location</th><td>" + resText[25].split("=")[1] + "</td></tr><tr><th>Surveyor</th><td>" + resText[27].split("=")[1] + "</td></tr><tr><th>Institution</th><td>" + resText[26].split("=")[1] + "</td></tr><tr><th>Survey Site</th><td>" + surveySite + "</td></tr><tr><th>Wheat Type</th><td>" + wheatType + "</td></tr><tr><th>Growth Stage</th><td>" + growthStage + "</td></tr><tr><th>Area (ha)</th><td>" + areaHA + "</td></tr><tr><th>Altitude</th><td>" + resText[10].split("=")[1] + "</td></tr>" + surveyDetailsTemplate + "<tr><th>Comment</th><td>" + resText[28].split("=")[1] + "</td></tr></table></div></div>";
                                                    overlay.setPosition(evt.coordinate);
                                                } else {
                                                    overlay.setPosition(undefined)
                                                    closer.blur();
                                                }
                                            }
                                        }
                                    }

                                });





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
                                $("#filterType").change(function () {
                                    if ($(this).val() == 'dateWise') {
                                        $(".seasonOpts").hide();
                                        $(".dateOpts").show();
                                    } else {
                                        $(".seasonOpts").show();
                                        $(".dateOpts").hide();
                                    }
                                });


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







                            </script>
                        </div>
                    </form>
                    <!--===================================================-->
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    $(document).ready(function () {
        $('#action').on('change', function () {
            if (this.value == '2')
            //.....................^.......
            {
                $("#remark").show();
            }
            else {
                $("#remark").hide();
            }
        });


        // Map Expand collapse

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


    });



</script>


<script language="JavaScript">
    var card = document.getElementById("action")[0].value;
    function validateForm(f) {
        if (action.value == 0) {
            alert("Please select Action");
            return false;
        }
        else
            return true;
    }
    function checkData(field) {
        if (action.value == 2 && field.value === "") {
            alert("Please enter the remark.");
        }
    }


</script>