import 'package:flutter/material.dart';

import '../../widgets/scaffold.dart';

class ReportsPage extends StatefulWidget {
  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) => scaffold(
        appBar: appBar("Relatório"),
        body: Center(child: Text("relatório")),
      );
}
