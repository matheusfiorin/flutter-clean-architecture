import 'package:flutter_masked_text/flutter_masked_text.dart';

abstract class TextInputFormatter {
  TextInputFormatter({String text}) : _text = text ?? "";

  final String _text;

  MaskedTextController _controller;

  String get _format;

  int get maxLength => _format.length;

  MaskedTextController get controller {
    _controller ??= MaskedTextController(
      text: _text,
      mask: _format,
    );

    return _controller;
  }
}

class CnpjFormatter extends TextInputFormatter {
  CnpjFormatter({String text}) : super(text: text);

  @override
  String get _format => '00.000.000/0000-00';
}

class DddFormatter extends TextInputFormatter {
  DddFormatter({String text}) : super(text: text);

  @override
  String get _format => '00';
}

class PhoneNumberFormatter extends TextInputFormatter {
  PhoneNumberFormatter({String text}) : super(text: text);

  final _shortFormat = '0000-0000';
  final _longFormat = '00000-0000';

  @override
  String get _format => _isLongText ? _longFormat : _shortFormat;

  bool get _isLongText => (_text ?? "").length > _maskChangeLimit;

  int get _maskChangeLimit => _shortFormat.length;

  @override
  int get maxLength => _longFormat.length;

  @override
  MaskedTextController get controller {
    if (_controller == null) {
      _controller = MaskedTextController(
        text: _text,
        mask: _format,
      );

      _controller.beforeChange = (previousText, nextText) {
        final phoneDigits = nextText.replaceAll(RegExp(r"[^\d]"), '');

        if (phoneDigits.length > _maskChangeLimit) {
          return false;
        } else if (phoneDigits.length == _maskChangeLimit) {
          _updateMask(_longFormat);
        } else {
          _updateMask(_shortFormat);
        }

        return true;
      };
    }

    return _controller;
  }

  void _updateMask(String mask) {
    if (_controller.mask != mask) {
      _controller.updateMask(mask);
    }
  }
}
