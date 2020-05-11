import 'package:meta/meta.dart';

@immutable
class ApiSettings {
  const ApiSettings({
    this.baseUrl = "",
  });

  final String baseUrl;
}
