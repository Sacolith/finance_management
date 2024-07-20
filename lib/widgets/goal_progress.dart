import 'package:finance_management/providers/goal_provide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalProgress extends StatelessWidget{
  const GoalProgress({super.key});

  @override
  Widget build(BuildContext context){
    return Consumer<GoalProvider>(
      builder:(context,goalProvider,child){
        return goalProvider.goals.isEmpty?const Center(child: Text('No Set goals'),)
        :ListView.builder(
          itemCount: goalProvider.goals.length ,
          itemBuilder: (context,index){
            final goal= goalProvider.goals[index];
            final progress = goal.savedAmount/goal.targetAmount;
            return ListTile(
              title:  Text(goal.description),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Target: \$${goal.targetAmount.toStringAsFixed(2)}'),
                  Text('Saved: \$${goal.savedAmount.toStringAsFixed(2)}'),
                  LinearProgressIndicator(value: progress),
                ],
                ),
            );
          },
          );
      }, 
      );
  }
}