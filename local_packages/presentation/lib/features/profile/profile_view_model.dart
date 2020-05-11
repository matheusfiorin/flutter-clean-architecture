import 'package:common/platform/build_config/build_config.dart';
import 'package:data/repositories/user_session/user_session_repo.dart';

class ProfileViewModel {
  ProfileViewModel(this._userSessionRepo, this._buildConfig);

  final UserSessionRepo _userSessionRepo;
  final BuildConfig _buildConfig;

  ProfileOutput _output;

  // ignore: avoid_setters_without_getters
  set output(ProfileOutput value) => _output = value;

  Future<void> logout() async {
    await _userSessionRepo.logout();
    _output?.didLogout();
  }

  String get buildInfo {
    final info = _buildConfig.currentInfo;
    return "${info.appVersion}";
  }
}

abstract class ProfileOutput {
  void didLogout();
}
