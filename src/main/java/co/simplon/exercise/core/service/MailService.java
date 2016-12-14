package co.simplon.exercise.core.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import co.simplon.exercise.core.model.Mail;
import co.simplon.exercise.core.repository.MailRepository;
import co.simplon.exercise.core.service.mailing.EmailAPI;

/**
 * Created by millet on 06/12/16.
 */
@Service
public class MailService extends GenericService <Mail, MailRepository> {
	
	@Autowired
	    EmailAPI emailAPI;

	
    @Autowired
    public MailRepository mailRepository;

    public boolean isTreated(Integer id) {
        Mail mail = mailRepository.findMailById(id);
        if (mail.getTreated().equals(0)) {
            return true;
        } else {
            return false;
        }
    }

    public String getUserNameByMailId(Integer id) {
        Mail mail = mailRepository.findMailById(id);
        return mail.getFromAddress();
    }
    public void sendMailandSave(String email, String msgBody, String subject, String actualFromAdress,
			Date createdAt) {
		Mail mail = new Mail(email,createdAt, 0, null, subject, msgBody);
		 //enregistrer ds la base
         addOrUpdate(mail);
		 //envoi mail
		emailAPI.sendEmail(mail.getFromAddress(),actualFromAdress, mail.getSubject(), mail.getMsgBody());
	}
    public void saveandSendMail(String msgBody, String subject) {
		String actualFromAdress = SecurityContextHolder.getContext().getAuthentication().getName();
        String toAdress="simplon.company@gmail.com";
        Date createdAt = new Date();
        sendMailandSave( actualFromAdress,  msgBody,  subject,  actualFromAdress,
    			 createdAt);
      
	}
    
    
}


