import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/word_model.dart';
import '../../data/services/local_storage.dart';

final databaseProvider = Provider((ref) => HiveLocalStroge());
final wordsProvider = FutureProvider<List<Words>>((ref) async {
  final dbProvider = ref.read(databaseProvider);
  return await dbProvider.getAllWords();
});

final deleteWordProvider =
    FutureProvider.family<void, Words>((ref, word) async {
  final dbProvider = ref.read(databaseProvider);
  await dbProvider.deleteWord(word: word);
  ref.invalidate(wordsProvider);
});

final addWordProvider = FutureProvider.family<void, Words>((ref, word) async {
  final dbProvider = ref.read(databaseProvider);
  await dbProvider.addWord(word: word);
  ref.invalidate(wordsProvider);
});
