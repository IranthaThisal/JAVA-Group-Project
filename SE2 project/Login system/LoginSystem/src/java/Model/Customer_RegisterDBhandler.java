/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Sasinima
 */
public class Customer_RegisterDBhandler {
     public int CustRegDBhandlerMethod(String RegFname,String Regemail,String Regcontactno,String Reggender,String RegDOB,String Regusername,String Regpassword,String Regconpassword) throws ClassNotFoundException, SQLException{
         String DBRegFname = RegFname;
        String DBRegemail = Regemail;
        String DBRegcontactno = Regcontactno;
        String DBReggender = Reggender;
        String DBRegDOB = RegDOB;
        String DBRegusername = Regusername;
        String DBRegpassword = Regpassword;
        String DBRegconpassword = Regconpassword;
        
        int Qstatus=-1;
        Connection CDBcon =null;
        DBconnection cusDBconobj=new DBconnection();
        
        CDBcon = cusDBconobj.getconnection();
        PreparedStatement st=CDBcon.prepareStatement("INSERT INTO customer(Full_Name,Email,Contact_Number,Gender,Username,Password,Date_of_Birth) VALUES(?,?,?,?,?,?,?)");
        
        st.setString(1, DBRegFname);
        st.setString(2, DBRegemail);
        st.setString(3, DBRegcontactno);
        st.setString(4, DBReggender);
        st.setString(5, DBRegusername);
        st.setString(6, DBRegpassword);
        st.setString(7, DBRegDOB);
        
        Qstatus = st.executeUpdate();
        
        return Qstatus;
        
     }
}
