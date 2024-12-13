/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package gihan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class submitCommentServlet extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String userIdPara = request.getParameter("user_id");
        
        
            // Check if the user_id parameter is null or empty
    if (userIdPara.equals("null")) {
        response.sendRedirect("user_login.jsp");
    }
    else{
        
        
        
        try {
               int user_id = Integer.parseInt(userIdPara);
               String comment = request.getParameter("comment"); 
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                String query = "INSERT INTO comments(user_id,comment) VALUES(?,?)";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, user_id); // Set new status
                ps.setString(2, comment); // Set booking ID

                int rowsUpdated = ps.executeUpdate();
                if(rowsUpdated>0){
                out.println("<script>");
                out.println("alert('Comment Added successfully!');");
                out.println("window.location.href = 'booking_dashboard.jsp';"); 
                out.println("</script>");
                }
        }
            catch(Exception e){
                out.println(e);
            }
    }
        
        
        
       
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
        processRequest(request, response);
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
