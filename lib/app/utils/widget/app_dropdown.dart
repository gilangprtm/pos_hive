import 'package:flutter/material.dart';

import '../helpers/helpers.dart';
import '../theme/theme.dart';

class AppDropdownInput<T> extends StatefulWidget {
  final String? hintText;
  final List<T> items;
  final String? value;
  final String label;
  final bool? isReadOnly;
  final void Function(T?) onChanged;

  AppDropdownInput({
    required this.onChanged,
    required this.items,
    this.hintText,
    required this.label,
    this.value,
    this.isReadOnly,
  });

  @override
  State<AppDropdownInput<T>> createState() => _AppDropdownInputState<T>();
}

class _AppDropdownInputState<T> extends State<AppDropdownInput<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 15,
            ),
            Text(widget.label),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0x40000000),
                offset: Offset(0, 1),
                blurRadius: 4,
                spreadRadius: 0,
              )
            ],
            color:
                widget.isReadOnly == true ? Colors.grey[300] : AppColor.white,
            borderRadius: AppHelper.cicularRadius,
          ),
          child: DropdownButton<T>(
            borderRadius: AppHelper.cicularRadius,
            elevation: 4,
            value: widget.value!.isEmpty ? null : widget.value as T,
            onChanged: widget.onChanged,
            hint: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.hintText ?? ""),
              ],
            ),
            // Hide the default underline
            underline: Container(),
            icon: Icon(
              Icons.arrow_drop_down,
              size: 30,
            ),
            isExpanded: true,

            // The list of options
            items: widget.items
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "$e",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ))
                .toList(),

            // Customize the selected item
            selectedItemBuilder: (BuildContext context) => widget.items
                .map((e) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$e",
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
