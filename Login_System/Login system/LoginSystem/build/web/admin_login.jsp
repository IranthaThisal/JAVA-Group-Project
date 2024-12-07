<%-- 
    Document   : AdminLogin
    Created on : Nov 17, 2024, 7:32:46 PM
    Author     : Sasinima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/AdminLoginStyle.css">
    <script src="./js/LoginJS.js"></script>
    <title>Admin Login</title>
</head>
<body>
    <div class="glass-container">
        <div class="login-box">
            <h2>Admin Login</h2>
            <p>Please log in to access the admin dashboard.</p>
            <form action="admin_login_servlet" method="POST" name="login">
                <label for="Admin_Loguname">Username</label>
                <input type="text" id="Admin_Loguname" name="Admin_Loguname" placeholder="Enter your username" required>
                
                <label for="Admin_Logpswd">Password</label>
                <input type="password" id="Admin_Logpswd" name="Admin_Logpswd" placeholder="Enter your password" required>
                
                <div class="additional-options">
                    <label>
                        <input type="checkbox" name="rememberme"> Remember me
                    </label>
                </div>
                <div class="button-container">
                    <button type="submit" name="Login" value="Login" onclick="validateform()">Login</button>
                    <button type="reset" name="Clear" value="Clear">Clear</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
