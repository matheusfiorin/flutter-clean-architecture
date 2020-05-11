import 'package:data/repositories/user_session/user_session_repo.dart';
import 'package:mobx/mobx.dart';
import 'package:models/user_session/user_session.dart';

import 'login_state.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

abstract class _LoginViewModel with Store {
  _LoginViewModel(
    this._userSessionRepo,
  );

  final UserSessionRepo _userSessionRepo;
  LoginOutput _output;

  // ignore: avoid_setters_without_getters
  set output(LoginOutput value) => _output = value;

  @observable
  LoginState _state = LoginState();

  @computed
  LoginState get state => _state;

  void onCnpjChanged(String cnpj) {
    _state = _state.copyWith(cnpj: cnpj);
  }

  void onDocumentChanged(String document) {
    _state = _state.copyWith(document: document);
  }

  void onPasswordChanged(String password) {
    _state = _state.copyWith(password: password);
  }

  Future<void> onLogin() {
    setStateAsLoading();

    return _userSessionRepo
        .login(_state.cnpj, _state.document, _state.password)
        .then(
      _onLoginResult,
      onError: (err) {
        setStateAsNotLoggedIn(
          errorMessage: "Ocorreu um erro ao tentar entrar.",
        );
      },
    );
  }

  void setStateAsLoading() {
    _state = _state.copyWith(viewState: LoginViewState.loading);
  }

  void setStateAsNotLoggedIn({String errorMessage}) {
    _state = _state.copyWith(
      viewState: LoginViewState.notLoggedIn,
      errorMessage: errorMessage,
    );
  }

  _onLoginResult(UserSession userSession) {
    if (userSession.isLoggedIn) _output?.didLoginSucceed();
  }
}

abstract class LoginOutput {
  void didLoginSucceed();
}
