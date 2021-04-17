import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product/manager/shop/shop_manager.dart';
import '../../product/widgets/card/photo_card.dart';

class BasketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<ShopManager>().shopPhotoItems.isEmpty ? Center(child: Text('Basket is empty')) : buildListView(context),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<ShopManager>().shopPhotoItems.length,
      itemBuilder: (context, index) {
        return PhotoCard(model: context.watch<ShopManager>().shopPhotoItems[index]);
      },
    );
  }
}
