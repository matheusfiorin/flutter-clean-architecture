import 'package:chopper/chopper.dart';

import 'converters/json_to_type_converter.dart';
import 'dtos/login/user_session_dto.dart';
import 'interceptors/token_interceptor.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Post(path: "login")
  Future<Response<UserSessionDto>> login(
    @Body() Map<String, dynamic> body,
  );
}

ApiService createApiService(
  String baseUrl,
  TokenInterceptor tokenInterceptor,
) {
  final client = ChopperClient(
    baseUrl: baseUrl,
    services: [_$ApiService()],
    interceptors: [
      tokenInterceptor,
    ],
    converter: _converter(),
  );

  return _$ApiService(client);
}

Converter _converter() => JsonToTypeConverter({
      UserSessionDto: (jsonData) => UserSessionDto.fromJson(jsonData),
    });
