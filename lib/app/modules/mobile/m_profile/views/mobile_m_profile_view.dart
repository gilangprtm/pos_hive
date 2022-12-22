import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mobile_m_profile_controller.dart';

class MobileMProfileView extends GetView<MobileMProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobileMProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MobileMProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
