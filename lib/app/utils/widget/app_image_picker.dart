import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_hive/app/utils/theme/app_color.dart';

import '../helpers/helpers.dart';

class AppImagePicker extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool? isReadOnly;
  final Function(String) onChanged;

  const AppImagePicker({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.isReadOnly,
    this.hint,
    required this.onChanged,
    this.obscure = false,
  }) : super(key: key);

  @override
  State<AppImagePicker> createState() => _AppImagePickerState();
}

class _AppImagePickerState extends State<AppImagePicker> {
  String? imageUrl;
  bool loading = false;
  late TextEditingController controller;
  @override
  void initState() {
    imageUrl = widget.value;
    controller = TextEditingController(
      text: widget.value ?? "-",
    );
    super.initState();
  }

  Future<String?> getFileMultiplePlatform() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        "png",
        "jpg",
      ],
      allowMultiple: false,
    );
    if (result == null) return null;
    return result.files.first.path;
  }

  Future<String?> getFileAndroidIosAndWeb() async {
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    String? filePath = image?.path;
    if (filePath == null) return null;
    return filePath;
  }

  Future<String?> uploadFile(String filePath) async {
    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(
        File(filePath).readAsBytesSync(),
        filename: "upload.jpg",
      ),
    });

    var res = await Dio().post(
      'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
      data: formData,
    );

    var data = res.data["data"];
    var url = data["url"];
    widget.onChanged(url);
    return url;
  }

  browsePhoto() async {
    if (loading) return;

    String? filePath;
    loading = true;
    setState(() {});

    if (Platform.isWindows) {
      filePath = await getFileMultiplePlatform();
    } else {
      filePath = await getFileAndroidIosAndWeb();
    }
    if (filePath == null) return;

    imageUrl = await uploadFile(filePath);
    loading = false;
    controller.text = imageUrl!;
    setState(() {});
  }

  String? get currentValue {
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 72.0,
                width: 72.0,
                margin: const EdgeInsets.only(
                  top: 8.0,
                ),
                decoration: BoxDecoration(
                  color: loading ? Colors.blueGrey[900] : null,
                  image: loading
                      ? null
                      : DecorationImage(
                          image: NetworkImage(
                            imageUrl == null
                                ? "https://i.ibb.co/S32HNjD/no-image.jpg"
                                : imageUrl!,
                          ),
                          fit: BoxFit.cover,
                        ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                child: Visibility(
                  visible: loading == true,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: CircularProgressIndicator(
                            color: AppColor.primary,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "Uploading...",
                          style: TextStyle(
                            fontSize: 9.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: FormField(
                    initialValue: false,
                    validator: (value) {
                      return widget.validator!(imageUrl);
                    },
                    enabled: true,
                    builder: (FormFieldState<bool> field) {
                      return Container(
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
                            color: widget.isReadOnly == true
                                ? Colors.grey[300]
                                : AppColor.white),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          style: TextStyle(color: AppColor.black),
                          controller: controller,
                          // validator: widget.validator,
                          obscureText: widget.obscure,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Transform.scale(
                              scale: 0.8,
                              child: SizedBox(
                                width: 80.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: AppHelper.cicularRadius,
                                    ),
                                    backgroundColor: loading
                                        ? Colors.grey[300]
                                        : Colors.blueGrey,
                                  ),
                                  onPressed: () => browsePhoto(),
                                  child: const Text(
                                    "Pick",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            helperText: widget.hint,
                            errorText: field.errorText,
                          ),
                          onChanged: (value) {
                            widget.onChanged(value);
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
