<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
	border: 1px solid black;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	This is the result of query 2
	<%
int size = (int) session.getAttribute("amount");
Object[] name = new Object[size];
Object[] level = new Object[size];
for (int i = 0; i <= size / 2; i++) {
	name[i] = session.getAttribute("n" + i);
	level[i] = session.getAttribute("l" + i);
}
%>

	<table>
		<tr>
			<th>name</th>
			<th>level</th>
		</tr>
		<%
		for (int i = 0; i < size / 2; i++) {
		%>
		<tr>
			<td>
				<%
				out.print(name[i]);
				%>
			</td>
			<td>
				<%
				out.print(level[i]);
				%>
			</td>
		</tr>
		<%
		}
		%>


	</table>
</body>
</html>