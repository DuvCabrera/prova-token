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
        await _createMovieDetailTable(db);
        await _createFavoriteTable(db);
      },
    );
  }

  Future<void> _createFavoriteTable(Database db) async {
    await db.execute(
      '''CREATE TABLE favorite(
      id INTEGER PRIMARY KEY,
      title TEXT,
      poster_url TEXT,
      genres TEXT);''',
    );
  }

  Future<void> _createMovieGeneralTable(Database db) async {
    await db.execute(
      '''CREATE TABLE moviegeneral(
      id INTEGER PRIMARY KEY,
      title TEXT,
      vote_average REAL,
      poster_url TEXT,
      genres TEXT,
      release_date TEXT);''',
    );
  }

  Future<void> _createMovieDetailTable(Database db) async {
    await db.execute('''CREATE TABLE moviedetail(
      id INTEGER PRIMARY KEY,
      budget INTEGER,
      genres TEXT,
      imdb_id TEXT,
      overview TEXT,
      popularity INTERGER,
      poster_url TEXT,
      production_countries TEXT,
      release_date TEXT,
      runtime INTERGER,
      tagline TEXT,
      title TEXT,
      vote_average REAL,
      vote_count INTEGER
      );''');
  }
}
