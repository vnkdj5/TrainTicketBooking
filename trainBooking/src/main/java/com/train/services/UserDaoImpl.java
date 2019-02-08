package com.train.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.train.bean.User;


@Repository		//It allows the component scanning to find and configure the respected DAO
@Qualifier("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	MongoTemplate mongoTemplate;
	
	final String COLLECTION="userInfo";
	public void create(User user) {
		mongoTemplate.insert(user);
		
	}

	public void update(User user) {
		mongoTemplate.save(user);
		
	}

	public void delete(User user) {
		mongoTemplate.remove(user);
	}

	public void deleteAll() {
		mongoTemplate.remove(new Query(),COLLECTION);	
		
	}

	public User find(User user) {
		Query query=new Query(Criteria.where("emailId").is(user.getEmailId()));
		return mongoTemplate.findOne(query, User.class,COLLECTION);
	}

	public List<User> findAll() {
		// TODO Auto-generated method stub
		return (List<User>) mongoTemplate.findAll(User.class);
	}

}
