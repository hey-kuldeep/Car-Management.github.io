<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manjiro Auto</title>
    <link rel="stylesheet" href="styles.css">
  <style>

body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-image: url('https://images.pexels.com/photos/2922142/pexels-photo-2922142.jpeg?auto=compress&cs=tinysrgb&w=600');
    background-size: cover;
    background-position: center;
}

.content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    z-index: 1;
    color: #ffffff;
    width: 90%; /* Adjust width to fit within the viewport */
    max-width: 500px; /* Max width to prevent stretching on larger screens */
    margin: auto; /* Center horizontally */
}

h1 {
    font-size: 3em;
    margin-bottom: 20px;
}

.buttons {
    margin-top: 20px;
}

.button {
    background: transparent;
    border: 2px solid #FF5733;
    color: #FF5733;
    padding: 12px 24px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 0 10px;
    cursor: pointer;
    border-radius: 5px;
    position: relative;
    overflow: hidden;
    transition: color 0.3s ease, background-color 0.3s ease, border-color 0.3s ease;
}

.button::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    background: radial-gradient(circle, #FF5733 0%, #FF7F00 70%, transparent 100%);
    border-radius: 50%;
    transition: width 0.3s ease, height 0.3s ease;
    z-index: -1;
    transform: translate(-50%, -50%);
}

.button:hover::before {
    width: 200%;
    height: 200%;
    animation: glow 1s infinite alternate;
}

@keyframes glow {
    0% {
        box-shadow: 0 0 20px 5px #FF5733;
    }
    100% {
        box-shadow: 0 0 30px 10px #FF5733;
    }
}

.button:hover {
    color: white;
    background-color: #FF5733;
    border-color: #FF5733;
}

@media screen and (max-width: 600px) {
    .content {
        width: 100%;
    }
}

</style>

</head>

<body>

    <div class="content">
        <h1>Welcome To Car Dashboard!!</h1>
        <div class="buttons">
            <a href="AddCar.jsp" class="button">Add New Car</a>
            <a href="displayCar" class="button">Display All Cars</a>
        </div>
    </div>

</body>
</html>
