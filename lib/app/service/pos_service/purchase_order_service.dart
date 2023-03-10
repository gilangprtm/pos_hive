import 'package:pos_hive/app/utils/helpers/app_format.dart';

import '../service_data.dart';
import 'product_service.dart';

class PurchaseOrderService {
  static List purchaseOrderList = [];
  static saveToLocalStorage() async {
    await mainStorage.put("purchase_orders", purchaseOrderList);
  }

  static loadDataFromDB() async {
    purchaseOrderList = await mainStorage.get("purchase_orders") ?? [];
    print(purchaseOrderList);
  }

  static checkout({
    required List productList,
  }) async {
    //menyimpan data ke db purchase
    purchaseOrderList.add({
      "created_at": AppFormat.dateToString(DateTime.now()),
      "items": productList,
      "total": ProductService.totalbuy,
    });
    saveToLocalStorage();
    // //mengupdate stock
    for (var product in productList) {
      ProductService.addStock(
        id: product["id"],
        qty: product["qty"],
      );
    }
  }

  static void clearPurchaseOrder() {
    purchaseOrderList.clear();
    saveToLocalStorage();
  }
}
