<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles.css">
</head>
<body>
	<h2>Generate Reports</h2>
    <form action="${pageContext.request.contextPath}/generateReport" method="get">
        <label for="reportType">Select Report Type:</label>
        <select name="reportType" id="reportType">
            <option value="totalBooksByAuthor">Total Books by Author</option>
            <option value="transactionsByDate">Transactions by Date</option>
            <option value="booksBorrowedByStudents">Books Borrowed by Students</option>
        </select>
        <button type="submit">Generate Report</button>
    </form>
    <hr>
    <h3>Export Reports</h3>
    <!--  <form action="exportToExcel" method="get">
        <label for="reportTypeExcel">Select Report Type for Excel:</label>
        <select name="reportType" id="reportTypeExcel">
            <option value="totalBooksByAuthor">Total Books by Author</option>
            <option value="transactionsByDate">Transactions by Date</option>
            <option value="booksBorrowedByStudents">Books Borrowed by Students</option>
        </select>
        <a href="${pageContext.request.contextPath}/exportToExcel?reportType=${reportType}"><button type="submit">Export to Excel</button></a>
    </form>
    
    <form action="exportToPDF" method="get">
        <label for="reportTypePDF">Select Report Type for PDF:</label>
        <select name="reportType" id="reportTypePDF">
            <option value="totalBooksByAuthor">Total Books by Author</option>
            <option value="transactionsByDate">Transactions by Date</option>
            <option value="booksBorrowedByStudents">Books Borrowed by Students</option>
        </select>
        <a href="${pageContext.request.contextPath}/exportToPDF?reportType=${reportType}"><button type="submit">Export to PDF</button></a>
    </form>-->
    <form action="${pageContext.request.contextPath}/exportToExcel" method="post">
        <input type="hidden" name="reportType" value="${reportType}">
        <input type="submit" value="Export to Excel">
    </form>

    <form action="${pageContext.request.contextPath}/exportToPDF" method="get">
        <input type="hidden" name="reportType" value="${reportType}">
        <input type="submit" value="Export to PDF">
    </form>
    
    <a href="index.jsp"><button>Back to Home</button></a>
</body>
</html>