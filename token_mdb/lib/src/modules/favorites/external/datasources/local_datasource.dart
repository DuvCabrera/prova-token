abstract class ILocalDatasource {
  Future<List<Map<String, dynamic>>> getDataFromDatabase(
      {required String tableName, int? id});
  Future<void> deleteDataFromDatabase(
      {required String tableName, required int id});
}
