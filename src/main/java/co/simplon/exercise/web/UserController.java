package co.simplon.exercise.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.simplon.exercise.core.model.User;
import co.simplon.exercise.core.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping()
	public ModelAndView get(ModelMap model) {
		List<User> users = userService.getAll();
		model.addAttribute("users", users);
		return new ModelAndView("user/usersList", model);
	}

	@RequestMapping(path = "/profil")
	public ModelAndView getMyProfil(ModelMap model) {
		String email = SecurityContextHolder.getContext().getAuthentication().getName();
//		System.out.println("name : "+name);
		User myself = userService.findOneByEmail(email);
//		System.out.println("myself : "+myself.getEmail());
		model.addAttribute("myInfos", myself);
		return new ModelAndView("user/myprofil", model);
	}

	@RequestMapping(path = "/form/adduser")
	public ModelAndView getUserAddForm(){
		return new ModelAndView("user/addUserForm");
	}

	@RequestMapping(path = "/addUser")
	public ModelAndView addUser(  @RequestParam String name,
								  @RequestParam String surname,
								  @RequestParam String email,
								  @RequestParam String password,
								  @RequestParam String role,
								  ModelMap model) {
		userService.addOrUpdate(new User(name, surname, password, email, role));
		return new ModelAndView("redirect:/users");
	}

	/**
	 * get a form to update a user by id
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(path="/updateUserForm")
	public ModelAndView getUpdateForm(@RequestParam Integer id, ModelMap model)
	{   User ps = userService.findById(id);
		model.addAttribute(ps);
		return new ModelAndView("user/updateUserForm", model);
	}

	@RequestMapping(path="/update")
	public ModelAndView updateUser(@RequestParam Integer id,
								   @RequestParam String name,
								   @RequestParam String surname,
								   @RequestParam String password,
								   @RequestParam String email,
								   ModelMap model)
	{
		User userToUpdate = userService.findById(id);
		userToUpdate.setName(name);
		userToUpdate.setSurname(surname);
		userToUpdate.setPassword(password);
		userToUpdate.setEmail(email);
		userService.addOrUpdate(userToUpdate);

		return new ModelAndView("redirect:/users", model);
	}

	
	@RequestMapping("/delete")
	public ModelAndView remove(@RequestParam Integer id, ModelMap model) {
		
		userService.delete(id);
		return new ModelAndView("redirect:/users");
	}
	

}
