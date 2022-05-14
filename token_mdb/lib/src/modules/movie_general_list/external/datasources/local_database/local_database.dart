import '../../../../database/database.dart';
import '../../external.dart';

class LocalDatabase extends IGeneralLocalDatasource {
  final IDataBaseAdapter database;

  LocalDatabase(this.database);
  @override
  Future<List<Map<String, dynamic>>> getMovieListFromLocalDatabase(
      String tableName) async {
    return await database.readData(tableName: tableName);
  }

  @override
  Future<void> saveMovieListOnLocalDatabase(
      {required String tableName,
      required List<Map<String, dynamic>> data}) async {
    for (var item in data) {
      try {
        await database.saveData(tableName: tableName, data: item);
      } catch (e) {
        continue;
      }
    }
  }
}
