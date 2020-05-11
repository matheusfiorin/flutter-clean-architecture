import 'package:data/repositories/user_session/user_session_repo.dart';

class AppDrawerViewModel {
  AppDrawerViewModel(this._userSessionRepo);

  final UserSessionRepo _userSessionRepo;

  AppDrawerOutput _output;

  String get userName => _userSessionRepo.currentUserSession().name;

  // ignore: avoid_setters_without_getters
  set output(AppDrawerOutput value) => _output = value;

  void navigateToReports() => _output.onNavigateToReports();

  void navigateToProfile() => _output.onNavigateToProfile();

  Future<void> logout() async {
    await _userSessionRepo.logout();
    _output?.didLogout();
  }
}

abstract class AppDrawerOutput {
  void onNavigateToReports();

  void onNavigateToProfile();

  void didLogout();
}
