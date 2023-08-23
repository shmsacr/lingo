import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchTextFieldProvider =
    StateNotifierProvider<SearchTextFieldControllerNotifier, bool>((ref) {
  return SearchTextFieldControllerNotifier();
});

class SearchTextFieldControllerNotifier extends StateNotifier<bool> {
  SearchTextFieldControllerNotifier() : super(false);
  
  void changeSearch() {
    state = !state;
  }
}



