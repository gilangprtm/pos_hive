import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tablet_t_product_form_controller.dart';

class TabletTProductFormView extends GetView<TabletTProductFormController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabletTProductFormView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TabletTProductFormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
