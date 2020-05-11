import 'package:flutter/widgets.dart';

import '../../../design/metrics.dart';
import '../../../design/style.dart';

class AppDrawerStyle {
  final _Header header = _Header();
  final _Item item = _Item();
  final _AppVersion appVersion = _AppVersion();
}

class _Header {
  final double height = 240.0;
  final double avatarRadius = 32.0;
}

class _Item {
  final TextStyle textStyle = Style.current.text.mdTextStyle;
  final TextStyle boldTextStyle = Style.current.text.mdBoldTextStyle;
}

class _AppVersion {
  final TextStyle textStyle = Style.current.text.xsTextStyle;
  final EdgeInsets padding = Metrics.layout.mdPadding;
}
