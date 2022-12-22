import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:pos_hive/app/utils/extension/box_extension.dart';
import 'package:pos_hive/app/utils/widget/app_button.dart';

import '../../../../models/languange_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../service/categories_service/categories_service.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../../utils/src/img_string.dart';
import '../../../../utils/widget/app_dropdown.dart';
import '../../../../utils/widget/app_input_text.dart';
import '../../../../utils/widget/validator.dart';

class MobileMDashboardController extends GetxController {
  final List menus = [];
  RxBool isLoad = false.obs;
  RxBool isClearProduct = false.obs;
  RxBool isClearCategories = false.obs;
  String? productName;

  @override
  void onInit() {
    refresh();
    addMenu();
    initSplash();
    super.onInit();
  }

  void initSplash() async {
    FlutterNativeSplash.remove();
  }

  List<LanguangeModel> items = [
    LanguangeModel(bahasa: "English", code: "en"),
    LanguangeModel(bahasa: "Indonesia", code: "id"),
  ];

  RxString selectedItem = "".obs;

  void addMenu() {
    menus.addAll([
      {
        "icon": ImgString.product,
        "label": "Product\n",
        "onTap": () {
          Get.toNamed(Routes.MOBILE_M_PRODUCT_LIST);
        }
      },
      {
        "icon": ImgString.purchase,
        "label": "Purchase\nOrder",
        "onTap": () {
          Get.toNamed(Routes.MOBILE_M_PURCHASE_ORDER);
        }
      },
      {
        "icon": ImgString.sale,
        "label": "Sales\nTransaction",
        "onTap": () {
          Get.toNamed(Routes.MOBILE_M_SALES_TRANSACTION);
        }
      },
      {
        "icon": ImgString.report,
        "label": "Sales\nReport",
        "onTap": () {
          Get.toNamed(Routes.MOBILE_M_SALES_REPORT);
        }
      },
      {
        "icon": ImgString.report,
        "label": "Purchase\nReport",
        "onTap": () {
          Get.toNamed(Routes.MOBILE_M_PURCHASE_REPORT);
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
                  text: "Clear All Product",
                  onTap: () {},
                ),
              ),
              5.widthBox,
              Expanded(
                child: AppButton(
                  text: "Clear All Categories",
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
          value: productName,
          onChanged: (value) {
            productName = value;
          },
        ),
      ],
    );
    if (r == true) {
      if (productName == null) {
      } else {
        CategoriesService.addCategorie(
          tag: productName!,
        );
        refresh();
        productName = null;
      }
      if (isClearCategories.value == true) {
        CategoriesService.clearCategories();
        refresh();
        isClearCategories.value = false;
      }
    } else {
      isClearCategories.value = false;
    }
  }

  void refresh() {
    isLoad.value = false;
    isLoad.value = true;
  }

  void choseLanguange(String bahasa) {
    // var locale = items.where((element) => element.bahasa == bahasa).first;
    // selectedItem.value = bahasa;
    // AppData.locale = locale.code!;
    // Get.updateLocale(Locale(locale.code!));
    // db.updateLocale();
  }

  void productCategories(String tag) {
    print(tag);
    Get.toNamed(Routes.MOBILE_M_PRODUCT_LIST, arguments: tag);
  }
}