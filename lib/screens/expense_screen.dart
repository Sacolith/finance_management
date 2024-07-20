import 'package:finance_management/models/expence.dart';
import 'package:finance_management/providers/expense_provider.dart';
import 'package:finance_management/widgets/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseScreen extends StatelessWidget{
   ExpenseScreen({super.key});
  final TextEditingController _titleController= TextEditingController();
  final TextEditingController _amountController= TextEditingController();

  @override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: const Text('Expenses'),
    ),
    body: Column(
      children: <Widget>[
         Padding(padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _titleController,
          decoration:  const InputDecoration(labelText: 'Expense Title'),
        ),
        ),
        Padding(padding:  const EdgeInsets.all(8.0),
        child: TextField(
          controller: _amountController,
          decoration: const InputDecoration(labelText: 'Expense Amount'),
          keyboardType: TextInputType.number,
        ),
        ),
        ElevatedButton(onPressed: (){
          if(_titleController.text.isEmpty || _amountController.text.isEmpty){
            return;
          }
          final expense= Expense(
            id: DateTime.now().toString(),
            title: _titleController.text,
            amount: double.parse(_amountController.text),
            date: DateTime.now()
          );
          Provider.of<ExpenseProvider>(context, listen: false).addExpense(expense);
        }, child: const Text('Add Expense')
        ),
        const Expanded(child: ExpenseList(),)
      ],
    ),
  );
}
}