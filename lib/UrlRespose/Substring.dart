// ignore_for_file: file_names

class ShowSubString {
  static String cutStringAddress(String name) {
    String values = name;
    if (values.length > 15) {
      values = values.substring(0, 15);
      values = '$values ...';
    }
    return values;
  }
 static String cutStringTextBox(String name) {
    String values = name;
    if (values.length > 15) {
      values = values.substring(0, 20);
      values = '$values ...';
    }
    return values;
  }
  static String cutStringPhone(String name) {
    String values = name;
    if (values.length > 11) {
      values = values.substring(0, 11);
      values = '$values ...';
    }
    return values;
  }
}
