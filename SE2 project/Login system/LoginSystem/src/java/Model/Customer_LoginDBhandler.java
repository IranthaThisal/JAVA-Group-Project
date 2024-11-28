/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Sasinima
 */
public class Customer_LoginDBhandler {
    public int CustDBhandlerMethod(String Loguname,String Logpswd) throws ClassNotFoundException, SQLException{
        String DBLoguname=Loguname;
        String DBLogpswd=Logpswd;
        
         int Qstatus=-1;
         String DBRusername = "";
         String DBRpassword="";
        Connection CLDBcon =null;
        DBconnection custLogDBconobj=new DBconnection();
        
        CLDBcon = custLogDBconobj.getconnection();
        
        PreparedStatement st=CLDBcon.prepareStatement("SELECT Username,Password FROM customer WHERE Username=?;");
        st.setString(1, DBLoguname);
        
        ResultSet rs=st.executeQuery();
        
        while(rs.next()){
           DBRusername = rs.getString("Username");
           DBRpassword = rs.getString("Password");
           
    }
        System.out.println(DBLogpswd);
        System.out.println(DBRpassword);
        if(DBRusername != null && DBRpassword != null){
            if(DBLogpswd.equals(DBRpassword)){
                Qstatus = 1;
            }
            else{
                Qstatus = 0;
            }
            
            
        }
        else{
            Qstatus = -1;
        }
        
        System.out.println(Qstatus);
        return Qstatus;
    }
}
