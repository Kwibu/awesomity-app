import 'package:flutter/material.dart';

Widget EmptyTemplate(BuildContext context) {
  return Column(
    children: [
      Container(
        height: 200,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "NOTHING HERE",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 18.0),
              child: Text(
                "Just like your crush's replies",
                style: TextStyle(color: Colors.black87),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/add_new_task');
                },
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).backgroundColor),
                child: const Text("START WITH A NEW TASK")),
          ],
        ),
      ),
    ],
  );
}
