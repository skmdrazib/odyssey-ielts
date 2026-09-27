import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/vocabulary_data.dart';
import '../providers/vocabulary_provider.dart';

class VocabularyPage extends ConsumerWidget {
  const VocabularyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchProvider);

    final filteredWords = vocabularyWords.where((word) {
      return word.word.toLowerCase().contains(
        search.toLowerCase(),
      );
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search vocabulary...',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              ref.read(searchProvider.notifier).state = value;
            },
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: filteredWords.length,
            itemBuilder: (context, index) {
              final word = filteredWords[index];

              final favorites =
                  ref.watch(favoriteWordsProvider);

              final isFavorite =
                  favorites.contains(word.word);

              return Card(
                child: ListTile(
                  title: Text(word.word),
                  subtitle: Text(
                    '${word.meaning}\n${word.example}',
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      final current =
                          [...favorites];

                      if (isFavorite) {
                        current.remove(word.word);
                      } else {
                        current.add(word.word);
                      }

                      ref
                          .read(
                            favoriteWordsProvider
                                .notifier,
                          )
                          .state = current;
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}