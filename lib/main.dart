import 'dart:io';

import 'menu/menu_settings.dart';

void main() {
  Map<String, Map<String, dynamic>> menuItems = {
    "palov": {
      "name": "palov",
      "cost": 12.90,
      "description": "delicious",
    },
    "chuchvara": {
      "name": "delicious",
      "cost": 10.90,
      "description": "deluciaso",
    },
    "norin": {
      "name": "norin",
      "cost": 10.90,
      "description": "delicious",
    },
  };

  RestaurantMenu menu = RestaurantMenu(menuItems: menuItems);
  beginning();
  int choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      RestaurantMenu.menuFunctions();
      break;
    case 2:
      break;
    default:
      beginning();
      break;
  }
}

beginning() {
  print("--Restaurant Reservation--");
  print("1. taurantMenu");
  print("2. Reservation");
}
