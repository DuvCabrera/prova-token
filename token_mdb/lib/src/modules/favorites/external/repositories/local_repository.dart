import '../../infra/infra.dart';
import '../external.dart';

class LocalRepository extends ILocalRepository {
  final ILocalDatasource datasource;

  LocalRepository(this.datasource);

  @override
  Future<void> deleteFromLocalRepository(
      {required int id, required String tableName}) async {
    await datasource.deleteDataFromDatabase(tableName: tableName, id: id);
  }

  @override
  Future<List<Map<String, dynamic>>> getFavoriteFromLocalRepository(
      {required String tableName, int? id}) async {
    return await datasource.getDataFromDatabase(tableName: tableName, id: id);
  }
}
