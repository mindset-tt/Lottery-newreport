// To parse this JSON data, do
//
//     final comboUnitMd = comboUnitMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<ComboUnitMd> comboUnitMdFromJson(String str) => List<ComboUnitMd>.from(json.decode(str).map((x) => ComboUnitMd.fromJson(x)));

String comboUnitMdToJson(List<ComboUnitMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ComboUnitMd {
    ComboUnitMd({
        this.unitName,
        this.unitId,
    });

    String unitName;
    int unitId;

    factory ComboUnitMd.fromJson(Map<String, dynamic> json) => ComboUnitMd(
        unitName: json["unit_name"],
        unitId: json["unit_id"],
    );

    Map<String, dynamic> toJson() => {
        "unit_name": unitName,
        "unit_id": unitId,
    };
}
