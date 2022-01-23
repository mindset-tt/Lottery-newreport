// To parse this JSON data, do
//
//     final deviceForAuthoriseMd = deviceForAuthoriseMdFromJson(jsonString);

// ignore_for_file: file_names

// To parse this JSON data, do
//
//     final deviceForAuthoriseMd = deviceForAuthoriseMdFromJson(jsonString);

import 'dart:convert';

List<DeviceForAuthoriseMd> deviceForAuthoriseMdFromJson(String str) => List<DeviceForAuthoriseMd>.from(json.decode(str).map((x) => DeviceForAuthoriseMd.fromJson(x)));

String deviceForAuthoriseMdToJson(List<DeviceForAuthoriseMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeviceForAuthoriseMd {
    DeviceForAuthoriseMd({
      this.row,
        this.dateRegister,
        this.deviceCode,
        this.deviceTypeName,
        this.usStatus,
        this.deviceNumber,
    });
     String row;
    DateTime dateRegister;
    String deviceCode;
    String deviceTypeName;
    String usStatus;
    int deviceNumber;

    factory DeviceForAuthoriseMd.fromJson(Map<String, dynamic> json) => DeviceForAuthoriseMd(
      row: json["row"],
        dateRegister: DateTime.parse(json["date_register"]),
        deviceCode: json["device_code"],
        deviceTypeName: json["device_type_name"],
        usStatus: json["us_status"],
        deviceNumber: json["device_number"],
    );

    Map<String, dynamic> toJson() => {
      "row": row,
        "date_register": dateRegister.toIso8601String(),
        "device_code": deviceCode,
        "device_type_name": deviceTypeName,
        "us_status": usStatus,
        "device_number": deviceNumber,
    };
}
