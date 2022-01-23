// To parse this JSON data, do
//
//     final reportSaleMd = reportSaleMdFromJson(jsonString);
// ignore_for_file: file_names
import 'dart:convert';

List<ReportSaleMd> reportSaleMdFromJson(String str) => List<ReportSaleMd>.from(
    json.decode(str).map((x) => ReportSaleMd.fromJson(x)));
String reportSaleMdToJson(List<ReportSaleMd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReportSaleMd {
  ReportSaleMd({
    this.row,
    this.deviceCode,
    this.branchName,
    this.dateOfffline,
    this.periodNumber,
    this.sd1,
    this.sd2,
    this.sd3,
    this.sd4,
    this.sd5,
    this.sd6,
    this.total,
  });
  String row;
  String deviceCode;
  String branchName;
  String dateOfffline;
  String periodNumber;
  String sd1;
  String sd2;
  String sd3;
  String sd4;
  String sd5;
  String sd6;
  String total;

  factory ReportSaleMd.fromJson(Map<String, dynamic> json) => ReportSaleMd(
        row: json["row"],
        deviceCode: json["device_code"],
        branchName: json["branch_name"],
        dateOfffline: json["date_offfline"],
        periodNumber: json["period_number"],
        sd1: json["sd1"],
        sd2: json["sd2"],
        sd3: json["sd3"],
        sd4: json["sd4"],
        sd5: json["sd5"],
        sd6: json["sd6"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "row": row,
        "device_code": deviceCode,
        "branch_name": branchName,
        "date_offfline": dateOfffline,
        "period_number": periodNumber,
        "sd1": sd1,
        "sd2": sd2,
        "sd3": sd3,
        "sd4": sd4,
        "sd5": sd5,
        "sd6": sd6,
        "total": total,
      };
}
