import 'package:flutter/material.dart';
import '../models/budget.dart';

class BudgetProvider with ChangeNotifier{
  final List<Budget> _budgets= [];
  
  List<Budget> get budgets=> _budgets;

  void addBudget(Budget budget){
  _budgets.add(budget);
  notifyListeners();
  }

   void setBudgets(List<Budget> budgets) {
    budgets = budgets;
    notifyListeners();
    
  }
}