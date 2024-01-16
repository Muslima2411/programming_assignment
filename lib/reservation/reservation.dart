import 'package:programming_assignment/menu/menu_settings.dart';

class Reservation {
  late String customerName;
  late DateTime date;
  late String time;
  late int numberOfGuests;
  RestaurantMenu? menu;
  List<String>? mealChoices;

  Reservation(
      {required this.customerName,
      required this.date,
      required this.time,
      required this.numberOfGuests,
      this.menu,
      this.mealChoices});

  void addMealChoice(String itemName) {
    if (mealChoices!.length < 10 && menu!.isValidItem(itemName)) {
      mealChoices!.add(itemName);
      print('$itemName added to the meal choices.');
    } else {
      print(
          'Cannot add $itemName to the meal choices. Limit reached or invalid item.');
    }
  }

  void removeMealChoice(String itemName) {
    if (mealChoices!.contains(itemName)) {
      mealChoices!.remove(itemName);
      print('$itemName removed from the meal choices.');
    } else {
      print('$itemName not found in the meal choices.');
    }
  }

  double calculateTotalCost() {
    double totalCost = 0.0;
    for (String choice in mealChoices!) {
      totalCost += menu!.items[choice];
    }
    return totalCost;
  }

  String returnMealDetails() {
    String meals = '''''';
    if (mealChoices!.isEmpty) {
      return 'No meal choices selected.';
    } else {
      mealChoices!.forEach((element) {
        meals += "\n $element";
      });
      return meals;
    }
  }

  @override
  String toString() {
    return '''
      Reservation Details:
      Customer Name: $customerName
      Date: ${date.toLocal()}
      Time: $time
      Number of Guests: $numberOfGuests
      $returnMealDetails()
      Total Cost: \$${calculateTotalCost()}
    ''';
  }
}
