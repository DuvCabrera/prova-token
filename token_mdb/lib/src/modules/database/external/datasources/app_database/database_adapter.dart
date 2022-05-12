import 'package:sqflite/sqflite.dart';
import 'package:token_mdb/src/modules/database/database.dart';

class DatabaseAdapter extends IDataBaseAdapter {
  final AppDatabase database = AppDatabase();

  Future<void> saveData({
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    final Database db = await database.initdb();

    if (tableName == 'moviegeneral') {
      final existingRelation = await db.query(
        'moviegeneral',
        where: 'id = ?',
        whereArgs: [data["id"]],
      );

      if (existingRelation.isEmpty) {
        await db.insert(tableName, data);
      } else {
        await db.update(
          tableName,
          data,
          where: "id = ?",
          whereArgs: [existingRelation.first['id']],
        );
      }

      return;
    }

    final alreadyExists = data["id"] != null
        ? await db.query(
            tableName,
            where: "id = ?",
            whereArgs: [data["id"] as int],
          )
        : [];

    if (alreadyExists.isNotEmpty) {
      await updateData(id: data["id"] as int, data: data, tableName: tableName);
    } else {
      await db.insert(tableName, data);
    }
  }

  Future<void> updateData({
    required int id,
    required Map<String, dynamic> data,
    required String tableName,
  }) async {
    final Database db = await database.initdb();

    await db.update(tableName, data, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> readData(
      {required String tableName, int? id}) async {
    final Database db = await database.initdb();
    if (id != null) {
      final List<Map<String, dynamic>> result =
          await db.query(tableName, where: 'id = ?', whereArgs: [id]);
      return result;
    } else {
      final result = await db.query(tableName);
      return result;
    }
  }

  Future<void> removeData({required String tableName, int? id}) async {
    final Database db = await database.initdb();
    await db.delete(
      tableName,
      where: id == null ? null : ' id = ?',
      whereArgs: id == null ? null : [id],
    );
  }
}
