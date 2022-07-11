import 'package:get/get.dart';
import 'package:poc_cf/models.dart/taskModel.dart';
import 'package:uuid/uuid.dart';

class TasksController extends GetxController {

  var tasksList = [].obs;

  populateTaskListWithInitialData() {
    String defContent = "type something here..";
    var uuid = const Uuid();
    TaskModel _newTask = TaskModel(uuid.v4(), defContent);
    // tasksList.value.add(_newTask);
    tasksList.value = [_newTask];
  }

  updateTaskWithContent(int index, String content) {
    String currentTaskId = (tasksList.value[index] as TaskModel).taskId;
    tasksList.value[index] = TaskModel(currentTaskId, content);
  }

  addNewEmptyTaskToList() {
    print("add called");
    var uuid = const Uuid();
    TaskModel _newTask = TaskModel(uuid.v4(), "new note");
    tasksList.add(_newTask);
  }

  removetaskFromListWithIndex(int taskIndex) {
    if(tasksList.length > 1) {
      tasksList.removeAt(taskIndex);
    }
  }

}