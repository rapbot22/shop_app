import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Map<String, Object>> _allProducts = [];
  List<Map<String, Object>> _filteredProducts = [];

  List<Map<String, Object>> get products =>
      _filteredProducts.isEmpty ? _allProducts : _filteredProducts;

  void setProducts(List<Map<String, Object>> products) {
    _allProducts = products;
    notifyListeners();
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = [];
    } else {
      _filteredProducts = _allProducts.where((product) {
        final name = product['title'] as String;
        return name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
