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
    <title>multiflex</title>
    <!-- MATERIAL CDN  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp"
      rel="stylesheet">

      <style>
         @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');

/* ROOT VARIABLES  */
:root{
    --color-primary: #ff0000;
    --color-danger: #ff7782;
    --color-success: #ff0000;
    --color-warning: #ffbb55;
    
    --color-info-dark: #7d8da1;
    --color-info-light: #2a2a2b;
    --color-dark: #363949;
    --color-light: rgba(132, 139, 200, 0.18);
    --color-primary-variant:#235e53;
    --color-dark-varient: #677483;


    --card-border-radious: 2rem;
    --border-radious-1: 0.4rem;
    --border-radious-2: 0.8rem;
    --border-radious-3: 1.2rem;

    --card-padding: 1.8rem;
    --padding-1: 1.2rem;

    --box-shadow: 0 2rem 3rem var(--color-light);

    --color-background:#181a1e;
    --color-white:#202528;
    --color-dark:#edeffd;
    --color-dark-varient:#a3bdcc;
    --color-light:rgba(0, 0, 0, 0.4);
    --box-shadow:0 2rem 3rem var(--color-light);

}

/* ---------dark theme variables--------- */
.dark-theme-variables{
    --color-background:#181a1e;
    --color-white:#202528;
    --color-dark:#edeffd;
    --color-dark-varient:#a3bdcc;
    --color-light:rgba(0, 0, 0, 0.4);
    --box-shadow:0 2rem 3rem var(--color-light);
}

*{
    margin: 0;
    padding: 0;
    outline: 0;
    appearance: none;
    border: 0;
    text-decoration: none;
    list-style: none;
    box-sizing: border-box;
}

html{
    font-size: 14px;
}

body{
    width: 100vw;
    height: 100vh;
    font-family: poppins,sans-serif;
    font-size: 0.88rem;
    background: var(--color-background);
    /* user-select: none; */
    overflow-x: hidden;
    color: var(--color-dark);
}

.container{
    display: grid;
    width: 96%;
    margin: 0 auto;
    gap: 1.8rem;
    grid-template-columns: 14rem auto 23rem;
}

a{
    color: var(--color-dark);
}

img{
    display: block;
    width: 100%;
}

h1{
    font-weight: 800;
    font-size: 1.8rem;
}

h2{
    font-size: 1.4rem;
}

h3{
    font-size: 0.87rem;
}

h4{
    font-size: 0.8rem;
}

h5{
    font-size: 0.77rem;
}

small{
    font-size: 0.75rem;
}

.profile-photo{
    width: 2.8rem;
    height: 2.8rem;
    border-radius: 50%;
    overflow: hidden;
}

.txt-center{
    text-align: center;
}

.text-muted{
    color: var(--color-info-dark);
}

p{
    color: var(--color-dark-varient);
}

b{
    color: var(--color-dark);
}

.primary{
    color: var(--color-primary);
}

.danger{
    color: var(--color-danger);
}

.success{
    color: var(--color-success);
}

.warning{
    color: var(--color-warning);
}

/* button  */
.submit{
    padding: 10px 20px;
    font-size: 15px;
    border-radius: var(--border-radious-1);
    font-weight: 600;
    color: #fff;
    background-color: var(--color-primary);
    cursor: pointer;
    transition: 300ms ease;
}

.submit:hover{
    background-color: #5a6aff;
}


/* ============ SIDE BAR ============= */
aside{
    height: 100vh;
}

aside .top{
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 1.4rem;

}

aside .close{
    display: none;
}

aside .sidebar{
    display: flex;
    flex-direction: column;
    height: 86vh;
    position: relative;
    top: 3rem;
}

aside h3{
    font-weight: 500;
}

aside .sidebar a{
    display: flex;
    color: var(--color-info-dark);
    margin-left: 2rem;
    gap: 1rem;
    align-items: center;
    position: relative;
    height: 3.7rem;
    transition: all 300ms ease;
}

aside .sidebar a span{
    font-size: 1.6rem;
    transition: all 300ms ease;
}

aside .sidebar a:last-child{
    position: absolute;
    bottom: 2rem;
    width: 100%;
}

aside .sidebar a.active{
    background: var(--color-light);
    color: var(--color-primary);
    margin-left: 0;
}

aside .sidebar a.active::before{
    content: "";
    width: 6px;
    height: 100%;
    background: var(--color-primary);
}

