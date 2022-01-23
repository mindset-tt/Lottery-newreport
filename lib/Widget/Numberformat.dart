// ignore_for_file: file_names

import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
class Numberformated{
  static final formated = NumberFormat("#,###", "en_US");
  static final maskFormatter = MaskTextInputFormatter(mask: '######', filter: { "#": RegExp(r'[0-9]') });
  static final maskTime = MaskTextInputFormatter(mask: '##:##:##', filter: { "#": RegExp(r'[0-9]') });
}