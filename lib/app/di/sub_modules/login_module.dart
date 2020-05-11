import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:presentation/features/login/login_page.dart';
import 'package:presentation/features/login/login_view_model.dart';

import '../app_module.dart';

class LoginModule {
  LoginModule(this._appModule) {
    _injector = Injector.getInjector(runtimeType.toString());

    _mapViewModels();
  }

  final AppModule _appModule;
  Injector _injector;

  void _mapViewModels() {
    _injector.map<LoginViewModel>(
      (i) => LoginViewModel(_appModule.userSessionRepo),
    );
  }

  LoginViewModel get loginViewModel => _injector.get<LoginViewModel>();

  LoginPage loginPage(LoginOutput output) =>
      LoginPage(loginViewModel..output = output);
}
