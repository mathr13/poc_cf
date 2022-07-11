import 'package:flutter/material.dart';
import 'package:poc_cf/screens/tasksList.dart';

class TasksHome extends StatefulWidget {
  const TasksHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TasksHomeState();
  }
}

class _TasksHomeState extends State<TasksHome> {
  @override
  Widget build(BuildContext context) {
    return const TasksList();
    // return AnimatedList(itemBuilder: itemBuilder);
  }

}