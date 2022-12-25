import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_hive/app/utils/extension/box_extension.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../utils/helpers/helpers.dart';
import '../../../../utils/theme/theme.dart';
import '../controllers/mobile_m_sales_report_controller.dart';

class MobileMSalesReportView extends GetView<MobileMSalesReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Report'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() {
            return TableCalendar(
                locale: 'id_ID',
                firstDay: DateTime(controller.focusDate.value.year - 10, 1, 1),
                lastDay: DateTime(controller.focusDate.value.year + 10, 1, 1),
                focusedDay: controller.focusDate.value,
                calendarStyle: const CalendarStyle(
                  weekendTextStyle: TextStyle(color: AppColor.red),
                  todayDecoration: const BoxDecoration(
                      color: AppColor.secondary, shape: BoxShape.circle),
                  selectedDecoration: const BoxDecoration(
                      color: AppColor.primary, shape: BoxShape.circle),
                ),
                headerStyle: const HeaderStyle(
                  titleTextStyle: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                availableGestures: AvailableGestures.all,
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: controller.onDaySelected,
                selectedDayPredicate: (day) =>
                    isSameDay(day, controller.focusDate.value));
          }),
          Container(
            color: AppColor.grey,
            height: 5,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sales total",
                  style: AppFont.headerwhite,
                ),
                Obx(() {
                  return Text(
                    "Rp. " + controller.total.value,
                    style: AppFont.h1,
                  );
                }),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return Container(
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: ListView.builder(
                    itemCount: controller.onDayList.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var items = controller.onDayList[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: GestureDetector(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: AppHelper.cicularRadius,
                              color: AppColor.grey1,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${items.item?.first.productname}"),
                                  Text("${items.item?.first.qty}")
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
          ),
          15.heightBox,
        ],
      ),
    );
  }
}
