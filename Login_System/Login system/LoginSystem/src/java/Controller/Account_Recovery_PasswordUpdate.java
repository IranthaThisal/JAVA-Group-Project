/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Account_Recovery_PasswordUpdate_DBhandler;
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
@WebServlet(name = "Account_Recovery_PasswordUpdate", urlPatterns = {"/Account_Recovery_PasswordUpdate"})
public class Account_Recovery_PasswordUpdate extends HttpServlet {

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
            out.println("<title>Servlet Account_Recovery_PasswordUpdate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Account_Recovery_PasswordUpdate at " + request.getContextPath() + "</h1>");
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
        
        String password = request.getParameter("password");
        String conpassword = request.getParameter("conpassword");
        String Customer_ID = request.getParameter("Customer_ID");
        
        int QueryStatus = -1;      
        if(password.equals(conpassword)){
            Account_Recovery_PasswordUpdate_DBhandler Account_Recovery_PasswordUpdate_DBhandlerObj= new Account_Recovery_PasswordUpdate_DBhandler();
            try {
                QueryStatus = Account_Recovery_PasswordUpdate_DBhandlerObj.Account_Recovery_PasswordUpdate_DB(password, Customer_ID);
                if(QueryStatus == 1){
                   response.getWriter().println("<h1>Your password successfully reset.<a href='./SignUp.jsp'>Go to sign in page.</a></h1>");
                }
                else{
                    response.getWriter().println("</h1>Error</h1>");
                }
            } catch (SQLException ex) {
                Logger.getLogger(Account_Recovery_PasswordUpdate.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Account_Recovery_PasswordUpdate.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        else{
            response.getWriter().println("</h1>Password and confirm password should match. Please try again.</h1>");
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
