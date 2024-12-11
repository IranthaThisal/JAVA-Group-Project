<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
     <%
       HttpSession session1 = request.getSession(false);
    
    
      if (session1 == null || session1.getAttribute("user_id") == null) {
       
        response.sendRedirect("admin_login.jsp");
    }
 %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema</title>
    <!-- MATERIAL CDN  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp"
      rel="stylesheet">

      <style>
                </style>
</head>
<body>
      
    <div class="container"> 
        
         <!-- ASIDE BAR STARTS HERE  -->
        <aside>
            

            <div class="top">
                <div class="logo">
                    <h2 style="color:white;">multi<span style="color: red;">flex</span></h2>
                </div>

                <div class="close" id="close-btn" onclick="closesidebar()">
                    <span class="material-icons-sharp">close</span>
                </div>
            </div>

            <div class="sidebar" id="sidebar">

                <a href="dashboard_home.jsp">
                    <span class="material-icons-sharp">grid_view</span>
                    <h3>Dashboard</h3>
                </a>
                
                <a href="admin.jsp">
                    <span class="material-icons-sharp">person_outline</span>
                    <h3>Admins</h3>
                </a>
                
                <a href="booking_dashboard.jsp">
                    <span class="material-icons-sharp">receipt_long</span>
                    <h3>Bookings</h3>
                </a>
                <a href="comments.jsp">
                    <span class="material-icons-sharp">mail_outline</span>
                    <h3>Comments</h3>
                    <span class="message-count">99</span>
                </a>
                
                <a href="movie.jsp">
                    <span class="material-icons-sharp">inventory</span>
                    <h3>Movies</h3>
                </a>
                <a href="tickets.jsp">
                    <span class="material-icons-sharp">insights</span>
                    <h3>Tickets</h3>
                </a>
                <a href="movie_category.jsp">
                <span class="material-icons-sharp">category</span>
                    <h3>Movie Categories</h3>
                </a>
                <a href="add_movie.jsp">
                    <span class="material-icons-sharp">add</span>
                    <h3>Add Movie</h3>
                </a>
                <a href="add_movie_category.jsp" class="active">
                    <span class="material-icons-sharp">queue</span>
                    <h3>Add Movie Category</h3>
                </a>
                <a href="add_ticket.jsp">
                    <span class="material-icons-sharp">queue</span>
                    <h3>Add Movie Tickets</h3>
                </a>
                <a href="logout.jsp">
                    <span class="material-icons-sharp">logout</span>
                    <h3>Log out</h3>
                </a>
            </div>
        </aside>





            <!-- add category -->
            <div class="form-container">
                <h2>Add category</h2>
                <p>Fill all the required fields below</p>
                
                <!-- add category form starts here -->
                <form action="movieCategoryServlet" method="POST" >
                    <div class="row">
                        <div class="column">
                            <label for="title">Category Name</label>
                            <input type="text" name="title" id="title" placeholder="Category Title" required="">
                        </div>

                    </div>



                    <div class="row">
                        <div class="column">
                            <label for="description">Category Description</label>
                            <textarea name="description" id="" cols="30" rows="10" placeholder="Category Description" required=""></textarea>
                        </div>
                    </div>

                   <div class="row">
                    <div class="column">
                        
                        <a href="movie_category.jsp" class="submit" style="background-color: blue;">Back</a>
                        <input class="submit" type="submit" name="submit" value="Add Category">
                        
                    </div>
                   </div>
                </form>
                <!-- add category form ends here -->

     
            </div>

    </div>
</body>
</html>