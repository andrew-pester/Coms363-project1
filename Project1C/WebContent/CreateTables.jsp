<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%!
	public void createTable(){
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
			
			statement.addBatch( "CREATE TABLE students(" + "snum int," + "ssn int," + "name varchar(10)," + "gender varchar(1),"
	                + "dob date," + "c_addr varchar(20)," + "c_phone varchar(10)," + "p_addr varchar(20),"
	                + "p_phone varchar(10)," + "PRIMARY KEY (ssn)," + "UNIQUE (snum)" + ");");
			statement.addBatch("CREATE TABLE departments(" + "code int," + "name varchar(50)," + "phone varchar(10),"
	                + "college varchar(20)," + "PRIMARY KEY(code)," + "UNIQUE (name)" + ");");
			statement.addBatch( "CREATE TABLE degrees (" + "name varchar(50)," + "level varchar(5)," + "department_code int,"
	                + "PRIMARY KEY (name,level)," + "FOREIGN KEY (department_code) REFERENCES departments(code)"
	                + "ON DELETE CASCADE);");
			statement.addBatch("CREATE TABLE courses (" + "number int," + "name varchar(50)," + "description varchar(50),"
	                + "credithours int," + "level varchar(20)," + "department_code int," + "PRIMARY KEY (number),"
	                + "UNIQUE (name)," + "FOREIGN KEY (department_code) REFERENCES departments(code)"
	                + "ON DELETE CASCADE);");
			statement.addBatch("CREATE TABLE register(" + "snum int," + "course_number int," + "regtime varchar(20),"
	                + "grade int," + "PRIMARY KEY(snum, course_number),"
	                + "FOREIGN KEY(snum) REFERENCES students(snum) ON DELETE CASCADE,"
	                + "FOREIGN KEY(course_number) REFERENCES courses(number)" + "ON DELETE CASCADE);");
			statement.addBatch("CREATE TABLE major(" + "snum int," + "name varchar(50)," + "level varchar(5),"
	                + "PRIMARY KEY(snum, name, level)," + "FOREIGN KEY(snum) REFERENCES students(snum) ON DELETE CASCADE,"
	                + "FOREIGN KEY(name, level) REFERENCES degrees(name, level)" + "ON DELETE CASCADE);");
			statement.addBatch("CREATE TABLE minor(" + "snum int," + "name varchar(50)," + "level varchar(5),"
	                + "PRIMARY KEY(snum, name, level)," + "FOREIGN KEY(snum) REFERENCES students(snum) ON DELETE CASCADE,"
	                + "FOREIGN KEY(name, level) REFERENCES degrees(name, level)" + "ON DELETE CASCADE);");
			statement.executeBatch();
			
			System.out.println("Tables are created");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in create table: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	%>
		<%
		String button = request.getParameter("button1");
		out.println("Click Submit To Make Tables");

		if ("Submit".equals(button)) {
			createTable();
			String redirectURL = "CreateTablesResult.jsp";
			response.sendRedirect(redirectURL);
		}
	%>

	<form method="post">
		<input type="submit" name="button1" value="Submit" />

	</form>
</body>
</html>