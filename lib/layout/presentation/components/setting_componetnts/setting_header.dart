import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HeaderLayout extends StatefulWidget {
  const HeaderLayout({Key? key}) : super(key: key);

  @override
  State<HeaderLayout> createState() => _HeaderLayoutState();
}

class _HeaderLayoutState extends State<HeaderLayout> {
  File? image;
  final imagePicker = ImagePicker();

  uploadImage() async {
    var pickerImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickerImage != null) {
      setState(() {
        image = File(pickerImage.path);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                image == null
                    ? const CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                  AssetImage('assets/images/workshop man.jpg'),
                )
                    : CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.grey,
                  backgroundImage: FileImage(
                    image!,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 18,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        uploadImage();
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 20),
            const SizedBox(width: 10),
            Text(
              "Kerollos Sameh Fouad ",
              style:
              Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone, size: 20),
            const SizedBox(width: 10),
            Text(
              "+201061748098",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}