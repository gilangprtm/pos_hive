import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_hive/app/modules/mobile/m_dashboard/views/mobile_m_dashboard_view.dart';
import 'package:pos_hive/app/modules/tablet/t_dashboard/views/tablet_t_dashboard_view.dart';
import 'package:pos_hive/app/utils/theme/theme.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/responsive_layout.dart';
import 'app/utils/services_init.dart';

void main() async {
  await ProjectService.init();
  runApp(
    GetMaterialApp(
      title: "Simple POS",
      home: ResponsiveLayout(
        mobileScaffold: MobileMDashboardView(),
        tabletScaffold: TabletTDashboardView(),
      ),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
    ),
  );
}
