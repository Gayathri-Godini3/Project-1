<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Library Management System</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles.css">
</head>
<body>
    <h1>Welcome to the Library Management System</h1>
      <p>Our Library Management System project aims to provide a robust platform for 
    managing books, students, and transactions within a library setting. The system 
    facilitates operations such as adding new books, managing student information, and 
    tracking book borrowing and return transactions.</p>
    <center><img src="https://files.codingninjas.in/article_images/custom-upload-1681454804.webp" height=250 width=500></center><br>
    <h2>Interacting with Library</h2>
    <div class="button-container">
	    <ul>
	        <li><a href="<%= request.getContextPath() %>/books.jsp"><button>Manage Books</button></a></li>
	        <li><a href="<%= request.getContextPath() %>/students.jsp"><button>Manage Students</button></a></li>
	        <li><a href="<%= request.getContextPath() %>/transactions.jsp"><button>Manage Transactions</button></a></li>
	    </ul>
	    <ul>
	    	<li><a href="<%= request.getContextPath() %>/reportsPage.jsp"><button>Reports</button></a></li>
	    </ul>
	</div>
    </center>
    
    <!--  
    <h2>Generate Reports</h2>
    <div class="report-section">
        <form action="ExportToPDFServlet" method="post">
            <button type="submit">Export Books to PDF</button>
        </form>
        <form action="ExportToExcelServlet" method="post">
            <button type="submit">Export Books to Excel</button>
        </form>
    </div>-->
</body>
</html>