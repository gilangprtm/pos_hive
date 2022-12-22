import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tablet_t_purchase_order_controller.dart';

class TabletTPurchaseOrderView extends GetView<TabletTPurchaseOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabletTPurchaseOrderView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TabletTPurchaseOrderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
