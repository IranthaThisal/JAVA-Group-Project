/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Customer_RegisterDBhandler;
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
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
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
        //processRequest(request, response);
        response.setContentType("text/html");
        String RegFname = request.getParameter("RegFname");
        String Regemail = request.getParameter("Regemail");
        String Regcontactno = request.getParameter("Regcontactno");
        String Reggender = request.getParameter("Reggender");
        String RegDOB = request.getParameter("RegDOB");
        String Regusername = request.getParameter("Regusername");
        String Regpassword = request.getParameter("Regpassword");
        String Regconpassword = request.getParameter("Regconpassword");
        
        int Qstatus = -1;
        String Qresponse = "";
        
        Customer_RegisterDBhandler objCustomer_RegisterDBhandler = new Customer_RegisterDBhandler();
        
        
        try {
            Qstatus = objCustomer_RegisterDBhandler.CustRegDBhandlerMethod(RegFname, Regemail, Regcontactno, Reggender, RegDOB, Regusername, Regpassword, Regconpassword);
                    } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(Qstatus == 1){
            Qresponse = "Account has been succefully created";
            
        }
        else if(Qstatus == 0){
                Qresponse = "Oops!Something went wrong. please try again.";
            }
        else{
            Qresponse = "System Error!";
        }
        response.getWriter().println("<h1>" + Qresponse + "</h1> <a href=\"./SignUp.jsp\"> Go to signup</a>");

                
        
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
