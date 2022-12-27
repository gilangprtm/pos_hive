import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:pos_hive/app/utils/extension/box_extension.dart';

import '../../../../models/languange_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../service/categories_service/categories_service.dart';
import '../../../../service/pos_service/product_names_service.dart';
import '../../../../service/pos_service/product_service.dart';
import '../../../../service/pos_service/purchase_order_service.dart';
import '../../../../service/pos_service/sales_order_service.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../../utils/src/img_string.dart';
import '../../../../utils/widget/app_button.dart';
import '../../../../utils/widget/app_dropdown.dart';
import '../../../../utils/widget/app_input_text.dart';
import '../../../../utils/widget/validator.dart';

class TabletTDashboardController extends GetxController {
  final List menus = [];
  RxBool isLoad = false.obs;
  RxBool isClearData = false.obs;
  RxBool isClearCategories = false.obs;
  String? categorieName;

  List<LanguangeModel> items = [
    LanguangeModel(bahasa: "English", code: "en"),
    LanguangeModel(bahasa: "Indonesia", code: "id"),
  ];

  RxString selectedItem = "".obs;

  @override
  void onInit() {
    refresh();
    initSplash();
    addMenu();
    super.onInit();
  }

  void addMenu() {
    menus.addAll([
      {
        "icon": ImgString.product,
        "label": "All\nProduct",
        "onTap": () {
          Get.toNamed(Routes.TABLET_T_PRODUCT_LIST);
        }
      },
      {
        "icon": ImgString.purchase,
        "label": "Purchase\nOrder",
        "onTap": () {
          Get.toNamed(Routes.TABLET_T_PURCHASE_ORDER);
        }
      },
      {
        "icon": ImgString.sale,
        "label": "Sales\nTransaction",
        "onTap": () {
          Get.toNamed(Routes.TABLET_T_SALES_TRANSACTION);
        }
      },
      {
        "icon": ImgString.report,
        "label": "Sales\nReport",
        "onTap": () {
          Get.toNamed(Routes.TABLET_T_SALES_REPORT);
        }
      },
      {
        "icon": ImgString.report,
        "label": "Purchase\nReport",
        "onTap": () {
          Get.toNamed(Routes.TABLET_T_PURCHASE_REPORT);
        }
      },
      {
        "icon": ImgString.settings,
        "label": "Settings",
        "onTap": () {
          onSetting();
        },
      },
    ]);
  }

  void refresh() {
    isLoad.value = false;
    isLoad.value = true;
  }

  void initSplash() async {
    FlutterNativeSplash.remove();
  }

  void productCategories(String tag) {
    Get.toNamed(Routes.TABLET_T_PRODUCT_LIST, arguments: tag);
  }

  void choseLanguange(String bahasa) {
    // var locale = items.where((element) => element.bahasa == bahasa).first;
    // selectedItem.value = bahasa;
    // AppData.locale = locale.code!;
    // Get.updateLocale(Locale(locale.code!));
    // db.updateLocale();
  }

  void onSetting() async {
    var r = await AppHelper.dialogCustomWidget(
      yes: 'Save',
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: AppButton(
                  text: "Clear Data",
                  onTap: () {
                    isClearData.value = true;
                  },
                ),
              ),
              5.widthBox,
              Expanded(
                child: AppButton(
                  text: "Clear Categories",
                  onTap: () {
                    isClearCategories.value = true;
                  },
                ),
              ),
            ],
          ),
        ),
        Obx(() {
          return AppDropdownInput(
            label: "languange".tr,
            hintText: "chose_languange".tr,
            items: items.map((e) => e.bahasa).toList(),
            value: selectedItem.value,
            onChanged: (value) {
              choseLanguange(value!);
            },
          );
        }),
        AppInputText(
          label: "Add Categories",
          validator: Validator.required,
          value: categorieName,
          onChanged: (value) {
            categorieName = value;
          },
        ),
      ],
    );
    if (r == true) {
      if (categorieName == null) {
      } else {
        CategoriesService.addCategorie(
          label: categorieName!,
        );
        refresh();
        categorieName = null;
      }
      if (isClearCategories.value == true) {
        CategoriesService.clearCategories();
        refresh();
        isClearCategories.value = false;
      }
      if (isClearData.value == true) {
        ProductService.clearProduct();
        PurchaseOrderService.clearPurchaseOrder();
        SalesOrderService.clearSalesOrder();
        CategoriesService.clearCategories();
        ProductNameService.clearProductNames();
        refresh();
        isClearData.value = false;
      }
    } else {
      isClearCategories.value = false;
    }
  }
}
