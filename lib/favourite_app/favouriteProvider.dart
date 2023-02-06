import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _itemAdded = [];
  List<int> get itemAdded => _itemAdded;

  void itemFavourite(int value) {
    _itemAdded.add(value);
    notifyListeners();
  }

  void remove(int val) {
    _itemAdded.remove(val);
    notifyListeners();
  }
}
