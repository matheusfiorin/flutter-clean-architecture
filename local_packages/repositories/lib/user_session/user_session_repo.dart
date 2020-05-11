import 'package:data/data_sources/user_session/user_session_data_source.dart';
import 'package:data/repositories/storage/secure_storage_repo.dart';
import 'package:data/repositories/user_session/user_session_repo.dart';
import 'package:models/user_session/user_session.dart';

class UserSessionRepoImpl implements UserSessionRepo {
  UserSessionRepoImpl(
    this._secureStorageRepo,
    this._userSessionDataSource,
  );

  final SecureStorageRepo _secureStorageRepo;
  final UserSessionDataSource _userSessionDataSource;

  UserSession _userSession = UserSession();

  @override
  UserSession currentUserSession() => _userSession;

  @override
  Future<UserSession> load() async {
    final userSessionJson =
        await _secureStorageRepo.readFromJson(key: _userSessionKey);

    if (userSessionJson != null) {
      _userSession = UserSession.fromJson(userSessionJson);
    }

    return _userSession;
  }

  @override
  Future<UserSession> login(
    String cnpj,
    String document,
    String password,
  ) async {
    final userSession = await _userSessionDataSource.login(
      cnpj,
      document,
      password,
    );
    await _save(userSession);

    return _userSession;
  }

  Future<void> _save(UserSession userSession) async {
    await _secureStorageRepo.writeAsJson(
      key: _userSessionKey,
      value: userSession.toJson(),
    );

    _userSession = userSession;
  }

  @override
  Future<void> logout() async {
    _userSession = UserSession();
    await _secureStorageRepo.deleteAll();
  }
}

const _userSessionKey = "USER_SESSION_V1";
