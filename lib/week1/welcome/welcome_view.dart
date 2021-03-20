import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeView extends StatelessWidget {
  final _appBarTitle = 'Instagram';
  final _randomImageUrl = 'https://picsum.photos/200/300';

  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(flex: 5, child: buildListViewTop(context)),
          Expanded(flex: 1, child: buildListView()),
          Expanded(flex: 1, child: buildDismissibleBottomCard()),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      actions: [buildIconButtonFavorite(context)],
      title: buildRowAppBarTitle(context),
    );
  }

  IconButton buildIconButtonFavorite(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.favorite),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Column(),
          );
        });
  }

  Row buildRowAppBarTitle(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.wallpaper),
        buildTextAppBar(context),
      ],
    );
  }

  Text buildTextAppBar(BuildContext context) {
    return Text(
      _appBarTitle,
      style: Theme.of(context).primaryTextTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
    );
  }

  ListView buildListViewTop(BuildContext context) {
    return ListView(
      children: [
        Container(width: 500, height: MediaQuery.of(context).size.height * 0.1, color: randomColor),
        Container(width: 500, height: MediaQuery.of(context).size.height * 0.1, color: randomColor),
        Container(width: 500, height: MediaQuery.of(context).size.height * 0.1, color: randomColor),
        Container(width: 500, height: MediaQuery.of(context).size.height * 0.1, color: randomColor),
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: 100,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return buildListViewCard(context, index);
      },
    );
  }

  SizedBox buildListViewCard(BuildContext context, int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        child: ListTile(
          onTap: () {},
          leading: CircleAvatar(backgroundImage: NetworkImage(_randomImageUrl)),
          title: Text('$_appBarTitle $index'),
          trailing: Icon(Icons.arrow_right_alt),
        ),
      ),
    );
  }

  Dismissible buildDismissibleBottomCard() {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.black),
      secondaryBackground: Container(color: Colors.red),
      child: buildContainerBottom(),
    );
  }

  Container buildContainerBottom() => Container(color: Colors.pink);
}
