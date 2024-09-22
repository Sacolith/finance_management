import 'package:finance_management/design/colors.dart';
import 'package:finance_management/providers/budget_provider.dart';
import 'package:finance_management/providers/expense_provider.dart';
import 'package:finance_management/providers/goal_provide.dart';
import 'package:finance_management/providers/report_provider.dart';
import 'package:finance_management/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///This file is the main brain of the application it plugs in the providers
///sets up the theme and routes.
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> BudgetProvider()),
      ChangeNotifierProvider(create: (_)=> ExpenseProvider()),
      ChangeNotifierProvider(create: (_)=> GoalProvider()),
      ChangeNotifierProvider(create: (_)=> ReportProvider())
    ],
    child: MaterialApp(
      
      title: 'Finance Management',
      theme: thyme(),
      initialRoute: '/',
      routes: Routes.getRoutes(),
    ),
    );
  }
}

   ThemeData thyme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
     backgroundColor: Color.fromARGB(102, 41, 71, 103)),
      cardColor: Colors.black,
      scaffoldBackgroundColor: Cols.mint
    );
  }


