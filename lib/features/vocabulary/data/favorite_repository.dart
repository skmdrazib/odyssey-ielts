import '../../../../core/database/database_service.dart';

class FavoriteRepository {
  Future<void> addFavorite(String word) async {
    final db = await DatabaseService.database;

    await db.insert(
      'favorites',
      {'word': word},
    );
  }

  Future<void> removeFavorite(String word) async {
    final db = await DatabaseService.database;

    await db.delete(
      'favorites',
      where: 'word = ?',
      whereArgs: [word],
    );
  }

  Future<List<String>> getFavorites() async {
    final db = await DatabaseService.database;

    final result = await db.query('favorites');

    return result
        .map((e) => e['word'] as String)
        .toList();
  }
}
