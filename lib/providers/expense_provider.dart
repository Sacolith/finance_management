import 'package:finance_management/models/budget.dart';
import 'package:finance_management/models/expence.dart';
import 'package:flutter/material.dart';

//Stores expanse values as list and distributres them to where they need to go
class ExpenseProvider with ChangeNotifier{
  final List<Expense> _expenses=[];

List<Expense> get expenses => _expenses;
final List<Budget> _budgets = [];

  void addExpense(Expense expense){
    _expenses.add(expense);
    notifyListeners();
  }

 void updateBudget(Expense expense) {
  
  final budget = _budgets.firstWhere(
    (budget) => budget.id == expense.budgetId,
    orElse: () => Budget(id: 'default', limit: 0, startDate: DateTime.now(), endDate: DateTime.now(), spentAmount: 0),
  );
  
  
  if (budget.id != 'default') {  
    budget.subtractExpense(expense.amount);
    notifyListeners();
  }

  
}


  List<Expense> getExpensesForBudget(String budgetId) {
    return _expenses.where((expense) => expense.budgetId == budgetId).toList();
  }
}