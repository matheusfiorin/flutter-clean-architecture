import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:models/settings/api_settings.dart';
import 'package:presentation/design/style.dart';

@immutable
class Settings {
  const Settings({
    @required this.apiSettings,
    @required this.buildStyle,
  });

  final ApiSettings apiSettings;
  final FlavorStyle Function() buildStyle;
}
