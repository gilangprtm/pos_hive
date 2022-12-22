import 'package:get/get.dart';

import '../controllers/tablet_t_purchase_order_controller.dart';

class TabletTPurchaseOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabletTPurchaseOrderController>(
      () => TabletTPurchaseOrderController(),
    );
  }
}
