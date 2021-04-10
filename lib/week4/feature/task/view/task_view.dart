import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/widgets/task_card.dart';
import '../viewmodel/task_view_model.dart';

final TaskViewModel _viewModel = TaskViewModel();

class TaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (_viewModel.context == null) {
      _viewModel.setContext(context);
    }
    return Scaffold(
      appBar: AppBar(title: buildObserverTitle()),
      body: buildObserverBody(),
    );
  }

  Observer buildObserverTitle() {
    return Observer(builder: (_) {
      return Visibility(
        visible: _viewModel.pageLifes == LifeState.LOADING,
        child: CircularProgressIndicator(),
      );
    });
  }

  Observer buildObserverBody() {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: _viewModel.items.length,
        itemBuilder: (context, index) => TaskCards(taskModel: _viewModel.items[index]),
      );
    });
  }
}
