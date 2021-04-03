import '../core/base/base_statefull.dart';
import 'food_card.dart';
import 'model/food_model.dart';

abstract class FoodCardViewModel extends BaseStatefull<FoodCard> {
  late final List<FoodModel> foodItemList;

  @override
  void initState() {
    super.initState();
    foodItemList = [
      FoodModel('Broccoli', imageConstants.bracoli, '10'),
      FoodModel('Kale', imageConstants.kale, '10'),
      FoodModel('Red Peppers', imageConstants.pepper, '10'),
      FoodModel('Strow Berries', imageConstants.strawBerry, '10'),
    ];
  }
}
