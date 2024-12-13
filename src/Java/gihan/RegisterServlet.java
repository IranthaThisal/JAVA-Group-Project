/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gihan;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;

/**
 *
 * @author Sasinima
 */
@WebServlet(urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //work here
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
            String fname = request.getParameter("fname");
            String pwd = request.getParameter("pwd");
            String lname = request.getParameter("lname");
            String mail = request.getParameter("mail");
            String gender = request.getParameter("gender");
            String country = request.getParameter("country");
        


            try {
                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                //email validation from server
                String query1 = "SELECT * FROM users WHERE e_mail = ?";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ps1.setString(1, mail);
                
                ResultSet result = ps1.executeQuery();
                
                if(result.next()){
                
                    response.sendRedirect("register.jsp?error=1");
                }
                else{
                
                    
                String query2 = "INSERT INTO users (first_Name,last_name,e_mail,gender,password,country) VALUES (?, ?,?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(query2);
                
                // Insert Query
               
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, mail);
                ps.setString(4, gender);
                ps.setString(5, pwd);
                ps.setString(6, country);

                // Execute Update
                int x = ps.executeUpdate();

                // Output Result
                if (x > 0) {
                    out.println("Success");
                } else {
                    out.println("Error");
                }
                }

                

            }
            catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
    }
}


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
