var app = angular.module("trainApp", ["ngRoute", 'ngCookies']); 
app.config(function($routeProvider) {
	$routeProvider
	.when("/", {
		templateUrl : "admin/home_view.jsp"
	})
	.when("/addTrain", {
		templateUrl : "admin/addTrains.html",
		controller: "trainCtrl"
	})
	.when("/viewTrains", {
		templateUrl : "admin/viewTrains.jsp",
		controller: "trainCtrl"
	})
	.when("/test", {
		templateUrl : "/test"
	})
	.when("/searchTrain",{
		templateUrl: "user/searchTrain.html",
		controller: "searchCtrl"
	})
	.otherwise({
		templateUrl : "user/404.html"
	});
});

app.filter('timeFormat', function() {
	/*
	 * Filter for converting time into HH:MM from db_value
	 */
	return function(x) {
		var hr=parseInt((x/3600));
		var rem=x-(hr*3600);
		var min=parseInt((rem/60));
		var txt=("00"+hr).slice(-2)+":"+("00"+min).slice(-2); 
		return txt;
	};
});

app.filter('timeReverseFormat', function() {
	/*
	 * Filter for converting time into HH:MM from db_value
	 */
	return function(x) {
		var hr=parseInt((x/3600));
		var rem=x-(hr*3600);
		var min=parseInt((rem/60));

		return new Date(1970, 0, 1, hr, min, 0);
	};
});