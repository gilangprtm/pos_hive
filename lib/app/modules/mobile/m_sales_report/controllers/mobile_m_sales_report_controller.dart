import 'package:get/get.dart';
import 'package:pos_hive/app/models/product_model.dart';
import 'package:pos_hive/app/service/pos_service/sales_order_service.dart';

import '../../../../utils/helpers/app_format.dart';

class MobileMSalesReportController extends GetxController {
  var focusDate = DateTime.now().obs;

  RxList<OrderModel> saleList = <OrderModel>[].obs;
  RxList<OrderModel> onDayList = <OrderModel>[].obs;
  RxString total = "".obs;

  @override
  void onInit() {
    toList();
    super.onInit();
  }

  void toList() {
    saleList.value = SalesOrderService.salesOrderList
        .map((e) => OrderModel.fromDynamic(e))
        .toList();
    DateTime tgl =
        AppFormat.stringToDateTime(AppFormat.dateToString(focusDate.value))!;
    onDayList.value = saleList.where((e) => e.createdAt == tgl).toList();
    var price = 0;
    total.value = "0";
    for (var i = 0; i < onDayList.length; i++) {
      price = price + onDayList[i].total!.toInt();
      total.value = AppFormat.toCurrency(price.toDouble());
    }
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    focusDate.value = selectedDay;
    DateTime tgl =
        AppFormat.stringToDateTime(AppFormat.dateToString(focusDate.value))!;
    onDayList.value = saleList.where((e) => e.createdAt == tgl).toList();
    var price = 0;
    total.value = "0";
    for (var i = 0; i < onDayList.length; i++) {
      price = price + onDayList[i].total!.toInt();
      total.value = AppFormat.toCurrency(price.toDouble());
    }
  }
}
