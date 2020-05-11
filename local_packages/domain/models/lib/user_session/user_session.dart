import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_session.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class UserSession {
  const UserSession({
    this.id,
    this.name,
    this.token,
  });

  final int id;
  final String name;
  final String token;

  bool get isLoggedIn => token != null;

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);

  Map<String, dynamic> toJson() => _$UserSessionToJson(this);

  UserSession copyWith({
    int id,
    String name,
    String token,
  }) =>
      UserSession(
        id: id ?? this.id,
        name: name ?? this.name,
        token: token ?? this.token,
      );
}
