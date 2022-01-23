// To parse this JSON data, do
//
//     final listofbillMd = listofbillMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<ListofbillMd> listofbillMdFromJson(String str) => List<ListofbillMd>.from(json.decode(str).map((x) => ListofbillMd.fromJson(x)));

String listofbillMdToJson(List<ListofbillMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListofbillMd {
    ListofbillMd({
        this.lotteryNumber,
        this.lotteryPrice,
    });

    String lotteryNumber;
    int lotteryPrice;

    factory ListofbillMd.fromJson(Map<String, dynamic> json) => ListofbillMd(
        lotteryNumber: json["lottery_number"],
        lotteryPrice: json["lottery_price"],
    );

    Map<String, dynamic> toJson() => {
        "lottery_number": lotteryNumber,
        "lottery_price": lotteryPrice,
    };
}
