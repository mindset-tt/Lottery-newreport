// To parse this JSON data, do
//
//     final periodMd = periodMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<PeriodMd> periodMdFromJson(String str) =>
    List<PeriodMd>.from(json.decode(str).map((x) => PeriodMd.fromJson(x)));

String periodMdToJson(List<PeriodMd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PeriodMd {
  PeriodMd({
    this.row,
    this.onlineId,
    this.periodNumber,
    this.onlineStatus,
    this.dateOnline,
    this.timeOnline,
    this.dateOffline,
    this.timeOffline,
    this.createBy,
    this.dateEnd,
    this.timeEnd,
    this.lotteryNumber,
  });
  String row;
  int onlineId;
  String periodNumber;
  int onlineStatus;
  DateTime dateOnline;
  String timeOnline;
  DateTime dateOffline;
  String timeOffline;
  int createBy;
  DateTime dateEnd;
  String timeEnd;
  dynamic lotteryNumber;

  factory PeriodMd.fromJson(Map<String, dynamic> json) => PeriodMd(
        row: json["row"],
        onlineId: json["online_id"],
        periodNumber: json["period_number"],
        onlineStatus: json["online_status"],
        dateOnline: DateTime.parse(json["date_online"]),
        timeOnline: json["time_online"],
        dateOffline: DateTime.parse(json["date_offline"]),
        timeOffline: json["time_offline"],
        createBy: json["create_by"],
        dateEnd: DateTime.parse(json["date_end"]),
        timeEnd: json["time_end"],
        lotteryNumber: json["lottery_number"],
      );

  Map<String, dynamic> toJson() => {
        "row": row,
        "online_id": onlineId,
        "period_number": periodNumber,
        "online_status": onlineStatus,
        "date_online": dateOnline.toIso8601String(),
        "time_online": timeOnline,
        "date_offline": dateOffline.toIso8601String(),
        "time_offline": timeOffline,
        "create_by": createBy,
        "date_end": dateEnd.toIso8601String(),
        "time_end": timeEnd,
        "lottery_number": lotteryNumber,
      };
}
