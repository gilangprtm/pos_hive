import 'package:get/get.dart';

import '../../../../service/pos_service/product_service.dart';
import '../../../../service/pos_service/purchase_order_service.dart';
import '../../../../utils/helpers/helpers.dart';

class MobileMPurchaseOrderController extends GetxController {
  RxBool isLoad = false.obs;

  @override
  void onInit() {
    refresh();
    ProductService.clearQty();
    super.onInit();
  }

  void refresh() {
    isLoad.value = false;
    isLoad.value = true;
  }

  doCheckout() async {
    var r = await AppHelper.dialogQuestion(
      message: 'Sure to checkout this item?',
      textConfirm: 'Yes',
    );
    if (r == true) {
      var productList =
          ProductService.productList.where((p) => p["qty"] > 0).toList();
      await PurchaseOrderService.checkout(
        productList: productList,
      );
      Get.back();
      AppHelper.dialogSuccess("Your order is success!");
    }
  }
}
