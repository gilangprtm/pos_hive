import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_hive/app/utils/extension/box_extension.dart';

import '../../../../utils/widget/app_button.dart';
import '../../../../utils/widget/app_image_picker.dart';
import '../../../../utils/widget/app_input_number.dart';
import '../../../../utils/widget/app_input_text.dart';
import '../../../../utils/widget/validator.dart';
import '../controllers/mobile_m_product_form_controller.dart';

class MobileMProductFormView extends GetView<MobileMProductFormController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.label ?? "Product"),
          centerTitle: true,
          actions: [
            Visibility(
              visible: controller.isDetail.value,
              child: PopupMenuButton(
                onSelected: (String value) {
                  controller.menuButtonAction(value);
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(value: '1', child: Text('Edit')),
                  const PopupMenuItem(value: '2', child: Text('Delete')),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() {
              return Column(
                children: [
                  AppImagePicker(
                    isReadOnly: controller.isDetail.value,
                    label: "Photo",
                    validator: Validator.required,
                    value: controller.photo,
                    onChanged: (value) {
                      controller.photo = value;
                    },
                  ),
                  AppInputText(
                    isReadOnly: controller.isDetail.value,
                    label: "Product Name",
                    validator: Validator.required,
                    value: controller.productName,
                    onChanged: (value) {
                      controller.productName = value;
                    },
                  ),
                  AppInputNumber(
                    isReadOnly: controller.isDetail.value,
                    label: "Buying Price",
                    validator: Validator.required,
                    value: controller.buyprice != null
                        ? controller.buyprice.toString()
                        : null,
                    onChanged: (value) {
                      controller.buyprice = double.parse(value);
                    },
                  ),
                  AppInputNumber(
                    isReadOnly: controller.isDetail.value,
                    label: "Selling Price",
                    validator: Validator.required,
                    value: controller.sellprice != null
                        ? controller.sellprice.toString()
                        : null,
                    onChanged: (value) {
                      controller.sellprice = double.parse(value);
                    },
                  ),
                  AppInputText(
                    isReadOnly: controller.isDetail.value,
                    label: "Description",
                    isDescription: true,
                    validator: Validator.required,
                    value: controller.description,
                    onChanged: (value) {
                      controller.description = value;
                    },
                  ),
                  30.heightBox,
                  controller.isDetail.value == true
                      ? Container()
                      : AppButton(
                          text: "Save",
                          onTap: () {
                            controller.doSave();
                          },
                        )
                ],
              );
            }),
          ),
        ),
      );
    });
  }
}
