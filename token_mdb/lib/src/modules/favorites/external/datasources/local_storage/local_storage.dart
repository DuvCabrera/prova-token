import 'package:token_mdb/src/modules/database/database.dart';
import 'package:token_mdb/src/modules/favorites/external/external.dart';

class LocalStorage extends ILocalDatasource {
  final IRead read;
  final IDelete delete;

  LocalStorage({required this.read, required this.delete});
  @override
  Future<void> deleteDataFromDatabase(
      {required String tableName, required int id}) async {
    try {
      await delete.delete(tableName: tableName, id: id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getDataFromDatabase(
      {required String tableName, int? id}) async {
    try {
      return await read.get(tableName: tableName, id: id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
