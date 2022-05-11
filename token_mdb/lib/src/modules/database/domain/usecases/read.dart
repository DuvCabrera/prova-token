abstract class IRead {
  Future<List<Map<String, dynamic>>> get({required String tableName});
}
