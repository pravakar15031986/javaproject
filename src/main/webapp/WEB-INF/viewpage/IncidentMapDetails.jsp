<link rel="stylesheet" href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
<!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
<script
    src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
<script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>

<style>
    #map {
        height: 600px;
    }

    .dateOpts {
        display: none;
    }

    /**MODAL STYLE**/
    .popupModal {
        display: none;
        /* Hidden by default */
        position: fixed;
        /* Stay in place */
        z-index: 99;
        /* Sit on top */
        padding-top: 4rem;
        /* Location of the box */
        left: 0;
        top: 0;
        width: 100%;
        /* Full width */
        height: 100%;
        /* Full height */
        overflow: auto;
        /* Enable scroll if needed */
        background-color: rgb(0, 0, 0);
        /* Fallback color */
        background-color: rgba(0, 0, 0, 0.4);
        /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content1 {
        position: relative;
        background-color: whitesmoke;
        font-size: .8rem;
        margin: auto;
        padding: 0;
        border: 1px solid #83a750;
        border-radius: 5px;
        width: 60%;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        -webkit-animation-name: animatebottom;
        -webkit-animation-duration: 0.6s;
        animation-name: animatebottom;
        animation-duration: 0.4s
    }

    /* Add Animation */
    @-webkit-keyframes animatebottom {
        from {
            top: -300px;
            opacity: 0
        }

        to {
            top: 0;
            opacity: 1
        }
    }

    @keyframes animatebottom {
        from {
            top: -300px;
            opacity: 0
        }

        to {
            top: 0;
            opacity: 1
        }
    }

    /* The Close Button */
    .popupModalClose1 {
        color: white;
        float: right;
        font-size: 28px;
        margin-right: 10px;
    }

    .popupModalClose1:hover,
    .popupModalClose1:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    .modal-header1 {
        background: #83a750;
        border-radius: 0;
        color: white;
        padding: 1rem 1rem 1.5rem 1rem;
    }

    .modal-body1 {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    }

    .modal-footer1 {
        padding: 1px 20px 20px 0px;
        color: white;
        text-align: right;
        border-top: 2px solid #dee2e6;
        ;
        background-color: #efefef;
    }



    #modalClose1 {
        border-radius: 3px;
        padding: .3rem 1rem;
        /* font-weight: bold; */
        font-size: medium;
        margin-top: .5rem;
        background-color: #fff;
        border-color: rgba(0, 0, 0, 0.07) !important;
        color: #7a878e;

        box-shadow: 2px 2px 5px gray;
    }

    #modalClose1:hover {
        /* background-color: rgb(144, 197, 69, 0.7); */
        cursor: pointer;
        box-shadow: 2px 2px 5px gray;
    }

    .modalTable {
        width: 100%;

    }

    .modalTable td {
        padding: 5px;
    }

    .tableHead {
        background-color: rgb(144, 197, 69);
        color: white;
        font-weight: bold;
        padding: 5px;
        font-size: medium;
    }

    /**MODAL STYLE**/
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
        width: 300px;
        max-width: 500px;
        font-size: 14px;
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
        margin-top: 7px;
        width: 100%;
        font-size: 13px;
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
        padding: 2px 5px 3px 5px;
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
    }

    .mapfilter {
        width: 220px;
        position: absolute;
        right: 20px;
        top: 15px;
        padding: 0 0 0 30px;
    }

    .expand {
        right: 15px;
        background: rgba(0, 0, 0, 0.82);
        padding: 4px 8px;
        left: auto;
        position: absolute;
        top: 13px;
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
</style>
<div class="mainpanel">
    <div class="section">
        <div class="page-title">
            <div class="title-details">
                <h4>View Incident Rust details on Map</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                        <li class="breadcrumb-item">GIS Map</li>
                        <li class="breadcrumb-item active" aria-current="page">Incident Map</li>
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
                                    <div class="col-sm-12">
                                        <div class="mapcontainer">
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
                                                      
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group row seasonOpts">
                                                <label class="col-12 col-md-12 col-xl-12 control-label"
                                                    for="demo-email-input"><strong>Season</strong></label>
                                                <div class="col-12 col-md-12 col-xl-12">
                                                    <select class="form-control" id="season">
                                                        
                                                    </select>
                                                </div>
                                            </div>

                                            <!-- Season wise filters Ends -->


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

                                <div id="alertModal" class="popupModal">

                                    <!-- Modal content -->
                                    <div class="modal-content1">
                                        <div class="modal-header1">
                                            <span class="popupModalClose1">x</span>
                                            <h4 style='display:inline-block;'>Rust Incident Questions</h4>
                                        </div>
                                        <div>
                                            <div class="modal-body1">
                                                <div
                                                    style="height:300px;overflow-x: auto;background-color: #e3e5e8;padding:10px;">
                                                    <table class='modalTable'></table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer1">
                                            <button type='button' id="modalClose1">Close</button>
                                        </div>
                                    </div>

                                </div>
                                <link href="wrsis/css/bootstrap-datepicker.min.css" rel="stylesheet">
                                <script src="wrsis/js/bootstrap-datepicker.min.js"></script>

                                <script>
                                    /*****GIS/OPENLAYERS MAP CODE*****/
                                    /****DEVELOPED BY TARUN KUMAR MEHER :: DATE:21-01-2020****/



                                    /*Get GIS Master Data here upon document id ready*/
                                    $(document).ready(function () {
                                        var data = {};

                                        var settings = {
                                            "url": "api/getMasterforRustIncidentMap",
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
                                                /**Disease list**/
                                                $("#year").html("");
                                                for (var i = 0; i < data.response.yearList.length; i++) {
                                                    $("#year").append("<option value='" + data.response.yearList[i] + "'>" + data.response.yearList[i] + "</option>");
                                                }


                                                /**Season Data**/
                                                $("#season").html("");
                                                for (var i = 0; i < data.response.seasonData.length; i++) {
                                                    $("#season").append("<option value='" + data.response.seasonData[i].seaId + "'>" + data.response.seasonData[i].seaName + "</option>");
                                                }
                                                //console.log(data.response)
                                                $("#year").val(data.response.yearSeasonData[0].year);
                                                $("#season").val(data.response.yearSeasonData[0].seaId);

                                                loadRustIncidentData();
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
                                        loadRustIncidentData();
                                    });
                                    var wmsSource;
                                    var incidentLayer = new ol.layer.Image({
                                        source: null
                                    });
                                    map.addLayer(incidentLayer);

                                    /*Function load rust incident data and render on the map*/
                                    function loadRustIncidentData() {
                                        overlay.setPosition(undefined);
                                        closer.blur();
                                        map.removeLayer(incidentLayer);

                                        /*Generating query below for CQL Filter in wms layer*/
                                        var filterQry = '';
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
                                                filterQry = "numeric_incident_date<=" + toDate + " and numeric_incident_date>=" + fromDate + "";
                                            }
                                        }

                                        //alert(filterQry)


                                        wmsSource = new ol.source.ImageWMS({
                                            url: '${GIS_URL}',
                                            params: { 'LAYERS': "${WORKSPACE}:view_rustincident_details", "CQL_FILTER": "" + filterQry + "" },
                                            serverType: "geoserver",
                                            crossOrigin: 'anonymous'
                                        });

                                        incidentLayer = new ol.layer.Image({
                                            source: wmsSource
                                        })
                                        map.addLayer(incidentLayer);
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
                                                        var queAnsArr = JSON.parse(resText[10].split("=")[1]);
                                                        //console.log(resText)
                                                        $(".modalTable").html('');
                                                        var qList = '';
                                                        for (var i = 0; i < queAnsArr.length; i++) {
                                                            qList += '<tr><td><font style="font-weight:bold;color:red">Q ' + (i + 1) + '</font><strong> : ' + queAnsArr[i].vch_question + ' ?</strong></td></tr><tr><td><font style="font-weight:bold;color:green">A</font> : <font style="color:gray">' + queAnsArr[i].vch_option_info + '.</font></td></tr>';
                                                        }
                                                        $(".modalTable").append(qList);
                                                        $("#alertModal").show();
                                                    }
                                                }
                                            }
                                        }
                                    });



                                    var popupModal = document.getElementById("alertModal");
                                    $(".popupModalClose1").click(function () {
                                        $("#alertModal").hide();
                                    });
                                    $("#modalClose1").click(function () {
                                        $("#alertModal").hide();
                                    });
                                    window.onclick = function (event) {
                                        if (event.target == popupModal) {
                                            popupModal.style.display = "none";
                                        }
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
                                                sketch = evt.feature;


                                                $('.ol-overlay-container').find('.tooltip-static').hide();


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
                                        $('.ol-overlay-container').find('.tooltip-static').hide()
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