<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Manjiro Auto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<style>

body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-image: url('https://images.pexels.com/photos/2922142/pexels-photo-2922142.jpeg?auto=compress&cs=tinysrgb&w=600');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    height: 100vh;
}

    h1 {
        display: flex;
        justify-content: center;
        color: #fff;
        margin-top: 50px;
    }

    #form {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 20px;
    }

    fieldset {
        border: none;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.5);
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        width: 90%;
        max-width: 400px;
    }

    input[type="number"],
    input[type="text"],
    input[type="submit"] {
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #FF5733;
        border-radius: 5px;
        transition: border-color 0.3s ease;
        width: calc(100% - 22px); /* Adjusted width to account for padding and border */
    }

    input[type="number"]:hover,
    input[type="text"]:hover,
    input[type="submit"]:hover {
        border-color: #FFC300;
    }

    input[type="submit"] {
        background-color: #FF5733;
        color: #fff;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #FFC300;
    }

    @media screen and (max-width: 600px) {
        fieldset {
            width: 100%; /* Full width on smaller screens */
            padding: 10px; /* Adjusted padding for smaller screens */
        }

        input[type="number"],
        input[type="text"],
        input[type="submit"] {
            width: calc(100% - 20px); /* Adjusted width for smaller screens */
        }
    }
</style>

</head>
<body>

	<% ResultSet rs = (ResultSet)request.getAttribute("car");
      rs.next();
   %>
<h1>Update your Car Details</h1>

	<form action="savesUpdateCar" method="post" id="form">
		<fieldset>
		<input type="number" value="<%=rs.getInt(1) %>" name="CarId" readonly="readonly"><br>
	    <input type="text"  value="<%=rs.getString(2) %>"  name="CarModel" required="required"><br>
	    <input type="text"  value="<%=rs.getString(3) %>"  name="CarBrand" required="required"><br>
	    <input type="number"  value="<%=rs.getInt(4) %>"  name="CarPrice" required="required"><br>
	    <input type="submit" onclick="update()" value="Update">
		</fieldset>
	</form>


</body>
</html>