import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/src/img_string.dart';

class MobileMDashboardController extends GetxController {
  List menus = [
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
      "label": "Sales\nOrder",
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
