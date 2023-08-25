import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lingo/core/const/string_const.dart';
import 'package:lingo/data/model/suggested_word.dart';

class SuggestedService {
  Future<String> _loadAsset() async {
    return await rootBundle.loadString(StringConst.dbData);
  }

  Future<List<SuggestedWord>> fetchSuggestedWord() async {
    final jsonString = await _loadAsset();
    final jsonParsed = json.decode(jsonString);

    final suggestedWord = jsonParsed['suggestedWord'] as List<dynamic>;

    List<SuggestedWord> suggestedWordList = [];
    
    for (var word in suggestedWord) {
      suggestedWordList
          .add(SuggestedWord.fromJson(word as Map<String, dynamic>));
    }
    print('suggestedWordList ${suggestedWordList}');

    return suggestedWordList;
  }
}
