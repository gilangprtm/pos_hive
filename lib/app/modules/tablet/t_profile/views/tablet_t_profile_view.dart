import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tablet_t_profile_controller.dart';

class TabletTProfileView extends GetView<TabletTProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabletTProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TabletTProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
