import 'package:flutter/material.dart';

import '../../../widgets/scaffold.dart';
import '../drawer/app_drawer.dart';
import 'home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage(this._appDrawer, this._viewModel);

  final AppDrawer _appDrawer;
  final HomeViewModel _viewModel;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => scaffold(
        appBar: appBar("Home"),
        drawer: widget._appDrawer,
        body: _body(),
      );

  Widget _body() => GridView.count(crossAxisCount: 2, children: <Widget>[
        GestureDetector(
          child: Text("Screen 1"),
          onTap: widget._viewModel.onShowScreen1,
        )
      ]);
}
