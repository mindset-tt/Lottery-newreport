// To parse this JSON data, do
//
//     final proviceMd = proviceMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<ProviceMd> proviceMdFromJson(String str) => List<ProviceMd>.from(json.decode(str).map((x) => ProviceMd.fromJson(x)));

String proviceMdToJson(List<ProviceMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProviceMd {
    ProviceMd({
        this.proviceId,
        this.provinceName,
    });

    int proviceId;
    String provinceName;

    factory ProviceMd.fromJson(Map<String, dynamic> json) => ProviceMd(
        proviceId: json["provice_id"],
        provinceName: json["province_name"],
    );

    Map<String, dynamic> toJson() => {
        "provice_id": proviceId,
        "province_name": provinceName,
    };
}
