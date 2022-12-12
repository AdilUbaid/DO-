import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../function/themeColor.dart';

String imgeGlob = 'x';

class EventImage extends StatefulWidget {
  var data;
  var mode;

  EventImage({super.key, required this.data, required this.mode
      // required this.imageStatic,
      });
  // const imageStatic;

  @override
  State<EventImage> createState() => _EventImageState();
}

class _EventImageState extends State<EventImage> {
  // File? imagePath;

  // late String imgPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 9),
      child: Stack(
        children: [
          Container(
            // color: rWhite,
            height: 220,
            // child: Card(

            // ),
            // width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: rWhite,
              image: DecorationImage(
                  // image: AssetImage(
                  //   'assets/image/wood-blog-placeholder.jpg',
                  // ),
                  image: imageProvide(),
                  fit: BoxFit.fitWidth
                  // scale: 0.9,
                  ),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            // alignment: Alignment.bottomLeft,
            child: TextButton(
                onPressed: () async {
                  // imgPath = await pickImage();
                  imgeGlob = await pickImage();
                },
                child: Icon(
                  Icons.add_a_photo,
                  color: cBlack,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }

  Future<String> pickImage() async {
    final pickedimage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedimage == null) {
      print('return zero');
      return 'error';
    } else {
      setState(() {
        imgeGlob = pickedimage.path;
      });
      print(pickedimage.path);
      return pickedimage.path;
    }
  }

  imageProvide() {
    if (imgeGlob == 'x' && (widget.data == null || widget.mode == 'ET')) {
      return const AssetImage('assets/image/wood-blog-placeholder.jpg')
          as ImageProvider;
    } else if (imgeGlob == 'x') {
      imgeGlob = widget.data.imagePath;
      return FileImage(File(widget.data.imagePath));
    } else {
      return FileImage(File(imgeGlob));
    }
  }
}
