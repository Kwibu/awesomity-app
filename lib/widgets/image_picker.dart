// import 'dart:html';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import "../store/tasks.dart";

class TaskImagePicker extends StatefulWidget {
  final Function(File pickedImage) imagePickFn;
  const TaskImagePicker(this.imagePickFn);

  @override
  _TaskImagePickerState createState() => _TaskImagePickerState();
}

enum UploadType {
  /// Uploads a randomly generated string (as a file) to Storage.
  string,

  /// Uploads a file from the device.
  file,

  /// Clears any tasks from the list.
  clear,
}

class _TaskImagePickerState extends State<TaskImagePicker> {
  File? _pickedImage;

  void _pickImageHandler() async {
    final ImagePicker _picker = ImagePicker();

    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      _pickedImage = imageTemporary;
    });
    widget.imagePickFn(imageTemporary);

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage
        .ref()
        .child(imageTemporary.toString() + DateTime.now().toString());
    await ref.putFile(imageTemporary);
    String imageUrl = await ref.getDownloadURL();
    print("Datas here" + imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickImageHandler,
      child: Container(
        color: Colors.black12,
        height: 90,
        // ignore: unnecessary_null_comparison
        child: Center(
          child: _pickedImage != null
              ? Image.file(
                  _pickedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text("Tap to add image"),
        ),
      ),
    );
  }
}
