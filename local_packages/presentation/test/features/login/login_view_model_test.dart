import 'package:data/repositories/user_session/user_session_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:models/user_session/user_session.dart';
import 'package:presentation/features/login/login_state.dart';
import 'package:presentation/features/login/login_view_model.dart';
import 'package:test/test.dart';

import '../../mocks/outputs.dart';
import '../../mocks/repositories.dart';

void main() {
  final arranger = _Arranger();

  LoginViewModel _createViewModel() =>
      LoginViewModel(arranger.userSessionRepo)..output = arranger.loginOutput;

  setUp(arranger.resetMocks);

  test('It should start in the "not logged in" view state', () async {
    // given
    final viewModel = _createViewModel();

    // when
    expect(viewModel.state.viewState, equals(LoginViewState.notLoggedIn));
  });

  test('It should call the output method when the login succeeds', () async {
    // given
    arranger.withSuccessfulLogin();

    final viewModel = _createViewModel();

    // when
    await viewModel.onLogin();

    // then
    verify(arranger.loginOutput.didLoginSucceed());
  });

  test('It should change to the "loading" view state after the login',
      () async {
    // given
    arranger.withSuccessfulLogin();

    final viewModel = _createViewModel();

    // when
    await viewModel.onLogin();

    // then
    expect(viewModel.state.viewState, equals(LoginViewState.loading));
  });

  test('It should NOT call the output method when the login fails', () async {
    // given
    arranger.withUnsuccessfulLogin();

    final viewModel = _createViewModel();

    // when
    await viewModel.onLogin();

    // then
    verifyZeroInteractions(arranger.loginOutput);
  });

  test(
      'It should revert to the "not loggged in" view state '
      'when the login fails', () async {
    // given
    arranger.withUnsuccessfulLogin();

    final viewModel = _createViewModel();

    // when
    await viewModel.onLogin();

    // then
    expect(viewModel.state.viewState, equals(LoginViewState.notLoggedIn));
  });
}

class _Arranger {
  _Arranger();

  final UserSessionRepo userSessionRepo = UserSessionRepoMock();
  final LoginOutput loginOutput = LoginOutputMock();

  void resetMocks() {
    reset(userSessionRepo);
    reset(loginOutput);
  }

  void withSuccessfulLogin() {
    when(userSessionRepo.login(any, any, any)).thenAnswer(
      (_) => Future.value(UserSession(token: "123")),
    );
  }

  void withUnsuccessfulLogin() {
    when(userSessionRepo.login(any, any, any))
        .thenAnswer((_) => Future.error("Oops!"));
  }
}
