/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mediator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class ConcretMediador implements IMediador {

    PreparedStatement ps, ps2, ps3;
    ResultSet rs, rs2, rs3;
    private ArrayList<ConcretCliente> clientes;
    ConcretCliente aux;

    public ConcretMediador() {
        this.clientes = new ArrayList<ConcretCliente>();
    }

    public String agregarCliente(ConcretCliente cliente, String usuario, String email, String pass) {
        aux = new ConcretCliente();
        aux.setEmail(email);
        aux.setNombre(usuario);
        aux.setPass(pass);
        this.clientes.add(aux);

        Conexion c = new Conexion();
        Connection conexion = null;
        String respuesta = "";
        try {
            conexion = c.getConnection();
            ps = conexion.prepareStatement("select * from usuarios WHERE us_user= '" + usuario + "' ");
            rs = ps.executeQuery();
            if (rs.next()) {
                respuesta = "yaexiste";

            } else {
                try {
                    ps2 = conexion.prepareStatement("insert into usuarios(us_user,us_pass,us_email) values(?,?,?)");
                    ps2.setString(1, clientes.get(0).getNombre());
                    ps2.setString(2, clientes.get(0).getPass());
                    ps2.setString(3, clientes.get(0).getEmail());
                    int resultado = ps2.executeUpdate();
                    if (resultado > 0) {
                        respuesta = "agregado";
                    } else {
                        respuesta = "error";
                    }
                } catch (SQLException ex) {
                    System.err.println("Error " + ex);
                }
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }

        return respuesta;
    }

    @Override
    public void enviarMensaje(String destinatario, String asunto, String cuerpo) {

        String remitente = "MCDSBH.system";

        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.gmail.com");  //El servidor SMTP de Google
        props.put("mail.smtp.user", remitente);
        props.put("mail.smtp.clave", "mcdsbhsystem");    //La clave de la cuenta
        props.put("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
        props.put("mail.smtp.starttls.enable", "true"); //Para conectar de manera segura al servidor SMTP
        props.put("mail.smtp.port", "587"); //El puerto SMTP seguro de Google

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(remitente));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            message.setSubject(asunto);
            message.setText(cuerpo);
            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", remitente, "mcdsbhsystem");
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (MessagingException me) {
            me.printStackTrace();   //Si se produce un error
        }

    }

    public static void main(String[] args) throws MessagingException {
        String asunto = "REGISTRO EN SISTEMA DE CURSOS";
        String cuerpo = "USUARIO REGISTRADO";
        ConcretMediador admin = new ConcretMediador();
        admin.SendingEmail("richard896qa@gmail.com","owowowow");
        //admin.enviarMensaje("richard896qa@gmail.com", asunto, cuerpo);
    }

    public void SendingEmail(String Email,String Body) throws AddressException, MessagingException
       {

                String host ="smtp.gmail.com";
                String from ="MCDSBH.system@gmail.com";  //Your mail id
                String pass ="mcdsbhsystem";   // Your Password
                Properties props = System.getProperties();
                props.put("mail.smtp.starttls.enable", "true"); // added this line
                props.put("mail.smtp.host", host);
                props.put("mail.smtp.user", from);
                props.put("mail.smtp.password", pass);
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.auth", "true");
                String[] to = {Email}; // To Email address
                Session session = Session.getDefaultInstance(props, null);
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(from));
                InternetAddress[] toAddress = new InternetAddress[to.length];        
                // To get the array of addresses
                 for( int i=0; i < to.length; i++ )
                 { // changed from a while loop
                     toAddress[i] = new InternetAddress(to[i]);
                 }
                System.out.println(Message.RecipientType.TO);
                for( int j=0; j < toAddress.length; j++)
                { // changed from a while loop
                message.addRecipient(Message.RecipientType.TO, toAddress[j]);
                }
                message.setSubject("Email from SciArchives");

                message.setContent(Body,"text/html");
                Transport transport = session.getTransport("smtp");
                transport.connect(host, from, pass);
                transport.sendMessage(message, message.getAllRecipients());
                    transport.close();
           }
    

}
