import 'package:get/get.dart';

import '../controllers/mobile_m_purchase_order_controller.dart';

class MobileMPurchaseOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileMPurchaseOrderController>(
      () => MobileMPurchaseOrderController(),
    );
  }
}
