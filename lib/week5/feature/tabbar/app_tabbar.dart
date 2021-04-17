import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/init/lang/locale_keys.g.dart';
import '../basket/basket_view.dart';
import '../photos/view/photos_view.dart';
import 'model/tab_model.dart';

class AppTabBar extends StatelessWidget {
  final List<TabModel> tabsItem = [
    TabModel(icon: Icons.ac_unit, page: PhotosView(), title: LocaleKeys.tabBar_home),
    TabModel(icon: Icons.accessibility_outlined, page: BasketView(), title: LocaleKeys.tabBar_basket),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(child: buildTabBar()),
        body: buildTabBarView(),
      ),
    );
  }

  TabBar buildTabBar() {
    // EasyLocalization.logger
    return TabBar(
        tabs: List.generate(
      tabsItem.length,
      (index) => Tab(text: tabsItem[index].title.tr(), icon: Icon(tabsItem[index].icon)),
    ));
  }

  TabBarView buildTabBarView() => TabBarView(children: tabsItem.map((e) => e.page).toList());
}
