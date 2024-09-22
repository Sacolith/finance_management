import 'package:finance_management/widgets/expense_list.dart';
import 'package:finance_management/widgets/goal_progress.dart';
import 'package:finance_management/widgets/report_generator.dart';
import 'package:flutter/material.dart';

class ScreensDisplay extends StatelessWidget{
  const ScreensDisplay({super.key});

  @override
  Widget build(BuildContext context){
    return  const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Card(
                          color:Colors.green,
                          shadowColor: Colors.purple,
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: ExpenseList(),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: Colors.blue,
                          shadowColor: Colors.black,
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: GoalProgress(),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: Colors.amber,
                          shadowColor: Color.fromARGB(255, 35, 27, 3),
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: ReportGenerator(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
  }
}