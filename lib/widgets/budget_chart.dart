import 'package:finance_management/providers/budget_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetChart extends StatelessWidget{
  const BudgetChart({super.key});

  @override
  Widget build(BuildContext context){

    final budgetProvider= Provider.of<BudgetProvider>(context);
    final budgets= budgetProvider.budgets;

    return budgets.isEmpty? const Center(child: Text('No budget data avalable'),): PieChart(
      PieChartData  (
        sections: budgets.map((budget){
          final value = budget.limit;
          return PieChartSectionData(
            value: value,
            title: '\$${value.toStringAsFixed(2)}',
            color: Colors.red,
          );
        }).toList(),
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        borderData: FlBorderData(show: false),
        pieTouchData: PieTouchData(
          touchCallback: (pieTouchResponse, _){

          })
      )
    );
  }
}