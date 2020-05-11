import 'package:flutter/material.dart';

import '../../widgets/scaffold.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
}
