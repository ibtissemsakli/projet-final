package co.simplon.exercise.core.service;

import java.security.SecureRandom;
import java.util.Date;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import co.simplon.exercise.core.model.User;
import co.simplon.exercise.core.repository.UserRepository;

@Service
public class UserService extends GenericService<User, UserRepository>{

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	MailService mailService;
	@Override
	public User addOrUpdate(User user) {

		user.setPassword(passwordEncoder.encode(user.getPassword()));

		return super.addOrUpdate(user);
	}
	 public User findOneByEmail(String email) {

		return userRepository.findOne(email);
	 }
	 /**
		 * Envoyer le mot de pass cripter par mail
		 * @param pwd
		 * @param email
		 */
		public void sendMpEmail(String pwd, String email, String msgBody, String subject ) {
			// TODO
				msgBody= "Votre nouveau mdp est: " + pwd;
				subject = "Récuperation du mot de passe";
				String toAdress= email;
				String actualFromAdress = "simplon.company@gmail.com";
		        Date createdAt = new Date();
		        mailService.sendMailandSave(email, msgBody, subject, actualFromAdress, createdAt);
			}
	
		/**
		 *  Generer le mot de passe
		 * @return
		 */
		public String generateMP() {
			String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~`!@#$%^&*()-_=+[{]}\\|;:\'\",<.>/?";
			String pwd = RandomStringUtils.random(15, 0, 0, false, false, characters.toCharArray(), new SecureRandom());
			return pwd;
		}
		public void sendpasswordAndSave(String email) {
			String pwd = generateMP();
			String msgBody= "Votre nouveau mdp est: " + pwd;
			String subject = "Récuperation du mot de passe";
			User user = findOneByEmail(email);
			//envoi du mail
			 sendMpEmail(pwd, email, msgBody, subject); 
			user.setPassword(pwd);
			//System.out.println(pwd);
			//ajout de MP dans la bade de donnée
			addOrUpdate(user);
		}
		
}