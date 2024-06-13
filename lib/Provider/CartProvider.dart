import 'package:butterfly_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  void toggleCart(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  IncrementQtn(int index) => _cart[index].quantity++;
  DecrementQtn(int index) {
    if (index >= 0 && index < _cart.length) {
      if (_cart[index].quantity > 1) {
        _cart[index].quantity--;
      }
    }
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
