import 'package:finance_management/design/colors.dart';
import 'package:finance_management/screens/budget_screen.dart';
import 'package:finance_management/screens/expense_screen.dart';
import 'package:finance_management/screens/goal_screen.dart';
import 'package:finance_management/screens/report_screen.dart';
import 'package:flutter/material.dart';

//This file is the main.darts backup singer it controls the navigation with the bottomNavbar 
class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int _selectedIndex=0;

  static final List<Widget> _widgetOptions = <Widget>[
    const BudgetContent(),
    const ExpensesScreen(),
    GoalScreen(),
    const ReportScreen(),
];

void _onItemTapped(int index){
  setState(() {
    _selectedIndex=index;
  });
}

@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      title: const Text('Sunrise Financials'),
    ),
    body: Center(
      child: _widgetOptions.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
BottomNavigationBarItem(
  backgroundColor: Cols.sailorBlue,
  icon: Icon(Icons.account_balance_wallet,
  ),
  label: 'budget'),
  BottomNavigationBarItem(
  icon: Icon(Icons.money,
  ),
  label: 'Expenses'),
  BottomNavigationBarItem(
  icon: Icon(Icons.flag,
  ),
  label: 'Goals'),
  BottomNavigationBarItem(
  icon: Icon(Icons.bar_chart,
  ),
  label: 'Reports')
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    ),
  );
}
}