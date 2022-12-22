import 'package:get/get.dart';

import '../controllers/tablet_t_purchase_report_controller.dart';

class TabletTPurchaseReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabletTPurchaseReportController>(
      () => TabletTPurchaseReportController(),
    );
  }
}
