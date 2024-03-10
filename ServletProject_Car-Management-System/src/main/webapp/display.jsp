<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manjiro Auto</title>
</head>
 
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #222;
        color: #fff;
        margin: 0;
        padding: 0;
    }

    .container {
        margin: 20px auto;
        max-width: 100%; /* Adjust maximum width to fill the viewport */
        overflow-x: auto; /* Enable horizontal scrolling on small screens */
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #333;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        border-radius: 10px;
        overflow: hidden;
    }

    table th,
    table td {
        padding: 12px 15px;
        text-align: left;
    }

    table th {
        background-color: #111;
        color: #FFD700;
        font-weight: bold;
        text-transform: uppercase;
        border-bottom: 2px solid #FFD700;
    }

    table tr:nth-child(even) {
        background-color: #444;
        transition: background-color 0.3s ease;
    }

    table tr:hover {
        background-color: #555;
        transition: background-color 0.3s ease;
    }

    a {
        text-decoration: none;
        color: #FFD700;
    }

    a:hover {
        color: #FFA500;
    }

    .btn-container {
        text-align: center;
        margin-top: 20px;
    }

    .button {
        background-color: #FFD700;
        border: none;
        color: #222;
        padding: 12px 24px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-bottom: 20px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .button:hover {
        background-color: #FFA500;
    }

    h2 {
        text-align: center;
        margin-top: 20px;
    }
</style>
 
<body>
	<%
	ResultSet rs = (ResultSet) request.getAttribute("carDetails");
	%>

	<table border="">
		<tr>
			<th>CarId</th>
			<th>CarModel</th>
			<th>CarBrand</th>
			<th>CarPrice</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>

		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getInt(4)%></td>
			<td><a href="UpdateCar?carId=<%=rs.getInt(1)%>">Update</a></td>
			<td><a href="DeleteCar?CarId=<%=rs.getInt(1)%>">Delete</a></td>
		</tr>
		<%
		}
		%>
	</table>
	
	<h2><a href="home.jsp">Go Back to home</a></h2>
</body>
</html>