// To parse this JSON data, do
//
//     final billNumberSellerMd = billNumberSellerMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<BillNumberSellerMd> billNumberSellerMdFromJson(String str) => List<BillNumberSellerMd>.from(json.decode(str).map((x) => BillNumberSellerMd.fromJson(x)));

String billNumberSellerMdToJson(List<BillNumberSellerMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BillNumberSellerMd {
    BillNumberSellerMd({
      this.row,
        this.billId,
        this.billNumber,
        this.periodNumber,
        this.dateBill,
        this.timeBill,
        this.billPrice,
        this.sellerId,
        this.deviceNumber,
    });
     String row;
    String billId;
    String billNumber;
    String periodNumber;
    DateTime dateBill;
    String timeBill;
    int billPrice;
    String sellerId;
    int deviceNumber;

    factory BillNumberSellerMd.fromJson(Map<String, dynamic> json) => BillNumberSellerMd(
      row: json["row"],
        billId: json["bill_id"],
        billNumber: json["bill_number"],
        periodNumber: json["period_number"],
        dateBill: DateTime.parse(json["date_bill"]),
        timeBill: json["time_bill"],
        billPrice: json["bill_price"],
        sellerId: json["seller_id"],
        deviceNumber: json["device_number"],
    );

    Map<String, dynamic> toJson() => {
      "row": row,
        "bill_id": billId,
        "bill_number": billNumber,
        "period_number": periodNumber,
        "date_bill": dateBill.toIso8601String(),
        "time_bill": timeBill,
        "bill_price": billPrice,
        "seller_id": sellerId,
        "device_number": deviceNumber,
    };
}
