package Model;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {
    public int sendEmail(String email, String token) throws AddressException, MessagingException {
       String Email = email;
       String Email_Token = token;
       String Email_subject = "No reply email account recovery";
       String Email_Body = 
        "Dear " + Email + ",\n\n" +
        "Thank you for choosing our services! To proceed, please use the verification code below:\n\n" +
        "Your Verification Code: " + Email_Token + "\n\n" +
        "This code is valid for a limited time, so please use it promptly to complete your verification process.\n\n" +
        "If you didn’t request this code, please disregard this email or contact our support team for assistance at test@localhost .\n\n" +
        "Thank you for your trust in us.\n\n" +
        "Warm regards,\n ABC \n";

       final String host = "localhost"; 
       final int port = 25; 
       final String username = "test"; 
       final String password = "test"; 

        
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        }
        );
        
        Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username + "@" + host));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(Email));
            message.setSubject(Email_subject);
            message.setText(Email_Body);
            
        try{
            Transport.send(message);
            System.out.println("Email sent successfully!");
            
            
            
        }
        catch(MessagingException e){
            e.printStackTrace();
            return 0;
        }
        
        return 1;
}
}