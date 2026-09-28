import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../vocabulary/providers/daily_word_provider.dart';
import '../vocabulary/pages/quiz_page.dart';
import '../quiz/pages/quiz_history_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyWord = ref.watch(dailyWordProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Welcome to Odyssey IELTS',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    '📚 Daily Word',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    dailyWord.word,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    dailyWord.meaning,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          ElevatedButton.icon(
            icon: const Icon(Icons.quiz),
            label: const Text(
              'Start Vocabulary Quiz',
              
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const QuizPage(),
                ),
              );
            },
          ),


const SizedBox(
  height: 12,
),

ElevatedButton.icon(
  icon: const Icon(
    Icons.history,
  ),

  label: const Text(
    'Quiz History',
  ),

  onPressed: () {

    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (_) =>
            const QuizHistoryPage(),
      ),
    );
  },
),
          
        ],
      ),
    );
  }
}
