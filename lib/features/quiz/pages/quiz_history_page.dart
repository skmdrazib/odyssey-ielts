import 'package:flutter/material.dart';

import '../data/quiz_repository.dart';

class QuizHistoryPage
    extends StatefulWidget {

  const QuizHistoryPage({
    super.key,
  });

  @override
  State<QuizHistoryPage>
      createState() =>
          _QuizHistoryPageState();
}

class _QuizHistoryPageState
    extends State<QuizHistoryPage> {

  final repository =
      QuizRepository();

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Quiz History'),
      ),

      body:
          FutureBuilder<List<Map<
              String, dynamic>>>(
        future:
            repository.getResults(),

        builder:
            (context, snapshot) {

          if (!snapshot.hasData) {

            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          final results =
              snapshot.data!;

          if (results.isEmpty) {

            return const Center(
              child: Text(
                'No Quiz Results Yet',
              ),
            );
          }

          return ListView.builder(
            itemCount:
                results.length,

            itemBuilder:
                (context, index) {

              final result =
                  results[index];

              return Card(
                margin:
                    const EdgeInsets
                        .all(10),

                child: ListTile(
                  leading:
                      const Icon(
                    Icons.quiz,
                  ),

                  title: Text(
                    'Score '
                    '${result['score']}'
                    '/'
                    '${result['totalQuestions']}',
                  ),

                  subtitle: Text(
                    result['date'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}