var rustYear = null;
var rustSeasonId = null;
var rustDateFrom = null;
var rustDateTo = null;
var rustHighcharts = null;

var surveyYear = null;
var surveySeasonId = null;
var surveyDateFrom = null;
var surveyDateTo = null;
var surveyHighcharts = null;

var recYear = null;
var recSeasonId = null;
var recDateFrom = null;
var recDateTo = null;
var recHighcharts = null;

var currentYear = null;
var currentSeasonId = null;

var docReady=null;
function fetchCurrentYearSeason() {
	$.ajax({
		type : "POST",
		url : 'getCurrentYearSeason',
		cache : false,
		async : false,
		success : function(data) {
			var response = JSON.parse(data)
			currentYear = response.year;
			currentSeasonId = response.seasonid;
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
}

var rustDataArray = new Array();

function rustChart(rustYear, rustSeasonId, rustDateFrom, rustDateTo,docReady) {
	$.ajax({
		type : "POST",
		url : 'getRustTypeChartReportAjax',
		data : {
			"year" : rustYear,
			"seasonId" : rustSeasonId,
			"dateFrom" : rustDateFrom,
			"dateTo" : rustDateTo
		},
		cache : false,
		async : false,
		success : function(data) {
			json = atob(data);
			// alert(json);
			json = JSON.parse(json);
			var rustchart = json;
			// alert(rustchart)
			var total = 0;

			if(rustchart.length<=0){
				  $("#chartContainerPai").hide()
				  if(docReady==1){
					  swal("No record found")
				  }
			  }else{
				  $("#chartContainerPai").show()
			  }
			
			for (i = 0; i < rustchart.length; i++) {
				// total += rustchart[i].y;
				var data = [ rustchart[i].label, rustchart[i].y ];
				rustDataArray.push(data);
			}
			for (i = 0; i < rustchart.length; i++) {
				var js = rustchart[i];
				js.data = js.y;
				js.y = (((js.y) * 100) / total);
				rustchart[i] = js;
			}
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});

	// Rust Type Statistics
	// Build the chart
	rustHighcharts = Highcharts.chart('chartContainerPai', {
		chart : {
			plotBackgroundColor : null,
			plotBorderWidth : null,
			plotShadow : false,
			type : 'pie'
		},
		title : {
			text : ''
		},
		tooltip : {
			pointFormat : '{point.y}: <b>{point.percentage:.1f}%</b>'
		},
		accessibility : {
			point : {
				valueSuffix : '%'
			}
		},
		colors : [ '#da6366', '#246b9c', '#e3a821' ],
		plotOptions : {
			pie : {
				allowPointSelect : true,
				cursor : 'pointer',
				dataLabels : {
					enabled : true,
					format : '{point.percentage:.1f} %',
					distance : -30,
				},
				showInLegend : true
			}
		},
		series : [ {
			name : 'Brands',
			colorByPoint : true,
			data : rustDataArray
		} ]
	});

}

var regionArray = new Array();
var surveyRegionArr = new Array();
var incidentRegionArr = new Array();
var surveyDataArray = new Array();
var yArray = null;

function surveyChart(surveyYear, surveySeasonId, surveyDateFrom, surveyDateTo,docReady) {
	$
			.ajax({
				type : "POST",
				url : 'getSurveyIvrIncidentChartReportAjax',
				data : {
					"year" : surveyYear,
					"seasonId" : surveySeasonId,
					"dateFrom" : surveyDateFrom,
					"dateTo" : surveyDateTo
				},
				cache : false,
				async : false,
				success : function(data) {
					json = atob(data);
					// alert(json);
					json = JSON.parse(json);
					
					var surveychart = json;
					// console.log(surveychart)
					var objkeys = Object.keys(surveychart);
					// push region names into the regionArray(no duplicate)
					
					if(surveychart.survey==null && surveychart.incident==null){
						  $("#chartContainerBar").hide()
						  if(docReady==1){
							  swal("No record found")
						  }
					  }else{
						  $("#chartContainerBar").show()
					  }
					
					for (var i = 0; i < objkeys.length; i++) {
						if(surveychart[objkeys[i]]!=null){
							for (var j = 0; j < surveychart[objkeys[i]].length; j++) {
								var region = ((surveychart[objkeys[i]])[j].label)
								if (regionArray.indexOf(region) > -1) {
								} else {
									regionArray.push(region);
								}
							}
						}
					}
					// push regions present in survey and incident into
					// surveyRegionArr and IncidentRegionArr respectively
					for (var i = 0; i < objkeys.length; i++) {
						if (objkeys[i] == "survey" && surveychart.survey!=null) {
							for (var j = 0; j < surveychart[objkeys[i]].length; j++) {
								surveyRegionArr
										.push((surveychart[objkeys[i]])[j].label);
							}
						}
						if (objkeys[i] == "incident" && surveychart.incident!=null) {
							for (var j = 0; j < surveychart[objkeys[i]].length; j++) {
								incidentRegionArr
										.push((surveychart[objkeys[i]])[j].label);
							}
						}
					}
					// console.log("SR=" + surveyRegionArr)
					// console.log("IR=" + incidentRegionArr)
					// console.log(regionArray)

					// create data for chart
					for (var i = 0; i < objkeys.length; i++) {
						if (objkeys[i] == "survey" && surveychart.survey!=null) {
							yArray = new Array();
							for (var j = 0; j < regionArray.length; j++) {
								var region = regionArray[j];

								if (surveyRegionArr.includes(region, 0)) {
									var ydata = (surveychart[objkeys[i]])[surveyRegionArr
											.indexOf(region, 0)].y;
									yArray.splice(regionArray.indexOf(region),
											0, ydata);
								} else {
									var ydata = 0;
									yArray.splice(regionArray.indexOf(region),
											0, ydata);
								}
							}
							var obj = {
								name : objkeys[i].toUpperCase(),
								data : yArray
							}
							surveyDataArray.push(obj);
						}
						if (objkeys[i] == "incident" && surveychart.incident!=null) {
							yArray = new Array();
							for (var j = 0; j < regionArray.length; j++) {
								var region = regionArray[j];

								if (incidentRegionArr.includes(region, 0)) {
									var ydata = (surveychart[objkeys[i]])[incidentRegionArr
											.indexOf(region, 0)].y;
									yArray.splice(regionArray.indexOf(region),
											0, ydata);
								} else {
									var ydata = 0;
									yArray.splice(regionArray.indexOf(region),
											0, ydata);
								}
							}
							var obj = {
								name : objkeys[i].toUpperCase(),
								data : yArray
							}
							surveyDataArray.push(obj);
						}
					}
					// console.log("regionArray="+regionArray)
					// console.log(surveyDataArray)
				},
				error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
			});

	// Survey Statistics
	// Build the chart
	surveyHighcharts = Highcharts
			.chart(
					'chartContainerBar',
					{
						chart : {
							type : 'column'
						},
						title : {
							text : ''
						},

						xAxis : {
							categories : regionArray,
							crosshair : true
						},
						yAxis : {
							min : 0,
							title : {
								text : 'Count'
							}
						},
						tooltip : {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y} </b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						},
						colors : [ '#246b9c', '#e3a821', '#01a15c' ],
						plotOptions : {
							column : {
								pointPadding : 0,
								borderWidth : 0
							},
							series: {
					            pointWidth: 25	
					        }
						},
						series : surveyDataArray
					});
}

var montharr = new Array();
var surveyMonthArr = new Array();
var monitorMonthArr = new Array();
var recDataArray = new Array();

function recChart(recYear, recSeasonId, recDateFrom, recDateTo,docReady) {
	$.ajax({
		type : "POST",
		url : 'getRecomChartReportAjax',
		data : {
			"year" : recYear,
			"seasonId" : recSeasonId,
			"dateFrom" : recDateFrom,
			"dateTo" : recDateTo
		},
		cache : false,
		async : false,
		success : function(data) {
			json = atob(data);
			// alert(json);
			json = JSON.parse(json);
			var recchart = json;
			// console.log(recchart)
			var objkeys = Object.keys(recchart);

			if(recchart.linemonitorsurvey==null && recchart.linemonitomonitoring==null){
				  $("#chartContainerLine").hide()
				  //alert(docReady)
				  if(docReady==1){
					  swal("No record found")
				  }
			  }else{
				  $("#chartContainerLine").show()
			  }
			// Push months present in both keys into montharr (no duplicate)
			for (var i = 0; i < objkeys.length; i++) {
				if (recchart[objkeys[i]] != null) {
					for (var j = 0; j < recchart[objkeys[i]].length; j++) {
						var month = ((recchart[objkeys[i]])[j].label)
						if (montharr.indexOf(month) > -1) {
						} else {
							montharr.push(month);
						}
					}
				}
			}

			// push months present in survey and monitor into surveyMonthArr and
			// IncidentMonthArr respectively

			for (var i = 0; i < objkeys.length; i++) {
				if (objkeys[i] == "linemonitomonitoring"
						&& recchart[objkeys[i]] != null) {
					for (var j = 0; j < recchart[objkeys[i]].length; j++) {
						monitorMonthArr.push((recchart[objkeys[i]])[j].label);
					}
				}
				if (objkeys[i] == "linemonitorsurvey"
						&& recchart[objkeys[i]] != null) {
					for (var j = 0; j < recchart[objkeys[i]].length; j++) {
						surveyMonthArr.push((recchart[objkeys[i]])[j].label);
					}
				}
			}
			// console.log( monitorMonthArr)
			// console.log( surveyMonthArr)

			// create data for chart
			for (var i = 0; i < objkeys.length; i++) {
				// debugger
				yArray = new Array();
				var dataName = null;
				for (var j = 0; j < montharr.length; j++) {
					var month = montharr[j];
					if (objkeys[i] == "linemonitomonitoring"
							&& monitorMonthArr.includes(month, 0)) {
						var ydata = (recchart[objkeys[i]])[monitorMonthArr
								.indexOf(month, 0)].y;
						yArray.splice(montharr.indexOf(month), 0, ydata);
						dataName = 'Monitor';
					}
					if (objkeys[i] == "linemonitorsurvey"
							&& surveyMonthArr.includes(month, 0)) {
						var ydata = (recchart[objkeys[i]])[surveyMonthArr
								.indexOf(month, 0)].y;
						yArray.splice(montharr.indexOf(month), 0, ydata);
						dataName = 'Survey';
					}
				}
				if (dataName != null) {
					var obj = {
						name : dataName,
						data : yArray
					}
					recDataArray.push(obj);
				}
			}
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});

	// console.log(montharr)
	// console.log(recDataArray)

	recHighCharts = Highcharts.chart('chartContainerLine', {
		chart : {
			type : 'line'
		},
		title : {
			text : ''
		},
		xAxis : {
			categories : montharr
		},
		yAxis : {
			title : {
				text : 'Survey Record'
			}
		},
		colors : [ '#e3a821', '#01a15c' ],
		plotOptions : {
			column : {
				pointPadding : 0,
				borderWidth : 2,
				borderRadius : 5
			},
			line : {
				dataLabels : {
					enabled : true
				},
				enableMouseTracking : false
			}
		},
		series : recDataArray
	});
}

$(document)
		.ready(
				function() {

					$("#radioSeasonRust").prop("checked", true);
					$(".rustDate").hide();
					$("#rustDateFrom").val("");
					$("#rustDateTo").val("");
					$("#radioSeasonSurvey").prop("checked", true);
					$(".surveyDate").hide();
					$("#surveyDateFrom").val("");
					$("#surveyDateTo").val("");
					$("#radioSeasonRec").prop("checked", true);
					$(".recDate").hide();
					$("#recDateFrom").val("");
					$("#recDateTo").val("");

					rustYear = "";
					rustSeasonId = "";
					rustDateFrom = "";
					rustDateTo = "";

					surveyYear = "";
					surveySeasonId = "";
					surveyDateFrom = "";
					surveyDateTo = "";

					recYear = "";
					recSeasonId = "";
					recDateFrom = "";
					recDateTo = "";

					fetchCurrentYearSeason()

					rustChart(rustYear, rustSeasonId, rustDateFrom, rustDateTo)
					$("#dropdownYearRust").val(currentYear)
					$("#seasonIdRust").val(currentSeasonId)
					surveyChart(surveyYear, surveySeasonId, surveyDateFrom,
							surveyDateTo)
					$("#dropdownYearSurvey").val(currentYear)
					$("#seasonIdSurvey").val(currentSeasonId)
					// debugger
					recChart(recYear, recSeasonId, recDateFrom, recDateTo)
					$("#dropdownYearRec").val(currentYear)
					$("#seasonIdRec").val(currentSeasonId)

					// hi chart

					// Rust Type Statistics
					// Build the chart
					/*
					 * Highcharts.chart('chartContainerPai', { chart: {
					 * plotBackgroundColor: null, plotBorderWidth: null,
					 * plotShadow: false, type: 'pie' }, title: { text: '' },
					 * tooltip: { pointFormat: '{series.name}:
					 * <b>{point.percentage:.1f}%</b>' }, accessibility: {
					 * point: { valueSuffix: '%' } }, colors:
					 * ['#da6366','#246b9c','#e3a821'], plotOptions: { pie: {
					 * allowPointSelect: true, cursor: 'pointer', dataLabels: {
					 * enabled: true, format: '{point.percentage:.1f} %',
					 * distance: -30, }, showInLegend: true } }, series: [{
					 * name: 'Brands', colorByPoint: true, data: [{ name:
					 * 'Yellow Rust', y: 30, sliced: true, selected: true }, {
					 * name: 'leaf Rust', y: 30 }, { name: 'Stem Rust', y: 40 }] }]
					 * });
					 */

					// Rust Survey vs Rust Incident
					/*
					 * Highcharts.chart('chartContainerBar', { chart: { type:
					 * 'column' }, title: { text: '' },
					 * 
					 * xAxis: { categories: [ 'Amhara', 'Oromia', 'Somali',
					 * 'South' ], crosshair: true }, yAxis: { min: 0, title: {
					 * text: '' } }, tooltip: { headerFormat: '<span
					 * style="font-size:10px">{point.key}</span><table>',
					 * pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}:
					 * </td>' + '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
					 * footerFormat: '</table>', shared: true, useHTML: true },
					 * colors: ['#246b9c','#e3a821','#01a15c'], plotOptions: {
					 * column: { pointPadding: 0, borderWidth: 2, borderRadius:
					 * 5 } }, series: [{ name: 'Survey', data: [243, 212, 236]
					 *  }, { name: 'IVR', data: [236, 186, 172 ]
					 *  }, { name: 'Incident', data: [243, 272, 309 ]
					 *  }] });
					 */

					// Monitoring Progress
					/*
					 * Highcharts.chart('chartContainerLine', { chart: { type:
					 * 'line' }, title: { text: '' }, xAxis: { categories:
					 * ['Jun', 'Jul', 'Aug', 'Sep'] }, yAxis: { title: { text: '' } },
					 * colors: ['#e3a821','#01a15c'], plotOptions: { column: {
					 * pointPadding: 0, borderWidth: 2, borderRadius: 5 }, line: {
					 * dataLabels: { enabled: true }, enableMouseTracking: false } },
					 * series: [{ name: 'Survey', data: [7, 20, 25, 40] }, {
					 * name: 'Monitor', data: [17, 25, 35, 50] }] });
					 */ 		


// Rust Incidence Progress

Highcharts.chart('rustincidence', {
																																		chart  : {
											type : 'bar',
										},
										title : {
											text : ''
										},
										subtitle : {
											text : ''
										},
										xAxis : {
											categories : [ 'Leaf Rust',
													'Stem Rust', 'Yellow Rust' ],
											title : {
												text : null
											}
										},
										yAxis : {
											min : 0,
											title : {
												text : '',
												align : 'high'
											},
											labels : {
												overflow : 'justify'
											}
										},
										tooltip : {
											valueSuffix : ' millions'
										},
										colors : [ '#246b9c', '#e3a821' ],
										plotOptions : {
											bar : {
												dataLabels : {
													enabled: true
    }
}
},
legend: {
											layout : 'vertical',
											align : 'right',
											verticalAlign : 'top',
											x : -40,
											y : 80,
											floating : true,
											borderWidth : 1,
											backgroundColor : Highcharts.defaultOptions.legend.backgroundColor
													|| '#FFFFFF',
											shadow : true
										},
										credits : {
											enabled : false
										},
										series : [ {
											name : 'Serverity',
											data : [ 107, 31, 635 ]
										}, {
											name : 'Incidence',
											data : [ 133, 156, 947 ]
										} ]
									});

					/*$(".p-search1").click(function() {
						$(".portletf1").slideToggle();
					});

					$(".p-search2").click(function() {
						$(".portletf2").slideToggle();
					});

					$(".p-search3").click(function() {
						$(".portletf3").slideToggle();
					});*/
				});



function changeRustSearchBy(qType) {
	//debugger
	if (qType == 0) {
		$("#dropdownYearRust").val(currentYear)
		$("#seasonIdRust").val(currentSeasonId)
		$(".rustSeason").show();
		$(".rustDate").hide();
		$("#rustDateFrom").val("");
		$("#rustDateTo").val("");
	}
	if (qType == 1) {
		$(".rustSeason").hide();
		$("#dropdownYearRust").val("");
		$("#seasonIdRust").val("");
		$(".rustDate").show();
	}
}
function changeSurveySearchBy(qType) {
	//debugger
	if (qType == 0) {
		$("#dropdownYearSurvey").val(currentYear)
		$("#seasonIdSurvey").val(currentSeasonId)
		$(".surveySeason").show();
		$(".surveyDate").hide();
		$("#surveyDateFrom").val("");
		$("#surveyDateTo").val("");
	}
	if (qType == 1) {
		$(".surveySeason").hide();
		$("#dropdownYearSurvey").val("");
		$("#seasonIdSurvey").val("");
		$(".surveyDate").show();
	}
}
function changeRecSearchBy(qType) {
	//debugger
	if (qType == 0) {
		$("#dropdownYearRec").val(currentYear)
		$("#seasonIdRec").val(currentSeasonId)
		$(".recSeason").show();
		$(".recDate").hide();
		$("#recDateFrom").val("");
		$("#recDateTo").val("");
	}
	if (qType == 1) {
		$(".recSeason").hide();
		$("#dropdownYearRec").val("");
		$("#seasonIdRec").val("");
		$(".recDate").show();
	}
}