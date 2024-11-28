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
                <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" href="./css/LoginStyle.css">
                <script src="./js/LogingJS.js"></script>
        </head>
        <%
            Cookie[] cookies=request.getCookies();
            String uname = "";
            boolean rememberme = false;
            if(cookies != null){
               for (Cookie cookie : cookies) {
                   if (cookie.getValue().equals("unamecookie")) {
                        uname = cookie.getValue();
            }
                   if (cookie.getValue().equals("remembermecookie")) {
                        rememberme = cookie.getValue().equals("true");
                   } 
            }           
            } 

        %>
            <body>
               <div class="glass-container">
                <div class="login">
                    <h2>Login</h2><br>
                    <form action="SignUpservlet" method="POST" name="login">
                        <H2>Hi! welcome back! Please log into your account.</H2><br>
                        Username<input type="text" name="Loguname" value=<%= uname %>><br><br>
                        Password<input type="password" name="Logpswd">
                        <a href="Account_Recovery.jsp">Forget password?</a><br><br>
                <div class="options">
                    Remember me<input type="checkbox" name="rememberme" <%= rememberme ? "checked" : "" %>>  <br><br>              
                </div>
                <button type="submit" name="Login" value="Login" onclick="validateform()">Login</button>
                <button type="reset" name="Clear" value="Clear">Clear</button><br><br>
                <p>Don't have an account? <a href="./Register.jsp">Register</a></a></p>
                    </form>
                </div>
               </div> 
            </body>        
</html>