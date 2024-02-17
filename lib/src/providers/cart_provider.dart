import 'package:flutter/material.dart';
import '../models/cat_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CatInformation> _cats = [];

  List<CatInformation> get cats => _cats;

  void add(CatInformation cat) {
    _cats.add(cat);
    notifyListeners();
  }

  void remove(CatInformation cat) {
    _cats.remove(cat);
    notifyListeners();
  }

  void removeAll() {
    _cats.clear();
    notifyListeners();
  }

  double getCartTotal() {
    return _cats.fold(0, (previousValue, cats) => previousValue + cats.price);
  }
}
