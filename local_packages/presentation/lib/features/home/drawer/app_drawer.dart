import 'package:flutter/material.dart';

import '../../../widgets/layout.dart';
import '../../../widgets/texts.dart';
import 'app_drawer_style.dart';
import 'app_drawer_view_model.dart';

class AppDrawer extends StatelessWidget {
  static final _style = AppDrawerStyle();

  const AppDrawer(
    this._viewModel,
  );

  final AppDrawerViewModel _viewModel;

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _header(),
            ..._items(context),
          ],
        ),
      );

  Widget _header() => Container(
        height: _style.header.height,
        child: DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ..._userAvatar(),
              ..._userName(),
              _userProfile(),
            ],
          ),
        ),
      );

  List<Widget> _userAvatar() => [
        lgSpacer(),
        CircleAvatar(radius: _style.header.avatarRadius),
      ];

  List<Widget> _userName() => [
        lgSpacer(),
        heading2Text(_viewModel.userName),
        xsSpacer(),
      ];

  Widget _userProfile() => Text(
        '[Profile]',
        style: _style.item.textStyle,
      );

  List<Widget> _items(BuildContext context) => [
        ..._item(
          'Home',
          Icons.home,
          onTap: () => _closeDrawer(context),
        ),
        ..._item(
          'Relatório',
          Icons.assessment,
          onTap: () => _navigateToReports(context),
        ),
        ..._item(
          'Perfil',
          Icons.person,
          onTap: () => _navigateToProfile(context),
        ),
        ..._item(
          'Sair',
          Icons.exit_to_app,
          isBold: true,
          onTap: _logout,
        ),
      ];

  void _closeDrawer(BuildContext context) => Navigator.pop(context);

  List<Widget> _item(String title, IconData icon,
          {bool isBold = false, VoidCallback onTap}) =>
      [
        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: isBold ? _style.item.boldTextStyle : _style.item.textStyle,
          ),
          onTap: onTap,
        ),
      ];

  void _navigateToProfile(BuildContext context) {
    _closeDrawer(context);
    _viewModel.navigateToProfile();
  }

  void _navigateToReports(BuildContext context) {
    _closeDrawer(context);
    _viewModel.navigateToReports();
  }

  void _logout() => _viewModel.logout();
}
