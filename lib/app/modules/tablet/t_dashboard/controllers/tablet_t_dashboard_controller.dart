import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/src/img_string.dart';

class TabletTDashboardController extends GetxController {
  List menus = [
    {
      "icon": ImgString.product,
      "label": "Product\n",
      "onTap": () {
        Get.toNamed(Routes.PRODUCT_LIST);
      }
    },
    {
      "icon": ImgString.purchase,
      "label": "Purchase\nOrder",
      "onTap": () {
        Get.toNamed(Routes.PURCHASE_ORDER);
      }
    },
    {
      "icon": ImgString.sale,
      "label": "Sales\nOrder",
      "onTap": () {
        Get.toNamed(Routes.SALES_TRANSACTION);
      }
    },
    {
      "icon": ImgString.report,
      "label": "Sales\nReport",
      "onTap": () {
        Get.toNamed(Routes.SALES_REPORT);
      }
    },
    {
      "icon": ImgString.report,
      "label": "Stock\nReport",
      "onTap": () {
        Get.toNamed(Routes.STOCK_REPORT);
      }
    },
  ];

  @override
  void onInit() {
    initSplash();
    super.onInit();
  }

  void initSplash() async {
    FlutterNativeSplash.remove();
  }
}
