import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';

class Order {
  final Restaurant restaurant;
  final Food food;
  final String date;
  final int quantity;

  Order({
    this.date,
    this.restaurant,
    this.food,
    this.quantity,
  });
  Order copyWith(
      {Restaurant inputRestaurant,
      Food inputFood,
      String inputDate,
      int inputQuantity}) {
    return Order(
        restaurant: restaurant ?? this.restaurant,
        food: inputFood ?? this.food,
        date: inputDate ?? this.date,
        quantity: inputQuantity ?? this.quantity);
  }
}
