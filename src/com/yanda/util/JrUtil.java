package com.nice.core.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JrUtil {

	private static final String SMTPSERVER = "smtp.qq.com";
	private static final String SMTPPORT = "465";
	private static final String ACCOUT = "2514619243@qq.com";
	private static final String PWD = "oqwituvvdrcldigh";

    public static void  sendEMail(String sendName,String receiveMail,String title,String text) throws Exception {

        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp"); 
        props.setProperty("mail.smtp.host", SMTPSERVER); 
        props.setProperty("mail.smtp.port", SMTPPORT); 
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.auth", "true"); 
        props.setProperty("mail.smtp.ssl.enable", "true");


        Session session = Session.getDefaultInstance(props);
        session.setDebug(false);
        MimeMessage message = createEmail(session,sendName,receiveMail,title,text);
        Transport transport = session.getTransport();
        transport.connect(SMTPSERVER,ACCOUT, PWD);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();

    }


    private static MimeMessage createEmail(Session session,String sendName,String receiveMail,String title,String text) throws Exception {
        MimeMessage msg = new MimeMessage(session);
        InternetAddress fromAddress = new InternetAddress(ACCOUT,
                sendName, "utf-8");
        msg.setFrom(fromAddress);
        InternetAddress receiveAddress = new InternetAddress(
                receiveMail, "test", "utf-8");
        msg.setRecipient(RecipientType.TO, receiveAddress);
        msg.setSubject(title);
        msg.setText(text);
        msg.setSentDate(new Date());
        msg.saveChanges();
        return msg;
    }
    public static void main(String[] args) {
    	String text = "请点击连接激活 http://localhost:8080/ssm/bussiness/activePage.action";
		try {
			JrUtil.sendEMail("JD商城","2514619243@qq.com" , "通知信息", text);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
