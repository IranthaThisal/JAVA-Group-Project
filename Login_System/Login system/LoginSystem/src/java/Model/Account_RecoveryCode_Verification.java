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
import static java.time.Clock.system;
import java.util.concurrent.TimeUnit;
import javax.mail.internet.HeaderTokenizer.Token;

/**
 *
 * @author Sasinima
 */
public class Account_RecoveryCode_Verification {
    public int RecoveryCodeVerification(String Recovery_code, String Cemail) throws SQLException, ClassNotFoundException{
        String recovery_Code = Recovery_code;
        String email = Cemail;
        int DBCust_ID = -1;
        String DBToken = null;
        String DBEx_Time = null;
        long CurrentTime = 0;
        int Vstatus = 0; 
        
        Connection AR_veri_DBcon = null;
        DBconnection Account_RecoveryVeriobj = new DBconnection();
        
        AR_veri_DBcon = Account_RecoveryVeriobj.getconnection();
        
        PreparedStatement st = AR_veri_DBcon.prepareStatement("SELECT* FROM forgetpassword WHERE Token=?");
        st.setString(1,recovery_Code);
        
        
        ResultSet rs = st.executeQuery();
        rs.next();
            
       
        DBCust_ID = rs.getInt("Customer_ID");
        DBToken = rs.getString("Token");
        DBEx_Time = rs.getString("ExpeiryTime");
        CurrentTime = System.currentTimeMillis();
        System.out.println("1" + DBToken);
        System.out.println("2" + recovery_Code);
        System.out.println("T" + DBEx_Time);
        System.out.println("T" + CurrentTime);
        if(DBCust_ID == -1)
            {
                   
                Vstatus = -3;//no record
            }
        else 
            {
                if(!DBToken.equals(recovery_Code) )
                    {
                     Vstatus = -2;//token invalid  
                      
                    }
                else
                   {
                        if(Long.parseLong(DBEx_Time) > CurrentTime)
                        {
                                Vstatus = DBCust_ID;//token verfied
                               
                        }
                        else
                        {
                               Vstatus = -4;//Token expired
                               
                        }
                    }
            }
        System.out.println(Vstatus);
        return  Vstatus;
        }
    
}       
