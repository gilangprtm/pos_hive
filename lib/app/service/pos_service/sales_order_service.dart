import '../../utils/helpers/app_format.dart';
import '../service_data.dart';
import 'product_service.dart';

class SalesOrderService {
  static List salesOrderList = [];
  static saveToLocalStorage() async {
    await mainStorage.put("sales_orders", salesOrderList);
  }

  static loadDataFromDB() async {
    salesOrderList = await mainStorage.get("sales_orders") ?? [];
    print(salesOrderList);
  }

  static checkout({
    required List productList,
  }) async {
    //menyimpan data ke db purchase
    salesOrderList.add({
      "created_at": AppFormat.dateToString(DateTime.now()),
      "items": productList,
      "total": ProductService.totalsell,
    });
    saveToLocalStorage();
    //mengupdate stock
    for (var product in productList) {
      ProductService.reduceStock(
        id: product["id"],
        qty: product["qty"],
      );
    }
  }

  static void clearSalesOrder() {
    salesOrderList.clear();
    saveToLocalStorage();
  }
}
