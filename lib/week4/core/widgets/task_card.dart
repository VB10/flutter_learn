import 'package:flutter/material.dart';

import '../../feature/task/model/task_model.dart';

class TaskCards extends StatelessWidget {
  final TaskModel taskModel;

  const TaskCards({Key? key, required this.taskModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(),
              body: Image.network(taskModel.imageUrl ?? 'https://picsum.photos/200/300'),
            ),
          ));
        },
        leading: CircleAvatar(backgroundImage: NetworkImage(taskModel.imageUrl!)),
        title: Text(taskModel.description ?? 'https://picsum.photos/200/300'),
      ),
    );
  }
}
