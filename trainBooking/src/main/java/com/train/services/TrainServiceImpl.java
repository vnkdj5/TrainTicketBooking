package com.train.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.train.bean.Train;

@Repository
@Service("trainService")
public class TrainServiceImpl implements TrainService {

	@Autowired
	MongoTemplate mongoTemplate;
	final String COLLECTION="trainInfo";
	
	public void create(Train train) {
			mongoTemplate.insert(train);
		
	}

	
	public void update(Train train) {
		mongoTemplate.save(train);
	}

	
	public List<Train> findAll() {
		
		return mongoTemplate.findAll(Train.class);
	}

	public List<Train> find(String source, String dest, int day, String type) {
		Query query=new Query(Criteria.where("sourceStation").regex(source,"i").and("destinationStation").regex(dest,"i").and("days").is(day));
		return mongoTemplate.find(query, Train.class, COLLECTION);
	}

}
