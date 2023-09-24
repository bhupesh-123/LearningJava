package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {
	@RequestMapping(value="/" ,method=RequestMethod.GET)
public String sayHello(ModelMap model){
	model.addAttribute("massege","welcome spring mvc application");
	return "welcome";
}
	@RequestMapping(value="/Hello" ,method=RequestMethod.GET)
public String sayHelloAgain(ModelMap model){
	model.addAttribute("massege","again welcome spring mvc application");
	return "welcome";
}
	@RequestMapping(value="Hello/{user}",method=RequestMethod.GET)
	public String urlInput(@PathVariable("user")String user, ModelMap model){
		model.addAttribute("userinput",user);
	return "urlpage";
	}
}
