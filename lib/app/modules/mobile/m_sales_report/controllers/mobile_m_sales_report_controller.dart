import 'package:get/get.dart';
import 'package:pos_hive/app/models/product_model.dart';
import 'package:pos_hive/app/service/pos_service/sales_order_service.dart';

import '../../../../utils/helpers/app_format.dart';

class MobileMSalesReportController extends GetxController {
  var focusDate = DateTime.now().obs;

  RxList<OrderModel> baseList = <OrderModel>[].obs;
  RxList<OrderModel> onList = <OrderModel>[].obs;
  RxList<OrderModel> onDayList = <OrderModel>[].obs;
  RxList<ProductNameModel> list = <ProductNameModel>[].obs;
  RxString total = "".obs;

  @override
  void onInit() {
    toList();
    super.onInit();
  }

  void toList() {
    baseList.value = SalesOrderService.salesOrderList
        .map((e) => OrderModel.fromDynamic(e))
        .toList();
    DateTime tgl =
        AppFormat.stringToDateTime(AppFormat.dateToString(focusDate.value))!;
    onList.value = baseList.where((e) => e.createdAt == tgl).toList();
    onDayList.clear();
    for (var i = 0; i < onList.length; i++) {
      var item = onList[i].item;
      for (var j = 0; j < item!.length; j++) {
        onDayList.add(
          OrderModel(
            createdAt: onList[i].createdAt,
            item: [onList[i].item![j]],
            total: onList[i].total,
          ),
        );
      }
    }
    var price = 0;
    total.value = "0";
    for (var i = 0; i < onList.length; i++) {
      price = price + onList[i].total!.toInt();
      total.value = AppFormat.toCurrency(price.toDouble());
    }
    finalResult();
  }

  void finalResult() {
    // Inisialisasi list belanja bulanan
    // Buat map yang menyimpan jumlah barang per nama
    var mapJumlah = {};
    for (var barang in onList) {
      var nama = barang.item!.first.productname;
      var jumlah = barang.item!.first.qty;
      if (mapJumlah.containsKey(nama)) {
        mapJumlah[nama] += jumlah;
      } else {
        mapJumlah[nama] = jumlah;
      }
    }

    // Buat list baru berdasarkan map yang telah dibuat
    list.value = mapJumlah.entries.map((entry) {
      return ProductNameModel(productname: entry.key, qty: entry.value);
    }).toList();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    focusDate.value = selectedDay;
    DateTime tgl =
        AppFormat.stringToDateTime(AppFormat.dateToString(focusDate.value))!;
    onList.value = baseList.where((e) => e.createdAt == tgl).toList();
    onDayList.clear();
    for (var i = 0; i < onList.length; i++) {
      var item = onList[i].item;
      for (var j = 0; j < item!.length; j++) {
        onDayList.add(
          OrderModel(
            createdAt: onList[i].createdAt,
            item: [onList[i].item![j]],
            total: onList[i].total,
          ),
        );
      }
    }
    var price = 0;
    total.value = "0";
    for (var i = 0; i < onList.length; i++) {
      price = price + onList[i].total!.toInt();
      total.value = AppFormat.toCurrency(price.toDouble());
    }
    finalResult();
  }
}
