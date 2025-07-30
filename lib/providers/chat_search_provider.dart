import 'package:flutter/material.dart';

class ChatSearchProvider with ChangeNotifier {
  bool _isSearching = false;
  bool get isSearching => _isSearching; 

  void toggleSearchBar() {
    _isSearching = !_isSearching;
    notifyListeners();
  }

  void hideSearchBar() {
    _isSearching = false;
    notifyListeners();
  }

  void showSearchBar() {
    _isSearching = true;
    notifyListeners();
  }

}