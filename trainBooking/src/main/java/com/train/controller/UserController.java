package com.train.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.train.bean.User;
import com.train.services.UserServices;
import com.train.services.UserServicesImp;

@RestController
public class UserController {
	
 @Autowired
 UserServices userServices;
 
	@RequestMapping(value="/Login", method=RequestMethod.POST)
	 public Map<String,Object> loginUser(@RequestBody User user) {
		Map<String,Object> response=new HashMap<String,Object>();
        System.out.println("Logging in :: " + user.getEmailId());
        User user1=userServices.find(user);
        if(user1!=null &&user1.getPassword().equals(user.getPassword()))
        {
        	response.put("message", "Login Successful!");
        	response.put("user", user1);
        	response.put("loggedin", true);
        	response.put("type", 1);
        }
        else if(user.getEmailId().equals("admin@gmail.com") && user.getPassword().equals("admin"))
        {
        	response.put("message", "Login Successful!");
        	user.setName("ADMIN");
        	response.put("user", user);
        	response.put("type", 0);
        	response.put("loggedin", true);
        }
        else
        {
        	response.put("message", "Incorrect email/password.");
        	response.put("loggedin", false);
        }
        return response;
       
  }
	
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public Map<String,Object> registerUser(@RequestBody User user)
	{
		Map<String,Object> response=new HashMap<String,Object>();
		User userResponse=userServices.find(user);
		if(userResponse!=null)
		{
			response.put("message","Already Registered! Please Login.");
		}
		else
		{
		userServices.create(user);
		
		response.put("message","Registration Successful.");
		
		}
		
		return response;
		
	}
	
	
	@RequestMapping(value="/test")
	public @ResponseBody List<User> test()
	{
		/*
		 StringBuffer str=new StringBuffer();
		List<User> list=userServices.findAll();
		for(User user:list)
			str.append(list+"\n");
			
			*/
		
		return userServices.findAll();
	}
	
}
