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

<div class="row">

</div>

<script>



// Create the chart
Highcharts.chart('barchart1', {
  chart: {
    type: 'column',
	options3d: {
      enabled: true,
      alpha: 45
		
	  
    }
  },
  title: {
    text: 'Current Tender List'
  },
  subtitle: {
    text: 'Tender List of 2018'
  },
  xAxis: {
    type: 'category'
  },
  yAxis: {
    title: {
      text: 'Total Tenders'
    }

  },
  legend: {
    enabled: false
  },
  exporting: { enabled: false },
  plotOptions: {
    series: {
      borderWidth: 0,
      dataLabels: {
        enabled: true,
        format: '{point.y:.1f}%'
      }
    }
  },

  tooltip: {
    headerFormat: '<span style="font-size:18px">{series.name}</span><br>',
    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
  },

  "series": [
    {
      "name": "Browsers",
      "colorByPoint": true,
      "data": [
        {
          "name": "january",
          "y": 62.74,
          
        },
        {
          "name": "February",
          "y": 41.57,
          
        },
        {
          "name": "March",
          "y": 37.23,
          
        },
        {
          "name": "April",
          "y": 55.58,
          
        },
        {
          "name": "May",
          "y": 44.02,
          
        }
      ]
    }
  ],
});

<!-- Donut Chart-->




Highcharts.chart('donut1', {
  chart: {
    type: 'pie',
    options3d: {
      enabled: true,
      alpha: 45
    }
  },
    exporting: { enabled: false },
	  legend: {
    enabled: true
  },

  title: {
    text: 'Participants Details'
  },
  subtitle: {
    text: 'Area wise Participants Details'
  },
  plotOptions: {
    pie: {
      innerSize: 100,
      depth: 60
    }
  },
  series: [{
    name: 'Delivered amount',
    data: [
      ['Mombasa', 10],
      ['Nairobi', 8],
      ['Kisumu', 2],
      ['Eldoret', 6],

    ]
  }]
});


    </script>
    
    

    