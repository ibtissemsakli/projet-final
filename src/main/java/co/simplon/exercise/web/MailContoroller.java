package co.simplon.exercise.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.simplon.exercise.core.model.Mail;
import co.simplon.exercise.core.service.MailService;
import co.simplon.exercise.core.service.UserService;
//import co.simplon.exercise.core.service.mailing.EmailAPI;
import co.simplon.exercise.core.service.mailing.EmailAPI;

/**
 * Created by millet on 06/12/16.
 */

@Controller
@RequestMapping("/mail")
public class MailContoroller {

    @Autowired
    private MailService mailService;

    @Autowired
    private UserService userService;

    @Autowired
    EmailAPI emailAPI;

    @RequestMapping
    public ModelAndView getMailList(ModelMap model){
        List<Mail>mailList=mailService.getAll();
        model.addAttribute("mailList",mailList);
        return new ModelAndView("mail",model);
    }

    @RequestMapping(path="/sendAndSaveMail")
    public ModelAndView sendAndSaveMail (@RequestParam ("msgBody") String msgBody, @RequestParam String subject  ){
    	mailService.saveandSendMail(msgBody, subject);
        return new ModelAndView("redirect:/");
    }

	
}