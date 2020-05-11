import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:presentation/features/profile/profile_page.dart';
import 'package:presentation/features/profile/profile_view_model.dart';

import '../app_module.dart';

class ProfileModule {
  ProfileModule(this._appModule) {
    _injector = Injector.getInjector(runtimeType.toString());

    _mapViewModels();
  }

  final AppModule _appModule;
  Injector _injector;

  void _mapViewModels() {
    _injector.map<ProfileViewModel>(
      (i) => ProfileViewModel(
        _appModule.userSessionRepo,
        _appModule.buildConfig,
      ),
    );
  }

  ProfileViewModel get profileViewModel => _injector.get<ProfileViewModel>();

  ProfilePage profilePage(ProfileOutput output) =>
      ProfilePage(profileViewModel..output = output);
}
