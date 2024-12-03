/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Account_RecoveryCode_Verification;
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

/**
 *
 * @author Sasinima
 */
@WebServlet(name = "Account_Recoverycode_VerificationServlet", urlPatterns = {"/Account_Recoverycode_VerificationServlet"})
public class Account_Recoverycode_VerificationServlet extends HttpServlet {

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
            out.println("<title>Servlet Account_Recoverycode_VerificationServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Account_Recoverycode_VerificationServlet at " + request.getContextPath() + "</h1>");
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
        String Recovery_code = request.getParameter("Recovery_code");
        String Cemail = request.getParameter("Cemail");
        int Verification_status = -1;
        
        Account_RecoveryCode_Verification Verification_statusobj = new Account_RecoveryCode_Verification();
        
        try {
            Verification_status = Verification_statusobj.RecoveryCodeVerification(Recovery_code,Cemail);
            System.out.println("verification status:" + Verification_status );
            if(Verification_status <= 0){
                switch(Verification_status){                               
                    case -2:
                        response.getWriter().println("</h1>Recovery code is invalid. Please try again.</h1>");
                     break;
                    case -3:
                        response.getWriter().println("<h1>Data base error.</h1>");
                     break;
                    case -4:
                        response.getWriter().println("<h1>Token has expired.</h1>");
                     break;
                    
                    default:
                       response.getWriter().println("<h1>Unexpected error.</h1>");
                 }
                 
                   }
            else{
               response.getWriter().println(
                    "<h1>Please enter your new password.</h1><br>" +
                    "<form action='Account_Recovery_PasswordUpdate' method='Post'>" +
                    "Password: <input type='password' name='password'><br>" +
                    "Confirm Password: <input type='password' name='conpassword'><br>" +
                    "<input type='hidden' name='Customer_ID' value='" + Verification_status + "'>" +
                    "<input type='submit' name='submit' value='Recover'>" +
                    "</form>"
                );
            }
        
            
        } catch (SQLException ex) {
            Logger.getLogger(Account_Recoverycode_VerificationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Account_Recoverycode_VerificationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
