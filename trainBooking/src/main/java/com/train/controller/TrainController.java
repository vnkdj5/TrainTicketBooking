package com.train.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.train.bean.Train;
import com.train.bean.User;
import com.train.services.TrainService;

@RestController
public class TrainController {

	@Autowired
	TrainService trainService;
	
	@RequestMapping(value="/addtrain",method=RequestMethod.POST )
	public Map<String,Object>addTrain(@RequestBody Train train)
	{
		Map<String,Object> response =new HashMap<>();
		
		trainService.create(train);
		
		response.put("message","Train details added successfully!");
		response.put("train", train);
		return response;
	}
	
	@RequestMapping(value="/gettrains")
	public @ResponseBody List<Train> getTrains()
	{
		
		return trainService.findAll();
	}
	
	@RequestMapping(value="/updateTrain",method=RequestMethod.POST )
	public Map<String,Object>updateTrain(@RequestBody Train train)
	{
		Map<String,Object> response =new HashMap<String, Object>();
		try {
		trainService.update(train);
		response.put("message","Train updated successfully!");
		}
		catch(Exception e) {
			response.put("message", "Update error"+e.toString());
		}
		
		response.put("train", train);
		return response;
	}
	
	@RequestMapping(value="/getsearchdetails", method=RequestMethod.GET)
	public Map<String,Object> getsearchdetails(@RequestParam("sourceStation") String sourceStation,
			@RequestParam("destinationStation") String destinationStation,
			
			@RequestParam("trainType") String trainType,
			@RequestParam("day") int day){
		Map<String,Object> response =new HashMap<String, Object>();
		try {
		
		response.put("message","Search successful!");
		response.put("list", trainService.find(sourceStation, destinationStation, day, trainType));
		}
		catch(Exception e) {
			response.put("message", "Error"+e.toString());
		}
		
		
		return response;
		
			
		
	}
}
