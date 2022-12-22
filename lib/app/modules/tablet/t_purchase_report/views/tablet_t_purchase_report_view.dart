import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tablet_t_purchase_report_controller.dart';

class TabletTPurchaseReportView
    extends GetView<TabletTPurchaseReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabletTPurchaseReportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TabletTPurchaseReportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
