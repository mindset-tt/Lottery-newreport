// To parse this JSON data, do
//
//     final emeideviceMd = emeideviceMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<EmeideviceMd> emeideviceMdFromJson(String str) => List<EmeideviceMd>.from(json.decode(str).map((x) => EmeideviceMd.fromJson(x)));

String emeideviceMdToJson(List<EmeideviceMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmeideviceMd {
    EmeideviceMd({
        this.deviceNumber,
        this.deviceTypeId,
        this.brandId,
        this.brandName,
        this.deviceCode,
        this.deviceRef,
        this.deviceImei,
        this.statusName,
        this.deviceTypeName,
        this.branchId,
        this.deviceDate,
    });

    int deviceNumber;
    int deviceTypeId;
    int brandId;
    String brandName;
    String deviceCode;
    String deviceRef;
    String deviceImei;
    String statusName;
    String deviceTypeName;
    int branchId;
    DateTime deviceDate;

    factory EmeideviceMd.fromJson(Map<String, dynamic> json) => EmeideviceMd(
        deviceNumber: json["device_number"],
        deviceTypeId: json["device_type_id"],
        brandId: json["brand_id"],
        brandName: json["brand_name"],
        deviceCode: json["device_code"],
        deviceRef: json["device_ref"],
        deviceImei: json["device_imei"],
        statusName: json["status_name"],
        deviceTypeName: json["device_type_name"],
        branchId: json["branch_id"],
        deviceDate: DateTime.parse(json["device_date"]),
    );

    Map<String, dynamic> toJson() => {
        "device_number": deviceNumber,
        "device_type_id": deviceTypeId,
        "brand_id": brandId,
        "brand_name": brandName,
        "device_code": deviceCode,
        "device_ref": deviceRef,
        "device_imei": deviceImei,
        "status_name": statusName,
        "device_type_name": deviceTypeName,
        "branch_id": branchId,
        "device_date": deviceDate.toIso8601String(),
    };
}
