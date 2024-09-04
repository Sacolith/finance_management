class Budget {
  final String id;
  double limit;
  final DateTime startDate;
  final DateTime endDate;
  double spentAmount;

//Budget blueprint used througout Application
  Budget({
    required this.id,
    required this.limit,
    required this.startDate,
    required this.endDate,
    this.spentAmount = 0,
  });

  void subtractExpense(double amount) {
    limit -= amount;
    spentAmount += amount;
  }
}
