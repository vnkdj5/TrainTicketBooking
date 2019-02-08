package com.train.services;

import java.util.List;

import com.train.bean.Train;


public interface TrainService
{
	
	public void create(Train train);
	
	public void update(Train train);
	
	public List<Train> find(String source,String dest, int day,String type);
	
	public List<Train> findAll();
}