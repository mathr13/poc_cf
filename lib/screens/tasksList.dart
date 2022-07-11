import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_cf/constants/extensions.dart';
import 'package:poc_cf/controllers/tasksController.dart';
import 'package:poc_cf/models.dart/taskModel.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TasksListState();
  }
}

class _TasksListState extends State<TasksList> {

  final TasksController _tasksController = TasksController();

  @override
  void initState() {
    _tasksController.populateTaskListWithInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: ListView.builder(
          itemCount: _tasksController.tasksList.value.length,
          itemBuilder: (context, index) {
            final TextEditingController _textController = TextEditingController();
            _textController.text = (_tasksController.tasksList.value[index] as TaskModel).taskContent;
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    onChanged: (value) {
                      _tasksController.updateTaskWithContent(index, value);
                    },
                  )
                ),
                Container(
                  child: const Icon(Icons.remove_circle)
                ).onTap(
                  () => _tasksController.removetaskFromListWithIndex(index)
                ),
              ],
            );
          },
        ),
        floatingActionButton: Icon(Icons.add).onTap(() => _tasksController.addNewEmptyTaskToList()),
      )
    );
  }
}