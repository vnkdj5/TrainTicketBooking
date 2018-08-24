app.controller("myCntrl", function ($scope, myService) {  
  
$scope.LoginCheck = function () {  
        var User = {  
            emailId: $scope.uName,  
            password: $scope.password  
        };  
        $("#divLoading").show();  
        var getData = myService.UserLogin(User); 
        document.write(gestdata);
        getData.then(function (msg) {  
            if (msg.data == "0") {  
                $("#divLoading").hide();  
                $("#alertModal").modal('show');  
                $scope.msg = "Password Incorrect !";  
            }  
            else if (msg.data == "-1") {  
                $("#divLoading").hide();  
                $("#alertModal").modal('show');  
                $scope.msg = "Username Incorrect !";  
            }  
            else {  
                uID = msg.data;  
                $("#divLoading").hide();  
                window.location.href = "/Home/Index";  
            }  
        });  
       
    }  
  
function clearFields() {  
        $scope.uName = '';        
        $scope.uPwd = '';  
    }  
  
$scope.alertmsg = function () {  
    $("#alertModal").modal('hide');  
}; 
});  
 