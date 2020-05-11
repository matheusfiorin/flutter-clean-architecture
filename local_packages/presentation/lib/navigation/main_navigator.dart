import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:models/user_session/user_session.dart';

import '../features/home/drawer/app_drawer_view_model.dart';
import '../features/home/page/home_page.dart';
import '../features/home/page/home_view_model.dart';
import '../features/home/tabs/tabs_home_page.dart';
import '../features/login/login_page.dart';
import '../features/login/login_view_model.dart';
import '../features/profile/profile_page.dart';
import '../features/profile/profile_view_model.dart';
import '../features/reports/reports_page.dart';
import '../features/splash/splash_page.dart';
import 'navigation_stack.dart';

class MainNavigator
    implements LoginOutput, AppDrawerOutput, HomeOutput, ProfileOutput {
  MainNavigator(
    this._navigationStack,
    this._createLoginPage,
    this._createTabsHomePage,
    this._createDrawerHomePage,
    this._createReportsPage,
    this._createProfilePage,
  );

  final NavigationStack _navigationStack;

  final LoginPage Function(LoginOutput) _createLoginPage;

  final TabsHomePage Function(
    HomeOutput,
    ProfileOutput,
  ) _createTabsHomePage;

  final HomePage Function(AppDrawerOutput, HomeOutput) _createDrawerHomePage;
  final ReportsPage Function() _createReportsPage;
  final ProfilePage Function(ProfileOutput) _createProfilePage;

  GlobalKey<NavigatorState> get navigatorKey => _navigationStack.navigatorKey;

  Widget firstPage(UserSession userSession) {
    if (userSession == null) return _splashPage();
    return userSession.isLoggedIn ? _homePage() : _loginPage();
  }

  Widget _splashPage() => SplashPage();

  Widget _loginPage() => _createLoginPage(this);

  Widget _homePage() => Platform.isAndroid
      ? _createDrawerHomePage(this, this)
      : _createTabsHomePage(this, this);

  void _pushLoginPage() => _navigationStack.pushAsHome(_loginPage());

  void _pushHomePage() => _navigationStack.pushAsHome(_homePage());

  void _pushReportsPage() => _navigationStack.push(_createReportsPage());

  void _pushProfilePage() => _navigationStack.push(_createProfilePage(this));

  @override
  void didLoginSucceed() => _pushHomePage();

  @override
  void onNavigateToReports() => _pushReportsPage();

  @override
  void onNavigateToProfile() => _pushProfilePage();

  @override
  void showScreen1() {
    // TODO: implement showScreen1
  }

  @override
  void didLogout() => _pushLoginPage();
}
