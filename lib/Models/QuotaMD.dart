// To parse this JSON data, do
//
//     final quotaMd = quotaMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<QuotaMd> quotaMdFromJson(String str) => List<QuotaMd>.from(json.decode(str).map((x) => QuotaMd.fromJson(x)));

String quotaMdToJson(List<QuotaMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuotaMd {
    QuotaMd({
        this.digitLenght,
        this.maxValues,
        this.pricePerNumber,
    });

    int digitLenght;
    String maxValues;
    String pricePerNumber;

    factory QuotaMd.fromJson(Map<String, dynamic> json) => QuotaMd(
        digitLenght: json["digit_lenght"],
        maxValues: json["max_values"],
        pricePerNumber: json["price_per_number"],
    );

    Map<String, dynamic> toJson() => {
        "digit_lenght": digitLenght,
        "max_values": maxValues,
        "price_per_number": pricePerNumber,
    };
}
