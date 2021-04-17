import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../feature/photos/model/photos_model.dart';

class ShopManager extends ChangeNotifier {
  List<PhotoModel> shopPhotoItems = [];

  double totalMoney = 0;

  void sumtotalMoney() {
    totalMoney = shopPhotoItems.fold(0, (previousValue, element) => previousValue + element.price * element.count);
    notifyListeners();
  }

  void addShopItem(PhotoModel model) {
    model.count++;
    shopPhotoItems.add(model);
    sumtotalMoney();
    notifyListeners();
  }

  void removeShopItem(PhotoModel model) {
    model.count = 0;
    shopPhotoItems.remove(model);
    sumtotalMoney();
    notifyListeners();
  }

  void incrementItem(PhotoModel model) {
    if (!shopPhotoItems.contains(model)) {
      Logger().wtf('Item has not found');
    } else {
      shopPhotoItems.singleWhere((element) => element.id == model.id).count++;
      sumtotalMoney();
    }
    notifyListeners();
  }

  void deIncrementItem(PhotoModel model) {
    if (!shopPhotoItems.contains(model)) {
      Logger().wtf('Item has not found');
    } else {
      shopPhotoItems.singleWhere((element) => element.id == model.id).count--;
      sumtotalMoney();
    }
    notifyListeners();
  }
}
