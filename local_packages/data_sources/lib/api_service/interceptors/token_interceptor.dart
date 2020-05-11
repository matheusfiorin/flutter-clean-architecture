import 'package:chopper/chopper.dart';

class TokenInterceptor implements RequestInterceptor {
  const TokenInterceptor(this._getToken);

  final String Function() _getToken;

  @override
  Future<Request> onRequest(Request request) async {
    final token = _getToken();
    return applyHeaders(request, {"Authorization": "Bearer $token"});
  }
}
