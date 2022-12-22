import 'package:get/get.dart';

import '../controllers/tablet_t_dashboard_controller.dart';

class TabletTDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabletTDashboardController>(
      () => TabletTDashboardController(),
    );
  }
}
