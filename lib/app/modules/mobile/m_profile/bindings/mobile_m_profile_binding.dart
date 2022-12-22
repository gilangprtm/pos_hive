import 'package:get/get.dart';

import '../controllers/mobile_m_profile_controller.dart';

class MobileMProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileMProfileController>(
      () => MobileMProfileController(),
    );
  }
}
