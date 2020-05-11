class BuildInfo {
  final String packageName;
  final String version;
  final String buildNumber;

  BuildInfo({this.packageName, this.version, this.buildNumber});

  String get appVersion => "v$version.$buildNumber";
}
