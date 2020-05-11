import 'package:models/user_session/user_session.dart';

abstract class UserSessionRepo {
  UserSession currentUserSession();

  Future<UserSession> load();

  Future<UserSession> login(
    String cnpj,
    String document,
    String password,
  );

  Future<void> logout();
}
