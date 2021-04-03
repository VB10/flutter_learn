import 'package:flutter/material.dart';

import '../core/base/base_statefull.dart';

class FoodDashboardView extends StatefulWidget {
  @override
  _FoodDashboardViewState createState() => _FoodDashboardViewState();
}

class _FoodDashboardViewState extends BaseStatefull<FoodDashboardView> {
  final _randomImage = 'https://picsum.photos/200/300';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food Dashboard')),
      body: ListView(
        children: [
          SizedBox(height: dynamichHeight(0.3), child: buildPageView()),
          Padding(padding: EdgeInsets.all(8.0), child: Placeholder()),
          FlutterLogo(),
          buildListView(),
          Padding(padding: EdgeInsets.all(8.0), child: Placeholder()),
        ],
      ),
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      itemBuilder: (context, index) => Image.network(
        _randomImage,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: 15,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => buildCard(index),
    );
  }

  Card buildCard(int index) {
    return Card(
      child: ListTile(
        title: Text(index.toString()),
      ),
    );
  }
}
