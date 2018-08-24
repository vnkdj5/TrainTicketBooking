package com.train.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.train.bean.User;

@Service("userServices")
public class UserServicesImp implements UserServices{

	@Autowired
	UserDao userDao;

	public void create(User user) {
		userDao.create(user);
	}

	public void update(User user) {
		userDao.update(user);

	}

	public void delete(User user) {
		userDao.delete(user);	
	}

	public void deleteAll() {
		userDao.deleteAll();

	}

	public User find(User user) {
		return userDao.find(user);
	}

	public List<User> findAll() {
		return userDao.findAll();
	}

}
