import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../forms/text_input_formatters.dart';
import '../../mobx/disposable_state.dart';
import '../../widgets/buttons.dart';
import '../../widgets/layout.dart';
import '../../widgets/platform/platform_alert_dialog.dart';
import '../../widgets/platform/platform_dialog_button_action.dart';
import '../../widgets/progress_indicators.dart';
import '../../widgets/scaffold.dart';
import '../../widgets/text_form_fields.dart';
import 'login_page_style.dart';
import 'login_state.dart';
import 'login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(this._viewModel);

  final LoginViewModel _viewModel;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with DisposableState {
  static final _style = LoginPageStyle();

  CnpjFormatter _cnpjFormatter;
  TextEditingController _documentController;
  TextEditingController _passwordController;

  LoginViewModel get _viewModel => widget._viewModel;

  LoginState get _state => _viewModel.state;

  @override
  Widget build(BuildContext context) {
    registerReactions([
      reaction((_) => _viewModel.state.errorMessage, _showErrorMessage),
    ]);

    return scaffold(
      appBar: appBar("Login"),
      body: keyboardHider(context, _body()),
    );
  }

  Widget _body() => Observer(
        builder: (_) => _state.viewState.when(
          notLoggedIn: _form,
          loading: centeredProgressIndicator,
        ),
      );

  Widget _form() => SingleChildScrollView(
        child: Container(
          padding: _style.padding,
          child: Column(
            children: [
              ..._cnpj(_state.cnpj),
              ..._userName(_state.document),
              ..._password(_state.password),
              _loginButton(_state.isValid),
            ],
          ),
        ),
      );

  List<Widget> _cnpj(String cnpj) {
    _cnpjFormatter ??= CnpjFormatter(text: cnpj);

    return [
      textFormField(
        labelText: 'CNPJ',
        prefixIcon: Icons.domain,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        maxLength: _cnpjFormatter.maxLength,
        textEditingController: _cnpjFormatter.controller,
        onChanged: _viewModel.onCnpjChanged,
      ),
      mdSpacer(),
    ];
  }

  List<Widget> _userName(String document) {
    _documentController ??= TextEditingController(text: document);

    return [
      textFormField(
        labelText: 'Usuário',
        prefixIcon: Icons.person,
        textInputAction: TextInputAction.next,
        textEditingController: _documentController,
        onChanged: _viewModel.onDocumentChanged,
      ),
      mdSpacer(),
    ];
  }

  List<Widget> _password(String password) {
    _passwordController ??= TextEditingController(text: password);

    return [
      textFormField(
        labelText: 'Senha',
        prefixIcon: Icons.verified_user,
        obscureText: true,
        textInputAction: TextInputAction.go,
        textEditingController: _passwordController,
        onChanged: _viewModel.onPasswordChanged,
      ),
      mdSpacer(),
    ];
  }

  Widget _loginButton(bool canLogin) => expandedPositiveButton(
        "Entrar",
        onPressed: canLogin ? _viewModel.onLogin : null,
      );

  void _showErrorMessage(String errorMessage) {
    if (errorMessage.isEmpty) return;

    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: "Atenção",
        content: errorMessage,
        actions: [neutralAction("OK")],
      ),
    );
  }

  @override
  void dispose() {
    unregisterReactions(); // clean the reaction listeners
    super.dispose();
  }
}
