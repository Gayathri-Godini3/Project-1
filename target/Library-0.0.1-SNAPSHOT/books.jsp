<%@ page import="java.util.List" %>
<%@ page import="com.example1.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles.css">
    <script>
        function confirmDelete(bookTitle, bookIsbn) {
            if (confirm('Are you sure you want to delete the book "' + bookTitle + '" with ISBN: ' + bookIsbn + '?')) {
                alert('Book "' + bookTitle + '" with ISBN: ' + bookIsbn + ' has been deleted.');
                return true;
            }
            return false;
        }
    </script>
</head>
<body>
	<center>
    <h2>Books in the Library</h2>
    <form action="<%= request.getContextPath() %>/books" method="post">
    	<table>
    		<tr>
    			<th>Title</th>
    			<td><input type="text" name="title"></td>
    		</tr>
    		<tr>
    			<th>Author</th>
    			<td><input type="text" name="author"></td>
    		</tr>
    		<tr>
    			<th>ISBN</th>
    			<td><input type="text" name="isbn"></td>
    		</tr>
    		<tr>
    			<td colspan="2"><center><input type="submit" value="Add Book"></center></td>
    		</tr>
    	</table>
        <!-- Title: <input type="text" name="title"><br>
        Author: <input type="text" name="author"><br>
        ISBN: <input type="text" name="isbn"><br>
        <input type="submit" value="Add Book"> -->
    </form>
    <hr>
    <h3>Book List</h3>
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>
    <table border="1">
        <thead>
            <tr style="background-color: #4CAF50">
                <th>Title</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <% 
            List<Book> books = (List<Book>) request.getAttribute("books");
            if (books != null) {
                for (Book book : books) { 
        %>
            <tr>
                <td><%= book.getTitle() %></td>
                <td><%= book.getAuthor() %></td>
                <td><%= book.getIsbn() %></td>
                <td>
                	<a href="<%= request.getContextPath() %>/books?action=delete&bookIsbn=<%=book.getIsbn() %>" 
                	onclick="return confirmDelete('<%= book.getTitle() %>', '<%= book.getIsbn() %>');">Delete</a>
                </td>
            </tr>
        <% 
                } 
            }
            else{
        %>
        	<tr>
        		<td colspan="4"><center>No books found</center></td>
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
