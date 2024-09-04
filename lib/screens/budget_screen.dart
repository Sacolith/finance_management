import 'package:finance_management/models/budget.dart';
import 'package:finance_management/providers/budget_provider.dart';
import 'package:finance_management/widgets/budget_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetContent extends StatefulWidget {
  const BudgetContent({super.key});

  @override
  State<BudgetContent> createState() => BudgetScreen();
}

class BudgetScreen extends State<BudgetContent> with SingleTickerProviderStateMixin {
  final TextEditingController _limitController = TextEditingController();
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final CurvedAnimation _cve;
  static bool _isBudgetSet = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _cve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _animation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(_cve);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isBudgetSet = true;  // Remove TextField and Button after animation completes
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          if (!_isBudgetSet)
            FadeTransition(
              opacity: _animation,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _limitController,
                      decoration: const InputDecoration(labelText: 'Budget Limit'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_limitController.text.isEmpty) {
                        return;
                      }
                      final budget = Budget(
                        id: DateTime.now().toString(),
                        limit: double.parse(_limitController.text),
                        startDate: DateTime.now(),
                        endDate: DateTime.now().add(const Duration(days: 30)), spentAmount: 0,
                      );
                      Provider.of<BudgetProvider>(context, listen: false).addBudget(budget);

                      _controller.forward(); // Start the fade-out animation
                    },
                    child: const Text('Set Budget'),
                  ),

                ],
              ),
            ),
          const Expanded(child: BudgetChart()),
          
        ],
      ),
    );
  }
}


  