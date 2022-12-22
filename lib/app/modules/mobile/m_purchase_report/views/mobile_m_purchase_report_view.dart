import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../utils/theme/theme.dart';
import '../controllers/mobile_m_purchase_report_controller.dart';

class MobileMPurchaseReportView
    extends GetView<MobileMPurchaseReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Report'),
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
        ],
      ),
    );
  }
}
