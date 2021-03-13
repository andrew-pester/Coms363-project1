<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%!public static Connection connect = null;
	public static Statement stmt = null;

	Statement statement = null;

	public List<String> Query1() {
		List<String> list = new ArrayList<>();

		try {
			createConnection();

			ResultSet rs = statement.executeQuery("SELECT snum, ssn FROM students where name = 'Becky';");
			list = createList(rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in query: " + e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	public List<String> Query2() {
		List<String> list = new ArrayList<>();

		try {
			createConnection();

			ResultSet rs = statement.executeQuery(
					"Select name, level from degrees where department_code = (select code from departments where name = 'Computer Science');");
			list = createList(rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in query: " + e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	public List<String> Query3() {
		List<String> list = new ArrayList<>();

		try {
			createConnection();

			ResultSet rs = statement.executeQuery(
					"SELECT c.number, c.name FROM courses c JOIN departments d on c.department_code = d.code WHERE d.name = 'Computer Science' or d.name = 'Landscape Architect';");
			list = createList(rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in query: " + e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	public List<String> createList(ResultSet rs) throws SQLException {
		List<String> list = new ArrayList<>();
		ResultSetMetaData rsmd = rs.getMetaData();
		int numCol = rsmd.getColumnCount();
		while (rs.next()) {
			for (int i = 1; i <= numCol; i++) {
				list.add(rs.getString(i));
			}
		}
		return list;
	}

	public void createConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			// Set up connection parameters
			String userName = "[username]";
			String password = "[password]";
			String dbServer = "jdbc:mysql://mysql.cs.iastate.edu/[schema]";

			// Set up connection
			connect = DriverManager.getConnection(dbServer, userName, password);

			statement = connect.createStatement();
			// this works now
		} catch (Exception e) {

		}

	}%>
	<%
	String button1 = request.getParameter("button1");
	if ("Q1".equals(button1)) {
		List<String> ret = Query1();
		session.setAttribute("amount", ret.size());
		int count = 0;
		for (int i = 0; i < ret.size(); i++) {
			if (i % 2 == 0) {
		session.setAttribute("snum" + count, ret.get(i));
			} else {
		session.setAttribute("ssn" + count++, ret.get(i));
			}
		}
		String redirectURL = "QueryResult1.jsp";
		response.sendRedirect(redirectURL);

	}

	String button2 = request.getParameter("button2");

	if ("Q2".equals(button2)) {
		List<String> ret = Query2();
		session.setAttribute("amount", ret.size());
		int count = 0;
		for (int i = 0; i < ret.size(); i++) {
			if (i % 2 == 0) {
		session.setAttribute("n" + count, ret.get(i));
			} else {
		session.setAttribute("l" + count++, ret.get(i));
			}
		}
		String redirectURL = "QueryResult2.jsp";
		response.sendRedirect(redirectURL);
	}
	String button3 = request.getParameter("button3");

	if ("Q3".equals(button3)) {
		List<String> ret = Query3();
		session.setAttribute("amount", ret.size());
		int count = 0;
		for (int i = 0; i < ret.size(); i++) {
			if (i % 2 == 0) {
		session.setAttribute("num" + count, ret.get(i));
			} else {
		session.setAttribute("name" + count++, ret.get(i));
			}
		}
		String redirectURL = "QueryResult3.jsp";
		response.sendRedirect(redirectURL);
	}
	%>

	<form method="post">
		<h3>Click "Q1" to see result of query 1</h3>
		<input type="submit" name="button1" value="Q1" />

	</form>
	<form method="post">
		<h3>Click "Q2" to see result of query 2</h3>
		<input type="submit" name="button2" value="Q2" />

	</form>
	<form method="post">
		<h3>Click "Q3" to see result of query 3</h3>
		<input type="submit" name="button3" value="Q3" />

	</form>


</body>
</html>