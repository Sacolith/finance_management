import 'package:flutter/material.dart';

import '../models/goal.dart';

class GoalProvider with ChangeNotifier{
  final List<Goal> _goals=[];

  List<Goal> get goals => _goals;

  void addGoal(Goal goal){
    _goals.add(goal);
    notifyListeners();
  }
}