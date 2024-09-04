import 'package:flutter/material.dart';

//Stores a list of String values as placeholder reports
class ReportProvider with ChangeNotifier{
  final List<String> _reports=['Report1','Report2','Report3'];

  List<String> get reports => _reports;
}