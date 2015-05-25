/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.utils;

import javax.enterprise.context.ApplicationScoped;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 *
 * @author Tiago Luiz Gomes
 */
@ApplicationScoped
public class SendMailController {

    // @Inject private AsyncMailer mailer;
/*    @Inject
     private Mailer mailer;
     */
    public void enviar(){
        SimpleEmail email = new SimpleEmail();
        email.setSSLOnConnect(true);
        email.setHostName("smtp.gmail.com");
        email.setStartTLSEnabled(true);
            
        //email.setSslSmtpPort("465");
        email.setSslSmtpPort("465");
        email.setAuthenticator(new DefaultAuthenticator("cemariacandida@gmail.com", "colegioestadual"));
        try {
            email.setFrom("cemariacandida@gmail.com", "Tiago Luiz Gomes de Oliveira");
            email.setDebug(true);
            email.setSubject("Email com commons-email");
            email.setMsg("Texto sem formatação");
            email.addTo("tiagolgo@gmail.com");//por favor trocar antes de testar!!!!
            email.send();
        } catch (EmailException e) {
            e.printStackTrace();
        }
    }
}
