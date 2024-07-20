import 'package:finance_management/providers/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseList extends StatelessWidget{
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context){
     return Consumer<ExpenseProvider>(
      builder: (context, expenseProvider, child){
        return expenseProvider.expenses.isEmpty? 
        const Center(child:Text('No Expenses added'))
        :ListView.builder(
          itemCount: expenseProvider.expenses.length,
          itemBuilder:  (context,index){
            final expense = expenseProvider.expenses[index];
            return ListTile(
              title: Text(expense.title),
              subtitle: Text(expense.date.toString()),
              trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
            );
          },
          ); 
      },
      );
  }
}