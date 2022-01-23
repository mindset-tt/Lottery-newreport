// To parse this JSON data, do
//
//     final listOfbillcanceMd = listOfbillcanceMdFromJson(jsonString);

import 'dart:convert';

List<ListOfbillcanceMd> listOfbillcanceMdFromJson(String str) => List<ListOfbillcanceMd>.from(json.decode(str).map((x) => ListOfbillcanceMd.fromJson(x)));

String listOfbillcanceMdToJson(List<ListOfbillcanceMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListOfbillcanceMd {
    ListOfbillcanceMd({
        this.lotteryNumber,
        this.lotteryPrice,
    });

    String lotteryNumber;
    int lotteryPrice;

    factory ListOfbillcanceMd.fromJson(Map<String, dynamic> json) => ListOfbillcanceMd(
        lotteryNumber: json["lottery_number"],
        lotteryPrice: json["lottery_price"],
    );

    Map<String, dynamic> toJson() => {
        "lottery_number": lotteryNumber,
        "lottery_price": lotteryPrice,
    };
}
