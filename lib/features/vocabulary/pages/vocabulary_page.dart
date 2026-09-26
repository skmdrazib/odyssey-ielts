import 'package:flutter/material.dart';

import '../data/vocabulary_data.dart';

class VocabularyPage extends StatelessWidget {
  const VocabularyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vocabularyWords.length,
      itemBuilder: (context, index) {
        final word = vocabularyWords[index];

        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              word.word,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${word.meaning}\n${word.example}',
            ),
          ),
        );
      },
    );
  }
}