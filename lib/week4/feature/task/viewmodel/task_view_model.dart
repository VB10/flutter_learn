import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../core/network/network_manager.dart';
import '../model/task_model.dart';
import '../service/ITaskService.dart';
import '../service/task_service.dart';

part 'task_view_model.g.dart';

class TaskViewModel = _TaskViewModelBase with _$TaskViewModel;

abstract class _TaskViewModelBase with Store {
  BuildContext? context;
  late ITaskService taskService;

  @observable
  List<TaskModel> items = [];

  @observable
  LifeState pageLifes = LifeState.IDDLE;

  _TaskViewModelBase({this.context}) {
    taskService = TaskService(NetworkManager.instance.dio);
  }

  void setContext(BuildContext? context) {
    this.context = context;
    fetchItems();
  }

  @action
  Future<void> fetchItems() async {
    pageLifes = LifeState.LOADING;
    items = await taskService.fetchAllTask();
    pageLifes = LifeState.DONE;
  }
}

enum LifeState {
  IDDLE,
  LOADING,
  DONE,
}
