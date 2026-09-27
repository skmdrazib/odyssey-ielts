import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../vocabulary/providers/daily_word_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyWord = ref.watch(dailyWordProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(
                dailyWord.word,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                dailyWord.meaning,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
