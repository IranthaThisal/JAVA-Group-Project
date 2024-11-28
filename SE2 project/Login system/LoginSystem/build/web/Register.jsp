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
                <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" href="./css/LoginStyle.css">
                <script src="./js/RegisterJS.js"></script>
        </head>  
            <body>
                <div>
                    <form action="RegisterServlet" method="POST" name="Register">
                       <h2>Register</h2><br>
                       Full Name<input type="text" name="RegFname"><br><br>
                       Email<input type="text" name="Regemail"><br><br>
                       Contact number<input type="text" name="Regcontactno"><br><br>
                       Gender<br>
                       <input type="radio" name="Reggender" value="Male">Male
                       <input type="radio" name="Reggender" value="Female">Female<br><br>
                       Date of birth<input type="text" name="RegDOB"><br><br>
                       Username<input type="text" name="Regusername"><br><br>
                       Password<input type="password" name="Regpassword"><br><br>
                       Confirm password<input type="password" name="Regconpassword"><br><br>

                       <input type="submit" name="Register" value="Register" onclick="validateform()">
                       <input type="reset" name="clear" value="Clear">
                    </form>
                </div>                
            </body>
</html>
