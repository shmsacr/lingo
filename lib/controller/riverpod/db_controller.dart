import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/word_model.dart';
import '../../data/services/local_storage.dart';

final databaseProvider = Provider((ref) => HiveLocalStroge());
final wordsProvider = FutureProvider<List<Words>>((ref) async {
  final dbProvider = ref.read(databaseProvider);
  return await dbProvider.getAllWords();
});
