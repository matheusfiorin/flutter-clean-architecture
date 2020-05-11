import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:models/user_session/user_session.dart';

part 'user_session_dto.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class UserSessionDto {
  const UserSessionDto({
    this.id,
    this.name,
    this.token,
  });

  final int id;
  final String name;
  final String token;

  factory UserSessionDto.fromJson(Map<String, dynamic> json) =>
      _$UserSessionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserSessionDtoToJson(this);

  UserSession toModel() => UserSession(
        id: id,
        name: name,
        token: token,
      );
}
