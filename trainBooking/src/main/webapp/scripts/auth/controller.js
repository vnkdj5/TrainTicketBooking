app.controller("loginCtrl", function ($scope,$cookies,$rootScope, myService,$location) {  
	$scope.user=null;/*=
	{
			emailId:null,
			password:null,
			name:null,
			mobileNo:null,
			dateOfBirth:null

	}*/
	$scope.msg=null;
	
	/*
	 * Function for processing User_Login Request.
	 */
	$scope.loginCheck = function () {  
		var User = $scope.user;
		//  alert(User.emailId);
		myService.UserLogin(User)
		.then(function onSuccess(response) {  
			$scope.msg="Login Successful!\n ";
			var data=response.data;
			if(data.loggedin){
			var now = new Date();
		    now.setDate(now.getDate() + 7); //Expiry date for cookies
		    $cookies.put("loggedin",data.loggedin,{expires:now});
		    $cookies.put("emailId",data.user.emailId,{expires:now});
		    $cookies.put("name",data.user.name,{expires:now});
		    $cookies.put("type",data.type,{expires:now});
		    $scope.loggedin=$cookies.get("loggedin");
		    $rootScope.type=($cookies.get("type")==null)?3:$cookies.get("type");
		    $rootScope.userName=($cookies.get("name")==null)?"Guest":$cookies.get("name");
		    alert(data.message)
			}
			else{
				alert(data.message);
			}

		}).catch(
				function OnError(response)
				{
					alert("Error: "+response.status);
					clearFields();
				}
		);  

	}
	
	$scope.loggedin=$cookies.get("loggedin");
	$rootScope.type=($cookies.get("type")==null)?3:$cookies.get("type");
	$rootScope.userName=($cookies.get("name")==null)?"Guest":$cookies.get("name");
	/*
	$scope.showMenu= function(){
		if($cookies.get("loggedin")==true){
			$("#logoutMenu").show();
			$("#loginMenu").hide();
		}else{
			$("#logoutMenu").hide();
			$("#loginMenu").show();
		}
			
	}
	*/
	$scope.logout= function(){
		$cookies.remove("emailId");
		$cookies.remove("name");
		$cookies.remove("type");
		$cookies.remove("loggedin");
		window.location.href="/trainBooking/";
	}

	/*
	 * Function for handling User Registration
	 */
	$scope.registerUser= function ()
	{

		myService.UserRegister($scope.user)
		.then(function onSuccess(response)
		{ 
			var data=response.data;
			alert(data.message);
			clearFields();

		}).catch(
				function onError(response)
				{
					alert(reponse.status+reponse.ststusText);

				}
		);
	}

	function clearFields() {  
		$scope.emailId = '';        
		$scope.password = '';  
	}  

	$scope.alertmsg = function () {  
		// $("#alertModal").modal('hide');  
	}; 
});
/*
 * Controller for adding trains and for performing manipulations [ADMIN]
 */

app.controller("trainCtrl",function($scope,$rootScope,$cookies,$filter,myService)
		{
	$scope.departs=new Date(1970, 0, 1, 6, 0, 0);
	$scope.arrives=new Date(1970, 0, 1, 8, 0, 0);
	
	
	$scope.train=
	{
			id:null,
			trainId:null,
			name:null,
			sourceStation:null,
			destinationStation:null,
			departs:0,
			arrives:0,
			distance:0.0,
			fare:0.0,
			days:[],
			seats:0,
			type:"1"

	};
	$scope.trains=[];
	$scope.parseInt = parseInt;

	$scope.weekDays = [{
		name: "Sun",
		value: false,
	},
	{
		name: "Mon",
		value: true,
	}, {
		name: "Tues",
		value: true,
	}, {
		name: "Wed",
		value: true,
	}, {
		name: "Thur",
		value: true,
	}, {
		name: "Fri",
		value: true,
	}, {
		name: "Sat",
		value: true,
	},  ];
	$scope.getDays = function() {
		var i = 0;
		
		for (i; i < $scope.weekDays.length; i++) {
			if ($scope.weekDays[i].value) {
				$scope.train.days[i]= (i+1);
			}
		}
	
	}

		$scope.addTrain = function () { 
			// alert("here");
			$scope.getDays();
			
			myService.AddTr($scope.train)
			.then(function onSuccess(response) {  
				$scope.msg=response.data.message;
				alert(response.data.message);
			}).catch(
					function OnError(response)
					{
						alert("Error: "+response.status);

					}

			);  

		};
		
		$scope.updateTrain= function() {
			$scope.getDays();
			myService.updateTrainSer($scope.train)
			.then(function onSuccess(response){
				$('#editModal').modal('toggle');
				alert(response.data.message);
			},function onError(response){
				alert("Error: "+response);
			});
			
			
		};
		
		$scope.viewTrains= function(){
		myService.getTrains()
		.then(function onSuccess(response)
		{	//console.log($scope)
			$scope.trains=response.data;
		}).catch(
				function onError(response){
					alert("Error"+response.status);
				});
		}
		
		
		//$scope.viewTrains();
		$scope.editTrain = function(index){
			//console.log(index);
			$scope.train=$scope.trains[index];
			
	       
			$scope.departsEdit= $scope.getTime($scope.train.departs);
			$scope.arrivesEdit=$scope.getTime($scope.train.arrives);
			//console.log($filter('timeReverseFormat')($scope.train.departs));
			
			//commonService.setValue($rootScope.train);;
		}
		
		$scope.getTime=function(x){
			
			var hr=parseInt((x/3600));
	        var rem=x-(hr*3600);
	        var min=parseInt((rem/60));
			return new Date(1970, 0, 1, hr, min, 0);
		}

	});
app.controller("searchCtrl",function($scope,$rootScope,searchService)	{
	$scope.search={};
	$scope.search.sourceStation=null;
	$scope.search.destinationStation=null;
	$scope.search.journeyDate=new Date();
	$scope.search.trainType="0";
	$scope.search.day=null;
	$scope.trains=[];
	$scope.searchTrain= function(){
		//TODO: Create JSON FRom input data and then send search request to the server
		//TODO: Create service 
		var day1=$scope.search.journeyDate.getDay();
		$scope.search.day=day1+1;
		
		searchService.getResult($scope.search)
		.then(function onSuccess(response){
			$scope.trains=response.data.list;
			$scope.IsVisible=true;
		},
		function onError(response){
			alert(response.status);
		});
		}
	
	 //This will hide the DIV by default.
    $scope.IsVisible = false;
    $scope.ShowHide = function () {
        //If DIV is visible it will be hidden and vice versa.
        $scope.IsVisible = $scope.IsVisible ? false : true;
    }

});



app.directive('weekDaysList', [weekDaysList]);

function weekDaysList() {
  return {
    template: ' <div class="row" style="padding-left:15px;">' +
      '<div class="col-sm-1" style="padding-right:0px;" ng-repeat="option in weekDays">' +
      '<label class="clear"  >' +
      '<input type="checkbox" style=""' +
      'class="radio-week-day" ng-model="option.value">' +
      '&nbsp;{{option.name}}</label></div>' +
      '</div>',
    restrict: 'A',
    replace: true,
    scope: {
      weekDays: "="
    },
    link: function(scope, element) {
      /**
       * @ngdoc method
       * @name destroy
       * @description
       * # utterly destroy listeners and anything else
       */
      // Write anything which you need to do with the days list

    }
  };
}