import 'package:awesomity_app/store/task.dart';
import 'package:awesomity_app/store/tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({Key? key}) : super(key: key);

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final taskId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedTask =
        Provider.of<Tasks>(context, listen: false).findById(taskId);

    var dateFormat = DateFormat().add_yMMMEd();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                'https://www.markspaneth.com/assets/images/blog/_list_image/02_02_18_508408464_AAB_560x292.jpg',
                fit: BoxFit.cover,
              )),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 11.0),
                      child: Text(
                        loadedTask.priority,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    color: const Color.fromRGBO(73, 93, 105, 1),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/add_new_task',
                            arguments: loadedTask.id);
                      },
                      child: Container(
                        color: Colors.black12,
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.only(
                            top: 6, left: 6, right: 0, bottom: 6),
                        child: const Icon(Icons.edit),
                      ),
                    ),
                    Container(
                      color: Colors.black12,
                      margin: const EdgeInsets.all(12),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(Icons.close),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/add_new_task');
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        child: const Text(
                          "DONE",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                loadedTask.title.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Text(
                loadedTask.description.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15, height: 1.5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Created at  ${dateFormat.format(loadedTask.createdTime)}"),
                    Text(
                        "Modified at ${dateFormat.format(loadedTask.endedTime)}")
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
