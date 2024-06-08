void main() {
  DateTime now = DateTime.now();

  String formatDate(DateTime date, String separator) {
    return '${date.day.toString().padLeft(2, '0')}$separator${date.month.toString().padLeft(2, '0')}$separator${date.year}';
  }

  String formatDateWithMonthName(DateTime date) {
    List<String> months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return '${date.day.toString().padLeft(2, '0')} ${months[date.month - 1]}, ${date.year}';
  }

  print("Current date in different formats:");
  print(formatDate(now, '/'));      // dd/MM/yyyy
  print(formatDate(now, '-'));      // dd-MM-yyyy
  print(formatDateWithMonthName(now)); // dd MMM, yyyy
  print('${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString().substring(2)}'); // dd-MM-yy
}
