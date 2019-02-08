/**
 * 
 */
package com.train.bean;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author Vaibhav
 *
 */

@Document(collection="trainInfo")
public class Train {
@Id
private String id;
private String name,trainId,sourceStation,destinationStation,type;
double fare,distance;
int seats,arrives,departs;
int days[];





/**
 * @param id
 * @param name
 * @param trainId
 * @param sourceStation
 * @param destinationStation
 * @param type
 * @param fare
 * @param distance
 * @param arrives
 * @param departs
 * @param days
 * @param seats
 */
public Train(String id, String name, String trainId, String sourceStation, String destinationStation, String type,
		double fare, double distance, int arrives, int departs, int[] days, int seats) {
	super();
	this.id = id;
	this.name = name;
	this.trainId = trainId;
	this.sourceStation = sourceStation;
	this.destinationStation = destinationStation;
	this.type = type;
	this.fare = fare;
	this.distance = distance;
	this.arrives = arrives;
	this.departs = departs;
	this.days = days;
	this.seats = seats;
}
public Train()
{
	
}

/**
 * @return the arrives
 */
public int getArrives() {
	return arrives;
}
/**
 * @param arrives the arrives to set
 */
public void setArrives(int arrives) {
	this.arrives = arrives;
}
/**
 * @return the departs
 */
public int getDeparts() {
	return departs;
}
/**
 * @param departs the departs to set
 */
public void setDeparts(int departs) {
	this.departs = departs;
}
/**
 * @return the days
 */
public int[] getDays() {
	return days;
}
/**
 * @param days the days to set
 */
public void setDays(int[] days) {
	this.days = days;
}
/**
 * @return the id
 */
public String getId() {
	return id;
}
/**
 * @param id the id to set
 */
public void setId(String id) {
	this.id = id;
}
/**
 * @return the name
 */
public String getName() {
	return name;
}
/**
 * @param name the name to set
 */
public void setName(String name) {
	this.name = name;
}
/**
 * @return the trainId
 */
public String getTrainId() {
	return trainId;
}
/**
 * @param trainId the trainId to set
 */
public void setTrainId(String trainId) {
	this.trainId = trainId;
}
/**
 * @return the sourceStation
 */
public String getSourceStation() {
	return sourceStation;
}
/**
 * @param sourceStation the sourceStation to set
 */
public void setSourceStation(String sourceStation) {
	this.sourceStation = sourceStation;
}
/**
 * @return the destinationStation
 */
public String getDestinationStation() {
	return destinationStation;
}
/**
 * @param destinationStation the destinationStation to set
 */
public void setDestinationStation(String destinationStation) {
	this.destinationStation = destinationStation;
}
/**
 * @return the type
 */
public String getType() {
	return type;
}
/**
 * @param type the type to set
 */
public void setType(String type) {
	this.type = type;
}
/**
 * @return the fare
 */
public double getFare() {
	return fare;
}
/**
 * @param fare the fare to set
 */
public void setFare(double fare) {
	this.fare = fare;
}
/**
 * @return the distance
 */
public double getDistance() {
	return distance;
}
/**
 * @param distance the distance to set
 */
public void setDistance(double distance) {
	this.distance = distance;
}
/**
 * @return the seats
 */
public int getSeats() {
	return seats;
}
/**
 * @param seats the seats to set
 */
public void setSeats(int seats) {
	this.seats = seats;
}


}
