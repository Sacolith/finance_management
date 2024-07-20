import 'dart:io';

import 'package:finance_management/providers/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:pdf/widgets.dart' as pw;

class ReportGenerator extends StatelessWidget{
const ReportGenerator({super.key});

Future<void> _generateReport(BuildContext context) async {
  final reportprovider= Provider.of<ReportProvuder>(context, listen: false);
  final reports= reportprovider.reports;

  //Create PDf
  final pdf= pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context){
        return pw.Column(
          children: [
            pw.Text('Finance Report', style: const pw.TextStyle(fontSize: 24)),
              ...reports.map((report)=> pw.Text(report))

          ] );
      }
    )
  );

  //save pdf
  final outputDir = await getApplicationDocumentsDirectory();
  final outputFile = File('${outputDir.path}/finance_report.pdf');
  await outputFile.writeAsBytes(await pdf.save());

  // ignore: use_build_context_synchronously
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Report saved to ${outputFile.path}'))
  );
}
@override
Widget build(BuildContext context){
  return Column(
    children: <Widget>[
      Expanded(child: 
      Consumer<ReportProvuder>(builder: (context, reportprovider, child){
        return ListView.builder(
          itemCount: reportprovider.reports.length,
          itemBuilder: (context, index){
          final report =reportprovider.reports[index];
          return ListTile(
            title: Text(report),
          );
          });
      },)
      ),
      ElevatedButton(onPressed: ()=> _generateReport(context),
       child: const Text ('Generate report'),
       ),
    ],
  );
}
}