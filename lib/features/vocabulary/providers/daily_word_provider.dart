import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/vocabulary_data.dart';

final dailyWordProvider = Provider((ref) {
  return vocabularyWords.first;
});
