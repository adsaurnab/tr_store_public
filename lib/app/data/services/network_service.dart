import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../core/constants/constants.dart';

class NetworkStatusService extends GetxService {
  final isConnected = false.obs;

  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen(
      (status) async {
        _getNetworkStatus(status);
      },
    );
  }

  void _getNetworkStatus(ConnectivityResult status) {
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      logger.i("Internet connected");
      isConnected.value = true;
    } else {
      logger.i("Lost the connection");
      isConnected.value = false;
    }
  }
}
