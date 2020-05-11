import 'package:models/user_session/user_session.dart';

abstract class UserSessionDataSource {
  Future<UserSession> login(
    String cnpj,
    String document,
    String password,
  );
}
