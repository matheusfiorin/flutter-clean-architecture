class HomeViewModel {
  HomeOutput _output;

  // ignore: avoid_setters_without_getters
  set output(HomeOutput value) => _output = value;

  void onShowScreen1() => _output?.showScreen1();
}

abstract class HomeOutput {
  void showScreen1();
}
