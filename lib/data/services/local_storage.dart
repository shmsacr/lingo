import 'package:hive/hive.dart';
import 'package:lingo/data/model/word_model.dart';

abstract class LocalStroge {
  Future<void> addWord({required Words word});
  Future<Words> getWords({required Words word});
  Future<List<Words>> getAllWords();
  Future<bool> deleteWord({required Words word});
  Future<Words> updateWord({required Words word});
}

class HiveLocalStroge extends LocalStroge {
  final String boxName = 'words_box';

  @override
  Future<void> addWord({required Words word}) async {
    var box = await Hive.openBox<Words>(boxName);
    await box.put(word.id, word);
    await box.close();
  }

  @override
  Future<Words> getWords({required Words word}) async {
    var box = await Hive.openBox<Words>(boxName);
    var retrievedWord = box.get(word.id);
    await box.close();

    return (retrievedWord) ?? Words(id: '', word: '', means: '');
  }

  @override
  Future<List<Words>> getAllWords() async {
    var box = await Hive.openBox<Words>(boxName);
    var wordList = box.values.cast<Words>().toList();
    await box.close();
    return wordList;
  }

  @override
  Future<Words> updateWord({required Words word}) async {
    var box = await Hive.openBox<Words>(boxName);
    await box.put(word.id, word);
    await box.close();
    return word;
  }

  @override
  Future<bool> deleteWord({required Words word}) async {
    var box = await Hive.openBox<Words>(boxName);
    await box.delete(word.id);
    await box.close();
    return true;
  }
}
