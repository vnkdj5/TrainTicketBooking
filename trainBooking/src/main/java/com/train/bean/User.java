package com.train.bean;



import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="userInfo")
public class User {
	@Id
	private String id;
	private String emailId,name,password,mobileNo;
	private Date dateOfBirth;
	
	
	public User()
	{
		
	}
	public User(String emailId, String name, String password, String mobileNo, Date dateOfBirth) {
		super();
		this.emailId = emailId;
		this.name = name;
		this.password = password;
		this.mobileNo = mobileNo;
		this.dateOfBirth = (Date) dateOfBirth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public Object getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDate(Date date) {
		this.dateOfBirth = date;
	}
	
	@Override
	public String toString() {
		
		StringBuilder userInfo=new StringBuilder();
		userInfo.append("_id: "+getId()+", emailID: "+getEmailId()+", name: "+getName()+", mobileNo: "+getMobileNo()+", dateOfBirth: "+getDateOfBirth());
		
		return  userInfo.toString();
	}
	
}
