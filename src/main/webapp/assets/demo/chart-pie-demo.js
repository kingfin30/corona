// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example

var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
	  type: 'pie',
	  data: {
	    labels: ["서울.경기", "강원", "충북", "충남","경북","경남","전북","전남","제주"],
	    datasets: [{
	      data: [108, 11, 13, 7, 31, 32, 7, 7, 11],
	      backgroundColor: ['#007bff','#FF8000', '#dc3545', '#ffc107', '#28a745', '#0B0B61','#8000FF','#FF00FF','#2E2E2E'],
	    }],
	  },
	});