aside .sidebar a.active span{
    color: var(--color-primary);
    margin-left: calc(1rem - 3px);
}


aside .sidebar a:hover span{
    margin-left: 1rem;
}

aside .sidebar .message-count{
    background: var(--color-danger);
    color: var(--color-white);
    padding: 2px 10px;
    font-size: 11px;
    border-radius: var(--border-radious-1);
}


/* ============ MAIN ============= */

main{
    margin: 1.4rem;
}

main .insights{
   display: grid;
   grid-template-columns: repeat(3, 1fr);
   gap: 1.6rem;
}

main .insights > div{
    background: var(--color-white);
    padding: var(--card-padding);
    border-radius: var(--card-border-radious);
    margin-top: 1rem;
    box-shadow: var(--box-shadow);
    transition: all 300ms ease;
    user-select: none;
}

main .insights > div:hover{
    box-shadow: none;
}

main .insights > div span{
    background: var(--color-primary);
    padding: 0.5rem;
    border-radius: 50%;
    color: var(--color-white);
    font-size: 2rem;
}

main .insights > div.category span{
    background: var(--color-danger);
}

main .insights > div.income span{
    background: var(--color-success);
}

main .insights > div .middle {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

main .insights .progress{
    position: relative;
    width: 92px;
    height: 92px;
    border-radius: 50%;
}

main .insights svg{
    width: 7rem;
    height: 7rem;
}

main .insights svg circle{
    fill: none;
    stroke: var(--color-primary);
    stroke-width: 14px;
    stroke-linecap: round;
    transform: translate(5px, 5px);
    stroke-dasharray: 110;
    stroke-dashoffset: 92;
}

main .insights .product svg circle,
main .insights .category svg circle{
    stroke-dashoffset:0 ;
    stroke-dasharray: 250;
}

main .insights .progress .number{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.income{
    min-width: 230px;
}

.income-card .left{
    margin: 0 auto;
    margin-top: 20px;
}

.income-card .left h2{
    color: var(--color-primary);
}


.number h3{
    font-size: 15px;
}

main .insights small{
    margin-top: 1.3rem;
    display: block;
}


main .recent-orders{
    margin-top: 1.6rem;
}

main .recent-orders h2{
    margin-bottom: 0.8rem;
}

/* table style for all pages  */
table{
    background: var(--color-white);
    width: 100%;
    border-radius: var(--card-border-radious);
    text-align: center;
}

td{
    transition: 200ms ease;
}

.recent-orders table{
    box-shadow: var(--box-shadow);
    padding: var(--card-padding);
}

table:hover{
    box-shadow: none;
}

table tbody td{
    text-align: center;
    height: 2.8rem;
    border-bottom: 1px solid var(--color-light);
}

table thead th{
    text-align: center;
}

table tbody tr:last-child td{
    border: none;
}

main .recent-orders a{
    text-align: center;
    display: block;
    margin: 1rem auto;
    color: var(--color-primary);
}


/* ============ RIGHT ============= */
.right{
    margin-top: 1.4rem;
}

.right .top{
    display: flex;
    justify-content: center;
    gap: 2rem;
}

.right .top button{
    display: none;
}

.right .theme-toggler{
    background: var(--color-light);
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 1.6rem;
    width: 4.2rem;
    cursor: pointer;
    border-radius: var(--border-radious-1);
}

.right .theme-toggler span{
    font-size: 1.2rem;
    width: 50%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.right .theme-toggler span.active{
    background: var(--color-primary);
    color: white;
    border-radius: var(--border-radious-1);
}

.right .top .profile{
    display: flex;
    gap: 2rem;
    text-align: right;
}

/* -----recent updates------- */
.right .recent-updates{
    margin-top: 1rem;
}

.right .recent-updates h2{
    margin-bottom: 0.8rem;
}

.right .recent-updates .updates{
    background: var(--color-white);
    padding: var(--card-padding);
    border-radius: var(--card-border-radious);
    box-shadow: var(--box-shadow);
    transition: all 300ms ease;
}

.right .recent-updates .updates:hover{
    box-shadow: none;
}

.right .recent-updates .updates .update{
    display: grid;
    grid-template-columns: 2.6rem auto;
    gap: 1rem;
    margin-bottom: 1rem;
}


/* -----sales analytics------- */
.right .sales-analytics{
    margin-top: 2rem;
}

.right .sales-analytics h2{
    margin-bottom: 0.8rem;
}

.right .sales-analytics .item{
    background: var(--color-white);
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-bottom: 0.7rem;
    padding: 1.4rem var(--card-padding);
    border-radius: var(--border-radious-3);
    box-shadow: var(--box-shadow);
    transition: all 300ms ease;
}

.right .sales-analytics .item:hover{
    box-shadow: none;
}

.right .sales-analytics .item .right{
    display: flex;
    justify-content: space-between;
    align-items: start;
    margin: 0;
    width: 100%;
}

.right .sales-analytics .item .icon{
    padding: 0.6rem;
    color: var(--color-white);
    border-radius: 50%;
    display: flex;
}

.right .sales-analytics .item.online .icon{
    background: var(--color-primary);
}

.right .sales-analytics .item.offline .icon{
    background: var(--color-danger);
}

.right .sales-analytics .item.customers .icon{
    background: var(--color-success);
}

.right .sales-analytics .add-product{
    background-color: transparent;
    border: 2px dashed var(--color-primary);
    color: var(--color-primary);
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: none;
    transition: all 300ms ease;
}

.right .sales-analytics .add-product:hover{
    gap: 2rem;
    /* background: var(--color-primary);
    color: white; */
}
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

                <a href="dashboard_home.jsp" class="active">
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
                <a href="add_movie_category.jsp">
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



        <!-- MAIN SECTION STARTS HERE  -->
        <main>
            <h1>Dashboard</h1>

            <div class="insights">

                <!-- ====products==== -->
               
          

                <div class="product">
                    <span class="material-icons-sharp">analytics</span>
                    <div class="middle">

                        <div class="left">
                            <h2>Movies</h2>
                            <h3>Add Movies</h3>
                        </div>

                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <h3></h3>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted ">Last 24 Hours</small>
                </div>

                <!-- ====category==== -->
                

                <div class="category"> 
                    <span class="material-icons-sharp">bar_chart</span>
                    <div class="middle">

                        <div class="left">
                            <h2>Category</h2>
                            <h3>Add Category</h3>
                        </div>

                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36" class="cc"></circle>
                            </svg>
                            <div class="number">
                                <h3></h3>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted ">Last 24 Hours</small>
                </div>

                <!-- ====income==== -->
                <div class="income">
   
                    <span class="material-icons-sharp">stacked_line_chart</span>
                    <div class="middle income-card">
                        <div class="left">
                            <h2>$</h2>
                            <h3>Total Income</h3>
                        </div>

                    </div>
                    <small class="text-muted ">Last 24 Hours</small>
                </div>

            </div>

            <!-- recent orders  -->
            <div class="recent-orders" >
                <h2>Recent <span style="color: red;">Bookings</span></h2>
                <table>
                    <thead>
                        <th>Booking Id</th>
                        <th>Customer</th>
                        <th>Movie Name</th>
                        <th>Booking Date</th>
                        <th>Status</th>
                    </thead>

                    <tbody>

                    
                    <%
                try {
                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                //email validation from server
                String query1 = "SELECT * FROM booking ORDER BY booking_id DESC LIMIT 3";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ResultSet result = ps1.executeQuery();
                
                while(result.next()){
                String status = result.getString("status");
                String booking_date = result.getString("booking_date");
                int user_id = result.getInt("user_id");
                int movie_id = result.getInt("movie_id");
                int booking_id = result.getInt("booking_id");
                
                  String query2 = "SELECT * FROM users WHERE id = ?";
                PreparedStatement ps2 = conn.prepareStatement(query2);
                ps2.setInt(1, user_id);
                
                ResultSet result2 = ps2.executeQuery();
                
                 if(result2.next()){
                 
                 String first_name = result2.getString("first_name");
                 String last_name = result2.getString("last_name");
                 
                      String query3 = "SELECT * FROM movie WHERE movie_id = ?";
                PreparedStatement ps3 = conn.prepareStatement(query3);
                ps3.setInt(1, movie_id);
                
                ResultSet result3 = ps3.executeQuery();
                
                 if(result3.next()){
                 
                 String movie_name = result3.getString("name");
    
%>
   

                        <tr style="border:1px solid red;">
                            <td><%= booking_id %> </td>
                            <td><%= first_name %> <%= last_name %></td>
                            <td><%= movie_name %></td>
                            <td><%= booking_date %></td>
                            <td><%= status %></td>
                        </tr>

                        <%
         
                            }
}
                   }
 
            }
            catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
%>
                         
                            

                    </tbody>
                </table>
            </div>
 
        </main>
        <!-- MAIN SECTION ENDS HERE  -->


        <!-- RIGHT SSECTION STARTS HERE  -->
        <div class="right">

            <!-- ==== top ==== -->
            <div class="top">
                <button id="menu-btn">
                    <span class="material-icons-sharp">menu</span>
                </button>
                 <%
 
          
             Integer userId = (Integer) session1.getAttribute("user_id");
             String user_name = (String) session1.getAttribute("user_name");
             %>
                <div class="profile">
                    <div class="info">
                        <p>Hey, <h3 style="color:red;"><%= user_name %></h3></p>
                        <small class="text-muted">Admin</small>
                    </div>
                    <div class="profile-photo">
                        <img src="profile-default.png" alt="">
                    </div>
                </div>
            </div>
            

            <!-- ==== Recent Updates ==== -->
            <div class="recent-updates">
                <h2>Recent <span style="color: red;">Comments</span></h2>
                <div class="updates">

                    <%
                try {
                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                //email validation from server
                String query1 = "SELECT * FROM comments ORDER BY comment_id DESC LIMIT 3";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ResultSet result = ps1.executeQuery();
                
                while(result.next()){
                String comment = result.getString("comment"); 
                int user_id = result.getInt("user_id");
                
                  String query2 = "SELECT * FROM users WHERE id = ?";
                PreparedStatement ps2 = conn.prepareStatement(query2);
                ps2.setInt(1, user_id);
                
                ResultSet result2 = ps2.executeQuery();
                
                 if(result2.next()){
                 
                 String first_name = result2.getString("first_name");
                 String last_name = result2.getString("last_name");
    
%>
                    <div class="update" style="border-bottom: 1px solid red;">
                        <div class="profile-photo">
                            <img src="profile-default.png" alt="">
                        </div>
                        <div class="message">
                            <p><b><%= first_name %> <%= last_name %></b> <%= comment %></p>
                            <small class="text-muted">2 Minutes Ago</small>
                        </div>
                    </div>

      <%
          }
                   }
 
            }
            catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
%>             

                    

                </div>
            </div>


            <!-- === sales Analytics === -->
            <div class="sales-analytics">
                <h2>Booking <span style="color:red;">Analytics</span></h2>
                    <%
                try {
                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                 String query = "SELECT COUNT(*) AS bookingCounts FROM booking";
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

               int bookingCounts = 0;
               if (rs.next()) {
                   bookingCounts = rs.getInt("bookingCounts");
                   

                    String query1 = "SELECT COUNT(*) AS customerCounts FROM users";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                ResultSet rs1 = ps1.executeQuery();

               int customerCounts = 0;
               if (rs1.next()) {
                   customerCounts = rs1.getInt("customerCounts");
               
                
                 
    
%>
                <div class="item online">
                    <div class="icon">
                        <span class="material-icons-sharp">shopping_cart</span>
                    </div>
                    <div class="right">
                        <div class="info">
                            <h3>ONLINE ORDERS</h3>
                            <small class="text-muted">last 24 Hours</small>
                        </div>
                        <h5 class="success">+37%</h5>
                        <h3><%= bookingCounts %></h3>
                    </div>
                </div>

                <div class="item offline">
                    <div class="icon">
                        <span class="material-icons-sharp">local_mall</span>
                    </div>
                    <div class="right">
                        <div class="info">
                            <h3>OFFLINE ORDERS</h3>
                            <small class="text-muted">last 24 Hours</small>
                        </div>
                        <h5 class="danger">0</h5>
                        <h3>0</h3>
                    </div>
                </div>

                <div class="item customers">
                    <div class="icon">
                        <span class="material-icons-sharp">person</span>
                    </div>
                    <div class="right">
                        <div class="info">
                            <h3>All CUSTOMERS</h3>
                            <small class="text-muted">last 24 Hours</small>
                        </div>
                        <h5 class="success">+30%</h5>
                        <h3><%= customerCounts %></h3>
                    </div>
                </div>
<%
          }
                   }
 
            }
            catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
%> 

            </div>
        </div>

    </div>
    


</body>
</html>
