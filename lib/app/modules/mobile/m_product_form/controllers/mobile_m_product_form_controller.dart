import 'package:get/get.dart';
import 'package:pos_hive/app/service/pos_service/product_names_service.dart';
import 'package:pos_hive/app/utils/helpers/helpers.dart';

import '../../../../models/product_model.dart';
import '../../../../service/pos_service/product_service.dart';

class MobileMProductFormController extends GetxController {
  String? tag;
  ProductModel? item;
  String? label;

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

  @override
  void onClose() {
    isDetail.value = false;
    super.onClose();
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
      photo = item!.photo;
      productName = item!.productname;
      buyprice = item!.buyprice;
      sellprice = item!.sellprice;
      description = item!.description;
      stock = item!.stock;
    }
  }

  void doSave() async {
    checkNullContent();
    if (isEditMode.value) {
      await ProductService.updateProduct(
        id: item!.id!,
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
      addProductNames();
    }
    Get.back();
  }

  void addProductNames() async {
    await ProductNameService.addProductNames(
      id: ProductService.productList.last['id'],
      name: ProductService.productList.last['product_name'],
    );
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
