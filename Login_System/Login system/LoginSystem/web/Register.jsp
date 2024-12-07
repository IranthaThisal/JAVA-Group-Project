<%-- 
    Document   : Register
    Created on : Nov 17, 2024, 7:38:19 PM
    Author     : Sasinima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/RegisterStyle.css">
    <script src="./js/RegisterJS.js"></script>
    <title>Register</title>
</head>
<body>
    <div class="glass-container">
        <div class="register-box">
            <h2>Create an Account</h2>
            <p>Fill in the details to register</p>
            <form action="RegisterServlet" method="POST" name="Register">
                <label for="RegFname">Full Name</label>
                <input type="text" id="RegFname" name="RegFname" placeholder="Enter your full name" required>

                <label for="Regemail">Email</label>
                <input type="email" id="Regemail" name="Regemail" placeholder="Enter your email" required>

                <label for="Regcontactno">Contact Number</label>
                <input type="text" id="Regcontactno" name="Regcontactno" placeholder="Enter your contact number" required>

                <label>Gender</label>
                <div class="gender-options">
                    <label><input type="radio" name="Reggender" value="Male" required> Male</label>
                    <label><input type="radio" name="Reggender" value="Female" required> Female</label>
                </div>

                <label for="RegDOB">Date of Birth</label>
                <input type="date" id="RegDOB" name="RegDOB" required>

                <label for="Regusername">Username</label>
                <input type="text" id="Regusername" name="Regusername" placeholder="Choose a username" required>

                <label for="Regpassword">Password</label>
                <input type="password" id="Regpassword" name="Regpassword" placeholder="Create a password" required>

                <label for="Regconpassword">Confirm Password</label>
                <input type="password" id="Regconpassword" name="Regconpassword" placeholder="Confirm your password" required>

                <div class="button-container">
                    <button type="submit" name="Register" value="Register" onclick="validateform()">Register</button>
                    <button type="reset" name="clear" value="Clear">Clear</button>
                </div>
            </form>
            <p>Already have an account? <a href="./Login.jsp">Login</a></p>
        </div>
    </div>
</body>
</html>
