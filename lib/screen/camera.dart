import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class camera extends StatefulWidget {
  static const routeName = '/ProfileScreen';

  const camera({Key? key}) : super(key: key);

  @override
  State<camera> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<camera> {
  File? _selectedImage;

  bool isEditBooking = false;

  TextEditingController startDate = TextEditingController(
    text: DateFormat('yyyy-MM-dd HH:mm').format(
      DateTime.now(),
    ),
  );

  _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Take a picture'),
              onTap: () {
                _openCamera(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Select from gallery'),
              onTap: () {
                _openGallery(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _openCamera(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _selectedImage = File(pickedFile!.path);
    });
    Navigator.pop(context);
  }

  void _openGallery(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(pickedFile!.path);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Profile Screen",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: (20)),
            InkWell(
              onTap: () => _showImagePickerBottomSheet(context),
              child: Stack(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Colors.cyan,
                        ),
                        image: _selectedImage != null
                            ? DecorationImage(
                                image: FileImage(_selectedImage!),
                                fit: BoxFit.fill,
                              )
                            : DecorationImage(
                                image: AssetImage(
                                    "assets/images")), // Fallback in case no image is selected
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              width: (250),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {},
                  child: const Text(
                    'Update',
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: TextFormField(
            //     controller: startDate,
            //     readOnly: true,
            //     decoration: InputDecoration(
            //       hintText: 'Start Time:*',
            //       floatingLabelBehavior: FloatingLabelBehavior.always,
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10).r,
            //       ),
            //       contentPadding: const EdgeInsets.symmetric(horizontal: 20).r,
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Colors.amber),
            //         borderRadius: BorderRadius.circular(10).r,
            //       ),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10).r,
            //       ),
            //       hintStyle: TextStyle(color: Colors.black, fontSize: 14.sp),
            //     ),
            //     onTap: () {
            //       // Use try-catch to handle invalid format
            //       DateTime initialDate;
            //       try {
            //         initialDate = DateTime.parse(startDate.text);
            //       } catch (e) {
            //         // Handle the error by providing a default date, like the current date
            //         initialDate = DateTime.now();
            //         print('Error parsing date: ${e.toString()}');
            //       }
            //       BottomPicker.dateTime(
            //         use24hFormat: true,
            //         pickerTitle: Text(
            //           'Start Date',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: (15.sp),
            //           ),
            //         ),
            //         dateOrder: DatePickerDateOrder.dmy,
            //         initialDateTime: initialDate,
            //         pickerTextStyle: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: (15.sp),
            //           color: Colors.black,
            //         ),
            //         onChange: (index) {
            //           print("Index:>>>>     $index");
            //         },
            //         onSubmit: (date) {
            //           // Format the date and update the text field
            //           final DateFormat dateFormat =
            //               DateFormat('yyyy-MM-dd HH:mm');
            //           startDate.text = dateFormat.format(date);
            //           print('startDate >>>>>>>>>>> ...${startDate.text}');
            //         },
            //         bottomPickerTheme: BottomPickerTheme.morningSalad,
            //       ).show(context);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
