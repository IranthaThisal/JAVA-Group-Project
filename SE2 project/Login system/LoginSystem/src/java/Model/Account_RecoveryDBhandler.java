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
import java.util.concurrent.TimeUnit;

/**
 *
 * @author Sasinima
 */
public class Account_RecoveryDBhandler {
    private String generateSecureToken() {
          return java.util.UUID.randomUUID().toString(); 
}

    public int AR_DBhandler(String ACCemail,String ACCconNumber) throws ClassNotFoundException, SQLException{
        String DBaccEmail = ACCemail;
        String DBaccConnum = ACCconNumber;
        int Email_Status = -1;
        int Sms_status = -1;
        
        String DBresult = "";
        Connection AR_DBcon = null;
        DBconnection Account_Recoveryobj = new DBconnection();
        
        AR_DBcon = Account_Recoveryobj.getconnection();
        
        PreparedStatement st1 = AR_DBcon.prepareStatement("SELECT Customer_ID FROM customer WHERE  Email = ? AND Contact_Number = ?;");
        st1.setString(1, ACCemail);
        st1.setString(2, ACCconNumber);
        
        ResultSet rs = st1.executeQuery();
        while(rs.next()){
            DBresult = rs.getString("Customer_ID");
            
        }
        if(DBresult !=null){
            String Token = generateSecureToken();
            long expiryTime = System.currentTimeMillis() + TimeUnit.MINUTES.toMillis(15); 
            PreparedStatement st2 = AR_DBcon.prepareStatement("INSERT INTO forgetpassword(Customer_ID,Token,ExpeiryTime) VALUES(?,?,?)");
            st2.setString(1, DBresult);
            st2.setString(2,Token);
            st2.setLong(3,expiryTime);
            
            EmailUtil email_obj = new EmailUtil();            
            Email_Status = email_obj.sendEmail(DBaccEmail, Token);
            if (Email_Status == 1){
                 int Istatus = st2.executeUpdate();
                 if (Istatus == 1){
                    return 1;
                }
                else{
                    return 2;
                }
            }
            
            else if(Email_Status == 0){
                return 3;
            }
            
            else{
                return 4;
            }
            
            
           
    }
    else{
       return 5;
    }
}   

}

