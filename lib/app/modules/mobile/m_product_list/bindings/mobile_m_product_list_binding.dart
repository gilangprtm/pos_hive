import 'package:get/get.dart';

import '../controllers/mobile_m_product_list_controller.dart';

class MobileMProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileMProductListController>(
      () => MobileMProductListController(),
    );
  }
}
