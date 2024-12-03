/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Account_RecoveryDBhandler;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.SecureRandom;
import java.util.concurrent.TimeUnit;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Sasinima
 */
@WebServlet(name = "Account_RecoveryServlet", urlPatterns = {"/Account_RecoveryServlet"})
public class Account_RecoveryServlet extends HttpServlet {

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
            out.println("<title>Servlet Account_RecoveryServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Account_RecoveryServlet at " + request.getContextPath() + "</h1>");
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
        String ACCemail=request.getParameter("email");
        String ACCconNumber=request.getParameter("ConNumber");
        int stat;
        String recovery_status = null;
        Account_RecoveryDBhandler objAccount_RecoveryDBhandler = new Account_RecoveryDBhandler();
        try {
            stat = objAccount_RecoveryDBhandler.AR_DBhandler(ACCemail, ACCconNumber); 
            System.out.println("#status" + stat);
        switch(stat){
            case 1:
                response.getWriter().println(
                      "<h1>Recovery code has been successfully sent to your email.</h1><br>" +
                      "<form action='Account_Recoverycode_VerificationServlet' method='Post'>" +
                      "Recovery Code: <input type='text' name='Recovery_code'><br>" +
                      "<input type='hidden' name='Cemail' value='" + ACCemail + "'>" +
                      "<input type='hidden' name='Cemail' value='" + ACCemail + "'>" +
                      "<input type='submit' name='submit' value='Recover'>" +
                      "</form>"
                          );
            break;
            case 2:
                response.getWriter().println("</h1>Email has successfully sent. Database error.E1_DB0_Auth1_ERR0</h1>");
             break;
            case 3:
                response.getWriter().println("<h1>Email has not successfully sent.E0_DB0_Auth1_ERR0</h1>");
             break;
            case 4:
                response.getWriter().println("<h1>Error!Email sending error.E0_DB0_Auth1_ERR1");
             break;
            case 5:
               response.getWriter().println("<h1>Error in the process.E0_DB0_Auth0_ERR0</h1>");
             break;
            default:
               response.getWriter().println("<h1>Unexpected error.</h1>");
             }
        
            
            } catch (ClassNotFoundException ex) {
            Logger.getLogger(Account_RecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Account_RecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(Account_RecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
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

    private String generateSecureToken() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
