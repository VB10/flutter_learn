import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../product/manager/shop/shop_manager.dart';
import '../../../product/widgets/card/photo_card.dart';
import '../viewmodel/photos_view_model.dart';

final _viewModel = PhotosViewModel();

class PhotosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildObserverISLoading(),
        actions: [buildActionChip(context)],
      ),
      body: buildGridView(),
    );
  }

  Observer buildObserverISLoading() {
    return Observer(builder: (_) {
      return Visibility(
        visible: _viewModel.isLoading,
        child: Padding(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
      );
    });
  }

  ActionChip buildActionChip(BuildContext context) {
    return ActionChip(
      label: Text('\$ ${context.watch<ShopManager>().totalMoney}'),
      avatar: Icon(Icons.shopping_bag),
      onPressed: () {},
    );
  }

  Widget buildGridView() {
    return Observer(builder: (_) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: _viewModel.photos.length,
        itemBuilder: (context, index) {
          return PhotoCard(model: _viewModel.photos[index]);
        },
      );
    });
  }
}
