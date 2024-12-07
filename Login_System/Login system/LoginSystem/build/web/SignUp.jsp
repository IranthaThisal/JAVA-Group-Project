<%-- 
    Document   : SignUp
    Created on : Nov 17, 2024, 7:32:46 PM
    Author     : Sasinima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/LoginStyle.css">
    <script src="./js/LoginJS.js"></script>
    <title>Login</title>
</head>
<body>
    <div class="glass-container">
        <div class="login-box">
            <h2>Welcome Back!</h2>
            <p>Please log into your account to continue.</p>
            <form action="SignUpservlet" method="POST" name="login">
                <label for="Loguname">Username</label>
                <input type="text" id="Loguname" name="Loguname" placeholder="Enter your username" required>
                <label for="Logpswd">Password</label>
                <input type="password" id="Logpswd" name="Logpswd" placeholder="Enter your password" required>
                <div class="additional-options">
                    <label>
                        <input type="checkbox" name="rememberme"> Remember me
                    </label>
                    <a href="Account_Recovery.jsp" class="forgot-link">Forgot password?</a>
                </div>
                <div class="button-container">
                    <button type="submit" name="Login" value="Login" onclick="validateform()">Login</button>
                    <button type="reset" name="Clear" value="Clear">Clear</button>
                </div>
                <p>Don't have an account? <a href="./Register.jsp">Register</a></p>
            </form>
        </div>
    </div>
</body>
</html>
