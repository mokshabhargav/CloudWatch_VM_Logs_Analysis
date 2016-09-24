package cmpe283Project;


import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail
{
	
public static void sendMail(String msg, String vm)
{    
   String from = "chanikya.mandapathi@sjsu.edu";
   String to = "chanu.reds@gmail.com";
  
   Properties properties = new Properties();
   properties.put("mail.smtp.auth", "true");
   properties.put("mail.smtp.starttls.enable", "true");
   properties.put("mail.smtp.host", "smtp.gmail.com");
   properties.put("mail.smtp.port", "587");

   // Get the default Session object.
   //Session session = Session.getDefaultInstance(properties);
   
   
   Session session = Session.getInstance(properties,
	          new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("chanikya.mandapathi@sjsu.edu", "Chanu120");
	            }
	          });


   try{
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(session);

      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));

      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));

      // Set Subject: header field
      message.setSubject("Alarm generated on your VM");

      // Now set the actual message
      message.setText(vm + "  " + msg);

      // Send message
      Transport.send(message);
      System.out.println("Sent message successfully....");
   }catch (MessagingException mex) {
      mex.printStackTrace();
   }
}

}