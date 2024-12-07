/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Sasinima
 */
public class DBconnection {
    private Connection DBcon() throws ClassNotFoundException, SQLException{        
        Class.forName("com.mysql.jdbc.Driver");        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails", "root","");
        
        return con;
    }
    public Connection getconnection() throws ClassNotFoundException, SQLException{
        
        Connection pubconnection = DBcon();
        
        
        return pubconnection ;
        
    }
    
}


