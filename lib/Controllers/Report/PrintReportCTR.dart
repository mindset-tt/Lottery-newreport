// ignore_for_file: file_names
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/Models/BranchMD.dart';
import 'package:lotterymanagement/Models/ModelReport/CombounitMD.dart';
import 'package:lotterymanagement/Models/ModelReport/ReportAllMD.dart';
import 'package:lotterymanagement/Models/ModelReport/ReportBillMD.dart';
import 'package:lotterymanagement/Models/ModelReport/ReportSaleMD.dart';
import 'package:lotterymanagement/Models/ModelReport/ReportWonMD.dart';
import 'package:lotterymanagement/Models/ModelReport/ReportexportMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:universal_html/html.dart';

class PrintReportCTR extends GetxController {
  var search = TextEditingController();
  MenuCTR menu = Get.put(MenuCTR());
  RxString empty = "".obs;
  RxBool onTapExcel = false.obs;
  RxBool onTapBill = false.obs;
  RxString branchpdf = "".obs;
  RxString txtsearch = "".obs;
  RxString loadingperoid = "".obs;
  RxString loadingsale = "".obs;
  RxString loadingreportsale = "".obs;
  RxString loadingreportWon = "".obs;
  RxString loadingreportBill = "".obs;
  RxString loadingreportExport = "".obs;
  RxString onselectTap = "0".obs;
  RxString dateperoid = "".obs;
  RxString numberperoid = "".obs;
  RxString statusCode = "".obs;
  RxString selected = "".obs;
  RxString itemselect = "ສັງລວມການຂາຍ".obs;
  String listitem;
  RxString getbranch = "".obs;
  RxString getperiod = "".obs;
  RxString getunit = "".obs;
  TabController controller;
  static var httpClient = HttpClient();
  var reportallmd = List<ReportAllMd>().obs;
  var listbrachmd = List<BranchMd>().obs;
  var listunitmd = List<ComboUnitMd>().obs;
  var reportSalemd = List<ReportSaleMd>().obs;
  var reportWonmd = List<ReportWonMd>().obs;
  var reportBillmd = List<ReportBillMd>().obs;
  var reportExportmd = List<ReportExportMd>().obs;
  final formated = NumberFormat("#,###", "en_US");
  void clear() {
    onTapBill(false);
    onTapExcel(false);
    // dateperoid("");
    // numberperoid("");
    onselectTap("0");
    // selected("");
    // loadingsale("");
    // loadingreportsale("");
    // loadingreportWon("");
    // itemselect("ສັງລວມການຂາຍ");
    // loadingreportBill("");
    // loadingreportExport("");
  }

  loadingData(String period, String branch, String unit) {
    getReportAll(period, branch, unit).then((value) => loadingsale(value));
    getReportBill(period, branch, unit)
        .then((value) => loadingreportBill(value));
    getReportExport(period, branch, unit).then((value) {
      loadingreportExport(value);
    });
    if (onselectTap.value == "0") {
      getReportSale(period, branch, unit)
          .then((value) => loadingreportsale(value));
    } else {
      getReportWon(period, branch, unit)
          .then((value) => loadingreportWon(value));
    }
  }

//////////// ສັ່ງລວມການຂາຍ /////////
  Future<String> getReportAll(String period, String branch, String unit) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.reportall}/$period/$branch/$unit"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = reportAllMdFromJson(jsonData);
        reportallmd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }
