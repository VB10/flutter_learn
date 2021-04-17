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
      ).onLazyLoads(() async {
        // NEW REQUEST
      });
    });
  }
}

extension ListViewExtension on ListView {
  Widget onLazyLoads(Future<void> Function() onPagingLoad, {Widget? itemLoadWidget}) {
    final delegate = childrenDelegate as SliverChildBuilderDelegate;
    final itemCount = delegate.childCount ?? 0;
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
          onPagingLoad();
        }
        return true;
      },
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index == (itemCount - 1)) itemLoadWidget ?? Center(child: CircularProgressIndicator());
          return delegate.builder(context, index)!;
        },
      ),
    );
  }
}
