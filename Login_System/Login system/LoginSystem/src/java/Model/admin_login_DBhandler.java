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
public class admin_login_DBhandler {
    public int adminDBhandlerMethod(String Admin_Loguname,String Admin_Logpswd) throws ClassNotFoundException, SQLException{
        String DBAdmin_Loguname=Admin_Loguname;
        String DBAdmin_Logpswd=Admin_Logpswd;
               
         int Qstatus=-1;
         String DBR_Adminusername = "";
         String DBR_Adminpassword="";
        Connection CLDBcon =null;
        DBconnection custLogDBconobj=new DBconnection();
        
        CLDBcon = custLogDBconobj.getconnection();
        
        PreparedStatement st=CLDBcon.prepareStatement("SELECT Admin_username,Admin_password FROM admin WHERE Admin_username=?;");
        st.setString(1, DBAdmin_Loguname);
        
        ResultSet rs=st.executeQuery();
      
        while(rs.next()){
           DBR_Adminusername = rs.getString("Admin_username");
           DBAdmin_Logpswd = rs.getString("Admin_password");
           
         }
        if(DBR_Adminusername != null && DBR_Adminpassword != null){
            if(DBAdmin_Logpswd.equals(DBAdmin_Logpswd)){
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



