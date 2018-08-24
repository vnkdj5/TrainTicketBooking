app.service("myService", function ($http) {  
  
 this.UserLogin = function (User) {  
        var response = $http({  
            method: "post",  
            url: "/Login/",  
            data: JSON.stringify(User),  
            dataType: "json"  
        });  
        return response;  
    }  
  
});