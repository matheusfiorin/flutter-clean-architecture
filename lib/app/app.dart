import 'package:common/platform/build_config/build_config.dart';
import 'package:data/repositories/user_session/user_session_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:models/user_session/user_session.dart';
import 'package:presentation/design/theme.dart';
import 'package:presentation/navigation/main_navigator.dart';
import 'package:presentation/widgets/application.dart';

class App extends StatelessWidget {
  App(
    this._mainNavigator,
    this._userSessionRepo,
    this._buildConfig,
  );

  final MainNavigator _mainNavigator;
  final UserSessionRepo _userSessionRepo;
  final BuildConfig _buildConfig;

  @override
  Widget build(BuildContext context) => application(
        materialThemeData: materialThemeData(),
        cupertinoThemeData: cupertinoThemeData(),
        title: "Host",
        navigatorKey: _mainNavigator.navigatorKey,
        home: _home(),
      );

  Widget _home() => FutureBuilder<UserSession>(
        future: _init(),
        builder: (context, snapshot) => _mainNavigator.firstPage(snapshot.data),
      );

  Future<UserSession> _init() async {
    await _buildConfig.init();

    final userSession = await _userSessionRepo.load();
    return userSession;
  }
}
