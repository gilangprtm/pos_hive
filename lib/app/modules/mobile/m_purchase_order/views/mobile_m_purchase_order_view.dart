import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../service/pos_service/product_service.dart';
import '../../../../utils/helpers/app_format.dart';
import '../../../../utils/theme/theme.dart';
import '../controllers/mobile_m_purchase_order_controller.dart';

class MobileMPurchaseOrderView extends GetView<MobileMPurchaseOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchase Order"),
        centerTitle: true,
        actions: const [],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    return controller.isLoad.value == false
                        ? Container()
                        : Text(
                            "Rp " +
                                "${AppFormat.toCurrency(ProductService.totalbuy)}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                  }),
                ),
              ],
            ),
            const Divider(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                ),
                onPressed: () {
                  if (ProductService.totalbuy != 0) {
                    controller.doCheckout();
                  }
                  return null;
                },
                child: Text("Checkout"),
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        return controller.isLoad.value == false
            ? Center(
                child: CircularProgressIndicator(
                color: AppColor.primary,
              ))
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: ProductService.productList.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = ProductService.productList[index];
                          item["qty"] = item["qty"] ?? 0;
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage: NetworkImage(
                                  item["photo"],
                                ),
                              ),
                              title: Text("${item["product_name"]}"),
                              subtitle: Text(
                                  "Rp. ${"${AppFormat.toCurrency(item['buyprice'])}"}"),
                              trailing: SizedBox(
                                width: 120.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blueGrey,
                                      radius: 12.0,
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            if (item["qty"] == 0) {
                                              return null;
                                            }
                                            item["qty"]--;
                                            controller.refresh();
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 9.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${item["qty"]}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.blueGrey,
                                      radius: 12.0,
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            item["qty"]++;
                                            controller.refresh();
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 9.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
