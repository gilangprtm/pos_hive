import 'package:get/get.dart';

import '../controllers/mobile_m_product_form_controller.dart';

class MobileMProductFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileMProductFormController>(
      () => MobileMProductFormController(),
    );
  }
}
