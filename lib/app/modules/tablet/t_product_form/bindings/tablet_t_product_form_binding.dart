import 'package:get/get.dart';

import '../controllers/tablet_t_product_form_controller.dart';

class TabletTProductFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabletTProductFormController>(
      () => TabletTProductFormController(),
    );
  }
}
