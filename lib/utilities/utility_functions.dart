import 'dart:math';

import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pnr_app/models/pnr_history_model.dart';

String generateImgUrl() {
  Random rnd = Random();
  int imgId = 1690104570000 + rnd.nextInt(8999) + 1000;
  String imgUrl =
      "https://www.indianrail.gov.in/enquiry/captchaDraw.png?$imgId";
  return imgUrl;
}

Future<String> generateCookie() async {
  Dio dio = Dio();
  String cookie = "";
  final response = await dio.get(
      "https://www.indianrail.gov.in/enquiry/PNR/PnrEnquiry.html?locale=en",
      options: Options(headers: {"connection": "keep-live"}));
  final headers = response.headers['set-cookie'];
  for (int i = 0; i < headers!.length; i++) {
    cookie += "${headers[i].split(";").first};";
  }
  return cookie;
}

late Isar isarDB;

Future<void> isarInit() async {
  final dir = await getApplicationSupportDirectory();
  isarDB = await Isar.open(
    [PnrHistoryModelSchema],
    directory: dir.path,
  );
}
