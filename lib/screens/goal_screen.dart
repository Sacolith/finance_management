import 'package:finance_management/models/goal.dart';
import 'package:finance_management/providers/goal_provide.dart';
import 'package:finance_management/widgets/goal_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalScreen extends StatelessWidget{
   GoalScreen({super.key});
   final TextEditingController _descriptionController = TextEditingController();
   final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Goal Screen'),),
      body: Column(
        children: <Widget>[
Padding(padding: const EdgeInsets.all(8.0),
child:
Container(                      
                      decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all()
                      ),child: TextField(
  controller: _descriptionController,
  decoration: const InputDecoration(labelText: 'Goal Description',
  border: InputBorder.none),
),)
),
Padding(padding: const EdgeInsets.all(8.0),
child:Container( 
                      decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all()
                      ),child: TextField(
  controller: _amountController,
  decoration: const InputDecoration(labelText: 'Target Amt',
  border: InputBorder.none),
  keyboardType: TextInputType.number,
),)
),
ElevatedButton(onPressed: (){
  if(_descriptionController.text.isEmpty || _amountController.text.isEmpty){
    return;
  }
  final goal= Goal(
    id: DateTime.now().toString(),
    description: _descriptionController.text,
    targetAmount: double.parse(_amountController.text),
    savedAmount: 0.0,
     );
     Provider.of<GoalProvider>(context, listen: false).addGoal(goal);
}, child: const Text('Add goal'),),
const Expanded(child: GoalProgress(),)
      ],),
    );
  }
}