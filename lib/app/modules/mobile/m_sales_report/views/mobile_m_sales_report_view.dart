import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mobile_m_sales_report_controller.dart';

class MobileMSalesReportView extends GetView<MobileMSalesReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobileMSalesReportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MobileMSalesReportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
