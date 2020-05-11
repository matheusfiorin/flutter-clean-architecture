import 'package:common/platform/network_connectivity/network_connectivity.dart';
import 'package:connectivity/connectivity.dart';

class NetworkConnectivityImpl implements NetworkConnectivity {
  Future<bool> get available async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
