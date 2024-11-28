/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author Sasinima
 */
public class EmailUtil {
    public static int sendEmail(String Email,String Token){
     
        final String fromEmail = "thevindusiriwardana@gmail.com"; 
        final String password = "tdSiriwar0712656174";        
        String Email_subject = "Account Recovery code";
        String Email_Body = "Your Account recovery code is" +Token;
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com"); 
        properties.put("mail.smtp.port", "587");            
        properties.put("mail.smtp.auth", "true");         
        properties.put("mail.smtp.starttls.enable", "true");

        
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
           
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail)); 
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(Email)); 
            message.setSubject(Email_subject); 
            message.setText(Email_Body);

           
            Transport.send(message);
            System.out.println("Email sent successfully!");
            
            return 1;

        } catch (MessagingException e) {
            
            return 0;
        }
    }
}