//////////// ສັ່ງລວມການຂາຍ /////////

  Future<String> getbranchCombobox() async {
    try {
      var data = await http
          .get(Uri.parse("${HttpUrl.httpurl}${HttpUrl.branch}/list"), headers: {
        'Authorization': 'Bearer ${menu.token}',
      });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = branchMdFromJson(jsonData);
        listbrachmd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> getbybranch(String id) async {
    try {
      var data = await http.get(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.unit}/list/$id"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = comboUnitMdFromJson(jsonData);
        listunitmd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  //////////// ສັ່ງລວມຈຸດຂາຍ ມູນຄ່າຂາຍໄດ້ /////////
  Future<String> getReportSale(
      String period, String branch, String unit) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.reportSale}/$period/$branch/$unit"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = reportSaleMdFromJson(jsonData);
        reportSalemd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }
//////////// ສັ່ງລວມຈຸດຂາຍ ມູນຄ່າຂາຍໄດ້ /////////

//////////// ສັ່ງລວມຈຸດຂາຍ ມູນຄ່າຖືກລາງວັນ /////////
  Future<String> getReportWon(String period, String branch, String unit) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.reportWon}/$period/$branch/$unit"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = reportWonMdFromJson(jsonData);
        reportWonmd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

//////////// ສັ່ງລວມຈຸດຂາຍ ມູນຄ່າຖືກລາງວັນ /////////

//////////// ພິມບິນຖືກການລາງວັນ /////////
  Future<String> getReportBill(
      String period, String branch, String unit) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.reportBill}/$period/$branch/$unit"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = reportBillMdFromJson(jsonData);
        reportBillmd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }
  //////////// ພິມບິນຖືກການລາງວັນ /////////

  //////////// ສັ່ງລວມຈຸດຂາຍ Export /////////
  Future<String> getReportExport(
      String period, String branch, String unit) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.reportExport}/$period/$branch/$unit"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = reportExportMdFromJson(jsonData);
        reportExportmd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> getExportAll(String period, String branch, String unit) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.exportall}/$period/$branch/$unit"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        return data.statusCode.toString();
      } else {
        return data.statusCode.toString();
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> getExportSale(
      String period, String branch, String unit) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.exportSale}/$period/$branch/$unit"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        return data.statusCode.toString();
      } else {
        return data.statusCode.toString();
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> getExportWon(String period, String branch, String unit) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.exportWon}/$period/$branch/$unit"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        return data.statusCode.toString();
      } else {
        return data.statusCode.toString();
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> getExportExport(
      String period, String branch, String unit) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.exportexport}/$period/$branch/$unit"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        return data.statusCode.toString();
      } else {
        return data.statusCode.toString();
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> getExportBill(
      String period, String branch, String unit) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.exportBill}/$period/$branch/$unit"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        return data.statusCode.toString();
      } else {
        return data.statusCode.toString();
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  downloadFile(String url) {
    AnchorElement anchorElement =
        AnchorElement(href: "${HttpUrl.httpurl}${HttpUrl.download}/$url");
    anchorElement.download = "${HttpUrl.httpurl}${HttpUrl.download}/$url";
    anchorElement.click();
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", fileName)
      ..click();
  }
  //////////// create PDf /////////

  createReportAllPDF(String period, String branch, String unit) {
    getReportAll(period, branch, unit).then((value) async {
      final List<int> fontData = await (String name) async {
        final ByteData data = await rootBundle.load("fonts/$name");
        return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      }('Phetsarath-OT.ttf');
      if (value == "200") {
        if (branch == "0") {
          branch = "ທັງໝົດ";
        } else {
          branch = branchpdf.value;
        }
        PdfDocument document = PdfDocument();

        final PdfPageTemplateElement headerTemplate =
            PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 440, 120));
        headerTemplate.graphics.drawString(
            '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tສາທາລະນະລັດ ປະຊາທິປະໄຕ ປະຊາຊົນລາວ\n\t\t\t\t\t\t\t\t\t\t\t\tສັນຕິພາບ ເອກະລາດ ປະຊາທິປະໄຕ ເອກະພາບ ວັດທະນາຖາວອນ\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tບິນສັງລວມການຂາຍ\n\n\tງວດ $period\n\tສາຂາ $branch',
            PdfTrueTypeFont(fontData, 9),
            bounds: const Rect.fromLTWH(0, 0, 0, 150));
        document.template.top = headerTemplate;
        PdfGrid grid = PdfGrid();
        document.pageSettings.orientation = PdfPageOrientation.landscape;
        grid.style = PdfGridStyle(
            font: PdfTrueTypeFont(fontData, 8),
            cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
        grid.columns.add(count: 8);
        grid.headers.add(1);
        PdfGridRow header = grid.headers[0];
        header.cells[0].value = "";
        header.cells[1].value = "ເລກ 1 ໂຕ";
        header.cells[2].value = "ເລກ 2 ໂຕ";
        header.cells[3].value = "ເລກ 3 ໂຕ";
        header.cells[4].value = "ເລກ 4 ໂຕ";
        header.cells[5].value = "ເລກ 5 ໂຕ";
        header.cells[6].value = "ເລກ 6 ໂຕ";
        header.cells[7].value = "ລວມທັງໝົດ";
        PdfGridRow row = grid.rows.add();
        row.cells[0].value = 'ມູນຄ່າຈຳໜ່າຍ';
        row.cells[1].value =
            formated.format(double.parse(reportallmd[0].quota[0].quota));
        row.cells[2].value =
            formated.format(double.parse(reportallmd[0].quota[1].quota));
        row.cells[3].value =
            formated.format(double.parse(reportallmd[0].quota[2].quota));
        row.cells[4].value =
            formated.format(double.parse(reportallmd[0].quota[3].quota));
        row.cells[5].value =
            formated.format(double.parse(reportallmd[0].quota[4].quota));
        row.cells[6].value =
            formated.format(double.parse(reportallmd[0].quota[5].quota));
        row.cells[7].value =
            formated.format(double.parse(reportallmd[0].totalQuota));
        row = grid.rows.add();
        row.cells[0].value = 'ມູນຄ່າຂາຍໄດ້';
        if (reportallmd[0].sales[0].sd1 == null) {
          row.cells[1].value = "0";
        } else {
          row.cells[1].value =
              formated.format(double.parse(reportallmd[0].sales[0].sd1));
        }
        if (reportallmd[0].sales[0].sd2 == null) {
          row.cells[2].value = "0";
        } else {
          row.cells[2].value =
              formated.format(double.parse(reportallmd[0].sales[0].sd2));
        }
        if (reportallmd[0].sales[0].sd3 == null) {
          row.cells[3].value = "0";
        } else {
          row.cells[3].value =
              formated.format(double.parse(reportallmd[0].sales[0].sd3));
        }
        if (reportallmd[0].sales[0].sd4 == null) {
          row.cells[4].value = "0";
        } else {
          row.cells[4].value =
              formated.format(double.parse(reportallmd[0].sales[0].sd4));
        }
        if (reportallmd[0].sales[0].sd5 == null) {
          row.cells[5].value = "0";
        } else {
          row.cells[5].value =
              formated.format(double.parse(reportallmd[0].sales[0].sd5));
        }
        if (reportallmd[0].sales[0].sd6 == null) {
          row.cells[6].value = "0";
        } else {
          row.cells[6].value =
              formated.format(double.parse(reportallmd[0].sales[0].sd6));
        }
        row.cells[7].value =
            formated.format(double.parse(reportallmd[0].totalSale));
        row = grid.rows.add();
        row.cells[0].value = 'ມູນຄ່າຖືກລາງວັນ';
        if (reportallmd[0].won[0].wd1 == null) {
          row.cells[1].value = "0";
        } else {
          row.cells[1].value =
              formated.format(double.parse(reportallmd[0].won[0].wd1));
        }
        if (reportallmd[0].won[0].wd2 == null) {
          row.cells[2].value = "0";
        } else {
          row.cells[2].value =
              formated.format(double.parse(reportallmd[0].won[0].wd2));
        }
        if (reportallmd[0].won[0].wd3 == null) {
          row.cells[3].value = "0";
        } else {
          row.cells[3].value =
              formated.format(double.parse(reportallmd[0].won[0].wd3));
        }
        if (reportallmd[0].won[0].wd4 == null) {
          row.cells[4].value = "0";
        } else {
          row.cells[4].value =
              formated.format(double.parse(reportallmd[0].won[0].wd4));
        }
        if (reportallmd[0].won[0].wd5 == null) {
          row.cells[5].value = "0";
        } else {
          row.cells[5].value =
              formated.format(double.parse(reportallmd[0].won[0].wd5));
        }
        if (reportallmd[0].won[0].wd6 == null) {
          row.cells[6].value = "0";
        } else {
          row.cells[6].value =
              formated.format(double.parse(reportallmd[0].won[0].wd6));
        }
        if (reportallmd[0].totalWon == "NaN") {
          row.cells[7].value = "0";
        } else {
          row.cells[7].value =
              formated.format(double.parse(reportallmd[0].totalWon));
        }
        row = grid.rows.add();
        row.cells[0].value = 'ຜິດດ່ຽງ';
        row.cells[1].value =
            formated.format(double.parse(reportallmd[0].balance.d1));
        row.cells[2].value =
            formated.format(double.parse(reportallmd[0].balance.d1));
        row.cells[3].value =
            formated.format(double.parse(reportallmd[0].balance.d1));
        row.cells[4].value =
            formated.format(double.parse(reportallmd[0].balance.d1));
        row.cells[5].value =
            formated.format(double.parse(reportallmd[0].balance.d1));
        row.cells[6].value =
            formated.format(double.parse(reportallmd[0].balance.d1));
        row.cells[7].value =
            formated.format(double.parse(reportallmd[0].totalBalance));
        grid.draw(
            page: document.pages.add(),
            bounds: const Rect.fromLTWH(0, 0, 0, 0));
        List<int> bytes = document.save();
        document.dispose();
        saveAndLaunchFile(bytes, 'ລາຍງານສັງລວມການຂາຍ.pdf');
      }
    });
  }

  //////////// ສັ່ງລວມຈຸດຂາຍ /////////
  createReportSalePDF(String period, String branch, String unit) {
    getReportSale(period, branch, unit).then((value) async {
      if (value == "200") {
        if (branch == "0") {
          branch = "ທັງໝົດ";
        } else {
          branch = branchpdf.value;
        }
        PdfDocument document = PdfDocument();
        final List<int> fontData = await (String name) async {
          final ByteData data = await rootBundle.load("fonts/$name");
          return data.buffer
              .asUint8List(data.offsetInBytes, data.lengthInBytes);
        }('Phetsarath-OT.ttf');
        final PdfPageTemplateElement headerTemplate =
            PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 440, 120));
        headerTemplate.graphics.drawString(
            '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tສາທາລະນະລັດ ປະຊາທິປະໄຕ ປະຊາຊົນລາວ\n\t\t\t\t\t\t\t\t\t\t\t\tສັນຕິພາບ ເອກະລາດ ປະຊາທິປະໄຕ ເອກະພາບ ວັດທະນາຖາວອນ\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tບິນສັງລວມຈຸດຂາຍທີ່ຂາຍໄດ້\n\n\tງວດ $period\n\tສາຂາ $branch',
            PdfTrueTypeFont(fontData, 9),
            bounds: const Rect.fromLTWH(0, 0, 0, 150));
        document.template.top = headerTemplate;
        PdfGrid grid = PdfGrid();
        document.pageSettings.orientation = PdfPageOrientation.landscape;
        grid.style = PdfGridStyle(
            font: PdfTrueTypeFont(fontData, 8),
            cellPadding: PdfPaddings(left: 5, right: 5, top: 2, bottom: 2));
        grid.columns.add(count: 10);
        grid.headers.add(1);
        PdfGridRow header = grid.headers[0];
        header.cells[0].value = "ລ/ດ";
        header.cells[1].value = "ສາຂາ";
        header.cells[2].value = "ລະຫັດເຄື່ອງ";
        header.cells[3].value = "ເລກ 1 ໂຕ";
        header.cells[4].value = "ເລກ 2 ໂຕ";
        header.cells[5].value = "ເລກ 3 ໂຕ";
        header.cells[6].value = "ເລກ 4 ໂຕ";
        header.cells[7].value = "ເລກ 5 ໂຕ";
        header.cells[8].value = "ເລກ 6 ໂຕ";
        header.cells[9].value = "ລວມທັງໝົດ";
        PdfGridRow row = grid.rows.add();
        for (int i = 0; i < reportSalemd.length; i++) {
          row.cells[0].value = reportSalemd[i].row;
          row.cells[1].value = reportSalemd[i].branchName;
          row.cells[2].value = reportSalemd[i].deviceCode;
          row.cells[3].value =
              formated.format(double.parse(reportSalemd[i].sd1));
          row.cells[4].value =
              formated.format(double.parse(reportSalemd[i].sd2));
          row.cells[5].value =
              formated.format(double.parse(reportSalemd[i].sd3));
          row.cells[6].value =
              formated.format(double.parse(reportSalemd[i].sd4));
          row.cells[7].value =
              formated.format(double.parse(reportSalemd[i].sd5));
          row.cells[8].value =
              formated.format(double.parse(reportSalemd[i].sd6));
          row.cells[9].value =
              formated.format(double.parse(reportSalemd[i].total));
          if (i < reportSalemd.length - 1) {
            row = grid.rows.add();
          }
        }
        grid.draw(
            page: document.pages.add(),
            bounds: const Rect.fromLTWH(0, 0, 0, 0));
        List<int> bytes = document.save();
        document.dispose();
        saveAndLaunchFile(bytes, 'ລາຍງານສັງລວມຈຸດຂາຍທີ່ຂາຍໄດ້.pdf');
      }
    });
  }

  //////////// ສັ່ງລວມຈຸດຂາຍທີ່ຖືກລາງວັນ /////////
  createReportWonPDF(String period, String branch, String unit) {
    getReportWon(period, branch, unit).then((value) async {
      if (value == "200") {
        if (branch == "0") {
          branch = "ທັງໝົດ";
        } else {
          branch = branchpdf.value;
        }
        PdfDocument document = PdfDocument();
        final List<int> fontData = await (String name) async {
          final ByteData data = await rootBundle.load("fonts/$name");
          return data.buffer
              .asUint8List(data.offsetInBytes, data.lengthInBytes);
        }('Phetsarath-OT.ttf');
        final PdfPageTemplateElement headerTemplate =
            PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 440, 120));
        headerTemplate.graphics.drawString(
            '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tສາທາລະນະລັດ ປະຊາທິປະໄຕ ປະຊາຊົນລາວ\n\t\t\t\t\t\t\t\t\t\t\t\tສັນຕິພາບ ເອກະລາດ ປະຊາທິປະໄຕ ເອກະພາບ ວັດທະນາຖາວອນ\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tບິນສັງລວມຈຸດຂາຍທີ່ຖືກລາງວັນ\n\n\tງວດ $period\n\tສາຂາ $branch',
            PdfTrueTypeFont(fontData, 9),
            bounds: const Rect.fromLTWH(0, 0, 0, 150));
        document.template.top = headerTemplate;
        PdfGrid grid = PdfGrid();
        document.pageSettings.orientation = PdfPageOrientation.landscape;
        grid.style = PdfGridStyle(
            font: PdfTrueTypeFont(fontData, 8),
            cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
        grid.columns.add(count: 11);
        grid.headers.add(1);
        PdfGridRow header = grid.headers[0];
        header.cells[0].value = "ລ/ດ";
        header.cells[1].value = "ສາຂາ";
        header.cells[2].value = "ລະຫັດເຄື່ອງ";
        header.cells[3].value = "ເລກ 1 ໂຕ";
        header.cells[4].value = "ເລກ 2 ໂຕ";
        header.cells[5].value = "ເລກ 3 ໂຕ";
        header.cells[6].value = "ເລກ 4 ໂຕ";
        header.cells[7].value = "ເລກ 5 ໂຕ";
        header.cells[8].value = "ເລກ 6 ໂຕ";
        header.cells[9].value = "ລວມທັງໝົດ";
        header.cells[10].value = "ຜິດດ່ຽງ";
        PdfGridRow row = grid.rows.add();
        // for (int i = 0; i < reportWonmd[0].won.length; i++) {
        for (int j = 0; j < reportWonmd[0].balance.length; j++) {
          // print(i.toString());
          //print(i.toString());
          row.cells[0].value = reportWonmd[0].won[j].row;
          row.cells[1].value = reportWonmd[0].won[j].branchName;
          row.cells[2].value = reportWonmd[0].won[j].deviceCode;
          row.cells[3].value =
              formated.format(double.parse(reportWonmd[0].won[j].wd1));
          row.cells[4].value =
              formated.format(double.parse(reportWonmd[0].won[j].wd2));
          row.cells[5].value =
              formated.format(double.parse(reportWonmd[0].won[j].wd3));
          row.cells[6].value =
              formated.format(double.parse(reportWonmd[0].won[j].wd4));
          row.cells[7].value =
              formated.format(double.parse(reportWonmd[0].won[j].wd5));
          row.cells[8].value =
              formated.format(double.parse(reportWonmd[0].won[j].wd6));
          row.cells[9].value =
              formated.format(double.parse(reportWonmd[0].won[j].total));
          row.cells[10].value =
              formated.format(double.parse(reportWonmd[0].balance[j].balance));
          if (j < reportWonmd[0].balance.length - 1) {
            row = grid.rows.add();
            // }
          }
        }
        grid.draw(
            page: document.pages.add(),
            bounds: const Rect.fromLTWH(0, 0, 0, 0));
        List<int> bytes = document.save();
        document.dispose();
        saveAndLaunchFile(bytes, 'ລາຍງານສັງລວມຈຸດຂາຍທີ່ຖືກລາງວັນ.pdf');
      }
    });
  }

  //////////// ພິມບິນຖືກການລາງວັນ /////////
  createReportbillPDF(String period, String branch, String unit) {
    getReportBill(period, branch, unit).then((value) async {
      if (value == "200") {
        if (branch == "0") {
          branch = "ທັງໝົດ";
        } else {
          branch = branchpdf.value;
        }
        PdfDocument document = PdfDocument();
        final List<int> fontData = await (String name) async {
          final ByteData data = await rootBundle.load("fonts/$name");
          return data.buffer
              .asUint8List(data.offsetInBytes, data.lengthInBytes);
        }('Phetsarath-OT.ttf');
        final PdfPageTemplateElement headerTemplate =
            PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 440, 120));
        headerTemplate.graphics.drawString(
            '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tສາທາລະນະລັດ ປະຊາທິປະໄຕ ປະຊາຊົນລາວ\n\t\t\t\t\t\t\t\t\t\t\t\tສັນຕິພາບ ເອກະລາດ ປະຊາທິປະໄຕ ເອກະພາບ ວັດທະນາຖາວອນ\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tບິນສັງລວມບີນທີ່ຖືກລາງວັນ\n\n\tງວດ $period\n\tສາຂາ $branch',
            PdfTrueTypeFont(fontData, 9),
            bounds: const Rect.fromLTWH(0, 0, 0, 150));
        document.template.top = headerTemplate;
        PdfGrid grid = PdfGrid();
        document.pageSettings.orientation = PdfPageOrientation.landscape;

        grid.style = PdfGridStyle(
            font: PdfTrueTypeFont(fontData, 7),
            cellPadding: PdfPaddings(left: 1, right: 0.5, top: 2, bottom: 2));
        grid.columns.add(count: 13);
        grid.headers.add(1);
        PdfGridRow header = grid.headers[0];
        header.cells[0].value = "ລ/ດ";
        header.cells[1].value = "ສາຂາ";
        header.cells[2].value = "ລະຫັດເຄື່ອງ";
        header.cells[3].value = "ເລກບິນ";
        header.cells[4].value = "ເລກ 1 ໂຕ";
        header.cells[5].value = "ເລກ 2 ໂຕ";
        header.cells[6].value = "ເລກ 3 ໂຕ";
        header.cells[7].value = "ເລກ 4 ໂຕ";
        header.cells[8].value = "ເລກ 5 ໂຕ";
        header.cells[9].value = "ເລກ 6 ໂຕ";
        header.cells[10].value = "ລວມທັງໝົດ";
        header.cells[11].value = "ຈ່າຍແລ້ວ";
        header.cells[12].value = "ວັນທີ່ຈ່າຍ";
        PdfGridRow row = grid.rows.add();
        for (int i = 0; i < reportBillmd.length; i++) {
          row.cells[0].value = reportBillmd[i].row;
          row.cells[1].value = reportBillmd[i].branchName;
          row.cells[2].value = reportBillmd[i].deviceCode;
          row.cells[3].value = reportBillmd[i].billNumber;
          row.cells[4].value =
              formated.format(double.parse(reportBillmd[i].wd1));
          row.cells[5].value =
              formated.format(double.parse(reportBillmd[i].wd2));
          row.cells[6].value =
              formated.format(double.parse(reportBillmd[i].wd3));
          row.cells[7].value =
              formated.format(double.parse(reportBillmd[i].wd4));
          row.cells[8].value =
              formated.format(double.parse(reportBillmd[i].wd5));
          row.cells[9].value =
              formated.format(double.parse(reportBillmd[i].wd6));
          row.cells[10].value =
              formated.format(double.parse(reportBillmd[i].total));
          if (reportBillmd[i].pay == null) {
            row.cells[11].value = "ວ່າງເປົ່າ";
          } else {
            row.cells[11].value = formated.format(reportBillmd[i].pay);
          }
          if (reportBillmd[i].date == null) {
            row.cells[12].value = "ວ່າງເປົ່າ";
          } else {
            row.cells[12].value = reportBillmd[i].date;
          }
          if (i < reportBillmd.length - 1) {
            row = grid.rows.add();
          }
        }
        grid.draw(
            page: document.pages.add(),
            bounds: const Rect.fromLTWH(0, 0, 0, 0));
        List<int> bytes = document.save();
        document.dispose();
        saveAndLaunchFile(bytes, 'ລາຍງານສັງລວມບີນທີ່ຖືກລາງວັນ.pdf');
      }
    });
  }

  //////////// ສັ່ງລວມຈຸດຂາຍ Export /////////
  createReportExportPDF(String period, String branch, String unit) {
    getReportBill(period, branch, unit).then((value) async {
      if (value == "200") {
        if (branch == "0") {
          branch = "ທັງໝົດ";
        } else {
          branch = branchpdf.value;
        }
        PdfDocument document = PdfDocument();
        final List<int> fontData = await (String name) async {
          final ByteData data = await rootBundle.load("fonts/$name");
          return data.buffer
              .asUint8List(data.offsetInBytes, data.lengthInBytes);
        }('Phetsarath-OT.ttf');
        final PdfPageTemplateElement headerTemplate =
            PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 440, 120));
        headerTemplate.graphics.drawString(
            '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tສາທາລະນະລັດ ປະຊາທິປະໄຕ ປະຊາຊົນລາວ\n\t\t\t\t\t\t\t\t\t\t\t\tສັນຕິພາບ ເອກະລາດ ປະຊາທິປະໄຕ ເອກະພາບ ວັດທະນາຖາວອນ\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tບິນສັງລວມຈຸດຂາຍແບບລວມທັງໝົດ\n\n\tງວດ $period\n\tສາຂາ $branch',
            PdfTrueTypeFont(fontData, 9),
            bounds: const Rect.fromLTWH(0, 0, 0, 150));
        document.template.top = headerTemplate;
        PdfGrid grid = PdfGrid();
        document.pageSettings.orientation = PdfPageOrientation.landscape;
        grid.style = PdfGridStyle(
            font: PdfTrueTypeFont(fontData, 8),
            cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
        grid.columns.add(count: 17);
        grid.headers.add(1);
        PdfGridRow header = grid.headers[0];
        header.cells[0].value = "ລ/ດ";
        header.cells[1].value = "ສາຂາ";
        header.cells[2].value = "ຊື້ 1 ໂຕ";
        header.cells[3].value = "ຊື້ 2 ໂຕ";
        header.cells[4].value = "ຊື້ 3 ໂຕ";
        header.cells[5].value = "ຊື້ 4 ໂຕ";
        header.cells[6].value = "ຊື້ 5 ໂຕ";
        header.cells[7].value = "ຊື້ 6 ໂຕ";
        header.cells[8].value = "ຖືກ 1 ໂຕ";
        header.cells[9].value = "ຖືກ 2 ໂຕ";
        header.cells[10].value = "ຖືກ 3 ໂຕ";
        header.cells[11].value = "ຖືກ 4 ໂຕ";
        header.cells[12].value = "ຖືກ 5 ໂຕ";
        header.cells[13].value = "ຖືກ 6 ໂຕ";
        header.cells[14].value = "ຜິດດ່ຽງ";
        header.cells[15].value = "ສາຂາ";
        header.cells[16].value = "ວັນທີ";
        PdfGridRow row = grid.rows.add();
        for (int j = 0; j < reportExportmd[0].data.length; j++) {
          row.cells[0].value = reportExportmd[0].sale[j].row;
          row.cells[1].value = reportExportmd[0].sale[j].deviceCode;
          row.cells[2].value =
              formated.format(double.parse(reportExportmd[0].sale[j].sd1));
          row.cells[3].value =
              formated.format(double.parse(reportExportmd[0].sale[j].sd2));
          row.cells[4].value =
              formated.format(double.parse(reportExportmd[0].sale[j].sd3));
          row.cells[5].value =
              formated.format(double.parse(reportExportmd[0].sale[j].sd4));
          row.cells[6].value =
              formated.format(double.parse(reportExportmd[0].sale[j].sd5));
          row.cells[7].value =
              formated.format(double.parse(reportExportmd[0].sale[j].sd6));
          row.cells[8].value =
              formated.format(double.parse(reportExportmd[0].data[j].won.wd1));
          row.cells[9].value =
              formated.format(double.parse(reportExportmd[0].data[j].won.wd2));
          row.cells[10].value =
              formated.format(double.parse(reportExportmd[0].data[j].won.wd3));
          row.cells[11].value =
              formated.format(double.parse(reportExportmd[0].data[j].won.wd4));
          row.cells[12].value =
              formated.format(double.parse(reportExportmd[0].data[j].won.wd5));
          row.cells[13].value =
              formated.format(double.parse(reportExportmd[0].data[j].won.wd6));
          row.cells[14].value =
              formated.format(double.parse(reportExportmd[0].data[j].balance));
          row.cells[15].value = reportExportmd[0].sale[j].branchName;
          row.cells[16].value = reportExportmd[0].sale[j].dateOffline;
          if (j < reportExportmd[0].sale.length - 1) {
            row = grid.rows.add();
          }
        }
        grid.draw(
            page: document.pages.add(),
            bounds: const Rect.fromLTWH(0, 0, 0, 0));
        List<int> bytes = document.save();
        document.dispose();
        saveAndLaunchFile(bytes, 'ລາຍງານສັງລວມຈຸດຂາຍແບບລວມທັງໝົດ.pdf');
      }
    });
  }
}
