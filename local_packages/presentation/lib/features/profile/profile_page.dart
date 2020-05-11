import 'package:flutter/material.dart';

import '../../widgets/buttons.dart';
import '../../widgets/layout.dart';
import '../../widgets/scaffold.dart';
import 'profile_page_style.dart';
import 'profile_view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(this._viewModel);

  final ProfileViewModel _viewModel;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static final _style = ProfilePageStyle();

  @override
  Widget build(BuildContext context) => scaffold(
        appBar: appBar("Perfil"),
        body: keyboardHider(context, _body()),
      );

  Widget _body() => Container(
        padding: _style.padding,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: _logoutButton(),
              ),
            ),
            ..._buildInfo(),
          ],
        ),
      );

  Widget _logoutButton() => expandedPositiveButton(
        "Sair",
        onPressed: widget._viewModel.logout,
      );

  List<Widget> _buildInfo() => [
        Text(
          '${widget._viewModel.buildInfo}',
          style: _style.appVersion.textStyle,
        ),
        mdSpacer(),
      ];
}
