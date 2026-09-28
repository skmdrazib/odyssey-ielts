import '../../../core/database/database_service.dart';

class QuizRepository {

  Future<void> saveResult({
    required int score,
    required int totalQuestions,
    required String date,
  }) async {

    final db = await DatabaseService.database;

    await db.insert(
      'quiz_results',
      {
        'score': score,
        'totalQuestions': totalQuestions,
        'date': date,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getResults() async {

    final db = await DatabaseService.database;

    return db.query(
      'quiz_results',
      orderBy: 'id DESC',
    );
  }
}