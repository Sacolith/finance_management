import 'package:flutter/material.dart';

class ReportProvuder with ChangeNotifier{
  final List<String> _reports=['Report1','Report2','Report3'];

  List<String> get reports => _reports;
}