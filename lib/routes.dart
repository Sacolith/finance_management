import 'package:finance_management/screens/budget_screen.dart';
import 'package:finance_management/screens/expense_screen.dart';
import 'package:finance_management/screens/goal_screen.dart';
import 'package:finance_management/screens/home_screen.dart';
import 'package:finance_management/screens/report_screen.dart';
import 'package:flutter/material.dart';

//ROUTES
class Routes{
  static Map<String, WidgetBuilder> getRoutes(){
    return{
     '/':(context)=> const HomeScreen(),
     '/expenses':(context)=>  const ExpensesScreen(),
     'buudget':(context)=> const BudgetContent(),
     '/goals':(context)=> GoalScreen(),
     'report':(context)=> const ReportScreen(),
    };
  }
}