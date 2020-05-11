import 'package:flutter/widgets.dart';

import '../../design/metrics.dart';
import '../../design/style.dart';

class ProfilePageStyle {
  final EdgeInsets padding = Metrics.layout.xlPadding;
  
  final _AppVersion appVersion = _AppVersion();
}

class _AppVersion {
  final TextStyle textStyle = Style.current.text.xsTextStyle;
  final EdgeInsets padding = Metrics.layout.mdPadding;
}
