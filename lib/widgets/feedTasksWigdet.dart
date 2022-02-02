import 'package:awesomity_app/store/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FeedsTaskPosts extends StatefulWidget {
  @override
  _FeedsTaskPostsState createState() => _FeedsTaskPostsState();
}

class _FeedsTaskPostsState extends State<FeedsTaskPosts> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context);
    var dateFormat = DateFormat.yMd();
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/task-details", arguments: task.id);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  activeColor: task.isFinish == false
                      ? const Color.fromRGBO(28, 40, 52, 1)
                      : Colors.black12,
                  value: task.isFinish,
                  onChanged: (value) {
                    task.toggleIsDoneStatus();
                    Navigator.of(context).pushNamed('/');
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        task.title.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: task.isFinish ? Colors.black12 : null),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 8),
                          child: Text(
                            task.priority,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        color: task.isFinish == false
                            ? const Color.fromRGBO(73, 93, 105, 1)
                            : Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Text(
                              "Created ${dateFormat.format(task.createdTime)}",
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                          Text(
                            "Modified ${dateFormat.format(task.endedTime)}",
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined),
                  iconSize: 14,
                )
              ],
            ),
            Container(
              color: task.isFinish ? Colors.black12 : Colors.grey,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
