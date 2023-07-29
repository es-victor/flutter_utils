class CustomDateTimeFormat {
  static String dateTimeToStringText({required String dateTime}) {
    List<String> dateAndTime = dateTime.replaceAll("/", "-").split(" ");
    String date = dateAndTime.first;
    String time = dateAndTime.last;

    ///
    DateTime now = DateTime.now();
    String nowDate = "${now.year}-${now.month}-${now.day}";
    if (date == nowDate) {
      /// Today
      return "Today";
    } else {}
    // DateTime dt = DateTime.parse();
    return "Today";
  }
}
