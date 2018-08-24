package com.train;

import java.util.Date;
import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import com.train.bean.User;
import com.train.services.UserServices;

public class Application {

	public static void main(String[] args) {

		AbstractApplicationContext context=new AnnotationConfigApplicationContext(ApplicationConfig.class);
		UserServices userServices=(UserServices) context.getBean("userServices");
		//userServices.create(new User("abc@gmail.com","Test User","pass","1234567890",new Date(2000, 11, 01)));
		
		List<User> list=userServices.findAll();
		list.stream()
		.forEach(System.out::println);
	}

}
