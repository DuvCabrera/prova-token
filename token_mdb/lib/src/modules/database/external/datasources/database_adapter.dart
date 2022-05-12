abstract class IDataBaseAdapter {
  Future<void> saveData(
      {required String tableName, required Map<String, dynamic> data});

  Future<void> updateData(
      {required String tableName,
      required Map<String, dynamic> data,
      required int id});

  Future<void> removeData({required String tableName, int? id});

  Future<List<Map<String, dynamic>>> readData(
      {required String tableName, int? id});
}
