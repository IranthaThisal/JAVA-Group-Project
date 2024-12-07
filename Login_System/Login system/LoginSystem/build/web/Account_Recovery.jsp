<%-- 
    Document   : Account_Recovery
    Created on : Nov 24, 2024, 10:18:42 PM
    Author     : Sasinima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="Account_RecoveryServlet" method="POST">
        <h3>Enter the Email and the contact number to reset the password</h3><br>
        Email<input type="email" name="email"><br><br>
        contact number<input type="int" name="ConNumber"><br><br>  
        <input type="submit" name="submit" value="Submit" onclick="validateform()">
    </form>
</body>
</html>
