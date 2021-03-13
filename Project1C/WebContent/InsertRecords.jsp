<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Records</title>
</head>
<body>
<%!
	public void insertRecords(){
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
			
			statement.addBatch("use project1;");
			statement.addBatch( "INSERT INTO students(snum, ssn, name, gender, dob, c_addr, c_phone, p_addr, p_phone)"
	                + "VALUES (1001, 654651234, 'Randy', 'M', '2000/12/01', '301 E Hall', 5152700988, '121 Main', 7083066321),"
	                + "(1002, 123097834, 'Victor', 'M', '2000/05/06', '270 E Hall', 5151234578, '702 Walnut', 7080366333),"
	                + "(1003, 978012431, 'John', 'M', '1999/07/08', '201 E Hall', 5154132805, '888 University', 5152012011),"
	                + "(1004, 746897816, 'Seth', 'M', '1998/12/30', '199 N Hall',	5158891504,	'21 Green',	5154132907),"
	                + "(1005, 186032894, 'Nicole', 'F', '2001/04/01', '178 S Hall', 5158891155, '13 Gray', 5157162071),"
	                + "(1006, 534218752, 'Becky', 'F', '2001/05/16', '12 N Hall', 5157083698, '189 Clark', 2034367632),"
	                + "(1007, 432609519, 'Kevin', 'M', '2000/08/12', '75 E Hall', 5157082497, '89 National', 7182340772);");
			statement.addBatch("INSERT INTO departments(code, name, phone, college)"
	                + "VALUES (401, 'Computer Science', 5152982801, 'LAS')," + "(402, 'Mathematics', 5152982802, 'LAS'),"
	                + "(403, 'Chemical Engineering', 5152982803, 'Engineering'),"
	                + "(404, 'Landscape Architect', 5152982804, 'Design');");
			statement.addBatch( "INSERT INTO degrees(name, level, department_code)" + "VALUES ('Computer Science', 'BS', 401),"
	                + "('Software Engineering', 'BS', 401)," + "('Computer Science', 'MS', 401),"
	                + "('Computer Science','PhD', 401)," + "('Applied Mathematics','MS', 402),"
	                + "('Chemical Engineering','BS', 403)," + "('Landscape Architect','BS', 404);");
			statement.addBatch("INSERT INTO major(snum, name, level)" + "VALUES (1001, 'Computer Science', 'BS'),"
	                + "(1002, 'Software Engineering', 'BS')," + "(1003, 'Chemical Engineering', 'BS'),"
	                + "(1004, 'Landscape Architect', 'BS')," + "(1005, 'Computer Science', 'MS'),"
	                + "(1006, 'Applied Mathematics', 'MS')," + "(1007, 'Computer Science', 'PhD');");
			statement.addBatch("INSERT INTO minor(snum, name, level)" + "VALUES (1007, 'Applied Mathematics', 'MS'),"
	                + "(1005, 'Applied Mathematics', 'MS')," + "(1001, 'Software Engineering', 'BS');");
			statement.addBatch("INSERT INTO courses(number, name, description, credithours, level, department_code)"
	                + "VALUES (113, 'Spreadsheet', 'Microsoft Excel and Access', 3, 'Undergraduate', 401),"
	                + "(311, 'Algorithm', 'Design and Analysis', 3, 'Undergraduate', 401),"
	                + "(531, 'Theory of Computation', 'Theorem and Probability', 3, 'Graduate', 401),"
	                + "(363, 'Database', 'Design Principle', 3, 'Undergraduate', 401),"
	                + "(412, 'Water Management', 'Water Management', 3, 'Undergraduate', 404),"
	                + "(228, 'Special Topics', 'Interesting Topics about CE', 3, 'Undergraduate', 403),"
	                + "(101, 'Calculus', 'Limit and Derivative', 4, 'Undergraduate', 402);");
			statement.addBatch("INSERT INTO register(snum, course_number, regtime, grade)" + "VALUES (1001, 363, 'Fall2020', 3),"
	                + "(1002, 311, 'Fall2020', 4)," + "(1003, 228, 'Fall2020', 4)," + "(1004, 363, 'Spring2021', 3),"
	                + "(1005, 531, 'Spring2021', 4)," + "(1006, 363, 'Fall2020', 3)," + "(1007, 531, 'Spring2021', 4);");
			statement.executeBatch();
			
			System.out.println("Records have been inserted");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in insert records table: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	%>
	<%
		String button = request.getParameter("button1");
		out.println("Click \"Submit\" To insert data records.");

		if ("Submit".equals(button)) {
			insertRecords();
			String redirectURL = "InsertRecordsResult.jsp";
			response.sendRedirect(redirectURL);
		}
	%>
	<form method="post">
		<input type="submit" name="button1" value="Submit" />

	</form>

</body>
</html>