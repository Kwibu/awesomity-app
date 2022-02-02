import 'package:awesomity_app/screens/template_screen.dart';
import 'package:awesomity_app/store/tasks.dart';
import 'package:awesomity_app/widgets/dashboardWidget.dart';
import 'package:awesomity_app/widgets/emptyWidget.dart';
import 'package:awesomity_app/widgets/feedTasksWigdet.dart';
import 'package:awesomity_app/widgets/min_dashboard_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isData = true;
  bool ismenuToggled = false;

  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context);
    final tasks = tasksData.items;

    final activeData = Provider.of<Tasks>(context).activeTasks();
    final taskDone = Provider.of<Tasks>(context).doneTasks();
    // setState(() {
    //   if (tasks.isEmpty) {
    //     isData = false;
    //   }
    // });

    print(tasks);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add_new_task');
          },
          child: const Icon(Icons.add),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: TemplateScreen(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            tasks.isNotEmpty
                ? MiniDashboardWidget(context, tasks, activeData, taskDone)
                : DashboardTemplate(tasks),
            tasks.isNotEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * .6,
                    child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(
                            children: tasks
                                .map((element) => ChangeNotifierProvider.value(
                                      value: element,
                                      child: FeedsTaskPosts(),
                                    ))
                                .toList(),
                          ),
                        ]),
                  )
                : EmptyTemplate(context),
          ],
        )));
  }
}
