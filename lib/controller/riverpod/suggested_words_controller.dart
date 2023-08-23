// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lingo/data/model/suggested_word.dart';
import 'package:lingo/data/services/suggested_service.dart';

final SuggestedStateNotifierProvider =
    StateNotifierProvider<SuggestedWordsNotifier, SuggestedState>((ref) {
  return SuggestedWordsNotifier();
});

class SuggestedWordsNotifier extends StateNotifier<SuggestedState> {
  SuggestedWordsNotifier() : super(SuggestedState());

  List<SuggestedWord>? _suggestedWords = [];

  List<SuggestedWord>? get suggestedWords => _suggestedWords;
  // Random _random = Random();

  void getSuggestedWords() async {
    state = state.copyWith(isLoading: true);
    final getSuggested = await SuggestedService().fetchSuggestedWord();
    final shuffledList = List<SuggestedWord>.from(getSuggested)..shuffle();
    final randomWords = shuffledList.take(30).toList();
    state = state.copyWith(suggestedWords: randomWords);
    print(randomWords.length);

    state = state.copyWith(isLoading: false);
  }

  // Future<List<SuggestedWord>> wordNumberFiltering() {
  //   if (_suggestedWords!.isEmpty && _suggestedWords?.length == 0) {
  //     return Future.value(_suggestedWords!);
  //   } else {
  //     final randomWord =
  //         _suggestedWords![_random.nextInt(_suggestedWords!.length)];
  //     return Future.value([randomWord]);
  //   }
  // }
}

class SuggestedState {
  final List<SuggestedWord>? suggestedWords;
  final bool? isLoading;

  SuggestedState({this.isLoading, this.suggestedWords});

  SuggestedState copyWith({
    List<SuggestedWord>? suggestedWords,
    bool? isLoading,
  }) {
    return SuggestedState(
      suggestedWords: suggestedWords ?? this.suggestedWords,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
