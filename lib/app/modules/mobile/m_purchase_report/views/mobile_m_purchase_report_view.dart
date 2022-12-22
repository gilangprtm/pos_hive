import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mobile_m_purchase_report_controller.dart';

class MobileMPurchaseReportView
    extends GetView<MobileMPurchaseReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobileMPurchaseReportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MobileMPurchaseReportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
