<%-- 
    Document   : Account_Recovery_Verification
    Created on : Nov 27, 2024, 9:19:44 PM
    Author     : Sasinima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
      int status = response.getStatus();
      System.out.println("123= "+ status);
      switch(status){
          case 1:
              response.getWriter().println(
                    "<h1>Recovery code has been successfully sent to your email.</h1><br>" +
                    "<form action='' method='Post'>" +
                    "Recovery Code: <input type='text' name='Recovery_code'><br>" +
                    "<input type='submit' name='submit' value='Recover'>" +
                    "</form>"
);

          break;
          case 2:
              response.getWriter().println("</h1>Email has successfully sent. Database error.</h1>");
           break;
          case 3:
              response.getWriter().println("<h1>Email has not successfully sent.</h1>");
           break;
          case 4:
              response.getWriter().println("<h1>Error!Email sending error.");
           break;
          case 5:
             response.getWriter().println("<h1>Error in the process.</h1>");
           break;
          default:
              response.getWriter().println("<h1>Error</h1>");
      }
    %>
    <body>
    </body>
</html>
