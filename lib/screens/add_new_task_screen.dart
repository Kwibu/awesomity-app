import 'dart:io';
// import 'dart:html';

import 'package:awesomity_app/store/task.dart';
import 'package:awesomity_app/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import "../store/tasks.dart";
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  String dropdownValue = "LOW";
  final _form = GlobalKey<FormState>();
  File? _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  @override
  Widget build(BuildContext context) {
    // todo THE ENDED TIME SHOULD BE EQUAL TO UPDATED TIME MY MISTAKES

    var _newTask = Task(
        id: "",
        title: "",
        description: "",
        isFinish: false,
        imageUrl: _userImageFile,
        priority: dropdownValue,
        createdTime: DateTime.now(),
        endedTime: DateTime.now());

    Future<void> onSaveNewTaskHandler() async {
      var validateForm = _form.currentState!.validate();
      _form.currentState!.save();

      if (_userImageFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Please select image"),
          backgroundColor: Colors.red[200],
          duration: const Duration(milliseconds: 1000),
        ));

        return;
      }

      if (validateForm) {
        Provider.of<Tasks>(context, listen: false).addTask(_newTask);
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.white, foregroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text("New Task",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // todo ADD IMAGE
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("Add Image"),
                            ),
                            TaskImagePicker(_pickedImage),
                          ],
                        ),
                      ),
                      // todo ADD Title
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("Title"),
                            ),
                            Container(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    fillColor: Colors.black12,
                                    filled: true,
                                    border: InputBorder.none,
                                    labelText: "Task title(140 Characters)",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelStyle:
                                        TextStyle(color: Colors.black54),
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 20,
                                    )),
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Fill the title';
                                  }
                                  if (value.length > 140) {
                                    return "Your";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _newTask = Task(
                                      id: _newTask.id,
                                      title: value.toString(),
                                      description: _newTask.description,
                                      isFinish: _newTask.isFinish,
                                      imageUrl: _newTask.imageUrl,
                                      priority: _newTask.priority,
                                      createdTime: _newTask.createdTime,
                                      endedTime: _newTask.endedTime);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // todo ADD DESCRIPTION
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("Description"),
                            ),
                            Container(
                              // height: 60,
                              child: TextFormField(
                                maxLines: 3,
                                decoration: const InputDecoration(
                                    fillColor: Colors.black12,
                                    filled: true,
                                    border: InputBorder.none,
                                    labelText: "240 Characters",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelStyle:
                                        TextStyle(color: Colors.black54),
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 20,
                                    )),
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Fill the description';
                                  }
                                  if (value.length > 240) {
                                    return "Your";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _newTask = Task(
                                      id: _newTask.id,
                                      title: _newTask.title,
                                      description: value.toString(),
                                      isFinish: _newTask.isFinish,
                                      imageUrl: _newTask.imageUrl,
                                      priority: _newTask.priority,
                                      createdTime: _newTask.createdTime,
                                      endedTime: _newTask.endedTime);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("Priority"),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                color: Colors.black12,
                                // border: Border.all(color: Colors.black38)
                              ),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                style: const TextStyle(color: Colors.black87),
                                isExpanded: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                underline: Container(
                                  height: 1,
                                ),
                                items: <String>[
                                  "LOW",
                                  "MEDIUM",
                                  'HIGH',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              onSaveNewTaskHandler();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).backgroundColor),
                            child: const Text("  CREATE TASK  ")),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
