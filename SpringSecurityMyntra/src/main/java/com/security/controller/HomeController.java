package com.security.controller;

import java.security.Principal;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.security.model.LoginForm;
import com.security.model.Product;

import antlr.debug.NewLineListener;

@Controller
@RequestMapping("/")
public class HomeController {

	public static String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		HomeController.username = username;
	}

	@RequestMapping(value = { "/home-page" }, method = RequestMethod.GET)
	public String displayHomePage(ModelMap modelMap) {
		String username = getUsername();
		modelMap.addAttribute("username", username);
		return "home-page";
	}

	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String displayMainPage(ModelMap modelMap, Principal principal) {
		try {
			username = principal.getName();
			if (username.equals(null)) {
				return "home-page";
			}
		} catch (Exception e) {
			System.out.println("Null Pointer Exception get caught");
		}
		setUsername(username);
		modelMap.addAttribute("username", username);
		return "home-page";
	}

	@RequestMapping(value = { "/logOut" }, method = RequestMethod.GET)
	public String displayLogoutPage(ModelMap modelMap) {
		return "logout-page";
	}

	@GetMapping("/accessDenied")
	public String error() {
		return "accessdenied";
	}
	
	@GetMapping("/checkOut")
	public String checkOutSuccess() {
		return "checkout-success";
	}
	
	@GetMapping("/cartDetails")
	public ModelAndView showCartPage() {
		ArrayList<Product> newList = PageController.list;
		ModelAndView mav = new ModelAndView("cart-page");
        mav.addObject("cartDetails", newList);
		return mav;
	}
}
