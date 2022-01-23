
// ignore_for_file: file_names

// To parse this JSON data, do
//
//     final paymentAwordMd = paymentAwordMdFromJson(jsonString);

import 'dart:convert';

List<PaymentAwordMd> paymentAwordMdFromJson(String str) => List<PaymentAwordMd>.from(json.decode(str).map((x) => PaymentAwordMd.fromJson(x)));

String paymentAwordMdToJson(List<PaymentAwordMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentAwordMd {
    PaymentAwordMd({
        this.totalPriceAll,
        this.totalPricePay,
        this.percent,
        this.statusPay,
        this.winList,
        this.data,
    });

    int totalPriceAll;
    int totalPricePay;
    int percent;
    String statusPay;
    WinList winList;
    List<Datum> data;

    factory PaymentAwordMd.fromJson(Map<String, dynamic> json) => PaymentAwordMd(
        totalPriceAll: json["TotalPriceAll"],
        totalPricePay: json["TotalPricePay"],
        percent: json["Percent"],
        statusPay: json["StatusPay"],
        winList: WinList.fromJson(json["WinList"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TotalPriceAll": totalPriceAll,
        "TotalPricePay": totalPricePay,
        "Percent": percent,
        "StatusPay": statusPay,
        "WinList": winList.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.periodNumber,
        this.deviceCode,
        this.lotteryNumber,
        this.numberLength,
        this.totalprice,
        this.billNumber,
    });

    String periodNumber;
    String deviceCode;
    String lotteryNumber;
    int numberLength;
    String totalprice;
    String billNumber;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        periodNumber: json["period_number"],
        deviceCode: json["device_code"],
        lotteryNumber: json["lottery_number"],
        numberLength: json["number_length"],
        totalprice: json["totalprice"],
        billNumber: json["bill_number"],
    );

    Map<String, dynamic> toJson() => {
        "period_number": periodNumber,
        "device_code": deviceCode,
        "lottery_number": lotteryNumber,
        "number_length": numberLength,
        "totalprice": totalprice,
        "bill_number": billNumber,
    };
}

class WinList {
    WinList({
        this.d1,
        this.d2,
        this.d3,
        this.d4,
        this.d5,
        this.d6,
    });

    int d1;
    int d2;
    int d3;
    int d4;
    int d5;
    int d6;

    factory WinList.fromJson(Map<String, dynamic> json) => WinList(
        d1: json["D1"],
        d2: json["D2"],
        d3: json["D3"],
        d4: json["D4"],
        d5: json["D5"],
        d6: json["D6"],
    );

    Map<String, dynamic> toJson() => {
        "D1": d1,
        "D2": d2,
        "D3": d3,
        "D4": d4,
        "D5": d5,
        "D6": d6,
    };
}
