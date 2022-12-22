import 'package:get/get.dart';

import 'package:pos_hive/app/modules/home/bindings/home_binding.dart';
import 'package:pos_hive/app/modules/home/views/home_view.dart';
import 'package:pos_hive/app/modules/mobile/m_dashboard/bindings/mobile_m_dashboard_binding.dart';
import 'package:pos_hive/app/modules/mobile/m_dashboard/views/mobile_m_dashboard_view.dart';
import 'package:pos_hive/app/modules/mobile/m_product_form/bindings/mobile_m_product_form_binding.dart';
import 'package:pos_hive/app/modules/mobile/m_product_form/views/mobile_m_product_form_view.dart';
import 'package:pos_hive/app/modules/mobile/m_product_list/bindings/mobile_m_product_list_binding.dart';
import 'package:pos_hive/app/modules/mobile/m_product_list/views/mobile_m_product_list_view.dart';
import 'package:pos_hive/app/modules/mobile/m_profile/bindings/mobile_m_profile_binding.dart';
import 'package:pos_hive/app/modules/mobile/m_profile/views/mobile_m_profile_view.dart';
import 'package:pos_hive/app/modules/mobile/m_purchase_order/bindings/mobile_m_purchase_order_binding.dart';
import 'package:pos_hive/app/modules/mobile/m_purchase_order/views/mobile_m_purchase_order_view.dart';
import 'package:pos_hive/app/modules/mobile/m_purchase_report/bindings/mobile_m_purchase_report_binding.dart';
import 'package:pos_hive/app/modules/mobile/m_purchase_report/views/mobile_m_purchase_report_view.dart';
import 'package:pos_hive/app/modules/mobile/m_sales_report/bindings/mobile_m_sales_report_binding.dart';
import 'package:pos_hive/app/modules/mobile/m_sales_report/views/mobile_m_sales_report_view.dart';
import 'package:pos_hive/app/modules/mobile/m_sales_transaction/bindings/mobile_m_sales_transaction_binding.dart';
import 'package:pos_hive/app/modules/mobile/m_sales_transaction/views/mobile_m_sales_transaction_view.dart';
import 'package:pos_hive/app/modules/tablet/t_dashboard/bindings/tablet_t_dashboard_binding.dart';
import 'package:pos_hive/app/modules/tablet/t_dashboard/views/tablet_t_dashboard_view.dart';
import 'package:pos_hive/app/modules/tablet/t_product_form/bindings/tablet_t_product_form_binding.dart';
import 'package:pos_hive/app/modules/tablet/t_product_form/views/tablet_t_product_form_view.dart';
import 'package:pos_hive/app/modules/tablet/t_product_list/bindings/tablet_t_product_list_binding.dart';
import 'package:pos_hive/app/modules/tablet/t_product_list/views/tablet_t_product_list_view.dart';
import 'package:pos_hive/app/modules/tablet/t_profile/bindings/tablet_t_profile_binding.dart';
import 'package:pos_hive/app/modules/tablet/t_profile/views/tablet_t_profile_view.dart';
import 'package:pos_hive/app/modules/tablet/t_purchase_order/bindings/tablet_t_purchase_order_binding.dart';
import 'package:pos_hive/app/modules/tablet/t_purchase_order/views/tablet_t_purchase_order_view.dart';
import 'package:pos_hive/app/modules/tablet/t_purchase_report/bindings/tablet_t_purchase_report_binding.dart';
import 'package:pos_hive/app/modules/tablet/t_purchase_report/views/tablet_t_purchase_report_view.dart';
import 'package:pos_hive/app/modules/tablet/t_sales_report/bindings/tablet_t_sales_report_binding.dart';
import 'package:pos_hive/app/modules/tablet/t_sales_report/views/tablet_t_sales_report_view.dart';
import 'package:pos_hive/app/modules/tablet/t_sales_transaction/bindings/tablet_t_sales_transaction_binding.dart';
import 'package:pos_hive/app/modules/tablet/t_sales_transaction/views/tablet_t_sales_transaction_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOBILE_M_DASHBOARD,
      page: () => MobileMDashboardView(),
      binding: MobileMDashboardBinding(),
    ),
    GetPage(
      name: _Paths.MOBILE_M_PRODUCT_LIST,
      page: () => MobileMProductListView(),
      binding: MobileMProductListBinding(),
    ),
    GetPage(
      name: _Paths.MOBILE_M_PRODUCT_FORM,
      page: () => MobileMProductFormView(),
      binding: MobileMProductFormBinding(),
    ),
    GetPage(
      name: _Paths.MOBILE_M_PROFILE,
      page: () => MobileMProfileView(),
      binding: MobileMProfileBinding(),
    ),
    GetPage(
      name: _Paths.MOBILE_M_PURCHASE_ORDER,
      page: () => MobileMPurchaseOrderView(),
      binding: MobileMPurchaseOrderBinding(),
    ),
    GetPage(
      name: _Paths.MOBILE_M_SALES_REPORT,
      page: () => MobileMSalesReportView(),
      binding: MobileMSalesReportBinding(),
    ),
    GetPage(
      name: _Paths.MOBILE_M_SALES_TRANSACTION,
      page: () => MobileMSalesTransactionView(),
      binding: MobileMSalesTransactionBinding(),
    ),
    GetPage(
      name: _Paths.MOBILE_M_PURCHASE_REPORT,
      page: () => MobileMPurchaseReportView(),
      binding: MobileMPurchaseReportBinding(),
    ),
    GetPage(
      name: _Paths.TABLET_T_DASHBOARD,
      page: () => TabletTDashboardView(),
      binding: TabletTDashboardBinding(),
    ),
    GetPage(
      name: _Paths.TABLET_T_PRODUCT_FORM,
      page: () => TabletTProductFormView(),
      binding: TabletTProductFormBinding(),
    ),
    GetPage(
      name: _Paths.TABLET_T_PRODUCT_LIST,
      page: () => TabletTProductListView(),
      binding: TabletTProductListBinding(),
    ),
    GetPage(
      name: _Paths.TABLET_T_PROFILE,
      page: () => TabletTProfileView(),
      binding: TabletTProfileBinding(),
    ),
    GetPage(
      name: _Paths.TABLET_T_PURCHASE_ORDER,
      page: () => TabletTPurchaseOrderView(),
      binding: TabletTPurchaseOrderBinding(),
    ),
    GetPage(
      name: _Paths.TABLET_T_PURCHASE_REPORT,
      page: () => TabletTPurchaseReportView(),
      binding: TabletTPurchaseReportBinding(),
    ),
    GetPage(
      name: _Paths.TABLET_T_SALES_REPORT,
      page: () => TabletTSalesReportView(),
      binding: TabletTSalesReportBinding(),
    ),
    GetPage(
      name: _Paths.TABLET_T_SALES_TRANSACTION,
      page: () => TabletTSalesTransactionView(),
      binding: TabletTSalesTransactionBinding(),
    ),
  ];
}
