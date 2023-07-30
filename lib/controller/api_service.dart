import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pnr_app/utilities/utility_functions.dart';

final cookieProvider = FutureProvider<CookieNotifier>((ref) async {
  final initialCookie = await generateCookie();
  return CookieNotifier(initialCookie);
});

final imgUrlProvider = StateProvider((ref) {
  return generateImgUrl();
});

final pnrProvider = StateProvider<int>((ref) => 0);
final ansProvider = StateProvider<int>((ref) => 0);

final seatStatusProvider = StateProvider((ref) {
  final asyncValue = ref.watch(cookieProvider);
  final pnr = ref.watch(pnrProvider);
  final ans = ref.watch(ansProvider);
  String cookie = "";
  asyncValue.when(
    data: (data) {
      cookie = data.state;
    },
    error: (error, stackTrace) {},
    loading: () {},
  );

  return SeatStatusNotifier(cookie, pnr, ans);
});

class CookieNotifier extends StateNotifier<String> {
  final String initialCookie;
  CookieNotifier(this.initialCookie) : super(initialCookie);

  void updateCookie() async {
    state = await generateCookie();
  }
}

class SeatStatusNotifier extends StateNotifier<Map<String, dynamic>> {
  final String _cookie;
  final int _pnrNumber;
  final int _ans;
  SeatStatusNotifier(this._cookie, this._pnrNumber, this._ans) : super({});
  final Dio _dio = Dio();
  void getData() async {
    final response = await _dio.get(
      "https://www.indianrail.gov.in/enquiry/CommonCaptcha?inputCaptcha=$_ans&inputPnrNo=$_pnrNumber&inputPage=PNR&language=en",
      options: Options(
          headers: {"Cookie": _cookie, "Host": "www.indianrail.gov.in"}),
    );
    final data = response.data;
    print(_pnrNumber);
    print(_ans);
    print(data);

    state = data;
  }
}
