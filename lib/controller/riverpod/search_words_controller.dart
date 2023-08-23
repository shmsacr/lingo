import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/data/model/word_model.dart';

final searchProvider =
    StateNotifierProvider<SearchControllerNotifier, SearchState>((ref) {
  return SearchControllerNotifier();
});

final class SearchControllerNotifier extends StateNotifier<SearchState> {
  SearchControllerNotifier() : super(SearchState(isSearch: false, words: []));

  final searchList = <Words>[];

  // denenecek

  void changeSearch() {
    state = state.copyWith(isSearch: !state.isSearch);
  }

  void searchWords(String value,List<Words> words)  {

    searchList.clear();
    if (value.isNotEmpty) {
      searchList.addAll(words.where((element) =>
          element.word.toLowerCase().contains(value.toLowerCase()) ||
          element.means.toLowerCase().contains(value.toLowerCase())));
    }
    state = state.copyWith(words: searchList);
    print('searchList ${searchList.length}');
  }
}

final class SearchState {
  final bool isSearch;
  final List<Words>? words;

  SearchState({required this.isSearch, this.words});

  SearchState copyWith({
    bool? isSearch,
    List<Words>? words,
  }) {
    return SearchState(
      isSearch: isSearch ?? this.isSearch,
      words: words ?? this.words,
    );
  }
}
