import 'package:get/get.dart';

import '../controllers/mobile_m_sales_report_controller.dart';

class MobileMSalesReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileMSalesReportController>(
      () => MobileMSalesReportController(),
    );
  }
}
