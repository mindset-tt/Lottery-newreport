// To parse this JSON data, do
//
//     final deviceMd = deviceMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<DeviceMd> deviceMdFromJson(String str) => List<DeviceMd>.from(json.decode(str).map((x) => DeviceMd.fromJson(x)));

String deviceMdToJson(List<DeviceMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeviceMd {
    DeviceMd({
        this.deviceTypeId,
        this.deviceTypeName,
    });

    int deviceTypeId;
    String deviceTypeName;

    factory DeviceMd.fromJson(Map<String, dynamic> json) => DeviceMd(
        deviceTypeId: json["device_type_id"],
        deviceTypeName: json["device_type_name"],
    );

    Map<String, dynamic> toJson() => {
        "device_type_id": deviceTypeId,
        "device_type_name": deviceTypeName,
    };
}
