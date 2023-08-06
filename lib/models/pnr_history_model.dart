import 'package:isar/isar.dart';

part 'pnr_history_model.g.dart';

@collection
class PnrHistoryModel {
  Id id = Isar.autoIncrement;
  String? destination;
  String? source;
  int? pnrNum;
}
