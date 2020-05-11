import 'package:data/repositories/user_session/user_session_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/features/home/drawer/app_drawer_view_model.dart';
import 'package:test/test.dart';

import '../../mocks/outputs.dart';
import '../../mocks/repositories.dart';

void main() {
  final arranger = _Arranger();

  AppDrawerViewModel _createViewModel() => AppDrawerViewModel(
        arranger.userSessionRepo,
      )..output = arranger.appDrawerOutput;

  setUp(arranger.resetMocks);

  test('It should navigate to the "Reports" page', () async {
    // given
    final viewModel = _createViewModel();

    // when
    await viewModel.navigateToReports();

    // then
    verify(arranger.appDrawerOutput.onNavigateToReports());
  });

  test('It should navigate to the "Profile" page', () async {
    // given
    final viewModel = _createViewModel();

    // when
    await viewModel.navigateToProfile();

    // then
    verify(arranger.appDrawerOutput.onNavigateToProfile());
  });

  test('It should call the "logout" use case when logging out', () async {
    // given
    arranger.withSuccessfulLogout();

    final viewModel = _createViewModel();

    // when
    await viewModel.logout();

    // then
    verify(arranger.userSessionRepo.logout());
  });

  test('It should call the output method after logging out', () async {
    // given
    arranger.withSuccessfulLogout();

    final viewModel = _createViewModel();

    // when
    await viewModel.logout();

    // then
    verify(arranger.appDrawerOutput.didLogout());
  });
}

class _Arranger {
  final UserSessionRepo userSessionRepo = UserSessionRepoMock();
  final AppDrawerOutput appDrawerOutput = AppDrawerOutputMock();

  void resetMocks() {
    reset(userSessionRepo);
    reset(appDrawerOutput);
  }

  void withSuccessfulLogout() {
    when(userSessionRepo.logout()).thenAnswer((_) => Future.value());
  }

  void withFailedLogout() {
    when(userSessionRepo.logout()).thenAnswer((_) => Future.error("Oops!"));
  }
}
