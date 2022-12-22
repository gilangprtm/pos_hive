import 'package:get/get.dart';

class MobileMSalesReportController extends GetxController {
  var focusDate = DateTime.now().obs;
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    focusDate.value = selectedDay;
  }
}
