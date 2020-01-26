class DateUtils {
  static List<DateTime> calculateMonthsInterval() {
    var now = new DateTime.now();
    List<DateTime> months = [];
    for (int i = 1; i <= 12; i++) {
      months.add(new DateTime(now.year, i, 1));
    }
    return months;
  }

  static List<DateTime> calculateNextMonthsInterval(int monthsNumber) {
    List<DateTime> months = [];
    var now = new DateTime.now();
    for (int i = 1; i <= monthsNumber; i++) {
      months.add(new DateTime(now.year, now.month + i, 1));
    }
    return months;
  }
}