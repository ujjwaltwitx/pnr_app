import 'dart:math';

import 'package:dio/dio.dart';

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
      "https://www.indianrail.gov.in/enquiry/PNR/PnrEnquiry.html?locale=en");
  final headers = response.headers['set-cookie'];
  for (int i = 0; i < headers!.length; i++) {
    cookie += "${headers[i].split(";").first};";
  }
  return cookie;
}
