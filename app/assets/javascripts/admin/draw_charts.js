window.onload = function () {
	var chart1 = new CanvasJS.Chart("chartbar", {
		theme: "theme2",//theme1
		title:{
			text: "Basic Column Chart - CanvasJS"              
		},
		animationEnabled: true,   // change to true
		exportEnabled: true,
		data: [              
		{
			// Change type to "bar", "area", "spline", "pie",etc.
			type: "column",
			dataPoints: [
				{ label: "apple",  y: 10  },
				{ label: "orange", y: 15  },
				{ label: "banana", y: 25  },
				{ label: "mango",  y: 30  },
				{ label: "grape",  y: 28  }
			]
		}
		]
	});
	chart1.render();


	var chart = new CanvasJS.Chart("chartContainer",
  {
    title:{
      fontFamily: "arial black"
    },
    animationEnabled: true,
    exportEnabled: true,
    legend: {
      verticalAlign: "bottom",
      horizontalAlign: "center"
    },
    theme: "theme1",
    data: [
    {        
      type: "pie",
      indexLabelFontFamily: "Garamond",       
      indexLabelFontSize: 20,
      indexLabelFontWeight: "bold",
      startAngle:0,
      indexLabelFontColor: "MistyRose",       
      indexLabelLineColor: "darkgrey", 
      indexLabelPlacement: "inside", 
      toolTipContent: "{name}: {y}",
      showInLegend: true,
      dataPoints: [
        {  y: 30, name: "New Student", legendMarkerType: "triangle"},
        {  y:  40, name: "Returning", legendMarkerType: "square"},
        {  y:  50, name: "Status Pending", legendMarkerType: "circle"}
      ]
    }
    ]
  });
  chart.render();
}