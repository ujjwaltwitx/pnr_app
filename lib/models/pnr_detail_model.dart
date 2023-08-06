import 'package:intl/intl.dart';

import 'passenger_model.dart';

class PnrDetailModel {
  late String pnrNumber;
  late DateTime doj;
  late String trainNumber;
  late String trainName;
  late String sourceStation;
  late String destinationStation;
  late String journeyClass;
  late String chartStatus;
  late int distance;
  late List<PassengerModel> passengerList = [];

  PnrDetailModel();

  factory PnrDetailModel.fromJSON(Map<String, dynamic> data) {
    final PnrDetailModel obj = PnrDetailModel();

    obj.pnrNumber = data['pnrNumber'];
    obj.trainNumber = data['trainNumber'];
    obj.trainName = data['trainName'];
    obj.sourceStation = data['sourceStation'];
    obj.destinationStation = data['destinationStation'];
    obj.journeyClass = data['journeyClass'];
    obj.chartStatus = data['chartStatus'];
    obj.distance = data['distance'];

    DateFormat inputFormat = DateFormat("MMM d, yyyy h:mm:ss a");
    obj.doj = inputFormat.parse(data['dateOfJourney']);

    for (int i = 0; i < data['passengerList'].length; i++) {
      obj.passengerList.add(PassengerModel.fromJSON(data['passengerList'][i]));
    }
    return obj;
  }
}
