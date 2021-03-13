<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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

	This is the result of query 3

	<%

int size = (int) session.getAttribute("amount");

Object[] num = new Object[size];

Object[] name = new Object[size];

for (int i = 0; i <= size / 2; i++) {

	num[i] = session.getAttribute("num" + i);

	name[i] = session.getAttribute("name" + i);

}

%>


	<table>

		<tr>

			<th>number</th>

			<th>name</th>

		</tr>

		<%

		for (int i = 0; i < size / 2; i++) {

		%>

		<tr>

			<td>

				<%

				out.print(num[i]);

				%>

			</td>

			<td>

				<%

				out.print(name[i]);

				%>

			</td>

		</tr>

		<% } %>



	</table>

</body>

</html>