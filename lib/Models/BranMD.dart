// To parse this JSON data, do
//
//     final branMd = branMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<BranMd> branMdFromJson(String str) => List<BranMd>.from(json.decode(str).map((x) => BranMd.fromJson(x)));

String branMdToJson(List<BranMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BranMd {
    BranMd({
        this.brandid,
        this.dtypeId,
        this.brandName,
    });

    int brandid;
    int dtypeId;
    String brandName;

    factory BranMd.fromJson(Map<String, dynamic> json) => BranMd(
        brandid: json["brandid"],
        dtypeId: json["dtype_id"],
        brandName: json["brand_name"],
    );

    Map<String, dynamic> toJson() => {
        "brandid": brandid,
        "dtype_id": dtypeId,
        "brand_name": brandName,
    };
}
