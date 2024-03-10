<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


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
    text-align: center;
    color: #fff;
    margin-top: 50px;
}

#form {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center; /* Center vertically */
    margin-top: 20px;
}

fieldset {
    border: none;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.5);
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    width: 90%; /* Adjust width for responsiveness */
    max-width: 400px; /* Max width for larger screens */
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

h2 {
    text-align: center;
    margin-top: 20px;
}

h2 a {
    color: #FF5733;
    text-decoration: none;
    transition: color 0.3s ease;
}

h2 a:hover {
    color: #FF7F00;
}

@media screen and (max-width: 600px) {
    fieldset {
        width: 100%; /* Full width on smaller screens */
    }
}
</style>


</head>
<body>
<h1>Add Your Car!!!</h1>
<form action="addCar" method="post" id="form">
    <fieldset>
        <input type="number" placeholder="Enter CarId" name="CarId" required="required">
        <input type="text" placeholder="Enter CarModel" name="CarModel" required="required">
        <input type="text" placeholder="Enter CarBrand" name="CarBrand" required="required">
        <input type="number" placeholder="Enter CarPrice" name="CarPrice" required="required">
        <input type="submit" onclick="add()" value="Add">
    </fieldset>
</form>

<h2 style="text-align: center;"><a href="home.jsp">Go Back to home</a></h2>
</body>
</html>
