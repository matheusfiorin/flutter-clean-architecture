import 'package:mobx/mobx.dart';

mixin DisposableState {
  List<ReactionDisposer> _disposers = [];

  void registerReactions(List<ReactionDisposer> disposers) {
    unregisterReactions();

    _disposers = disposers ?? [];
  }

  void unregisterReactions() {
    for (final disposer in _disposers) {
      disposer.call();
    }

    _disposers = [];
  }
}
