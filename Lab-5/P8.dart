class Util {
  static String formatDate(DateTime date, String format) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();

    if (format == 'dd/MM/yyyy') {
      return '$day/$month/$year';
    } else if (format == 'dd-MM-yyyy') {
      return '$day-$month-$year';
    } else if (format == 'dd-MMM-yyyy') {
      List<String> months = [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
      ];
      String monthName = months[date.month - 1];
      return '$day-$monthName-$year';
    } else if (format == 'dd-MM-yy') {
      return '$day-$month-${year.substring(2)}';
    } else if (format == 'dd MMM, yyyy') {
      List<String> months = [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
      ];
      String monthName = months[date.month - 1];
      return '$day $monthName, $year';
    } else {
      return date.toString(); // Default format
    }
  }
}

class ClassWithInheritance extends Util {
  void printFormattedDate() {
    DateTime now = DateTime.now();
    print("Formatted date (with inheritance): ${Util.formatDate(now, 'dd/MM/yyyy')}");
  }
}

class ClassWithoutInheritance {
  void printFormattedDate() {
    DateTime now = DateTime.now();
    print("Formatted date (without inheritance): ${Util.formatDate(now, 'dd/MM/yyyy')}");
  }
}

void main() {
  ClassWithInheritance classWithInheritance = ClassWithInheritance();
  classWithInheritance.printFormattedDate();

  ClassWithoutInheritance classWithoutInheritance = ClassWithoutInheritance();
  classWithoutInheritance.printFormattedDate();
}
