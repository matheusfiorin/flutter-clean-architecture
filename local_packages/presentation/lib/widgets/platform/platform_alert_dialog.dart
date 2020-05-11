import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../design/metrics.dart';
import '../../design/style.dart';
import 'platform_dialog_button_action.dart';
import 'platform_info.dart';
import 'platform_widget.dart';

class PlatformAlertDialog
    extends PlatformWidget<CupertinoAlertDialog, AlertDialog> {
  PlatformAlertDialog({
    Key key,
    this.title,
    this.content,
    @required this.actions,
  }) : super(key: key);

  final String title;
  final String content;
  final List<DialogButtonAction> actions;

  @override
  AlertDialog createAndroidWidget(BuildContext context) => AlertDialog(
        title: (title != null) ? Text(title) : null,
        content: Text(content),
        actions: _androidButtons(context),
      );

  List<Widget> _androidButtons(BuildContext context) => actions
      .map(
        (action) => FlatButton(
          child: Text(action.text, style: _textStyleFrom(action.type)),
          onPressed: () => _callAndCloseDialog(context, action.onExecuted),
        ),
      )
      .toList();

  TextStyle _textStyleFrom(DialogButtonActionType type) => type.when(
        destructive: TextStyle(
          color: Style.current.dialog.destructiveTextColor,
        ),
        positive: TextStyle(fontWeight: FontWeight.bold),
        neutral: null,
      );

  void _callAndCloseDialog(BuildContext context, VoidCallback callback) {
    callback?.call();

    Navigator.of(context).pop();
  }

  @override
  CupertinoAlertDialog createIosWidget(BuildContext context) =>
      CupertinoAlertDialog(
        title: (title != null) ? Text(title) : null,
        content: Padding(
          padding: Metrics.layout.smTopBottomPadding,
          child: Text(content),
        ),
        actions: _cupertinoButtons(context),
      );

  List<Widget> _cupertinoButtons(BuildContext context) => actions
      .map(
        (action) => CupertinoButton(
          child: Text(action.text, style: _textStyleFrom(action.type)),
          onPressed: () => _callAndCloseDialog(context, action.onExecuted),
        ),
      )
      .toList();
}

Future<T> showPlatformDialog<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  bool androidBarrierDismissible = false,
}) {
  if (isAndroid(context)) {
    return showDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: androidBarrierDismissible,
    );
  } else {
    return showCupertinoDialog<T>(
      context: context,
      builder: builder,
    );
  }
}
