package com.web.controller;

import java.util.Map;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.model.User;
import com.web.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	UserService userService;
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String userForm(Map<String,Object> map){
		map.put("user", new User());
		return "user/register";
	}
	
	@RequestMapping(value="create",method=RequestMethod.POST)
	public String create(Map<String,Object> map,@ModelAttribute("user") @Valid User user,BindingResult result){
		if(result.hasErrors()){
			return "user/register";
		}
		userService.create(user);
		map.put("user", new User());
		return "redirect:/user/details/"+user.getUserId();
	}
	
	@RequestMapping(value="list",method=RequestMethod.GET)
	public String list(Map<String,Object> map,User user){
		if(logger.isDebugEnabled()){
			logger.debug("getWelcome is executed!");
		}
		//logs exception
		logger.error("This is Error message", new Exception("Testing"));

		userService.getAll();
		map.put("userlist", userService.getAll());
		return "user/list";
	}
	@RequestMapping(value="edit/{userId}",method=RequestMethod.GET)
	public String edit(@PathVariable("userId") Long userId, Map<String,Object> map){
	User user=	userService.edit(userId);
		map.put("user", user);
		return "user/edit";
	}
	
	@RequestMapping(value="delete/{userId}",method=RequestMethod.GET)
	public String delete(@PathVariable("userId") Long userId){
		userService.delete(userId);
		
		return "redirect:/user/list";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(Map<String,Object> map,User user){
		userService.update(user);
		
		return "redirect:/user/details/"+user.getUserId();
	}
	
	
	@RequestMapping(value="/details/{userId}" , method=RequestMethod.GET)
	public String userDetails( @PathVariable("userId") Long userId,Map<String, Object>map){
		// 2nd method    Long userId
		User user=userService.find(userId);
			map.put("fname",user.getFname());
			map.put("email",user.getEmail());
			map.put("mobile",user.getMobile());
			map.put("password",user.getPassword());
			
			
			
			// 1st method 
			/*@RequestParam("fname") String fname,
			@RequestParam("email")String email,@RequestParam("mobile")String mobile ,@RequestParam("password")String password, 
			Map<String,Object> map){
		map.put("fname", fname);
		map.put("email", email);
		map.put("mobile", mobile);
		map.put("password", password);*/
	
		return "user/details";
	}
			
}
