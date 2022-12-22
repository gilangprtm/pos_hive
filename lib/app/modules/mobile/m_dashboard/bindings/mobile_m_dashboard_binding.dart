import 'package:get/get.dart';

import '../controllers/mobile_m_dashboard_controller.dart';

class MobileMDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileMDashboardController>(
      () => MobileMDashboardController(),
    );
  }
}
