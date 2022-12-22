import 'package:get/get.dart';

import '../controllers/tablet_t_sales_report_controller.dart';

class TabletTSalesReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabletTSalesReportController>(
      () => TabletTSalesReportController(),
    );
  }
}
