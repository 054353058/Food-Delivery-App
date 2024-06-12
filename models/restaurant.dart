import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_2/models/cart_item.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    //BURGERS
    Food(
      name: 'Classic Burger ',
      description:
          "A Juicy beef patty with melted cheddar , lettuce , tomato , and a hint of noion and pickle.",
      imagePath: "lib/images/burgers/burger1.png",
      price: 8.50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 2.99),
        Addon(name: "Bacon", price: 2.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),

    Food(
      name: 'Plain burger',
      description:
          "A Juicy beef patty with melted cheddar , lettuce , tomato , and a hint of noion and pickle.",
      imagePath: "lib/images/burgers/burger2.png",
      price: 7.50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 2.99),
        Addon(name: "Bacon", price: 2.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),

    Food(
      name: 'Double burger',
      description:
          "A Juicy beef patty with melted cheddar , lettuce , tomato , and a hint of noion and pickle.",
      imagePath: "lib/images/burgers/burger3.png",
      price: 9.50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 2.99),
        Addon(name: "Bacon", price: 2.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),

    // DESSERTS
    Food(
      name: 'Raspberry dessert',
      description:
          "This dessert contains many layers, including berries, cream, and biscuits",
      imagePath: "lib/images/desserts/desserts1.jpg",
      price: 4.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cream", price: 1.99),
        Addon(name: "Extra berries", price: 2.99),
      ],
    ),

    Food(
      name: 'Raspberry dessert',
      description:
          "This dessert contains chocolate or also contains white cream",
      imagePath: "lib/images/desserts/desserts2.jpg",
      price: 5.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cream", price: 1.99),
        Addon(name: "Extra chocolate", price: 2.99),
      ],
    ),

    Food(
      name: 'Raspberry dessert',
      description: "This dessert contains cake, cream and strawberries",
      imagePath: "lib/images/desserts/desserts3.jpeg",
      price: 4.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cream", price: 1.99),
        Addon(name: "Extra strawberries", price: 2.99),
      ],
    ),

    //drinks

    Food(
      name: 'Coca-Cola',
      description: "Coca-Cola soft drink",
      imagePath: "lib/images/drinks/drinks1.png",
      price: 2.50,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Small size, ", price: 1.99),
        Addon(name: "large size", price: 2.99),
      ],
    ),

    Food(
      name: 'Natural orange juice',
      description: "Natural orange juice, cold and delicious, small and large",
      imagePath: "lib/images/drinks/drinks2.png",
      price: 2.50,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Small size, ", price: 1.99),
        Addon(name: "large size", price: 2.99),
      ],
    ),

    Food(
      name: 'Black coffee',
      description: "Black coffee from Colombia, Yemen and Uganda",
      imagePath: "lib/images/drinks/drinks3.png",
      price: 2.50,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Small size, ", price: 1.99),
        Addon(name: "large size", price: 2.99),
      ],
    ),

//SALADS

    Food(
      name: 'Green salad',
      description: "Green salad containing lettuce and arugula",
      imagePath: "lib/images/salads/salads1.jpg",
      price: 2.50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Small size, ", price: 1.99),
        Addon(name: "large size", price: 2.99),
      ],
    ),

    Food(
      name: 'fruit salad',
      description:
          "It contains apples, oranges, and lettuce with sauce toppings",
      imagePath: "lib/images/salads/salads1.jpg",
      price: 2.50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Small size, ", price: 1.99),
        Addon(name: "large size", price: 2.99),
      ],
    ),

    //SIDES

    Food(
      name: 'onion rings',
      description:
          "Onion rings contain crunchy and delicious onions and potatoes",
      imagePath: "lib/images/sides/sides3.jpg",
      price: 2.50,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Small size, ", price: 1.99),
        Addon(name: "large size", price: 2.99),
      ],
    ),

    Food(
      name: 'Potatoes with sausage',
      description:
          "The dish contains potatoes and sausage with toppings such as sauce and cheese",
      imagePath: "lib/images/sides/ss.webp",
      price: 2.50,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Small size, ", price: 1.99),
        Addon(name: "large size", price: 2.99),
      ],
    ),
  ];

  final List<CartItem> _cart = [];

  String _deliveryAddress = "99 Hollywood Bly";

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  String get deliveryAddress => _deliveryAddress;

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartItem != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

//generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the dete to in include up to second only

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("  Add-ons : ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total Items ${getTotalItemCount()}");
    receipt.writeln("Total Items ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to : " + deliveryAddress);

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(" , ");
  }
}
