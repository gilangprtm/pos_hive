import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tablet_t_sales_report_controller.dart';

class TabletTSalesReportView extends GetView<TabletTSalesReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabletTSalesReportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TabletTSalesReportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
