import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../theme/theme.dart';

class AppHelper {
  static BorderRadius get cicularRadius => BorderRadius.circular(15);

  static String idGenerator() {
    const uuid = Uuid();
    var r = uuid.v4();
    return r;
  }

  static Future<bool?> dialogQuestion({
    String? message,
    IconData? icon,
    String? textConfirm,
    String? textCancel,
    Color? color,
  }) async {
    return await Get.dialog<bool?>(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: AppHelper.cicularRadius),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.question_mark_rounded,
              color: color ?? AppColor.primary,
              size: 40,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              message ?? "",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        contentPadding:
            const EdgeInsets.only(bottom: 0, top: 20, right: 20, left: 20),
        actionsPadding:
            const EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
        actions: [
          TextButton(
            child: Text(
              textCancel ?? "Close",
              style: const TextStyle(
                color: AppColor.grey1,
              ),
            ),
            onPressed: () {
              Get.back(result: false);
            },
          ),
          TextButton(
            child: Text(
              textConfirm ?? "OK",
              style: TextStyle(
                color: color ?? AppColor.primary,
              ),
            ),
            onPressed: () async {
              Get.back(result: true);
            },
          ),
        ],
      ),
    );
  }

  static Future dialogWarning(String? message) async {
    await Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.warning_rounded,
              color: AppColor.yellow,
              size: 40,
            ),
            const Padding(padding: EdgeInsets.all(7)),
            Text(
              textAlign: TextAlign.center,
              message ?? "-",
              style: const TextStyle(
                color: AppColor.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future dialogSuccess(String? message) async {
    await Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              color: AppColor.primary,
              size: 40,
            ),
            const Padding(padding: EdgeInsets.all(7)),
            Text(
              textAlign: TextAlign.center,
              message ?? "-",
              style: const TextStyle(
                color: AppColor.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future dialogCustomWidget(
      {List<Widget>? children, String? yes}) async {
    return await Get.dialog<bool?>(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: AppHelper.cicularRadius),
        content: Column(mainAxisSize: MainAxisSize.min, children: children!),
        contentPadding:
            const EdgeInsets.only(bottom: 0, top: 20, right: 10, left: 10),
        actionsPadding:
            const EdgeInsets.only(top: 0, bottom: 5, left: 20, right: 20),
        actions: [
          TextButton(
            child: Text('close'.tr, style: TextStyle(color: AppColor.grey1)),
            onPressed: () {
              Get.back(result: false);
            },
          ),
          TextButton(
            child: Text(
              yes ?? "Yes",
              style: TextStyle(
                color: AppColor.primary,
              ),
            ),
            onPressed: () {
              Get.back(result: true);
            },
          ),
        ],
      ),
    );
  }
}
