import 'package:get/get.dart';

import '../../../../models/product_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../service/pos_service/product_service.dart';
import '../../../../utils/helpers/helpers.dart';

class MobileMProductListController extends GetxController {
  RxBool isLoad = false.obs;
  bool? allProduct;
  String? label;
  List<ProductModel>? products;
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

  void refresh() async {
    isLoad.value = false;
    await ProductService.loadDataFromDB();
    if (allProduct == true) {
      products = ProductService.products;
    } else {
      products =
          ProductService.products.where((e) => e.categorie == label).toList();
    }
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

  void toAddForm(String tag, String label) {
    Get.toNamed(Routes.MOBILE_M_PRODUCT_FORM, arguments: [tag, label])!.then(
      (value) => {
        refresh(),
      },
    );
  }

  void toEditForm(String tag, ProductModel item, String label) {
    Get.toNamed(Routes.MOBILE_M_PRODUCT_FORM, arguments: [tag, item, label])!
        .then(
      (value) => {
        refresh(),
      },
    );
  }

  void hasArg() {
    label = Get.arguments;
    if (label == null) {
      allProduct = true;
    } else {
      allProduct = false;
    }
  }
}
