import 'package:flutter/material.dart';

class ReportProvuder with ChangeNotifier{
  final List<String> _reports=['R1','R2','R3'];

  List<String> get reports => _reports;
}