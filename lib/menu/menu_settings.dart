import 'dart:io';
import 'dart:math';

class RestaurantMenu {
  late Map<String, Map<String, dynamic>> menuItems;

  RestaurantMenu({required this.menuItems});

  displayMenu() {
    print("Price List\n");
    menuItems.forEach((key, value) {
      print("$key - $value\n");
    });
  }

  addNewItem() {
    print("You are adding new ITEM\n");
    stdout.write("enter item name:");
    String name = stdin.readLineSync()!;
    stdout.write("enter item cost:");
    double cost = double.parse(stdin.readLineSync()!);
    stdout.write("enter item description:");
    String description = stdin.readLineSync()!;

    Map<String, Map<String, dynamic>> newItem = {
      name: {"name": name, "cost": cost, "description": description}
    };

    menuItems.addAll(newItem);
  }

  removeItem() {
    stdout.write("Enter NAME of the meal you want to remove");
    String name = stdin.readLineSync()!;
    menuItems.remove(name);
  }

  search() {
    stdout.write("Enter NAME of the meal:");
    String name = stdin.readLineSync()!;
    print(menuItems[name]);
  }

  update() {
    print("Which meal do u want to update?");
    stdout.write("Enter NAME of the meal:");
    String name = stdin.readLineSync()!;
    print(menuItems[name]);
    stdout.write("Enter cost of the meal:");
    double cost = double.parse(stdin.readLineSync()!);
    stdout.write("Enter description of the meal:");
    String description = stdin.readLineSync()!;
    menuItems[name] = {
      "name": name,
      "cost": cost,
      "description": description,
    };

    displayMenu();
  }

  bool isValidItem(String mealName) {
    return menuItems.containsKey(mealName);
  }

  static menuFunctions() {
    print("1. View menu");
    print("2. Add a new meal from menu");
    print("3. Remove a meal from menu");
    print("4. Update a meal from menu");
    print("5. Search a meal");
  }
}
