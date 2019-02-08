package com.train.services;

import java.util.List;

import com.train.bean.User;

public interface UserServices {

	public void create(User user);
	
	public void update(User user);
	
	public void delete(User user);
	
	public void deleteAll();
	
	public User find(User user);
	
	public List<User> findAll();
}
