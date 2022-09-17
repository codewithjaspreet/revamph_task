import 'dart:io';
import 'dart:async';

import 'package:blog_minimal/widgets/custom_text_field.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key key, this.titleController, this.descController})
      : super(key: key);

  final TextEditingController titleController;
  final TextEditingController descController;

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File image;

  Future _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    // print("ImagePath" + image.path);
    upload(image as File);
    setState(() {
      this.image = imageTemp;
    });
  }

  upload(File image) async {
    final storageRef = FirebaseStorage.instance.ref();
    // final imagesRef = storageRef.child(image.path);

    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // String filePath = '${appDocDir.absolute}/file-to-upload.png';
    // print("File path : " + filePath);
    final ref = storageRef.child("images");

    print("FILE PATH : " + image.path);
    // File file = File(filePath);
    //
    try {
      await ref.putFile(image);
    } catch (e) {
      print("ERORRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
    }

    String arr = await ref.getDownloadURL();
    Get.snackbar('User 123', arr, snackPosition: SnackPosition.BOTTOM);
    print(arr);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
// There are no fields for Time and Author (current time will be pushed to db & current user displayname as authername)
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Create Post',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                ),
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      _pickImage();
                    },
                    splashColor: Colors.yellow,
                    child: Ink(
                      width: size.width * 0.8,
                      height: size.height * 0.2,
                      child: Center(
                        child: image != null
                            ? Image.file(
                                image,
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Text("Select an Image"),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.025),
              Text(
                'Title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.005),
              CustomTextField(
                hint: 'Enter Title',
                controller: widget.titleController,
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.005),
              CustomTextField(
                hint: 'Enter Description',
                controller: widget.descController,
              ),
              SizedBox(height: size.height * 0.02),
              Align(
                  child: Container(
                      width: size.width * 0.5,
                      height: size.height * 0.06,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFFFFD810))),
                          child: Text('Create Post'))))
            ],
          ),
        ),
      ),
    );
  }
}

// _getFromGallery() async {
//   PickedFile pickedFile = await ImagePicker().getImage(
//     source: ImageSource.gallery,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     setState(() {
//       imageFile = File(pickedFile.path);
//     });
//   }
// }
