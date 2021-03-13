<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ModifyRecords</title>
</head>
<body>
<%!
	public void modifyRecords(){
		//will have to change the url and username and password before submiting
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		
		
		Statement statement = null;
		
		try {	
			Class.forName("com.mysql.jdbc.Driver");
			// Set up connection parameters
			String userName = "[username]";
			String password = "[password]";
			String dbServer = "jdbc:mysql://mysql.cs.iastate.edu/[schema]";

			// Set up connection
			connection = DriverManager.getConnection(dbServer, userName, password);

			statement = connection.createStatement();
			statement.addBatch("UPDATE students SET name = 'Scott' WHERE ssn =  746897816;");
			
			statement.executeBatch();
			
			System.out.println("Records have been modified.");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in Modify records: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	%>
		<%
		String button = request.getParameter("button1");
		out.println("Click \"Submit\" To modify records.");

		if ("Submit".equals(button)) {
			modifyRecords();
			String redirectURL = "ModifyRecordsResult.jsp";
			response.sendRedirect(redirectURL);
		}
	%>

	<form method="post">
		<input type="submit" name="button1" value="Submit" />

	</form>

</body>
</html>