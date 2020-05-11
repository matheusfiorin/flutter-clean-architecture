import 'build_info.dart';

abstract class BuildConfig {
  Future<void> init();

  BuildInfo get currentInfo;
}
