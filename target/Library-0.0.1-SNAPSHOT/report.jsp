<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<h2>Report: ${reportType}</h2>
    <canvas id="reportChart"></canvas>
    <script>
    
        /*var ctx = document.getElementById('reportChart').getContext('2d');
        var chartData = ${reportData}; // Ensure JSON data is properly formatted
        var labels = chartData.map(item => item.key); // Adjust based on your data structure
        var data = chartData.map(item => item.value); // Adjust based on your data structure
        var chartDataString = JSON.stringify(${reportData});
        var parsedChartData = JSON.parse(chartDataString);

        var labels = parsedChartData.map(item => item.key); 
        var data = parsedChartData.map(item => item.value); 
        */
        var chartData = JSON.parse('${reportData}');
        var labels = chartData.map(item => item.key); // Adjust based on your data structure
        var data = chartData.map(item => item.value); // Adjust based on your data structure

        var ctx = document.getElementById('reportChart').getContext('2d');
        
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Report Data',
                    data: data,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    <a href="exportToExcel?reportType=${reportType}">Export to Excel</a>
	<a href="exportToPDF?reportType=${reportType}">Export to PDF</a>
    
    <a href="index.jsp">Back to Home</a>
</body>
</html>