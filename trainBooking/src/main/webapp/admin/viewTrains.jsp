<h2>View Trains</h2>
<div ng-controller="trainCtrl" data-ng-init="viewTrains();">
<table class="table">
<tr>
<th>Sr.No.</th><th>TrainID</th><th>TrainName</th><th>Source</th><th>Destination</th><th>Distance</th><th>Fare</th><th>Seats</th>
<th>Departs</th><th>Arrives</th><th>OPTION</th>
</tr>
<tr ng-repeat="train in trains">
<td>{{$index + 1}}</td>
<td>{{train.trainId}}</td>
<td>{{train.name}}</td>
<td>{{train.sourceStation}}</td>
<td>{{train.destinationStation}}</td>
<td>{{train.distance}}</td>
<td>{{train.fare}}</td>
<td>{{train.seats}}</td>
<td>{{train.departs | timeFormat}}</td>
<td>{{train.arrives | timeFormat}}</td>
<td><button data-toggle="modal" data-target="#editModal" class="btn btn-info" ng-click="editTrain($index)"><i class="fas fa-edit"></i> Edit</button></td>
</tr>
</table>


<!-- The Modal -->
<div class="modal" id="editModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <!-- <div ng-include src="'admin/addTrains.html'"></div> -->
        {{train.id}}
        <form role="form" class="form-horizontal"
				ng-submit="updateTrain()" name="trainform">
				<div class="form-group">
					<label for="trainName" class="col-sm-4 control-label">
						TrainName</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="trainName"
							placeholder="" ng-model="train.name" required/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="trainId" class="col-sm-4 control-label"> Train
						Id</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="trainId"
							placeholder="SRCDSTTYPE" ng-model="train.trainId" required/>
					</div>
				</div>

				<div class="form-group">
					<label for="sourceStation" class="col-sm-4 control-label">
						Source Station</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="sourceStation"
							placeholder="" ng-model="train.sourceStation" required />
					</div>
				</div>

				<div class="form-group">
					<label for="destinationStation" class="col-sm-4 control-label">
						Destination Station</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="destinationStation"
							placeholder="" ng-model="train.destinationStation" required/>
					</div>
				</div>
				<div class="form-group">
					<label for="departs" class="col-sm-4 control-label"> Departs (Source)</label>
					<div class="col-sm-10">
						 <input type="time"	class="form-control" id="departs" 	ng-model="departsEdit" required/>
						 <input type="hidden" ng-model="train.departs" value="{{train.departs=departsEdit.getHours()*3600+departsEdit.getMinutes()*60}}">
					</div>
				</div>
				<div class="form-group">
					<label for="arrives" class="col-sm-4 control-label"> Arrives (Destination)</label>
					<div class="col-sm-10">
						 <input type="time"	class="form-control" id="arrives" required 	ng-model="arrivesEdit" />
							<input type="hidden" ng-model="train.arrives" value="{{train.arrives=arrivesEdit.getHours()*3600+arrivesEdit.getMinutes()*60}}">
					</div>
				</div>
				<div class="form-group">
					<label for="distance" class="col-sm-4 control-label">
						Distance</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="distance"
							placeholder="" ng-model="train.distance" required/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="seats" class="col-sm-4 control-label"> Seats Available</label>
					<div class="col-sm-10">
						 <input type="number" class="form-control" id="seats" placeholder="00" ng-model="train.seats" required/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="Fare" class="col-sm-4 control-label"> Fare ($)</label>
					<div class="col-sm-10">
						 <input type="number"
							class="form-control" id="fare" placeholder="00.00"
							ng-model="train.fare" required/>
					</div>
				</div>
				<div class="form-group">
				<label for="weekDays" class="col-sm-4 control-label"> Days Available</label>
					<div week-Days-List week-days="weekDays"></div>
   </div>
				<div class="form-group">
					<label for="trainType" class="col-sm-4 control-label"> Type</label>
					<div class="col-sm-10">
						<select class="form-control" id="trainType" ng-model="train.type">
							<option value="1">Passenger</option>
							<option value="2">Express</option>
							<option value="3">Local</option>
							<option value="4">Super Fast Express</option>
							<option value="5">Special</option>
						</select>
					</div>
				</div>
				<center>
				<button type="submit"  class="btn btn-primary">Update Train</button>
				</center>
			</form>
        
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</div>