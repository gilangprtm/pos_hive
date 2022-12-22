import 'package:get/get.dart';

import '../controllers/mobile_m_sales_transaction_controller.dart';

class MobileMSalesTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileMSalesTransactionController>(
      () => MobileMSalesTransactionController(),
    );
  }
}
