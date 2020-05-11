import 'package:flutter/widgets.dart';
import 'package:presentation/design/style.dart';

import 'app.dart';
import 'di/app_module.dart';
import 'flavor/flavor.dart';
import 'flavor/flavor_settings.dart';

void mainDelegate(Flavor flavor) {
  final settings = flavorSettings[flavor];

  // Set the style singleton
  Style.current = settings.buildStyle();

  final appModule = AppModule(settings);

  runApp(
    App(
      appModule.mainNavigator,
      appModule.userSessionRepo,
      appModule.buildConfig,
    ),
  );
}
