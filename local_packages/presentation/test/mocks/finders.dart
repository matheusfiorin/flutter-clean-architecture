import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Finder raisedButtonFinder({@required int index}) =>
    find.byType(RaisedButton).at(index);
