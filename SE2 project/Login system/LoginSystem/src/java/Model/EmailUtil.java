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
       String Email_Body = "This is the code for your verification code"+ Email_Token ;
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