import 'package:data/data_sources/user_session/user_session_data_source.dart';
import 'package:models/user_session/user_session.dart';

import '../api_service/api_service.dart';

class UserSessionDataSourceImpl implements UserSessionDataSource {
  const UserSessionDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<UserSession> login(
    String cnpj,
    String document,
    String password,
  ) async {
    final response = await _apiService.login({
      "cnpj": cnpj,
      "document": document,
      "password": password,
    });

    return response.body.toModel();
  }
}
