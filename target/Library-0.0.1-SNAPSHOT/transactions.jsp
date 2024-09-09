<%@ page import="java.util.List" %>
<%@ page import="com.example1.Transaction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Transactions</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles.css">
     <script>
        function confirmDelete(studentId, bookIsbn) {
            if (confirm('Are you sure you want to delete the transaction for Student ID: ' + studentId + ' and Book ISBN: ' + bookIsbn + '?')) {
                alert('Transaction for Student ID: ' + studentId + ' and Book ISBN: ' + bookIsbn + ' has been deleted.');
                return true;
            }
            return false;
        }
    </script>
</head>
<body>
	<center>
    <h2>Transactions</h2>
    <form action="<%= request.getContextPath() %>/transactions" method="post">
    	<input type="hidden" name="action" value="record">
    	<table>
    		<tr>
    			<th>Book ISBN:</th>
    			<td><input type="text" name="isbn"></td>
    		</tr>
    		<tr>
    			<th>Student ID:</th>
    			<td><input type="text" name="studentId"></td>
    		</tr>
    		
    		<tr>
    			<td colspan="2"><center><input type="submit" value="Record Transaction"></center></td>
    		</tr>
    	</table>
        </form>
    <hr>
    <h3>Transaction List</h3>
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>
    <table border="1">
        <thead>
            <tr style="background-color: #4CAF50">
                <th>Book ISBN</th>
                <th>Student ID</th>
                <th>Date Issued</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <% 
            List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
            if (transactions != null) {
                for (Transaction transaction : transactions) { 
        %>
            <tr>
                <td><%= transaction.getBook().getIsbn() %></td>
                <td><%= transaction.getStudent().getStudentId() %></td>
                <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(transaction.getDate()) %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/transactions?action=delete&studentId=<%=transaction.getStudent().getStudentId() %>&bookIsbn=<%=transaction.getBook().getIsbn() %>"
                    onclick="return confirmDelete('<%= transaction.getStudent().getStudentId()  %>', '<%= transaction.getBook().getIsbn() %>');">Delete</a> 
                   <!--  <form action="<%= request.getContextPath() %>/transactions" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="bookIsbn" value="<%= transaction.getBook().getIsbn() %>">
                        <input type="hidden" name="studentId" value="<%= transaction.getStudent().getStudentId() %>">
                        <input type="submit" value="Delete">
                    </form>-->
                </td>
            </tr>
        <% 
            	}
            }
            else{
        %>
        	<tr>
        		<td colspan="4"><center>No transactions found</center></td>
        	</tr>
        <%
            }
        %>
        </tbody>
    </table>
    <br>
        <button onclick="window.location.href='<%= request.getContextPath() %>/index.jsp'">Back to Home</button>
    
    </center>
</body>
</html>