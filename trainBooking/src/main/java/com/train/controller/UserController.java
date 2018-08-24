package com.train.controller;

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
 UserServicesImp userService;
 
	@RequestMapping(value="/Login", method=RequestMethod.POST)
	 public User loginUser(@RequestBody User user) {
		
        System.out.println("Logging in :: " + user.getEmailId());
        User user1=userService.find(user);
        if(user1.getPassword().equals(user.getPassword()))
        	return user1;
        
        return user;
       
  }
	
}
