// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModel, Store {
  Computed<LoginState> _$stateComputed;

  @override
  LoginState get state =>
      (_$stateComputed ??= Computed<LoginState>(() => super.state)).value;

  final _$_stateAtom = Atom(name: '_LoginViewModel._state');

  @override
  LoginState get _state {
    _$_stateAtom.context.enforceReadPolicy(_$_stateAtom);
    _$_stateAtom.reportObserved();
    return super._state;
  }

  @override
  set _state(LoginState value) {
    _$_stateAtom.context.conditionallyRunInAction(() {
      super._state = value;
      _$_stateAtom.reportChanged();
    }, _$_stateAtom, name: '${_$_stateAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'state: ${state.toString()}';
    return '{$string}';
  }
}
