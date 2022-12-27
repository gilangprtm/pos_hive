import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../service/pos_service/product_service.dart';
import '../../../../utils/helpers/app_format.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../../utils/theme/app_color.dart';
import '../controllers/tablet_t_product_list_controller.dart';

class TabletTProductListView extends GetView<TabletTProductListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.label ?? "All Product"),
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.toAddForm("add", controller.label ?? "");
        },
      ),
      body: Obx(() {
        return controller.isLoad.value == false
            ? Center(
                child: CircularProgressIndicator(
                color: AppColor.primary,
              ))
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                        ),
                        itemCount: controller.products!.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var size = context.width / 4;
                          var item = controller.products![index];
                          return Container(
                            padding: EdgeInsets.all(5),
                            width: size,
                            height: size,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: AppHelper.cicularRadius,
                                ),
                                animationDuration:
                                    const Duration(milliseconds: 1000),
                                shadowColor: Colors.transparent,
                                elevation: 0.0,
                              ),
                              onPressed: () {
                                controller.toEditForm("edit", item,
                                    controller.label ?? "Product");
                                print("object");
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(item['photo']),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: AppHelper.cicularRadius,
                                    ),
                                    child: null /* add child content here */,
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Text(
                                    "${item["product_name"]}",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Rp. " +
                                              AppFormat.toCurrency(
                                                  item['buyprice'])),
                                          Text("Rp. " +
                                              AppFormat.toCurrency(
                                                  item['sellprice'])),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColor.primary,
                                        ),
                                        child: Text("${item['stock']}"),
                                      ),
                                    ],
                                  ),
                                ],
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
