abstract class IDataBaseRepository {
  Future<void> create(
      {required String tableName, required Map<String, dynamic> data});

  Future<void> delete({required String tableName, int? id});

  Future<void> update(
      {required String tableName,
      required Map<String, dynamic> data,
      required int id});

  Future<List<Map<String, dynamic>>> read({required String tableName});
}
