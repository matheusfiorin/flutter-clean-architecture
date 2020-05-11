import 'package:data/data_sources/user_session/user_session_data_source.dart';
import 'package:data/repositories/storage/secure_storage_repo.dart';
import 'package:data/repositories/user_session/user_session_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:repositories/user_session/user_session_repo.dart';
import 'package:test/test.dart';

import '../mocks/data_sources.dart';
import '../mocks/repositories.dart';

void main() {
  final arranger = _Arranger();

  UserSessionRepo _createRepo() => UserSessionRepoImpl(
        arranger.secureStorageRepo,
        arranger.userSessionDataSource,
      );

  setUp(arranger.resetMocks);

  test('It should load the user session with as logged-in', () async {
    // given
    arranger.asLoggedIn();

    final repo = _createRepo();

    // when
    final userSession = await repo.load();

    // then
    expect(userSession.isLoggedIn, isTrue);
  });

  test('It should load the user session with as logged-out', () async {
    // given
    arranger.asLoggedOut();

    final repo = _createRepo();

    // when
    final userSession = await repo.load();

    // then
    expect(userSession.isLoggedIn, isFalse);
  });

  // TODO: Test the "login" method
}

class _Arranger {
  final SecureStorageRepo secureStorageRepo = SecureStorageRepoMock();
  final UserSessionDataSource userSessionDataSource =
      UserSessionDataSourceMock();

  void resetMocks() {
    reset(secureStorageRepo);
    reset(userSessionDataSource);
  }

  void asLoggedIn() {
    when(secureStorageRepo.readFromJson(key: anyNamed("key")))
        .thenAnswer((_) => Future.value({
              "id": 1,
              "name": "User name",
              "token": "123",
            }));
  }

  void asLoggedOut() {
    when(secureStorageRepo.readFromJson(key: anyNamed("key")))
        .thenAnswer((_) => Future.value(null));
  }
}
