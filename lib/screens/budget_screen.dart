import 'package:finance_management/models/budget.dart';
import 'package:finance_management/providers/budget_provider.dart';
import 'package:finance_management/widgets/budget_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetScreen extends StatelessWidget{
  final TextEditingController _limitController= TextEditingController();
   BudgetScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget'),
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _limitController,
            decoration: const InputDecoration(labelText: 'Budget Limit'),
            keyboardType: TextInputType.number,
          ),
          ),
          ElevatedButton(onPressed: (){
            if(_limitController.text.isEmpty){
              return;
            }
            final budget = Budget(
              id: DateTime.now().toString(), 
            limit: double.parse(_limitController.text), 
            startTate: DateTime.now(), 
            endDate: DateTime.now().add(const Duration(days: 30)),
            );
            Provider.of<BudgetProvider>(context, listen: false).addBudget(budget);
          }, child: const Text('Set Budget'),
          ),
          const Expanded(child: BudgetChart())
        ],),
    );
  }
}