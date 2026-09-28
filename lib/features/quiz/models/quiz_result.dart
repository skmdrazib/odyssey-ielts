class QuizResult {
  final int score;
  final int totalQuestions;
  final String date;

  QuizResult({
    required this.score,
    required this.totalQuestions,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'score': score,
      'totalQuestions': totalQuestions,
      'date': date,
    };
  }
}