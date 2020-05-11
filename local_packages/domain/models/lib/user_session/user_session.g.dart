// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSession _$UserSessionFromJson(Map<String, dynamic> json) {
  return UserSession(
    id: json['id'] as int,
    name: json['name'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UserSessionToJson(UserSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'token': instance.token,
    };
