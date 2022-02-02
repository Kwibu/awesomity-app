import 'package:awesomity_app/screens/add_new_task_screen.dart';
import 'package:awesomity_app/screens/home_screen.dart';
import 'package:awesomity_app/screens/task_details_screen.dart';
import 'package:awesomity_app/store/tasks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // todo This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "Montserrat",
            hintColor: const Color.fromRGBO(193, 207, 22, 1),
            primarySwatch: Colors.blue,
            backgroundColor: const Color.fromRGBO(12, 13, 13, 1)),
        routes: {
          '/': (context) => const HomeScreen(),
          '/add_new_task': (context) => const AddNewTaskScreen(),
          '/task-details': (context) => const TaskDetailsScreen(),
        },
      ),
    );
  }
}
