<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

	This is the result of query 1

	<%

int size = (int) session.getAttribute("amount");

Object[] ssn = new Object[size];

Object[] snum = new Object[size];

for (int i = 0; i <= size / 2; i++) {

	snum[i] = session.getAttribute("snum" + i);

	ssn[i] = session.getAttribute("ssn" + i);

}

%>


	<table>

		<tr>

			<th>snum</th>

			<th>ssn</th>

		</tr>

		<%

		for (int i = 0; i < size / 2; i++) {

		%>

		<tr>

			<td>

				<%

				out.print(snum[i]);

				%>

			</td>

			<td>

				<%

				out.print(ssn[i]);

				%>

			</td>

		</tr>

		<% } %>



	</table>

</body>

</html>