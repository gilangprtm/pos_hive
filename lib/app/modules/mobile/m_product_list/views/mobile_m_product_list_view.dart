import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../service/pos_service/product_service.dart';
import '../../../../utils/helpers/app_format.dart';
import '../../../../utils/theme/theme.dart';
import '../controllers/mobile_m_product_list_controller.dart';

class MobileMProductListView extends GetView<MobileMProductListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(controller.item.value);
        }),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.toAddForm();
        },
      ),
      body: Obx(() {
        return controller.isLoad.value == false
            ? Center(
                child: CircularProgressIndicator(
                color: AppColor.primary,
              ))
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: ProductService.productList.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item = ProductService.productList[index];
                      return InkWell(
                        onTap: () {
                          controller.toEditForm(item);
                        },
                        child: Dismissible(
                          key: UniqueKey(),
                          onDismissed: (detail) {},
                          confirmDismiss: (direction) async {
                            controller.deleteItem(item['id']);
                            return Future.value(false);
                          },
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage: NetworkImage(
                                  item["photo"],
                                ),
                              ),
                              title: Text("${item["product_name"]}"),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("Rp. " +
                                          AppFormat.toCurrency(
                                              item['buyprice'])),
                                      Text("Rp. " +
                                          AppFormat.toCurrency(
                                              item['sellprice'])),
                                    ],
                                  ),
                                  Text(item["stock"] == 0
                                      ? "Empty stock"
                                      : "${item["stock"]}")
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
      }),
    );
  }
}
