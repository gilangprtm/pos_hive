import 'package:get/get.dart';

import '../../../../models/product_model.dart';
import '../../../../service/pos_service/product_service.dart';

class MobileMProductFormController extends GetxController {
  ProductModel? item;

  @override
  void onInit() {
    hasArg();
    super.onInit();
  }

  String? productName;
  String? photo;
  double? buyprice;
  double? sellprice;
  String? description;
  int? stock;
  RxBool isEditMode = false.obs;
  RxBool isDetail = false.obs;
  // RxString menuButton = "".obs;

  // bool get isEditMode {
  //   return widget.item != null;
  // }

  @override
  void onClose() {
    isDetail.value = false;
    super.onClose();
  }

  void hasArg() {
    item = Get.arguments;
    if (item != null) {
      isDetail.value = true;
      photo = item!.photo;
      productName = item!.productname;
      buyprice = item!.buyprice;
      sellprice = item!.sellprice;
      description = item!.description;
      stock = item!.stock;
    }
  }

  void doSave() async {
    if (isEditMode.value) {
      await ProductService.updateProduct(
        id: item!.id!,
        photo: photo!,
        productName: productName!,
        buyprice: buyprice!,
        sellprice: sellprice!,
        description: description!,
        stock: stock!,
      );
    } else {
      await ProductService.addProduct(
        photo: photo!,
        productName: productName!,
        buyprice: buyprice!,
        sellprice: sellprice!,
        description: description!,
      );
    }

    Get.back();
  }

  void menuButtonAction(String value) {
    if (value == '1') {
      isDetail.value = false;
      isEditMode.value = true;
    } else if (value == '2') {
      var id = item!.id!;
      ProductService.deleteProduct(id);
      Get.back();
    }
  }
}
