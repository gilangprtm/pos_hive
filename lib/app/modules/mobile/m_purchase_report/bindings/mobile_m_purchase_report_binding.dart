import 'package:get/get.dart';

import '../controllers/mobile_m_purchase_report_controller.dart';

class MobileMPurchaseReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileMPurchaseReportController>(
      () => MobileMPurchaseReportController(),
    );
  }
}
