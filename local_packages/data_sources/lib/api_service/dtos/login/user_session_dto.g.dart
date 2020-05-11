// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSessionDto _$UserSessionDtoFromJson(Map<String, dynamic> json) {
  return UserSessionDto(
    id: json['id'] as int,
    name: json['name'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UserSessionDtoToJson(UserSessionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'token': instance.token,
    };
