// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pos_hive/app/service/categories_service/categories_service.dart';

import '../service/pos_service/product_service.dart';
import '../service/pos_service/purchase_order_service.dart';
import '../service/pos_service/sales_order_service.dart';
import '../service/service_data.dart';
// import 'package:flutter/services.dart';

class ProjectService {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // transparent status bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    // hive local storage
    await Hive.initFlutter();
    mainStorage = await Hive.openBox('mainStorage');

    await ProductService.loadDataFromDB();
    await PurchaseOrderService.loadDataFromDB();
    await SalesOrderService.loadDataFromDB();
    await CategoriesService.loadDataFromDB();

    // date format locale
    initializeDateFormatting();
  }
}
