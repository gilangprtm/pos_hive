import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../service/pos_service/product_service.dart';
import '../../../../utils/helpers/helpers.dart';

class MobileMProductListController extends GetxController {
  RxBool isLoad = false.obs;
  RxString item = "".obs;
  @override
  void onInit() {
    hasArg();
    refresh();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void refresh() {
    isLoad.value = false;
    isLoad.value = true;
  }

  void deleteItem(String id) async {
    var r = await AppHelper.dialogQuestion(
      message: 'Sure to delete this item?',
      textConfirm: 'Yes',
    );
    if (r == true) {
      ProductService.deleteProduct(id);
      refresh();
    }
  }

  void toAddForm() {
    Get.toNamed(Routes.MOBILE_M_PRODUCT_FORM)!.then(
      (value) => {
        refresh(),
      },
    );
  }

  void toEditForm(Map item) {
    Get.toNamed(Routes.MOBILE_M_PRODUCT_FORM, arguments: item)!.then(
      (value) => {
        refresh(),
      },
    );
  }

  void hasArg() {
    item.value = Get.arguments;
    print(Get.arguments);
    if (item.value == null) {
      item.value = 'All Product';
      print(item);
    }
  }
}
