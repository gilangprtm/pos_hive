import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tablet_t_product_list_controller.dart';

class TabletTProductListView extends GetView<TabletTProductListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabletTProductListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TabletTProductListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
