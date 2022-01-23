// To parse this JSON data, do
//
//     final cerrentperiodMd = cerrentperiodMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<CerrentperiodMd> cerrentperiodMdFromJson(String str) => List<CerrentperiodMd>.from(json.decode(str).map((x) => CerrentperiodMd.fromJson(x)));

String cerrentperiodMdToJson(List<CerrentperiodMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CerrentperiodMd {
    CerrentperiodMd({
        this.onlineId,
        this.periodNumber,
        this.onlineStatus,
    });

    int onlineId;
    String periodNumber;
    String onlineStatus;

    factory CerrentperiodMd.fromJson(Map<String, dynamic> json) => CerrentperiodMd(
        onlineId: json["online_id"],
        periodNumber: json["period_number"],
        onlineStatus: json["online_status"],
    );

    Map<String, dynamic> toJson() => {
        "online_id": onlineId,
        "period_number": periodNumber,
        "online_status": onlineStatus,
    };
}
