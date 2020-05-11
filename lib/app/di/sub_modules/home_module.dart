import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:presentation/features/home/drawer/app_drawer.dart';
import 'package:presentation/features/home/drawer/app_drawer_view_model.dart';
import 'package:presentation/features/home/page/home_page.dart';
import 'package:presentation/features/home/page/home_view_model.dart';

import '../app_module.dart';

class HomeModule {
  HomeModule(this._appModule) {
    _injector = Injector.getInjector(runtimeType.toString());

    _mapViewModels();
  }

  final AppModule _appModule;
  Injector _injector;

  void _mapViewModels() {
    _injector.map<AppDrawerViewModel>(
      (i) => AppDrawerViewModel(_appModule.userSessionRepo),
    );

    _injector.map<HomeViewModel>(
      (i) => HomeViewModel(),
    );
  }

  AppDrawerViewModel get appDrawerViewModel =>
      _injector.get<AppDrawerViewModel>();

  HomeViewModel get homeViewModel => _injector.get<HomeViewModel>();

  HomePage homePage(HomeOutput output) =>
      HomePage(null, homeViewModel..output = output);

  AppDrawer appDrawer(AppDrawerOutput output) =>
      AppDrawer(appDrawerViewModel..output = output);

  HomePage drawerHomePage(
    AppDrawerOutput appDrawerOutput,
    HomeOutput homeOutput,
  ) {
    final drawer = appDrawer(appDrawerOutput);
    final viewModel = homeViewModel..output = homeOutput;

    return HomePage(drawer, viewModel);
  }
}
