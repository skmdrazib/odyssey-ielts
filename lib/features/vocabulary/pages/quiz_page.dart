import 'package:flutter/material.dart';

import '../data/quiz_data.dart';
import '../../quiz/data/quiz_repository.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int currentQuestion = 0;
  int score = 0;

  // NOTE:
  // Single repository instance
  // Future database operations use this object.
  final QuizRepository repository = QuizRepository();

  Future<void> answerQuestion(
    String selectedAnswer,
  ) async {

    final question =
        quizQuestions[currentQuestion];

    if (selectedAnswer ==
        question.answer) {
      score++;
    }

    if (currentQuestion <
        quizQuestions.length - 1) {

      setState(() {
        currentQuestion++;
      });

      return;
    }

    // NOTE:
    // Quiz finished.
    // Save score before showing result.

    await repository.saveResult(
      score: score,
      totalQuestions:
          quizQuestions.length,
      date:
          DateTime.now().toIso8601String(),
    );

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            'Quiz Complete',
          ),
          content: Text(
            'Your Score: '
            '$score/${quizQuestions.length}',
          ),
          actions: [

            TextButton(
              onPressed: () {

                Navigator.pop(context);

                setState(() {
                  currentQuestion = 0;
                  score = 0;
                });
              },
              child: const Text(
                'Restart',
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                'Close',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {

    final question =
        quizQuestions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vocabulary Quiz',
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,

          children: [

            Text(
              'Question '
              '${currentQuestion + 1}'
              '/'
              '${quizQuestions.length}',

              style: const TextStyle(
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Text(
              question.question,

              style:
                  const TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            ...question.options.map(
              (option) {

                return Padding(
                  padding:
                      const EdgeInsets
                          .only(
                    bottom: 12,
                  ),
                  child:
                      ElevatedButton(
                    onPressed: () {
                      answerQuestion(
                        option,
                      );
                    },
                    child: Text(
                      option,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}