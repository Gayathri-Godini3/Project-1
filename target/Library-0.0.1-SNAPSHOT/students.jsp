<%@ page import="java.util.List" %>
<%@ page import="com.example1.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles.css">
    <script>
        function confirmDelete(studentId, studentName) {
            if (confirm('Are you sure you want to delete the student "' + studentName + '" with Student ID: ' + studentId + '?')) {
                alert('Student "' + studentName + '" with Student ID: ' + studentId + ' has been deleted.');
                return true;
            }
            return false;
        }
    </script>
</head>
<body>
	  <center>
    <h2>Students in the Library</h2>
    <form action="<%= request.getContextPath() %>/students" method="post">
    	<input type="hidden" name="action" value="add">
    	<table>
    		<tr>
    			<th>Student ID:</th>
    			<td><input type="text" name="studentId" ></td>
    		</tr>
    		<tr>
    			<th>Student Name:</th>
    			<td><input type="text" name="name"></td>
    		</tr>
    		<tr>
    			<td colspan="2"><center><input type="submit" value="Add Student"></center></td>
    		</tr>
    	</table>
        <!-- Student ID: <input type="text" name="studentId"><br>
        Name: <input type="text" name="name"><br>
        <input type="submit" value="Add Student"> -->
    </form>
    <hr>
    <h3>Student List</h3>
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>
    <table border="1">
        <thead>
            <tr style="background-color: #4CAF50">
                <th>Student ID</th>
                <th>Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
	        List<Student> students = (List<Student>) request.getAttribute("students");
	        if (students != null && !students.isEmpty()) {
	            for (Student student : students) { 
        %>
            <tr>
                <td><%= student.getStudentId() %></td>
                <td><%= student.getName() %></td>
                <td>
                    <!--  <form action="<%= request.getContextPath() %>/students" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">
                        <input type="submit" value="Delete">
                    </form>-->
                    <a href="<%= request.getContextPath()  %>/students?action=delete&studentId=<%=student.getStudentId() %>"
                    	onclick="return confirmDelete('<%= student.getStudentId() %>','<%= student.getName()  %>');">Delete</a>
                </td>
            </tr>
        <% 
            	}
	        }
	        else{
        %>
        	<tr>
        		<td colspan="3"><center>No students found</center></td>
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