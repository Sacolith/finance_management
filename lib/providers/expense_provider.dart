import 'package:finance_management/models/expence.dart';
import 'package:flutter/material.dart';

class ExpenseProvider with ChangeNotifier{
  final List<Expense> _expenses=[];

List<Expense> get expenses => _expenses;

  void addExpense(Expense expense){
    _expenses.add(expense);
    notifyListeners();
  }
}