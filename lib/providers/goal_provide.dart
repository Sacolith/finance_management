import 'package:flutter/material.dart';

import '../models/goal.dart';
//Stores Goal values as list and distributres them to where they need to go
class GoalProvider with ChangeNotifier{
  final List<Goal> _goals=[];

  List<Goal> get goals => _goals;

  void addGoal(Goal goal){
    _goals.add(goal);
    notifyListeners();
  }
}