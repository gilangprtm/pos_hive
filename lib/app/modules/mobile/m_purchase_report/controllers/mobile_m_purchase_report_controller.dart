import 'package:get/get.dart';

class MobileMPurchaseReportController extends GetxController {
  var focusDate = DateTime.now().obs;
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    focusDate.value = selectedDay;
  }
}
