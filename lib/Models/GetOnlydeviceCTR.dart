// To parse this JSON data, do
//
//     final getonlydeviceMd = getonlydeviceMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<GetonlydeviceMd> getonlydeviceMdFromJson(String str) => List<GetonlydeviceMd>.from(json.decode(str).map((x) => GetonlydeviceMd.fromJson(x)));

String getonlydeviceMdToJson(List<GetonlydeviceMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetonlydeviceMd {
    GetonlydeviceMd({
        this.deviceCode,
    });

    String deviceCode;

    factory GetonlydeviceMd.fromJson(Map<String, dynamic> json) => GetonlydeviceMd(
        deviceCode: json["device_code"],
    );

    Map<String, dynamic> toJson() => {
        "device_code": deviceCode,
    };
}
