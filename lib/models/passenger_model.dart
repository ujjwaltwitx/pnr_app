class PassengerModel {
  late String currentStatus;
  late String bookingStatusDetails;
  late int passengerSerialNumber;

  PassengerModel();

  factory PassengerModel.fromJSON(Map<String, dynamic> data) {
    PassengerModel obj = PassengerModel();
    obj.currentStatus = data['currentStatus'];
    obj.bookingStatusDetails = data['bookingStatusDetails'];
    obj.passengerSerialNumber = data['passengerSerialNumber'];

    return obj;
  }
}
