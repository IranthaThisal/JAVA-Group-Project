/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Customer_LoginDBhandler;
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
@WebServlet(name = "SignUpservlet", urlPatterns = {"/SignUpservlet"})
public class SignUpservlet extends HttpServlet {

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
         String Loguname=request.getParameter("Loguname");
         String Logpswd=request.getParameter("Logpswd");
         String RememberMe = request.getParameter("rememberme");
         Cookie unamecookie;
         Cookie remembermecookie;
         int Qstatus = -1;    

         System.out.println("remember:" + RememberMe);

         Customer_LoginDBhandler objCustomer_LoginDBhandler = new Customer_LoginDBhandler();
        try {    
            Qstatus = objCustomer_LoginDBhandler .CustDBhandlerMethod(Loguname, Logpswd);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignUpservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SignUpservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
          if (Qstatus == 1){
               HttpSession session = request.getSession();
               session.setAttribute("username", Loguname);
           
            if(RememberMe.equals("on")){
                unamecookie = new Cookie("unamecookie",Loguname);
                remembermecookie = new Cookie("remembermecookie","true");
                unamecookie.setMaxAge(2*24*60*60);
                remembermecookie.setMaxAge(2*24*60*60);
            }
            else{
                unamecookie = new Cookie("unamecookie","");
                remembermecookie = new Cookie("remembermecookie","false");
                unamecookie.setMaxAge(0);
                remembermecookie.setMaxAge(0);
            }
                response.addCookie(unamecookie);
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
