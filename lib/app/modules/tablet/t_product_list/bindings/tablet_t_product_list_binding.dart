import 'package:get/get.dart';

import '../controllers/tablet_t_product_list_controller.dart';

class TabletTProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabletTProductListController>(
      () => TabletTProductListController(),
    );
  }
}
