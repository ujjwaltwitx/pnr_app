import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:pnr_app/models/pnr_detail_model.dart';
import 'package:pnr_app/models/pnr_history_model.dart';
import 'package:pnr_app/utilities/utility_functions.dart';

final cookieProvider = StateNotifierProvider<CookieNotifier, String>((ref) {
  return CookieNotifier();
});

final imgUrlProvider = StateProvider((ref) {
  ref.watch(cookieProvider);
  return generateImgUrl();
});

final pnrDetailProvider =
    StateNotifierProvider<SeatStatusNotifier, PnrDetailModel>((ref) {
  final cookie = ref.watch(cookieProvider);
  return SeatStatusNotifier(cookie);
});

class CookieNotifier extends StateNotifier<String> {
  CookieNotifier() : super('');

  void updateCookie() async {
    state = await generateCookie();
  }
}

class SeatStatusNotifier extends StateNotifier<PnrDetailModel> {
  final String _cookie;
  SeatStatusNotifier(this._cookie) : super(PnrDetailModel());

  void init(int ans, int pnr) async {
    await getData(ans, pnr);
  }

  Future<void> getData(int ans, int pnr) async {
    final Dio dio = Dio();
    final response = await dio.get(
      "https://www.indianrail.gov.in/enquiry/CommonCaptcha?inputCaptcha=$ans&inputPnrNo=$pnr&inputPage=PNR&language=en",
      options: Options(
          headers: {"Cookie": _cookie, "Host": "www.indianrail.gov.in"}),
    );
    final data = response.data;
    state = PnrDetailModel.fromJSON(data);
  }
}

class PnrHistoryNotifier extends StateNotifier<List<PnrHistoryModel>> {
  final pnrHistory = isarDB.pnrHistoryModels;
  PnrHistoryNotifier() : super([]);

  void init() async {
    final allData = pnrHistory.where().limit(5);
    await allData.findAll().then((value) {
      state = value;
    });
  }

  void addNew(int pnrNum, String source, String destination) async {
    final newRecord = PnrHistoryModel()
      ..pnrNum = pnrNum
      ..destination = destination
      ..source = source;
    await isarDB.writeTxn(() async {
      await pnrHistory.filter().pnrNumEqualTo(pnrNum).deleteAll();
      await isarDB.pnrHistoryModels.put(newRecord);
    });
  }

  void streamDB() async {
    Stream<void> stream = isarDB.pnrHistoryModels.watchLazy();
    stream.listen((event) async {
      await pnrHistory.where().findAll().then((value) {
        state = value;
      });
    });
  }
}

final pnrHistoryList =
    StateNotifierProvider<PnrHistoryNotifier, List<PnrHistoryModel>>(
  (ref) => PnrHistoryNotifier(),
);

final pnrTextEditingController =
    StateProvider((ref) => TextEditingController());

final ansTextEditingController =
    StateProvider((ref) => TextEditingController());
