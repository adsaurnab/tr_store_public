import 'package:get/get.dart';

import '../data/services/network_service.dart';
import '../data/services/product_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkStatusService>(
      NetworkStatusService(),
      permanent: true,
    );
    Get.put<ProductService>(
      ProductService(),
      permanent: true,
    );
  }
}
