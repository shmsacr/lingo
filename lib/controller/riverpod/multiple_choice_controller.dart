import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import 'package:lingo/controller/riverpod/words_controller.dart';
import 'package:lingo/data/model/word_model.dart';

final quizProvider =
    StateNotifierProvider.autoDispose<QuizNotifier, QuizState>((ref) {
  final readWords = ref.read(wordListNotifierProvider);

  return QuizNotifier(allWordList: readWords);
});

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier({required this.allWordList})
      : super(QuizState(wordMeansMap: []));

  List<Words> allWordList;
  Random _random = Random();
  Map<String, String> _currentQuestion = {};
  List<String> _options = [];
  List<Map<String, String>> _wordMeansMap = [];
  int _questionCount = 1;
  int _correctAnswerCount = 0;
  List<Map<String, String>> _wordMeansMapCopy = [];
  bool _isCorrectQuestion = false;

  int get correctAnswerCount => _correctAnswerCount;
  int get questionCount => _questionCount;

  void fetchAndLoading() async {
    getQuizData();
    loadQuiz();
    resetQuiz();
  }

  void getQuizData() {
    if (allWordList.ext.isNullOrEmpty) return;
    _wordMeansMap.clear();
    for (Words word in allWordList) {
      _wordMeansMap.add({
        'word': word.word,
        'means': word.means,
      });
    }
    _wordMeansMapCopy = List.from(_wordMeansMap);
    state = state.copyWith(wordMeansMap: _wordMeansMap);
  }

  Future<void> loadQuiz() async {
    debugPrint(_wordMeansMapCopy.length.toString());
    if (_wordMeansMapCopy.length < 5 && _wordMeansMapCopy.ext.isNullOrEmpty)
      return;
    int randomIndex = _random.nextInt(_wordMeansMapCopy.length);
    _currentQuestion = _wordMeansMapCopy[randomIndex];
    _options.clear();
    _options.add(_currentQuestion['means']!);
    _wordMeansMapCopy.removeAt(randomIndex);

    while (_options.length < 4) {
      int randomIndex = _random.nextInt(_wordMeansMap.length);
      String option = _wordMeansMap[randomIndex]['means']!;

      if (!_options.contains(option)) {
        _options.add(option);
      } else {
        continue;
      }
    }
    state = state.copyWith(
        currentQuestion: _currentQuestion,
        options: _options,
        selectedValue: '');
    _options.shuffle();
  }

  void nextQuestion() async {
    if (_questionCount > _wordMeansMap.length) {
      getQuizData();
      return;
    } else {
      await loadQuiz();
      _questionCount++;
      state = state.copyWith(questionCount: _questionCount);
    }
  }

  void resetQuiz() {
    _questionCount = 1;
    state = state.copyWith(questionCount: _questionCount);
  }

  void selectedAnswer(String? value) {
    state = state.copyWith(selectedValue: value);
  }

  bool checkAnswer(String selectedAnswer) {
    _isCorrectQuestion = selectedAnswer == _currentQuestion['means'];
    calculateScore();

    return _isCorrectQuestion;
  }

  void calculateScore() {
    _isCorrectQuestion ? _correctAnswerCount++ : _correctAnswerCount;
  }
}

class QuizState {
  final List<Map<String, String>>? wordMeansMap;
  final Map<String, String>? currentQuestion;
  final List<String>? options;
  final String? selectedValue;
  final int? questionCount;

  QuizState({
    this.wordMeansMap,
    this.currentQuestion,
    this.options,
    this.selectedValue,
    this.questionCount,
  });

  QuizState copyWith(
      {List<Map<String, String>>? wordMeansMap,
      Map<String, String>? currentQuestion,
      List<String>? options,
      String? selectedValue,
      int? questionCount,
      int? score}) {
    return QuizState(
      wordMeansMap: wordMeansMap ?? this.wordMeansMap,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      options: options ?? this.options,
      selectedValue: selectedValue ?? this.selectedValue,
      questionCount: questionCount ?? this.questionCount,
    );
  }
}
