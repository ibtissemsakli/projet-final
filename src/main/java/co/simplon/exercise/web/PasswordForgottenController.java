package co.simplon.exercise.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import co.simplon.exercise.core.service.MailService;
import co.simplon.exercise.core.service.UserService;
import co.simplon.exercise.core.service.mailing.EmailAPI;

@Controller
public class PasswordForgottenController {

	@Autowired
    private MailService mailService;
	@Autowired
	private UserService userService;
	
	@Autowired
    EmailAPI emailAPI;

	
	

	/**
	 * Methode pour l'affichage du formulaire de l'oubli du mot de passe
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/sendMPmailForm", method = RequestMethod.GET)
	public ModelAndView getpassWordForm(ModelMap model) {
		return new ModelAndView("/authentication/mailpwforgotten", model);
	}

	/**
	 * Traite le formulaire web d'oubli de mot de passe
	 * @param email email de l'utilisateur ayant oublié le mot de passe
	 * @return
	 * 
	 */
	@RequestMapping(value = "/sendMP", method = RequestMethod.GET)
	public ModelAndView sendPassword(String email) {
		
		userService.sendpasswordAndSave(email);
		//affichage d'un message de validation d'envoi du MP
		return new ModelAndView("/authentication/msgChangeMP");
		
	}

}
