import 'package:dio/dio.dart';

import '../model/task_model.dart';

abstract class ITaskService {
  final Dio dio;
  ITaskService(this.dio);

  Future<List<TaskModel>> fetchAllTask();
}
