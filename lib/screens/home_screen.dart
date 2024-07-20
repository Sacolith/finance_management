import 'package:finance_management/screens/budget_screen.dart';
import 'package:finance_management/screens/expense_screen.dart';
import 'package:finance_management/screens/goal_screen.dart';
import 'package:finance_management/screens/report_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int _selectedIndex=0;

  static final List<Widget> _widgetOptions = <Widget>[
    BudgetScreen(),
    ExpenseScreen(),
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
    appBar: AppBar(
      title: const Text('Finance Management'),
    ),
    body: Center(
      child: _widgetOptions.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
BottomNavigationBarItem(
  icon: Icon(Icons.account_balance_wallet,color: Colors.red,),
  label: 'budget'),
  BottomNavigationBarItem(
  icon: Icon(Icons.money,color: Colors.red,),
  label: 'Expenses'),
  BottomNavigationBarItem(
  icon: Icon(Icons.flag,color: Colors.red,),
  label: 'Goals'),
  BottomNavigationBarItem(
  icon: Icon(Icons.bar_chart,color: Colors.red,),
  label: 'Reports')
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    ),
  );
}
}