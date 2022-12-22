import 'package:flutter/material.dart';

import '../helpers/helpers.dart';
import '../theme/theme.dart';

class AppInputNumber extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool? isReadOnly;
  final Function(String) onChanged;

  const AppInputNumber({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    this.isReadOnly,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AppInputNumber> createState() => _AppInputNumberState();
}

class _AppInputNumberState extends State<AppInputNumber> {
  @override
  void initState() {
    super.initState();
  }

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
          padding: const EdgeInsets.only(left: 16),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: AppHelper.cicularRadius,
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
          ),
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            style: TextStyle(color: AppColor.black),
            initialValue: widget.value,
            validator: widget.validator,
            keyboardType: TextInputType.number,
            readOnly: widget.isReadOnly ?? false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: AppFont.input,
            ),
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
