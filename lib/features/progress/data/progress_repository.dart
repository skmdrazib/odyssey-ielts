import '../models/dashboard_stats.dart';
import '../../../core/database/database_service.dart';

class ProgressRepository {

  Future<DashboardStats> getStats() async {

    final db =
        await DatabaseService.database;

    final results =
        await db.query(
      'quiz_results',
      orderBy: 'id DESC',
    );

    if (results.isEmpty) {
      return DashboardStats(
        attempts: 0,
        highestScore: 0,
        averageScore: 0,
        latestDate: 'No Quiz Yet',
      );
    }

    int totalScore = 0;
    int highestScore = 0;

    for (final row in results) {

      final score =
          row['score'] as int;

      totalScore += score;

      if (score > highestScore) {
        highestScore = score;
      }
    }

    final average =
        totalScore / results.length;

    return DashboardStats(
      attempts: results.length,
      highestScore: highestScore,
      averageScore: average,
      latestDate:
          results.first['date']
              .toString(),
    );
  }
}