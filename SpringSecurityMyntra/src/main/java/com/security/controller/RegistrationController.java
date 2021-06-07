package com.security.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.security.dao.RegistrationDao;
import com.security.model.RegisterData;


@Controller
public class RegistrationController {
	@Autowired
	private RegistrationDao registerDao;

	public void setRegisterDao(RegistrationDao registerDao) {
		this.registerDao = registerDao;
	}

	@RequestMapping("/submitForm")
	public String showRegisterForm(Model model) {
		model.addAttribute("command", new RegisterData());
		return "register-form";
	}

	@RequestMapping("/save")
	public ModelAndView registerToDB(@RequestParam("name") String fName, @RequestParam("password") String fPassword,
			@RequestParam("email") String fEmail, @RequestParam("mobileNumber") String fMobile) {
		String pName = fName;
		String pPassword = fPassword;
		String pEmail = fEmail;
		String PMobile = fMobile;
		registerDao.registerUserToDB(pName, pPassword, pEmail, PMobile);
		ModelAndView modelAndView = new ModelAndView("confirm-register", "mv", registerDao);
		return modelAndView;
	}
}
