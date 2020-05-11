import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../forms/validators.dart';

@immutable
class LoginState {
  LoginState({
    this.viewState = LoginViewState.notLoggedIn,
    this.cnpj = "",
    this.document = "",
    this.password = "",
    this.errorMessage = "",
  });

  final LoginViewState viewState;
  final String cnpj;
  final String document;
  final String password;
  final String errorMessage;

  bool get isValid =>
      isValidCnpj(cnpj) && document.isNotEmpty && password.isNotEmpty;

  LoginState copyWith({
    LoginViewState viewState,
    String cnpj,
    String document,
    String password,
    String errorMessage,
  }) =>
      LoginState(
        viewState: viewState ?? this.viewState,
        cnpj: cnpj ?? this.cnpj,
        document: document ?? this.document,
        password: password ?? this.password,
        errorMessage: errorMessage ?? "",
      );
}

enum LoginViewState { notLoggedIn, loading }

extension LoginViewStateEx on LoginViewState {
  Widget when({
    Widget Function() notLoggedIn,
    Widget Function() loading,
  }) {
    if (this == LoginViewState.notLoggedIn) return notLoggedIn.call();
    return loading.call();
  }
}
