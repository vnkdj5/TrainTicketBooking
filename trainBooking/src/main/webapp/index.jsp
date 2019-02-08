
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Train Ticket booking app">
<meta name="author" content="Vaibhav K">


<title>Train Ticket Booking</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-cookies.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script src="scripts/app.js"></script>
<script src="scripts/auth/services.js"></script>
<script src="scripts/auth/controller.js"></script>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<!-- Custom styles for this template -->

<style type="text/css">
/* Show it is fixed to the top */
body {
	min-height: 75rem;
	padding-top: 4.5rem;
}
</style>
</head>

<body ng-app="trainApp" ng-controller="loginCtrl" >

	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="#!">Train Ticket Booking</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<!-- <li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li> -->
				<li class="nav-item"><a class="nav-link" href="#!trainList">TrainList</a>
				</li>
				<li class="nav-item"><a class="nav-link disabled" href="#">About
						US</a></li>
			</ul>
			<div class="form-inline mt-2 mt-md-0">
				<div id="loginMenu" ng-show="!loggedin">
				<button class="btn btn-outline-success my-2 my-sm-0"
					data-toggle="modal" data-target="#myModal">SignUp</button>
				<button class="btn btn-outline-success my-2 my-sm-0"
					data-toggle="modal" data-target="#myModal">Login</button>
					</div>
					<div id="logoutMenu" ng-show="loggedin">
					<div style="color:white;">
					 {{userName}}!
					</div>
					<button class="btn btn-outline-success my-2 my-sm-0" ng-click="logout()">Logout</button>
					</div>
			</div>
		</div>
	</nav>

	<main role="main" class="container">
	<div class="row">
		<div class="col-sm-2" style="border-right: 1px solid darkgrey;">
			<ul class="nav nav-pills flex-column">
				<li class="nav-item"><a class="nav-link active" href="#!">Home</a></li>
				<li class="nav-item" ng-show="type==0"><a class="nav-link" href="#!addTrain"  >Add Trains</a></li>
				<li class="nav-item"  ng-show="type==0"><a class="nav-link" href="#!viewTrains" >View Trains</a></li>
				<li class="nav-item"  ng-show="type==3 || type==1"><a class="nav-link" href="#!searchTrain" >Search Trains</a></li>
				
			</ul>
		</div>
		<!-- ---------------------- MAIN CONTAINER -------------------- -->
		<div class="col-sm-10">
			<div ng-view></div>
		</div>

	</div>




	</main>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true"
		>
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Login/Registration</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>

				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-10">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
								<li><a href="#Registration" data-toggle="tab">Registration</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane active" id="Login">
									<form role="form" class="form-horizontal"
										ng-submit="loginCtrl.loginCheck()" name="loginform">
										<div class="form-group">
											<label for="email" class="col-sm-2 control-label">
												Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" id="lemail"
													placeholder="Email" ng-model="user.emailId" />
											</div>
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1"
												class="col-sm-2 control-label"> Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" id="lpassword"
													placeholder="Email" ng-model="user.password" />
											</div>
										</div>
										<div class="row">
											<div class="col-sm-2"></div>
											<div class="col-sm-10">
												<button type="submit" class="btn btn-primary btn-sm"
													ng-click="loginCheck()">Submit</button>
												<!-- <a href="javascript:;">Forgot your password?</a> -->
												
											</div>
										</div>
									</form>
								</div>
								<div class="tab-pane" id="Registration">
									<form role="form" class="form-horizontal"
										ng-submit="loginCtrl.registerUser()">
										<div class="form-group">
											<label for="email" class="col-sm-2 control-label">
												Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" placeholder="Name"
													ng-model="user.name" />
											</div>
										</div>
										<div class="form-group">
											<label for="email" class="col-sm-2 control-label">
												Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" id="email"
													placeholder="Email" ng-model="user.emailId" />
											</div>
										</div>
										<div class="form-group">
											<label for="mobile" class="col-sm-2 control-label">
												Mobile</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="mobile"
													placeholder="Mobile" ng-model="user.mobileNo" />
											</div>
										</div>
										<div class="form-group">
											<label for="dateOfBirth" class="col-sm-2 control-label">
												Birth Date</label>
											<div class="col-sm-10">
												<input type="date" class="form-control" id="dateOfBirth"
													placeholder="DD/MM/YYYY" ng-model="user.dateOfBirth" />
											</div>
										</div>

										<div class="form-group">
											<label for="password" class="col-sm-2 control-label">
												Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" id="password"
													placeholder="Password" ng-model="user.password" />
											</div>
										</div>

										<div class="row">
											<div class="col-sm-2"></div>
											<div class="col-sm-10">
												<button type="submit" class="btn btn-primary btn-sm"
													ng-click="registerUser()">Register</button>
												<button type="reset" class="btn btn-default btn-sm">
													Reset</button>
											</div>
										</div>
									</form>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Login/ Reg modal code ends -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>
