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
public class Account_Recovery_PasswordUpdate_DBhandler {
    public int Account_Recovery_PasswordUpdate_DB(String password, String Customer_ID) throws SQLException, ClassNotFoundException{
        String Cust_ID = Customer_ID;
        String psw = password;
        int QueryStatus = -1;
        
        String DBresult = "";
        Connection AR_UpdatePW_DBcon = null;
        DBconnection Account_RecoveryPWobj = new DBconnection();
        
        AR_UpdatePW_DBcon = Account_RecoveryPWobj.getconnection();
        
        PreparedStatement st1 = AR_UpdatePW_DBcon.prepareStatement("UPDATE customer SET Password=? WHERE  Customer_ID = ?");
        st1.setString(1, psw);
        st1.setString(2, Cust_ID);

        QueryStatus = st1.executeUpdate();
        
        return QueryStatus;
    }
}
