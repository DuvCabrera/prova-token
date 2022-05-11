import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Future<Database> initdb() async {
    final String path = join(await getDatabasesPath(), 'app.db');
    return openDatabase(
      path,
      version: 1,
      onDowngrade: onDatabaseDowngradeDelete,
      onCreate: (Database db, int newerVersion) async {
        await _createMovieGeneralTable(db);
      },
    );
  }

  Future<void> _createMovieGeneralTable(Database db) async {
    await db.execute(
      '''CREATE TABLE moviegeneral(
      id INTEGER PRIMARY KEY,
      voteAverage REAL,
      posterUrl TEXT,
      genres TEXT,
      realeaseDate TEXT);''',
    );
  }
}
