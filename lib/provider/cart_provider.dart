import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  CartProvider() {
    loadCart();
  }
  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();

    final cartJson = jsonEncode(cart);

    await prefs.setString('cart', cartJson);
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();

    final cartJson = prefs.getString('cart');

    if (cartJson != null) {
      final decoded = jsonDecode(cartJson);

      cart.clear();

      cart.addAll(
        List<Map<String, dynamic>>.from(
          decoded.map((item) => Map<String, dynamic>.from(item)),
        ),
      );

      notifyListeners();
    }
  }

  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    saveCart();
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    saveCart();
    notifyListeners();
  }
}
