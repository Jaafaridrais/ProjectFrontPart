package com.zjs.cashretracted.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zjs.cashretracted.form.LoginBean;

@Controller
public class LoginController {
	
	
	@RequestMapping(value={"/","/login"})
  public String login(Model model){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	  try{
		String name = auth.getName();
	      System.out.println("**********************************************    ****       **    "+name);
	  }catch(NullPointerException e)
	  {
		  model.addAttribute("loginBean", new LoginBean());
			return "login";
		 
	  }
	      
	      model.addAttribute("loginBean", new LoginBean());
		return "login";
  }
	
	
	
	
	@RequestMapping(value="/logout")
	  public String logout(){
		
		
		  return "login";
	  }
}
