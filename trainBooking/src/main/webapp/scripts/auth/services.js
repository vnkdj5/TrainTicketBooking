app.service("myService", function ($http) {  

	this.UserLogin = function (User) {  

		return $http({  
			method: "post",  
			url: "/trainBooking/Login/",  
			data: JSON.stringify(User),  
			dataType: "json"  
		});

		/* 
        var data = angular.toJson(User);
		var config = {
                headers : {
                	'Accept':'application/json',
                    'Content-Type': 'application/json'
                }
            }
		return $http.post(
			'/trainBooking/Login',data,config
		);
		 */
	};

	this.UserRegister=function (User)
	{
		var response=$http(
				{
					method: "post",
					url: "/trainBooking/register",
					data: JSON.stringify(User),
					dataType: "json"
				});
		return response;
	};

	this.AddTr=function (train)
	{
		var response=$http(
				{
					method: "post",
					url: "/trainBooking/addtrain",
					data: JSON.stringify(train),
					dataType: "json"
				});
		return response;
	};

	this.updateTrainSer= function (train) {
		var config={
			dataType:"json"	
		};
		return $http.post("/trainBooking/updateTrain",train,config);
	}
	this.getTrains=function(){
		return $http.get("/trainBooking/gettrains");
	}

});

app.service("searchService", function($http){
	this.getResult= function(search){
		
		return $http.get("/trainBooking/getsearchdetails",{params: {sourceStation: search.sourceStation,destinationStation: search.destinationStation,journeyDate:search.journeyDate, day:search.day, trainType:search.trainType}});
	}
})