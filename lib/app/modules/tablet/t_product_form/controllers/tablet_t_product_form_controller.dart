import 'package:get/get.dart';

import '../../../../service/pos_service/product_service.dart';
import '../../../../utils/helpers/helpers.dart';

class TabletTProductFormController extends GetxController {
  String? tag;
  Map? item;
  String? label;

  String? productName;
  String? photo;
  double? buyprice;
  double? sellprice;
  String? description;
  int? stock;
  RxBool isEditMode = false.obs;
  RxBool isDetail = false.obs;

  @override
  void onInit() {
    hasArg();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void checkNullContent() {
    if (photo == null ||
        productName == null ||
        buyprice == null ||
        sellprice == null ||
        description == null) {
      AppHelper.dialogWarning("Please fill all content");
    }
    ;
  }

  void hasArg() {
    tag = Get.arguments[0];

    if (tag == "add") {
      label = Get.arguments[1];
    } else if (tag == "edit") {
      item = Get.arguments[1];
      label = Get.arguments[2];
    }
    if (label == "") {
      label = "Product";
    }

    if (item != null) {
      isDetail.value = true;
      photo = item!['photo'];
      productName = item!['product_name'];
      buyprice = item!['buyprice'];
      sellprice = item!['sellprice'];
      description = item!['description'];
      stock = item!['stock'];
    }
    print(productName);
  }

  void doSave() async {
    checkNullContent();
    if (isEditMode.value) {
      await ProductService.updateProduct(
        id: item!['id'],
        photo: photo!,
        productName: productName!,
        buyprice: buyprice!,
        sellprice: sellprice!,
        description: description!,
        categorie: label ?? "",
        stock: stock!,
      );
    } else {
      await ProductService.addProduct(
        photo: photo!,
        productName: productName!,
        buyprice: buyprice!,
        sellprice: sellprice!,
        description: description!,
        categorie: label ?? "",
      );
    }
    Get.back();
  }

  void menuButtonAction(String value) {
    if (value == '1') {
      isDetail.value = false;
      isEditMode.value = true;
    } else if (value == '2') {
      var id = item!['id'];
      ProductService.deleteProduct(id);
      Get.back();
    }
  }
}
