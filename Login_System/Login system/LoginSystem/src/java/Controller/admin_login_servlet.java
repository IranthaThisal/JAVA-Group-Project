/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Customer_LoginDBhandler;
import Model.admin_login_DBhandler;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sasinima
 */
@WebServlet(name = "admin_login_servlet", urlPatterns = {"/admin_login_servlet"})
public class admin_login_servlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpservlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
         response.setContentType("text/html");
         String Admin_Loguname=request.getParameter("Admin_Loguname");
         String Admin_Logpswd=request.getParameter("Admin_Logpswd");
         String RememberMe = request.getParameter("rememberme");
         int Qstatus = -1;    
        
         Cookie remembermecookie;
        admin_login_DBhandler objadmin_login_DBhandler = new admin_login_DBhandler();
        try {    
            Qstatus = objadmin_login_DBhandler .adminDBhandlerMethod(Admin_Loguname, Admin_Logpswd);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(admin_login_servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(admin_login_servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (Qstatus == 1){
               HttpSession session = request.getSession();
               session.setAttribute("Admin_Loguname", Admin_Loguname);
           
            if("on".equals(RememberMe)){
                
                remembermecookie = new Cookie("remembermecookie","true");
                
                remembermecookie.setMaxAge(2*24*60*60);
            }
            else{
                remembermecookie = new Cookie("remembermecookie","false");
                
                remembermecookie.setMaxAge(0);
            }
                
                response.addCookie(remembermecookie);
                response.sendRedirect("./Dashborad.jsp");  
            }
            else if(Qstatus == 0){
               response.getWriter().println("<h1> Password or username does not match. Please try again. </h1>" + "<a href=\"./SignUp.jsp\">Go to signup</a>");

            }
           else {
              response.getWriter().println("<h1> Couldnt find the account.please try again. </h1>" + "<a href=\"./SignUp.jsp\">Go to signup</a>");

          }
        

       
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
