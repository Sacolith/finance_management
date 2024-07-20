import 'package:finance_management/widgets/report_generator.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget{
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( title: const Text('Reports'),
      ),
      body: const Column(
        children: <Widget>[
          Expanded(child: ReportGenerator()),
        ],),
    );
  }
}