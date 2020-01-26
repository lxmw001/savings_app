class DateUtils {
  static List<DateTime> calculateDaysInterval(int year) {
    List<DateTime> months = [];
    for (int i = 1; i <= 12; i++) {
      months.add(new DateTime(year, i, 1));
    }
    return months;
  }
}