import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tablet_t_sales_transaction_controller.dart';

class TabletTSalesTransactionView
    extends GetView<TabletTSalesTransactionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabletTSalesTransactionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TabletTSalesTransactionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
