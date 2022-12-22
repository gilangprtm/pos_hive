import 'package:get/get.dart';

import '../controllers/tablet_t_profile_controller.dart';

class TabletTProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabletTProfileController>(
      () => TabletTProfileController(),
    );
  }
}
