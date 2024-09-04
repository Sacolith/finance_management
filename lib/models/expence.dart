//expense blueprint used througout Application
class Expense{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
    final String budgetId;
  Expense({required this.budgetId,required this.id,required this.title, required this.amount,required this.date});
}