import 'package:flutter/material.dart';

import '../core/localizate/application_strings.dart';
import '../core/widgets/card/food_card.dart';
import '../core/widgets/wrap/icon_text.dart';
import 'food_card_view_model.dart';

class FoodCardView extends FoodCardViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildPadding(context),
    );
  }

  Padding buildPadding(BuildContext context) => Padding(padding: insetsAll, child: buildColumnBody(context));

  Column buildColumnBody(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 4, child: buildListViewFoodList()),
        Spacer(),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                Spacer(),
                Expanded(child: buildRowSubTotal()),
                Expanded(child: buildRowDelivery()),
                Expanded(flex: 2, child: buildRowTotal()),
                Spacer()
              ],
            )),
        Expanded(child: buildElevatedButtonCheckout(context)),
      ],
    );
  }

  ListView buildListViewFoodList() {
    return ListView.builder(
      itemCount: foodItemList.length,
      itemBuilder: (context, index) => FoodCardWidget(model: foodItemList[index]),
    );
  }

  Row buildRowSubTotal() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      buildTextSubTitle(applicationStrings.subTotal),
      Text('£9.30'),
    ]);
  }

  Row buildRowDelivery() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      buildTextSubTitle(applicationStrings.delivery),
      Text('data'),
    ]);
  }

  Row buildRowTotal() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        applicationStrings.total,
        style: textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
      ),
      Text('£9.30', style: textTheme.headline5),
    ]);
  }

  Text buildTextSubTitle(String title) => Text(title, style: textTheme.bodyText1!.copyWith(color: colorSchema.onPrimary));

  ElevatedButton buildElevatedButtonCheckout(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor), shape: MaterialStateProperty.all(StadiumBorder())),
      child: Center(
        child: buildWrapIconText(),
      ),
    );
  }

  Widget buildWrapIconText() {
    return IconTextWidget(icon: Icons.arrow_right_alt_outlined, title: applicationStrings.checkOut);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(ApplicationStrings.instance.cartTitle,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              )),
    );
  }
}
