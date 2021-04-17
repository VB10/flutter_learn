import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../feature/photos/model/photos_model.dart';
import '../../manager/shop/shop_manager.dart';

class PhotoCard extends StatefulWidget {
  final PhotoModel model;

  const PhotoCard({Key? key, required this.model}) : super(key: key);

  @override
  _PhotoCardState createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> with AutomaticKeepAliveClientMixin {
  bool isIncrementOpen = false;
  late PhotoModel model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  void isIncrementChange() {
    if (!isIncrementOpen) {
      context.read<ShopManager>().addShopItem(model);
    } else {
      context.read<ShopManager>().removeShopItem(model);
    }
    setState(() {
      isIncrementOpen = !isIncrementOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      child: Stack(
        children: [buildListTileCard(), Positioned(right: 0, child: buildCardShopIncrement())],
      ),
    );
  }

  ListTile buildListTileCard() {
    return ListTile(
      title: Image.network(model.url ?? ''),
      subtitle: Column(
        children: [
          Text(model.title ?? ' ', maxLines: 1),
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: isIncrementChange,
          )
        ],
      ),
    );
  }

  Widget buildCardShopIncrement() {
    return AnimatedContainer(
      duration: context.durationLow,
      height: isIncrementOpen ? context.dynamicHeight(0.15) : 0,
      width: isIncrementOpen ? context.dynamicWidth(0.1) : 0,
      child: Card(
          elevation: 10,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(flex: 4, child: buildIconButtonIncrement()),
              Expanded(
                flex: 1,
                child: Text(
                  model.count.toString(),
                  style: context.textTheme.button,
                ),
              ),
              Expanded(flex: 4, child: buildIconButtonRemove()),
            ],
          )),
    );
  }

  IconButton buildIconButtonRemove() {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.remove),
      onPressed: () {
        context.read<ShopManager>().deIncrementItem(model);
        model.count--;
      },
    );
  }

  IconButton buildIconButtonIncrement() {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.add),
      onPressed: () {
        context.read<ShopManager>().incrementItem(model);
        model.count++;
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
