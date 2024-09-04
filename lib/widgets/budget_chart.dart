import 'package:finance_management/main.dart';
import 'package:finance_management/providers/budget_provider.dart';
import 'package:finance_management/widgets/expense_list.dart';
import 'package:finance_management/widgets/goal_progress.dart';
import 'package:finance_management/widgets/report_generator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetChart extends StatefulWidget {
  const BudgetChart({super.key});

  @override
  State<BudgetChart> createState() => BudgetChartState();
}

class BudgetChartState extends State<BudgetChart> {
  late double upPosition;
  late double startPosition;

  @override
  void initState() {
    super.initState();
    startPosition = 500;
    upPosition = 200;
    upwardMotion();
  }

//This is the method that controls the headache of an annimation to move upwards "slowly".
  void upwardMotion() {
    Future.delayed(Duration.zero, () {
      setState(() {
        upPosition = 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final budgetProvider = Provider.of<BudgetProvider>(context);
    final budgets = budgetProvider.budgets;
    

    return budgets.isEmpty
        ? const Center(child: Text('No budget data available'))
        : SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 300, // Define a specific height for the Stack
                  child: Stack(
                    children: [
                      //This is where the animation starts to kick off upPosition is the vehicle
                      AnimatedPositioned(
                        top: upPosition,
                        left: 0,
                        right: 0,
                        duration: const Duration(seconds: 1),
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 200, // Provide a specific height for the PieChart
                          child: PieChart(
  PieChartData(
    sections: budgets.map((budget) {
      final value = budget.limit;  
      return PieChartSectionData(
        value: value,
        title: '\$${value.toStringAsFixed(2)}',titleStyle: const TextStyle(color: Colors.white),
        color: thyme().hintColor,  
      );
    }).toList(),
    sectionsSpace: 0,
    centerSpaceRadius: 45,
    borderData: FlBorderData(show: false),
    pieTouchData: PieTouchData(
      touchCallback: (pieTouchResponse, _) {},
    ),
  ),
),

                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
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
                ),
              ],
            ),
          );
  }
}
