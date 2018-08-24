<html ng-app="myApp">  
<head>  
    <title></title>  
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script> 
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
    <script src="scripts/app.js"></script>  
    <script src="scripts/auth/services.js"></script>  
    <script src="scripts/auth/controller.js"></script>  
    
  
</head>  
<body>  
  
    <div ng-controller="myCntrl">  
        <h1>  
          Login</h1>  
        <br />  
        <div id="alertModal" class="modal fade">  
            <div class="modal-dialog">  
                <div class="modal-content">  
                    <!-- dialog body -->  
                    <div class="modal-body">  
                        <button type="button" id="btn" value="Close" class="close" data-dismiss="modal">X</button>  
                        {{msg}}  
                    </div>  
                    <!-- dialog buttons -->  
                    <div class="modal-footer">  
                        <button type="button" ng-click="alertmsg()" class="btn btn-primary">OK</button>  
                    </div>  
                </div>  
            </div>  
        </div>  
  
        <div class="container-fluid">  
            <div class="panel panel-success" style="width: 50%;">  
                <div class="panel-heading">Login</div>  
                <div class="panel-body" style="box-shadow: -6px 2px 46px 7px #888888; padding: 20px;">  
                    <form name="loginForm"  novalidate>  
                        <div class="form-horizontal">  
                            <div class="form-group">     
                                <div class="row">  
                                    <div class="col-md-3" style="text-align: right;">  
                                        Email Id :  
                                    </div>  
                                    <div class="col-md-6">  
                                        <div class="input-group">  
                                            <input type="text" class="form-control" id="Uname" placeholder="Email Id" ng-model="uName" name="Username" required autofocus />  
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>  
                                        </div>                                      
                                    </div>  
                                </div>  
                            </div>  
  
                            <div class="form-group">    
                                <div class="row">  
                                    <div class="col-md-3" style="text-align: right;">  
                                        Password :  
                                    </div>  
                                    <div class="col-md-6">  
                                        <div class="input-group">  
                                            <input type="password" class="form-control" id="password" placeholder="Password" ng-model="password" name="Password" required autofocus />  
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>  
                                        </div>                                       
                                    </div>  
                                    </div>                                   
                            <div class="form-group">  
                                <div class="row">  
                                    <div class="col-md-6">  
                                        <div id="divLoading" style="margin: 0px; padding: 0px; position: fixed; right: 0px; top: 0px; width: 100%; height: 100%; background-color: #666666; z-index: 30001; opacity: .8; filter: alpha(opacity=70); display: none">  
                                            <p style="position: absolute; top: 30%; left: 45%; color: White;">  
                                                please wait...<img src="~/Content/images/load.png">  
                                            </p>  
                                        </div>  
                                    </div>  
                                </div>  
                            </div>  
  
                            <div class="form-group">  
                                <div class="row">  
                                    <div class="col-md-5" style="text-align: right;">  
                                        <button id="btnLogin" type="submit" class="btn btn-success" ng-disabled="!(password && uName)" ng-click="LoginCheck()">Login</button>  
                                    </div>                                      
                                </div>  
                            </div> 
                             
                        </div>  
                    </form>  
                </div>  
            </div>  
        </div>  
    </div>  
</body>  
</html>   