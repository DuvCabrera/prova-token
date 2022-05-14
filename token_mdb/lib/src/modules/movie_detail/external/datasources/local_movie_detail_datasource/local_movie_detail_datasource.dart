import '../../../../database/database.dart';
import '../datasources.dart';

class LocalMovieDetailDatasource extends ILocalMovieDetailDatasource {
  final IDataBaseAdapter database;

  LocalMovieDetailDatasource(this.database);
  @override
  Future<Map<String, dynamic>> getMovieDatailFromLocalDatabase(
      {required String tableName, required int id}) async {
    try {
      final request = await database.readData(tableName: tableName, id: id);
      return request.first;
    } catch (e) {
      return {};
    }
  }

  @override
  Future<void> saveMovieDetailOnLocalDatabase(
      {required String tableName, required Map<String, dynamic> data}) async {
    await database.saveData(tableName: tableName, data: data);
  }
}
