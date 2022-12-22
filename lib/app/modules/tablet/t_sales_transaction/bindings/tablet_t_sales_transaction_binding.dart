import 'package:get/get.dart';

import '../controllers/tablet_t_sales_transaction_controller.dart';

class TabletTSalesTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabletTSalesTransactionController>(
      () => TabletTSalesTransactionController(),
    );
  }
}
